Received: from mtaout03-winn.ispmail.ntl.com ([81.103.221.49])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HxmMv-0005eT-T5
	for linux-mtd@lists.infradead.org; Mon, 11 Jun 2007 12:04:05 -0400
Received: from aamtaout01-winn.ispmail.ntl.com ([81.103.221.35])
	by mtaout03-winn.ispmail.ntl.com with ESMTP id
	<20070611160330.QYBL13.mtaout03-winn.ispmail.ntl.com@aamtaout01-winn.ispmail.ntl.com>
	for <linux-mtd@lists.infradead.org>; Mon, 11 Jun 2007 17:03:30 +0100
Received: from FRN2 ([86.1.174.206]) by aamtaout01-winn.ispmail.ntl.com
	with SMTP
	id <20070611160330.LGL219.aamtaout01-winn.ispmail.ntl.com@FRN2>
	for <linux-mtd@lists.infradead.org>; Mon, 11 Jun 2007 17:03:30 +0100
Message-ID: <009201c7ac42$0cee6ec0$3902a8c0@FRN2>
From: "Kevin Morfitt" <kevin.morfitt@ntlworld.com>
To: <linux-mtd@lists.infradead.org>
Subject: CLEANMARKER node found at 0x007a4000 has totlen 0xc != normal 0x0
Date: Mon, 11 Jun 2007 17:03:26 +0100
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I'm using mtd-utils-1.0.0 on a KB9202B with a 32M NAND flash. /dev/mtd0 is 
mapped as one partition:

[root@KB9202B:~] cat /proc/mtd
dev:    size   erasesize  name
mtd0: 02000000 00004000 "nand_fs"

I create my jffs image using:

mkfs.jffs2 --pad=0x4000 --eraseblock=0x4000 -l --root=kb9202_nfsroot/target_fs 
 -o full_fs.bin

To program the NAND, when I'm mounted via NFS, I do:

[root@KB9202B:~] flash_eraseall -j /dev/mtd0
Erasing 16 Kibyte @ 1ffc000 -- 99 % complete. Cleanmarker written at 
1ffc000.
[root@KB9202B:~] nandwrite -f /dev/mtd0 /full_fs.bin

When I re-boot from MTD I always get lots of messages like "CLEANMARKER node 
found at 0x007a4000 has totlen 0xc != normal 0x0". The board still boots but 
after a few re-boots I end up getting other messages like:

Empty flash at 0x007de204 ends at 0x007de400
JFFS2 notice: (187) check_node_data: wrong data CRC in data node at 
0x007de800: read 0x95b49b87, calculated 0xc429c7e8.

I've seen the other threads on this subjects and tried using '-n' in my 
mkfs.jffs2 command but if I do that nandwrite fails with:

[root@KB9202B:~] Input file is not page aligned
[root@KB9202B:~] Data did not fit into device, due to bad blocks

I've read somewhere else that the "wrong data CRC" message might mean my 
erase size is wrong but I don't know what the erase size should be anyway.

I'd appreciate any advice anyone could give.

Thanks
Kev 
