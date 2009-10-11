Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mwyql-0002U8-HC
	for linux-mtd@lists.infradead.org; Sun, 11 Oct 2009 13:52:43 +0000
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
In-Reply-To: <4ACF3478.1060503@aimvalley.nl>
References: <4ACF3478.1060503@aimvalley.nl>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 16:52:28 +0300
Message-Id: <1255269148.16942.95.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-10-09 at 15:02 +0200, Norbert van Bolhuis wrote:
> We're using a 19MB UBIFS image (preprogrammed by manufacturing)
> for a 156 MB NOR flash partition.

Wow, really huge NOR. Keep in mind that we have not tested UBIFS
for NOR well enough.

> As soon as some of our application processes start reading/writing
> to the UBIFS the below message occurs:
> 
> INFO: task pdflush:110 blocked for more than 120 seconds.
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> pdflush       D 00000000     0   110      2
> 
> the below call trace belongs to the message:
> 
> [ceb6fc10] [c0008b24] 0xc0008b24
> [ceb6fc30] [c029b9a8] 0xc029b9a8 schedule
> [ceb6fc80] [c029c8c8] 0xc029c8c8 __mutex_lock_slowpath
> [ceb6fcb0] [c014211c] 0xc014211c make_reservation
> [ceb6fd20] [c014291c] 0xc014291c ubifs_jnl_write_inode
> [ceb6fd60] [c0149cc8] 0xc0149cc8 ubifs_write_inode
> [ceb6fd80] [c0145bbc] 0xc0145bbc ubifs_writepage
> [ceb6fdb0] [c005b0b8] 0xc005b0b8 __writepage
> [ceb6fdc0] [c005b8dc] 0xc005b8dc write_cache_pages
> [ceb6fe60] [c005ba50] 0xc005ba50 do_writepages
> [ceb6fe70] [c00a35cc] 0xc00a35cc __writeback_single_inode
> [ceb6fec0] [c00a3b90] 0xc00a3b90 generic_sync_sb_inodes
> [ceb6ff00] [c00a4330] 0xc00a4330 writeback_inodes
> [ceb6ff20] [c005c774] 0xc005c774 wb_kupdate
> [ceb6ff80] [c005cf70] 0xc005cf70 pdflush
> [ceb6ffd0] [c003bd30] 0xc003bd30
> [ceb6fff0] [c0011480] 0xc0011480
> 
> This message repeats once. Apart from the message everything is
> functioning OK.
> so it's the UBIFS commit_sem that's causing this.

Not the semaphore itself, but it is locked for too long time and we
cannot acquire it for too long. Since make_reservation needs it only
in read mode, it is obvious that the it is is locked somewhere in
the commit code, which is strange.

How full if the FS when this happens? What is your eraseblock size?

> We're using linux-2.6.28. The linux-next backport for 2.6.28
> (from git://git.infradead.org/~dedekind/ubifs-v2.6.28.git) changes
> are in.
> 
> I guess that, initially, there's a lot of work to be done
> for UBI. I'm thinking about scan entire 156MB, add UBI VID/EC headers
> for the empty 137MB, make LEB mappings, etc..
> 
> I don't understand why this would block UBIFS/pdflush.

It shouldn't. UBI spends time for scanning when you attach your flash.
You pay the price at the very beginning, and then it should be fast.

What I suggest you is to inject some code to UBIFS which measures for
how long the 'commit_sem' is locked in "write" mode, and find the times.
Then try to investigate why this actually happens. I cannot tell why
this could be, off the top of my head.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
