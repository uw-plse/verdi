Require Import List.
Import ListNotations.

Require Import VerdiTactics.
Require Import Util.
Require Import Net.
Require Import Omega.

Require Import Raft.
Require Import RaftRefinementInterface.
Require Import CommonDefinitions.
Require Import SpecLemmas.
Require Import RefinementSpecLemmas.

Require Import UpdateLemmas.
Local Arguments update {_} {_} {_} _ _ _ _ : simpl never.

Require Import VotesWithLogTermSanityInterface.

Section VotesWithLogTermSanity.

  Context {orig_base_params : BaseParams}.
  Context {one_node_params : OneNodeParams orig_base_params}.
  Context {raft_params : RaftParams orig_base_params}.

  Instance vwltsi : votesWithLog_term_sanity_interface.
  Proof.
  Admitted.
End VotesWithLogTermSanity.
