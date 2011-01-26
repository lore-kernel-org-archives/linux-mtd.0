Received: from mail.de.keymile.com ([195.8.104.1])
	by canuck.infradead.org with smtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pi6EV-0001ek-8U
	for linux-mtd@lists.infradead.org; Wed, 26 Jan 2011 14:20:28 +0000
Received: from srvdehan1003.de.keymile.net (srvdehan1003.de.keymile.net
	[10.9.1.108]) by mailrelay.de.keymile.net (8.12.2/8.12.2)
	with ESMTP id p0QEFc06016649 for <linux-mtd@lists.infradead.org>;
	Wed, 26 Jan 2011 15:15:38 +0100 (MET)
Message-ID: <4D402DA7.8050101@keymile.com>
Date: Wed, 26 Jan 2011 15:20:23 +0100
From: Holger Brunck <holger.brunck@keymile.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBIFS incompatibilities due to min_io_size adaptions?
Content-Type: text/plain;
	charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Andreas Huber <andreas.huber@keymile.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
we use UBI and UBIFS on NOR and NAND based systems and kernel 2.6.33. In the
last days we applied the latest UBI and MTD patches for the min I/O size.

Due to commit  a121f643993474548fe98144514c50dd4f3dbe76 UBI: use
mtd->writebufsize to set minimal I/O unit size
now the min I/O size is equal to the writebuffersize of the flash.

This caused incompatibilites in the UBIFS. We have an UBIFS on a board on a NOR
flash created in the past without the patches. Now with a newer SW and a newer
kernel which has the latest fixes we can't mount the old UBIFS anymore.

UBIFS error (pid 865): validate_sb: min. I/O unit mismatch: 8 in superblock, 64 real
UBIFS error (pid 865): validate_sb: bad superblock, error 1
mount: wrong fs type, bad option, bad superblock on ubi0:cfg,
        missing codepage or other error

If we reformate the UBIFS everything is ok, but we got a problem with the older
SW image:
UBIFS error (pid 865): validate_sb: min. I/O unit mismatch: 64 in
superblock, 8 real
UBIFS error (pid 865): validate_sb: bad superblock, error 1
mount: wrong fs type, bad option, bad superblock on ubi0:cfg,
        missing codepage or other error

Is there a way to solve this problem? I do not hope that the only solution is to
remove these patch.

Any help is appreciated.

Best regards
Holger Brunck
