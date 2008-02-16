Received: from smtp2.sssup.it ([193.205.80.100] helo=smpt2.sssup.it)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JQNTs-0007da-RK
	for linux-mtd@lists.infradead.org; Sat, 16 Feb 2008 13:53:29 +0000
Received: from sssup.it (ms01.sssup.it [193.205.80.99])
	by smpt2.sssup.it (Postfix) with ESMTP id D306764D5F8
	for <linux-mtd@lists.infradead.org>;
	Sat, 16 Feb 2008 14:39:52 +0100 (CET)
Received: from [193.205.82.7] (HELO gandalf.sssup.it)
	by sssup.it (CommuniGate Pro SMTP 4.1.8)
	with ESMTP-TLS id 39067681 for linux-mtd@lists.infradead.org;
	Sat, 16 Feb 2008 14:38:41 +0100
Received: from [10.30.3.161] ([10.30.3.161])
	by gandalf.sssup.it (8.12.10/8.12.10) with ESMTP id m1GDkVcw000856
	for <linux-mtd@lists.infradead.org>; Sat, 16 Feb 2008 14:46:31 +0100
Message-ID: <47B6EAC7.7070208@gandalf.sssup.it>
Date: Sat, 16 Feb 2008 14:53:11 +0100
From: michael <trimarchi@gandalf.sssup.it>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: jffs2 failing after reboot on dataflash. 2.6.24
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I use a dataflash for jffs2. The filesystem seems to work correctly but 
at the first reboot
I have some different and some file corruption. This is the different of 
two dump:

9475c9475,9489
< Empty space: 18268, dirty space: 0
---
 > Empty space found from 0x00444cec to 0x00444de0
 >          Inode      node at 0x00444de0, totlen 0x0000041b, #ino    
681, version    67, isize    66031, csize      983, dsize     2701, 
offset    49632
 > Wrong bitmask  at  0x004451fc, 0x0000
 > Empty space found from 0x00445200 to 0x00504f00
 >          Inode      node at 0x00504f00, totlen 0x00000590, #ino    
681, version    68, isize    66031, csize     1356, dsize     3168, 
offset    49632
 >          Inode      node at 0x00505490, totlen 0x00000044, #ino    
681, version    69, isize    66031, csize        0, dsize     1056, 
offset    52800
 >          Inode      node at 0x005054d4, totlen 0x00000531, #ino    
681, version    70, isize    66031, csize     1261, dsize     3168, 
offset    53856
 >          Inode      node at 0x00505a08, totlen 0x00000044, #ino    
681, version    71, isize    66031, csize        0, dsize     1056, 
offset    57024
 >          Inode      node at 0x00505a4c, totlen 0x00000641, #ino    
681, version    72, isize    66031, csize     1533, dsize     3168, 
offset    58080
 >          Inode      node at 0x00506090, totlen 0x00000044, #ino    
681, version    73, isize    66031, csize        0, dsize     1056, 
offset    61248
 >          Inode      node at 0x005060d4, totlen 0x0000063b, #ino    
681, version    74, isize    66031, csize     1527, dsize     3168, 
offset    62304
 >          Inode      node at 0x00506710, totlen 0x00000044, #ino    
681, version    75, isize    66031, csize        0, dsize      559, 
offset    65472
 >          Dirent     node at 0x00506754, totlen 0x00000032, #pino   
673, version   680, #ino       682, nsize       10, name pulldom.py
 >          Padding    node at 0x00506788, totlen 0x00000038
 > Empty space: 2933884, dirty space: 4

The file #ino 681 is corrupted.

The first is the original images creates with mkfs.jffs2, the second one 
is the filesystem after the first reboot. I don't understand
why there new inode created, that invalidate my image.

Regards Michael
