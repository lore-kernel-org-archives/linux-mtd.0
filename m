Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14QCbR-0003Zn-00
	for mtd-list@infradead.org; Tue, 06 Feb 2001 18:12:33 +0000
Received: from celeborn.rivendell.insynq.com ([216.174.202.131] ident=root)
	by infradead.org with esmtp (Exim 3.20 #2)
	id 14QCbQ-0003Zh-00
	for mtd@infradead.org; Tue, 06 Feb 2001 18:12:32 +0000
Received: from pyramid.insynq.com (pyramid.office.insynq.com [10.2.2.10])
	by celeborn.rivendell.insynq.com (8.9.3/8.8.7) with ESMTP id KAA14826
	for <mtd@infradead.org>; Tue, 6 Feb 2001 10:12:00 -0800
Received: by insynq.com
	via sendmail from stdin
	id <m14QCaj-0016mGC@pyramid.insynq.com> (Debian Smail3.2.0.102)
	for mtd@infradead.org; Tue, 6 Feb 2001 10:11:49 -0800 (PST)
From: "Ian Eure <Ian Eure" <ieure@insynq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <14976.15973.43530.527006@pyramid.insynq.com>
Date: Tue, 6 Feb 2001 10:11:49 -0800 (PST)
To: mtd@infradead.org
Subject: doc2k: "formatting block"?
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

while testing a 32mb doc2000, i see these messages:

-- snip --
DiskOnChip 2000 found at address 0xD0000
Flash chip found: Manufacturer ID: 98, Chip ID: 73 (Toshiba TH58V128DC)
2 flash chips found. Total DiskOnChip size: 32 Mb
Block 807: referencing block 110 already in another chain
Formatting chain at block 807
Formatting block 807
Unreferenced block 366, formatting it
-- snip --

...and later on:

-- snip --
EXT2-fs error (device nftl(93,1)): ext2_free_blocks: Freeing blocks in system zones - Block = 121, count = 1
EXT2-fs error (device nftl(93,1)): ext2_free_blocks: Freeing blocks in system zones - Block = 185, count = 1
EXT2-fs error (device nftl(93,1)): ext2_free_blocks: Freeing blocks in system zones - Block = 217, count = 1
EXT2-fs error (device nftl(93,1)): ext2_free_blocks: Freeing blocks in system zones - Block = 233, count = 1
EXT2-fs error (device nftl(93,1)): ext2_free_blocks: Freeing blocks in system zones - Block = 248, count = 1
EXT2-fs error (device nftl(93,1)): ext2_free_blocks: Freeing blocks in system zones - Block = 243, count = 1
end_request: I/O error, dev 5d:01 (unknown), sector 8274
EXT2-fs error (device nftl(93,1)): ext2_free_branches: Read failure, inode=12, block=4137
-- snip --

is this a software problem, or a bad doc?

i suppose it could be my eval board, they don't seem to be made very
well.

-- 
 ___________________________________
| Ian Eure - <ieure@insynq.com>     | "You're living in a facist world...
|         -  Developer -            | Freedom is a luxury." -Front Line
|        -  InsynQ, Inc. -          | Assembly, "Digital Tension Dementia"
| Your Internet Utility Company.tm  |________________________________________


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
