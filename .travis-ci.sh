set -ev

opam init --yes --no-setup
eval $(opam config env)
opam repo add coq-released https://coq.inria.fr/opam/released
opam repo add distributedcomponents http://opam.distributedcomponents.net
opam install coq.$COQ_VERSION coq-mathcomp-ssreflect.$SSREFLECT_VERSION \
  StructTact InfSeqExt verdi-runtime --yes --verbose

./build.sh

case $DOWNSTREAM in
verdi-raft)
  pushd ..
    git clone -b $VERDI_RAFT_BRANCH 'http://github.com/uwplse/verdi-raft'
    pushd verdi-raft
      Verdi_PATH=../verdi ./build.sh
    popd
  popd
  ;;
esac
