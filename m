Received: from mx1.mail.ru ([194.67.23.121])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E37WL-0000Gt-5O
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 03:30:37 -0400
Received: from [213.148.1.228] (port=32771 helo=[192.168.0.37])
	by mx1.mail.ru with asmtp id 1E37WH-000OBb-00
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2005 11:30:29 +0400
Message-ID: <42FAFEC9.1090306@mail.ru>
Date: Thu, 11 Aug 2005 11:31:21 +0400
From: Alex Karev <lineum@mail.ru>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Subject: jffs2 and nand mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello

While we mount empty jffs2 and then copying  files it's ok, after 
remount/reboot. the files have zero gaps ~2kb at some (stable?) 
locations, and filesytem is broken that way.
install procedure following:

#flash_eraseall -j /dev/mtd0
#mount -t jffs2 /dev/mtdblock0 /mnt
#cp ...
    at this stage files looks ok.
#umount
#mount
    zero gaps appear in data on flash and lot of debug info with some 
Eeps, sometimes kernel panic.


Also we try to use mkfs.jffs2, same result.

#mkfs.jffs2 -e 0x4000 -l -n ....     or #mkfs.jffs2 -e 0x4000 -p -l -n 
.... with different variations.

#flash_eraseall -j /dev/mtd0
#nandwrite -j /dev/mtd0 root_fs.jffs2
#mount ...
#umount ...
#mount ...
... usually have debug output, sometimes kernel panic.

Hardware:
ST VEGA PC.
General SW BIOS with extension.
SAMSUNG NAND K9F2808U0C. ports: 0x300 data, 0x301 cmd; erase block 16Kb 
according documentation. no ecc 16Mb

Software:
Our NAND driver implementation, derived from edb7312.c
2 partition
Linux kernel 2.4.29 with patch from mtd c vs.
