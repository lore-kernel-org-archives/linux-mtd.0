Received: from moutng.kundenserver.de ([212.227.126.183])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgQDz-0006mO-7K
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 15:12:59 +0000
Received: from [212.227.126.206] (helo=mrelayng.kundenserver.de)
	by moutng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1AgQBu-00035p-00
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 16:10:50 +0100
Received: from [10.100.100.154] by server5.adwin.de (GMS
	9.01.3158/LG0047.00.c59c3165) with ESMTP id qsvibaaa for
	linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 16:10:49 +0100
Date: Tue, 13 Jan 2004 16:10:49 +0100
To: linux-mtd@lists.infradead.org
From: Markus Borchers <MBorchers@ADwin.de>
Content-Type: text/plain; format=flowed; charset=utf-8
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <opr1py4bes8jdzbh@10.100.100.100>
Subject: overwrite complete flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello everyone,

during an firmware-update-process I want to overwrite the complete flash 
with one image.

My system is an Intel IXP425-based custom board with RedBoot, linux 
version 2.4.18, root on jffs2,
5 MTD partitions on "IXP425 Flash":
0x00000000-0x00040000 : "RedBoot"
0x00040000-0x000e0000 : "kernel"
0x00100000-0x007c0000 : "root"
0x007c0000-0x007e0000 : "RedBoot config"
0x007e0000-0x00800000 : "FIS directory"

I know that I can overwrite a complete partition (e.g. /dev/mtdblock1 = 
kernel),
but then the update-process depends on the partition table.

I miss a device-file (like /dev/hda) to have access independent of any 
partitions.


I found the implementation of the struct map_info ixp425_map in
drivers/mtd/maps/ixp425.c with the functions
read16:     ixp425_read16,
write16:    ixp425_write16
After exporting that symbol I can use this funktions with my own
kernel-modul.

The reading works but the writing not.


Any hints?

Thanks in advance!
Markus
