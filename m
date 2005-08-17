Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E5MCs-0007cf-FK
	for linux-mtd@lists.infradead.org; Wed, 17 Aug 2005 07:35:45 -0400
Message-ID: <43032196.3030501@inf.u-szeged.hu>
Date: Wed, 17 Aug 2005 13:37:58 +0200
From: Zoltan Sogor <weth@inf.u-szeged.hu>
MIME-Version: 1.0
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: problem with latest mtd-cvs
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem!

We try to use the latest mtd and nandsim. We are using 2.6.12.3 kernel
and the latest cvs version of mtd. Nandsim is enabled with default
parameters (0x98,0x39,0xff,0xff).

We build a small image which contains some data (/bin, /sbin and mtd
source).
mkfs.jffs2 -n -p -e8KiB -r image_src -o testimg.jffs2

I load the nandsim module, erase it and write the image.

modprobe nandsim
flash_eraseall -j  /dev/mtd0c
nandwrite -p /dev/mtd0c testimg.jffs2

I get the following messages on my console during the mount process:

JFFS2 version 2.2. (NAND) (C) 2001-2003 Red Hat, Inc.
JFFS2: default compression mode: priority
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x00006a00: read 0x2fbdbe31, calculated 0x368458d8.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x000e1a00: read 0x415d9de6, calculated 0xcf2a48a1.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x00135c00: read 0x6cf0c59a, calculated 0x1628ca38.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x00195e00: read 0x7e798a8e, calculated 0xd16b0a11.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x001f1000: read 0x143a2b51, calculated 0x2e19d442.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x001f3c00: read 0x89d9ae82, calculated 0x62720698.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x00251e00: read 0x329306e9, calculated 0x13ac17ca.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x002b6600: read 0xdb992886, calculated 0x8df5d88f.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x002d6a00: read 0x2bed4edb, calculated 0xcb15ac08.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x002dbc00: read 0x536d09d9, calculated 0x15a059a0.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x00345800: read 0x1579fd2b, calculated 0x55c80477.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x00353400: read 0x38303238, calculated 0xefc54214.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x00385e00: read 0x1ca8e53a, calculated 0xfec10e47.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x00556800: read 0xf0732889, calculated 0x37a1567d.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x00521600: read 0xbf319a5b, calculated 0x40a106fa.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x00564800: read 0xa3f49e69, calculated 0x4aaaae13.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x00582600: read 0xe19fedb, calculated 0xeef00524.
JFFS2 notice: 4261,check_node_data: wrong data CRC in data node at
0x00598600: read 0x32bc8c46, calculated 0x6dd5afa5.

It workes fine with mtd from July 26. Mtd snapshot from Aug 1 is wrong.

I send the log to you in private.

Thanks:
     Zoltan
