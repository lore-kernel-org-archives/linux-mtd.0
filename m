Received: from orvill.sda.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17gCAw-0007SL-00
	for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2002 23:36:06 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H1000I4TERAT0@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Sun, 18 Aug 2002 00:35:35 +0200 (MEST)
Date: Sun, 18 Aug 2002 00:35:26 +0200
From: Thomas Gleixner <tglx@linutronix.de>
Subject: No free space left for GC
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Message-id: <1029623727.2142.495.camel@thomas.tec.linutronix.de>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7BIT
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi David ! 

You wanted to know, why free_size got that low. 

I just copied stuff to an empty partition, until it got full. 
But instead of returning with "not enough space" it keeps garbage 
collection until really no more space is left. 
One of the problems is, that we have at lot of blocks on the dirty list,
with less than 2*sizeof(struct jffs2_raw_inode) left. At scan time we
put these blocks on the clean_list. We must do this in normal operation
too. It's total crap to gc blocks with 4 byte dirty space ! 
The total sum of dirty space is 32K, when we start gc. The most dirty 
block has 1.2k dirty space. Many blocks have less than 512 bytes dirty,
which is the pagesize on my device. This is a result of padding, when we
flush wbuf. The dirty space on blocks with more than 512 byte dirty
space is 12048 Byte, which is less than 1 block. 

The real weird thing is, that we write to the device (from gc) until the
last block is used and we run into an endless loop, where no more space
is left for garbage collection. This happens, because we increase dirty
size during gc instead of decreasing it. Once we are there we cannot
mount the filesystem again, without running in that endless gc loop.

I changed nodemgmt.c so that blocks with less than 2*sizeof(struct
jffs2_raw_inode) dirty space are moved to clean_list. But the gc effect
was still the same. 

Now I noticed that we don't move blocks to the dirty list anymore,
neither on mount (pass1) nor during gc or write. The reason is that
mark_node_obsolete checks if the dirty_size == ref_totlen. Due to the
fact, that we have blocks with some dirty space in the clean list, these
blocks stay there until they are very dirty, which may never happen. I
changed this by checking used space against sector_size -
2*sizeof(struct jffs2_raw_inode). Result is better but not good.
I tried the same procedure on a larger partition (56MB, previous one was
8MB). There I was running in trouble again. I had enough dirty space in
the clean_list, that the check in jffs2_reserve_space c->dirty_size <
c->sector_size never lead to -ENOSPC. I added a check, which is done,
when dirty_size is less than blocksneeded * sector_size. It checks if
the dirty_size in the dirty_lists is > c->sector_size. If not it returns
-ENOSPC too. Same as above.

In both cases, we end up with 3 empty blocks and we can't even remove a
file from the filesystem.

The strange thing is, that the dirty_size is not always correct. When I
filled the filesystem complete, df tells me:
/dev/mtdblock1	8192	8164	28	100%	/mnt/data
The last dirty information from the log was dirty_space = 0x3e0c
After umount and mount I have suddenly dirty_space = 0xcfe8, which is
the real dirty size. The good thing on this is, that the endless gc on a
100% full filesystem stops. The bad thing is that we have only 3 blocks
left and I can't remove a file anymore. Have to add some more checks on
monday.

If we are at the point of a 100% full filesystem and the dirty space is
splitted into small pieces, we add for each gc'd block one or two blocks
to the dirty list and the block, we have written to ends up sometimes on
the dirty list too. Maybe we have to add a check, where we calc the
average dirty space per block on dirty_list. If this is less than a
defined threshold, we return ENOSPC and stop garbage collection instead
of screwing up the filesystem at least. It should always be possible to
delete a file.

-- 
Thomas 
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
