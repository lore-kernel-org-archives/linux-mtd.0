Received: from mta09-acc.tin.it ([212.216.176.40] helo=fep09-svc.tin.it)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15CpWc-0005Oj-00
	for <linux-mtd@lists.infradead.org>; Wed, 20 Jun 2001 22:28:34 +0100
Received: from pentiumiii ([212.216.21.36]) by fep09-svc.tin.it
          (InterMail vM.4.01.03.13 201-229-121-113) with SMTP
          id <20010620213334.CGAU1561.fep09-svc.tin.it@pentiumiii>
          for <linux-mtd@lists.infradead.org>;
          Wed, 20 Jun 2001 23:33:34 +0200
Message-ID: <003e01c0f9d0$da3564e0$090da8c0@pentiumiii>
From: "Paolo Marini" <paolom@prisma-eng.it>
To: <linux-mtd@lists.infradead.org>
Subject: MTD + JFFS2 on RPX CLLF (Motorola PPC860)
Date: Wed, 20 Jun 2001 23:34:56 +0200
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

Hi,
I am trying to get JFFS2 working on an EmbedddPlanet RPX CLLF card (PowerPC,
big endian) with 16 mega RAM, 16 mega AMD flash.

I am currently using the 2.4.2 kernel that comes with the Montavista HHL
2.0.

I partitioned the Flash, modifying the rpxlite.c, in order to have two
partition, 512 Kbyte each, for the top and bottom part of the Flash, which
contains the card firmware, in order to live them and me calm. Then a 1
Mbyte partition for a kernel, the rest for the FS. Checked the two 512 K
partitions, by copying from the char and block devices, they seem OK,
containing the code of the FW.
Below the kernel configuration (MTD related).

#
# Memory Technology Devices (MTD)
#
CONFIG_MTD=y
CONFIG_MTD_DEBUG=y
CONFIG_MTD_DEBUG_VERBOSE=3
#
# Linearly Mapped Flash Device Drivers
#
CONFIG_MTD_CFI=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_MTD_RPXLITE=y
CONFIG_MTD_CHAR=y
CONFIG_MTD_BLOCK=y

The FS mounts, unmounts, but every time I remount the FS it seems the Flash
gets reprogrammed, no magic number is found at the correct offset. Is it a
big endian vs little endian problem ?

See below kernel log:

Dec 25 22:58:56 192 kernel: JFFS2: Erase block at 0x006c0000 is not
formatted. It will be erased
Dec 25 22:58:56 192 kernel: jffs2_scan_eraseblock(): Magic bitmask 0x1985
not found at 0x00700000: 0x0320 instead
Dec 25 22:58:56 192 kernel: jffs2_scan_eraseblock(): Magic bitmask 0x1985
not found at 0x00700004: 0x0c00 instead
Dec 25 22:58:56 192 kernel: jffs2_scan_eraseblock(): Magic bitmask 0x1985
not found at 0x00700008: 0x98dc instead
Dec 25 23:52:01 192 kernel: jffs2_setattr(): ino #62

Other fragment:

Dec 25 23:52:01 192 kernel: Node read from 00beaf9c: node_crc 23d06abe,
calculated CRC c6649d1e. dsize 10000000, csize 10000000, offset 0, buf
c0353440
Dec 25 23:52:01 192 kernel: Node CRC 23d06abe != calculated CRC c6649d1e for
node at 00beaf9c

I am not able alone to understand normal or ubnormal condition in the log,
e.g. this one ?

Dec 25 23:11:41 192 kernel: j_a_f_d_t_f: skipping frag 0x0000-0x1000; phys
0x00dc007c (*c0e7f2c0->c0e7f2d4)
Dec 25 23:11:41 192 kernel: j_a_f_d_t_f: skipping frag 0x1000-0x2000; phys
0x00dc0580 (*c0e7f2d4->c0e7f2e8)
Dec 25 23:11:41 192 kernel: j_a_f_d_t_f: skipping frag 0x2000-0x3000; phys
0x00dc0a18 (*c0e7f2e8->c0e7f2fc)
Dec 25 23:11:41 192 kernel: j_a_f_d_t_f: skipping frag 0x3000-0x4000; phys
0x00dc13a8 (*c0e7f2fc->c0e7f310)
Dec 25 23:11:41 192 kernel: j_a_f_d_t_f: skipping frag 0x4000-0x5000; phys
0x00dc1e94 (*c0e7f310->c0e7f324)
Dec 25 23:11:41 192 kernel: j_a_f_d_t_f: skipping frag 0x5000-0x6000; phys
0x00dc2858 (*c0e7f324->c0e7f338)
Dec 25 23:11:41 192 kernel: j_a_f_d_t_f: skipping frag 0x6000-0x7000; phys
0x00dc31d4 (*c0e7f338->c0e7f34c)
Dec 25 23:11:41 192 kernel: j_a_f_d_t_f: skipping frag 0x7000-0x8000; phys
0x00dc3af0 (*c0e7f34c->c0e7f360)
Dec 25 23:11:41 192 kernel: j_a_f_d_t_f: skipping frag 0x8000-0x9000; phys
0x00dc4470 (*c0e7f360->00000000)

Anyone can help me ?

Thank you
Paolo
