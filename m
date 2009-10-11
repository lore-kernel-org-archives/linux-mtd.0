Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mwz7I-0000le-GB
	for linux-mtd@lists.infradead.org; Sun, 11 Oct 2009 14:09:49 +0000
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
In-Reply-To: <1255269852.16942.105.camel@localhost>
References: <4ACF3478.1060503@aimvalley.nl>
	<1255269852.16942.105.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 17:09:36 +0300
Message-Id: <1255270176.16942.107.camel@localhost>
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

On Sun, 2009-10-11 at 17:04 +0300, Artem Bityutskiy wrote:
> On Fri, 2009-10-09 at 15:02 +0200, Norbert van Bolhuis wrote:
> > We're using a 19MB UBIFS image (preprogrammed by manufacturing)
> > for a 156 MB NOR flash partition.
> > 
> > As soon as some of our application processes start reading/writing
> > to the UBIFS the below message occurs:
> > 
> > INFO: task pdflush:110 blocked for more than 120 seconds.
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > pdflush       D 00000000     0   110      2
> > 
> > the below call trace belongs to the message:
> > 
> > [ceb6fc10] [c0008b24] 0xc0008b24
> > [ceb6fc30] [c029b9a8] 0xc029b9a8 schedule
> > [ceb6fc80] [c029c8c8] 0xc029c8c8 __mutex_lock_slowpath
> > [ceb6fcb0] [c014211c] 0xc014211c make_reservation
> > [ceb6fd20] [c014291c] 0xc014291c ubifs_jnl_write_inode
> > [ceb6fd60] [c0149cc8] 0xc0149cc8 ubifs_write_inode
> > [ceb6fd80] [c0145bbc] 0xc0145bbc ubifs_writepage
> > [ceb6fdb0] [c005b0b8] 0xc005b0b8 __writepage
> > [ceb6fdc0] [c005b8dc] 0xc005b8dc write_cache_pages
> > [ceb6fe60] [c005ba50] 0xc005ba50 do_writepages
> > [ceb6fe70] [c00a35cc] 0xc00a35cc __writeback_single_inode
> > [ceb6fec0] [c00a3b90] 0xc00a3b90 generic_sync_sb_inodes
> > [ceb6ff00] [c00a4330] 0xc00a4330 writeback_inodes
> > [ceb6ff20] [c005c774] 0xc005c774 wb_kupdate
> > [ceb6ff80] [c005cf70] 0xc005cf70 pdflush
> > [ceb6ffd0] [c003bd30] 0xc003bd30
> > [ceb6fff0] [c0011480] 0xc0011480
> 
> Does the stackdump always look like this?
> 
> Also, it is probably not commit_sem, because __mutex_lock_slowpath
> is about mutexes, so this is about
> mutex_lock_nested(&wbuf->io_mutex, wbuf->jhead);

I guess slow GC may have this effect. Try to see how much time is
spent in 'ubifs_garbage_collect()'.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
