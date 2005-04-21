Received: from send.forptr.21cn.com ([202.105.45.50] helo=21cn.com)
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DOYk5-0006dc-7h
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2005 06:17:11 -0400
Date: Thu, 21 Apr 2005 18:16:10 +0800
From: "carl liao" <carlliao@21cn.com>
To: "linux mtd" <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: 7bit
Message-ID: <DB949578818096.01258@send2.inner-21cn.com>
Subject: Why nandwrite success but mount complain?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------------------------------------------------------------------------
Hi,

My kernel is 2.4.26 mipsel with mtd snapshot 20050416. I erase and program my 
nand device this way:
# flash_eraseall -j /dev/mtd/3
# mkfs.jffs2 -n -e 16KiB -m none -o nddemo.jffs2 -d /demo
# nandwrite -p /dev/mtd/3 nddemo.jffs2 
# mount /dev/mtdblock/3 /mnt

The mount did succeed! But there are some dumping messeges and ECC errors.
After mounted, some of programs under /mnt could be executed correctly but some
others couldn't.

The error messages are like the following during mounting a NAND partition:

#mount /dev/mtdblock3 /mnt
......
--> mtd->read(0x400 bytes from 0xc000) returned ECC error 
--> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000c154: 
0x05b7 instead
--> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000c158: 
0x83a0 instead
......

I nanddump the data from /dev/mtd/3 to a file nandmtd3.dump and look at it:
--> 0x0000c150: 12 00 0b 00 b7 05 00 00 a0 83 41 00 00 00 00 00

I hexedit my JFFS2 image nddemo.jffs2 and look at it:
--> 0x0000c150: 8C 48 44 00 85 19 02 E0 44 10 00 00 6D 58 D1 84

The data indicate the complaints from while mounting JFFS2 is really 
justified!

Then why nandwrite programing most of data within nddemo.jffs2 correctly but 
not all of them? BTW, my nddemo.jffs2 is about 8MB.

Which codes should I dig into:
    1) NAND Flash drvier?
    2) NAND Flash core layer?
    3) JFFS2 wbuf.c and other JFFS2 codes in the kernel?
    4) the nandwrite program itself?

Please give me some suggestions. Thanks!

Carl Liao
