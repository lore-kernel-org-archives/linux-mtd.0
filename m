Received: from mailgate.siemenscomms.co.uk ([195.171.110.225])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JBquP-0008MX-MI
	for linux-mtd@lists.infradead.org; Mon, 07 Jan 2008 12:16:56 +0000
Received: from ntht207e.uksgcs.siemenscomms.co.uk ([137.223.247.82])
	by siemenscomms.co.uk (PMDF V6.3-x14 #31430)
	with ESMTP id <0JU90006PWRXQ5@siemenscomms.co.uk> for
	linux-mtd@lists.infradead.org; Mon, 07 Jan 2008 12:16:45 +0000 (GMT)
Content-return: allowed
Date: Mon, 07 Jan 2008 12:16:45 +0000
From: "Phillips, Owain" <owain.phillips@siemens.com>
Subject: Flash_eraseall -j and cowardly refusing to mount
To: linux-mtd@lists.infradead.org
Message-id: <4B760ED6D70BBC4EBFC0AEFDAFB2392A0AEB9FBC@NTHT202E.siemenscomms.co.uk>
MIME-version: 1.0
Content-type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi linux-mtd@lists.infradead.org,

We just upgraded to mtd-utils-1.0.1 on our 2.6.23 target and I am getting
problems with flash_eraseall -j where the mount fails.

# flash_eraseall -j /dev/mtd11
Erasing 128 Kibyte @ e20000 -- 36 % complete. Cleanmarker written at e20000.
Skipping bad block at 0x00e40000
Erasing 128 Kibyte @ 26a0000 -- 99 % complete. Cleanmarker written at
26a0000.
# mount -t jffs2 /dev/mtdblock11 /mnt
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 0, bad_blocks 1, c->nr_blocks 310
mount: Mounting /dev/mtdblock11 on /mnt failed: Input/output error


If I do a flash_eraseall without the -j option the mount is OK.
Is it OK to revert to just doing this non-jffs2-aware erase; what are
implications/side effects?

If I look at the differences in the filesystems generated via the
flash_eraseall -y and a flash_eraseall followed by a mount the clean marker
appears to be different; is that the problem.

First oob for a flash_erase -j.....

0x000007e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000007f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff 85 19 03 20 08 00 00 00 ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

First oob for a flash_erase, followed by jffs2 mount....

0x000007e0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
0x000007f0: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff 85 19 03 20 08 00 00 00 00 00 00 00 ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
  OOB Data: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff

Here are details for our device.

# mtd_debug info /dev/mtd11
mtd.type = MTD_NANDFLASH
mtd.flags =
mtd.size = 40632320 (38M)
mtd.erasesize = 131072 (128K)
mtd.oobblock = 2048 (2K)
mtd.oobsize = 64
mtd.ecctype = (unknown ECC type - new MTD API maybe?) regions = 0
#


Any help in pointing out the error of my ways would be greatly appreciated.
Does it look like we cocked up building the mtd utils?

Kind regards,
Owain Phillips
--
