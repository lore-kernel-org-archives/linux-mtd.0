Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BiyY1-0000cf-Ch
	for linux-mtd@lists.infradead.org; Fri, 09 Jul 2004 12:48:30 -0400
Received: from superfortress.nrl.navy.mil ([132.250.130.208]
	helo=superfortress)
	by osdsun1.nrl.navy.mil with smtp (Exim 3.35 #1 (Debian))
	id 1BiyPw-0000aP-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Jul 2004 12:40:08 -0400
Message-ID: <10ae01c465d6$3a0eed40$0100a8c0@superfortress>
From: "Dan Brown" <dan_brown@ieee.org>
To: <linux-mtd@lists.infradead.org>
Date: Fri, 9 Jul 2004 13:00:24 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Announcing DOCBoot
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've just committed to CVS a very small, simple Linux bootloader for
DiskOnChip.  This is based on David Woodhouse's Grub loader, but instead of
loading Grub, it loads a Linux kernel.  The idea is to avoid having to
modify an existing bootloader (such as LILO or Grub) to understand DOC
hardware access and JFFS2.  Instead, we just append the kernel image to the
bootloader and write the whole thing to flash, replacing the M-Systems BIOS
code.

Please take a look at docboot/README for instructions, limitations, etc.
Comments, criticism, and testing reports much appreciated.

    -Dan Brown
