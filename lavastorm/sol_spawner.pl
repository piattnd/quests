sub EVENT_SPAWN {
	quest::set_proximity($x - 20, $x + 20, $y - 20, $y + 20, $z - 20, $z + 20);
}

sub EVENT_ENTER {
	quest::movepc(80, -517, -455, 75, -125);
}
