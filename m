Received: from out006pub.verizon.net ([206.46.170.106] helo=out006.verizon.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16lMcd-0001p3-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Mar 2002 04:13:47 +0000
Received: from TonyRuggieri ([4.60.119.51]) by out006.verizon.net
          (InterMail vM.5.01.04.05 201-253-122-122-105-20011231) with ESMTP
          id <20020314042422.MJYE23259.out006.verizon.net@TonyRuggieri>
          for <linux-mtd@lists.infradead.org>;
          Wed, 13 Mar 2002 22:24:22 -0600
Reply-To: "Truggieri" <truggieri@multitechcorp.com>
From: "Tony R" <truggeri@gte.net>
To: <linux-mtd@lists.infradead.org>
Subject: Intel Strata Flash recognition
Date: Wed, 13 Mar 2002 23:29:11 -0500
Message-ID: <LPBBLDPINOJOBEBIIPKFGEELCEAA.truggeri@gte.net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Hello all,

I have a board with a ZFx86 processor from ZF Micro devices and a 16M Intel
Strata flash chip with a 16 bit bus.  I have had no luck in getting the
cfi_probe to recognize the chip once the kernel has booted from it and the
file system has been loaded into RAM.

I have the follwing configuration.  I am using a 2.4.18 kernel with the
latest mtd package downloaded from CVS.  I have a CFI compliant Intel 16M
flash chip.  I boot the kernel off the chip using a phoenix bios and
linuxloader also residing on the flash chip.  I successfully extract the
compressed filesystem residing on the chip into ram but once there, modprobe
physmap fails to recognize it.
I have followed the procedure as outlined in the mtd-jffs-HOWTO for Raw
Flash and still get' Physically mapped flash: Found no CFI device at
location zero'. I Have also gone into physmap.c to modify ioremap for
nocache, but that doesn't make a difference.

Any help would be appreciated.
Thanks

Tony Ruggieri
truggieri@multitechcorp.com
Multitech Corp
