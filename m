Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ebhO-0002mM-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 13:22:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B27@mailse01.axis.se> 
References: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B27@mailse01.axis.se> 
To: Jonas Holmberg <jonas.holmberg@axis.com>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo w:( 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 05 Sep 2001 13:28:31 +0100
Message-ID: <16572.999692911@redhat.com>
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

jonas.holmberg@axis.com said:
>  I probably should use cramfs, but I still have to put the bootloader
> in a separate partition.

Yeah - it might be worthwhile to rethink the partitioning stuff so that you 
can reprogram the whole device at once, and also reread a partition table 
if you're using one.

> Is it possible to make the block device use an offset while the
> character device doesn't (using an ioctl, or something, on the
> character device before mounting the block device) without modifying
> mtd? Then I could "hide" the bootloader from the fs in the same
> partition and still be able to erase and write a new bootloader and fs
> using the character device.

Thinks... there's actually no reason at all why the devices registered by 
your map driver shouldn't overlap - one for the whole chip for 
reprogramming, and one for the cramfs image.

add_mtd_partitions might not like it atm, but we could invent a new flags 
which tells it to accept the overlap.

--
dwmw2
