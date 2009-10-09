Received: from smtp-vbr5.xs4all.nl ([194.109.24.25])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MwF7j-0007s7-N9
	for linux-mtd@lists.infradead.org; Fri, 09 Oct 2009 13:03:11 +0000
Received: from mail3.aimsys.nl (a80-127-156-242.adsl.xs4all.nl
	[80.127.156.242])
	by smtp-vbr5.xs4all.nl (8.13.8/8.13.8) with ESMTP id n99D2q5a000917
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>;
	Fri, 9 Oct 2009 15:02:55 +0200 (CEST)
	(envelope-from nvbolhuis@aimvalley.nl)
Message-ID: <4ACF3478.1060503@aimvalley.nl>
Date: Fri, 09 Oct 2009 15:02:48 +0200
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: a UBIFS image makes task pdflush blocked > 120 seconds
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


We're using a 19MB UBIFS image (preprogrammed by manufacturing)
for a 156 MB NOR flash partition.

As soon as some of our application processes start reading/writing
to the UBIFS the below message occurs:

INFO: task pdflush:110 blocked for more than 120 seconds.
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
pdflush       D 00000000     0   110      2

the below call trace belongs to the message:

[ceb6fc10] [c0008b24] 0xc0008b24
[ceb6fc30] [c029b9a8] 0xc029b9a8 schedule
[ceb6fc80] [c029c8c8] 0xc029c8c8 __mutex_lock_slowpath
[ceb6fcb0] [c014211c] 0xc014211c make_reservation
[ceb6fd20] [c014291c] 0xc014291c ubifs_jnl_write_inode
[ceb6fd60] [c0149cc8] 0xc0149cc8 ubifs_write_inode
[ceb6fd80] [c0145bbc] 0xc0145bbc ubifs_writepage
[ceb6fdb0] [c005b0b8] 0xc005b0b8 __writepage
[ceb6fdc0] [c005b8dc] 0xc005b8dc write_cache_pages
[ceb6fe60] [c005ba50] 0xc005ba50 do_writepages
[ceb6fe70] [c00a35cc] 0xc00a35cc __writeback_single_inode
[ceb6fec0] [c00a3b90] 0xc00a3b90 generic_sync_sb_inodes
[ceb6ff00] [c00a4330] 0xc00a4330 writeback_inodes
[ceb6ff20] [c005c774] 0xc005c774 wb_kupdate
[ceb6ff80] [c005cf70] 0xc005cf70 pdflush
[ceb6ffd0] [c003bd30] 0xc003bd30
[ceb6fff0] [c0011480] 0xc0011480

This message repeats once. Apart from the message everything is
functioning OK.

so it's the UBIFS commit_sem that's causing this.

We're using linux-2.6.28. The linux-next backport for 2.6.28
(from git://git.infradead.org/~dedekind/ubifs-v2.6.28.git) changes
are in.

I guess that, initially, there's a lot of work to be done
for UBI. I'm thinking about scan entire 156MB, add UBI VID/EC headers
for the empty 137MB, make LEB mappings, etc..

I don't understand why this would block UBIFS/pdflush.

I'm hoping someone can explain what's going on here.

Is there a way to avoid the situation ?
