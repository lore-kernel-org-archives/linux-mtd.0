Received: from mail.fh-wedel.de ([213.39.232.194])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AFGta-0002i9-LX
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2003 17:47:42 +0000
Date: Thu, 30 Oct 2003 18:45:30 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: J B <mad_flasher@hotmail.com>
Message-ID: <20031030174530.GC25390@wohnheim.fh-wedel.de>
References: <Law11-F26lgYBr4BvRn0000b9c5@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Law11-F26lgYBr4BvRn0000b9c5@hotmail.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
cc: jffs-dev@axis.com
Subject: Re: jffs2 fragmentation
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Noone cared yet, how odd.

On Sat, 18 October 2003 09:20:23 -0500, J B wrote:
> 
> Ok, maybe I am just completely missing something here, but I am stumped.  I 
> am running some tests (similar to the jitter tests Vipin did a long time 
> ago), and I am seeing some very bad performance.   Below is a summary of 
> what I am doing and what I am seeing.
> 
> I have a jffs2 filesystem that is mounted and starts out at ~87% full.  
> There are various small files on there, and one big file, ~15MiB (lgood 
> compression :).  Here is what I do:
> 
> rm /opt/big_file; cp /home/big_file /opt/big_file; rm /opt/big_file; cp 
> /home/big_file2 /opt/big_file
> 
> /opt is the jffs2 filesystem, /home is an nfs mounted directory.  big_file 
> and big_file2 are the same size, but have different content (i.e. possibly 
> different compression ratios).
> 
> Normally, a rm/cp pair takes about 2 minutes on my system.  After about 10 
> iterations, the copies begin to take longer, about 3-4 minutes.   After 
> about 10 iterations they take upwards of 1/2 an hour.

The first slowdown is expected, the second is not.

When flash is full, jffs2 has to wait for garbage collection before
writing.  Flash erase costs roughly as long as flash write, so double
time is expected.  Try to add a sleep after each rm and this should go
away.

1/2 hour is a surprise.  Does this still appear, when adding a sleep?

> Looking at the dirty, used, and wasted size from a df command, I see this:
> 
> <7>STATFS:
> <7>flash_size:	00680000
> <7>used_size:		0041afe4
> <7>dirty_size:	00199d2c
> <7>wasted_size:	0000012c
> <7>free_size:		000cb1c4
> <7>erasing_size:	00000000
> <7>bad_size:		00000000
> <7>sector_size:	00020000
> <7>nextblock:	      0x00660000
> <7>gcblock:	      0x000a0000
> 
> So almost 13 eraseblocks worth of dirty space (NOR flash with 128KiB 
> eraseblocks).  But, there is only 1 block on the dirty_list, 6 on the 
> free_list, and 44 on the clean_list.  Garbage collection is going on during 
> the writes obviously, but it doesn't seem to be making any difference.  In 
> fact, the dirty_size _increases_.
> 
> So here is my question:  because of the size of the file involved and the 
> relative lack of free eraseblocks to start with, is it possible that the 
> filesystem is so fragmented that the dirty space is spread accross many 
> eraseblocks and garbage collection is incapable of actually freeing up any 
> space?

Fragmentation is hard to achieve for log structured file systems. ;)

Honestly, I have no idea.  Your test is not the usual workload for
jffs2, so you may have uncovered some hidden problem. (and one that
most people don't care about)

> That is the only conclusion I could come to.  Any thoughts would be 
> appreciated.

Jörn

-- 
Homo Sapiens is a goal, not a description.
-- unknown
