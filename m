Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15eaMW-0002dc-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 11:56:52 +0100
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B25@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo
	 w:(
Date: Wed, 5 Sep 2001 13:01:50 +0200 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> Currently we have to scan the whole thing on startup because we know 
> nothing about its state. By occasionally writing a checkpoint 
> - a brain 
> dump of the jffs2 code's internal state, we can speed up the mount.
> 
> You'd only ever write a checkpoint at the beginning of an 
> erase block. 
> The mount code would look at the beginning of each block, and 
> would note 
> the most recent checkpoint. It can suck in the state from 
> that checkpoint 
> and then go on to read every node in the blocks which were 
> written _after_ 
> that checkpoint.

I get it, thanks.

> Not really. Why not just upgrade bootloader and jffs2 fs 
> using two separate 
> character devices?

Two reasons:

1. To be able to write to both devices the partitions must start on eraseblock
block boundary. The bootloader I would use with this configuration is less than
10kB and my eraseblocks are 64kB. I would waste to much space on the loader
partition.

2. I would like to keep my old partitioning so I don't have to change the way
upgrade works. And right now I have a partitiontable, bootloader, compressed
kernel and cramfs-image all on the same mtd partition. And mtd is only used for
upgrading the whole lot on that partition.

I would like to put the contents of the cramfs partition and the kernel in a
jffs2 fs instead and modify the bootloader so that it can find the kernel
in the jffs2 fs. And still have the partitiontable and the bootloader at the
beginning of the partition. I was hoping that jffs2 would treat the partition
table and bootloader as garbage and just ignore it.

/Jonas
