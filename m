Received: from asmtp.proserver1.at ([193.186.169.16])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JcMvm-0003uK-Qi
	for linux-mtd@lists.infradead.org; Thu, 20 Mar 2008 15:43:51 +0000
Received: from secure.proserver1.at (boogie-with-stu.proserver1.at
	[193.186.169.6])
	by asmtp.proserver1.at (Postfix) with ESMTP id F28A22C7C8
	for <linux-mtd@lists.infradead.org>;
	Thu, 20 Mar 2008 16:51:51 +0100 (CET)
Message-ID: <48926.80.120.2.52.1206028032.squirrel@secure.proserver1.at>
Date: Thu, 20 Mar 2008 16:47:12 +0100 (CET)
Subject: usage of mkfs.jffs2 --incremental=
From: "Harald Krammer" <Harald.Krammer@hkr.at>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I have a question about the usage of "--incremental=<img> in mkfs.jffs2.

I made following test code (flash_img.jffs2 is already there):

mkfs.jffs2 --incremental=flash_img.jffs2  -o flash_backup.jffs2
--root=backup/
cat flash_backup.jffs2 >>flash_img.jffs2
rm flash_backup.jffs2
fcp -v flash_img.jffs2 /dev/mtd3

After mounting I get many error message...

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002e0024:
0x2e94 instead
Further such events for this erase block will not be printed
Empty flash at 0x002e2288 ends at 0x002e228c
CLEANMARKER node found at 0x002e228c, not first node in block (0x002e0000)
Node at 0x002ef82c with length 0x00000a06 would run over the end of the
erase block
Perhaps the file system was created with the wrong erase size?
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x002f0000:
0x9a8f instead

What is my mistake?

Any help are welcome
nice greetings,
Harald

-- 
Harald Krammer
Brucknerstrasse 33
A - 4020  Linz
AUSTRIA

Mobil +43.(0) 664. 130 59 58
Mail: Harald.Krammer (at) hkr.at
