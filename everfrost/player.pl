
sub EVENT_CLICKDOOR {
    quest::debug("objectid " . $objectid);
    $key = $client->AccountID() . "-kunark-flag";
	$expansion = quest::get_data($key);
    if($doorid ==78)
    {
	if ($expansion >= 20){
	quest::movepc(202, 130, 878, -157, 0);
	}
    else {
    quest::whisper("I must return once I have conquered Luclin");
}
}
}

