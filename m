Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15ebeh-0002lu-00
	for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2001 13:19:43 +0100
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6B27@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: RE: JFFS2 on 8MB Flash-Chip conneted to MPC850 works extremly slo
	 w:(
Date: Wed, 5 Sep 2001 14:24:36 +0200 
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

> And if it's _strictly_ readonly then why not use cramfs on 
> /dev/mtdblock1?

I probably should use cramfs, but I still have to put the bootloader in a
separate partition.

Thanks for your help, just one last straw (-:

Is it possible to make the block device use an offset while the character device
doesn't (using an ioctl, or something, on the character device before mounting
the block device) without modifying mtd? Then I could "hide" the bootloader from
the fs in the same partition and still be able to erase and write a new
bootloader and fs using the character device.

/Jonas
