Received: from [141.169.254.2] (helo=mio.wago.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17c4iV-0006Or-00
	for <linux-mtd@lists.infradead.org>; Tue, 06 Aug 2002 14:49:43 +0100
Received: from wago.de (donau [141.169.1.4])
	by mio.wago.de (8.11.6+Sun/8.11.6) with ESMTP id g76DnCj02367
	for <linux-mtd@lists.infradead.org>; Tue, 6 Aug 2002 15:49:12 +0200 (MEST)
Received: from magnus.eni.wago.de (magnus [141.169.1.17])
	by wago.de (8.11.6+Sun/8.11.6) with SMTP id g76DnCn07573
	for <linux-mtd@lists.infradead.org>; Tue, 6 Aug 2002 15:49:12 +0200 (MEST)
From: olivier.eribon@acterna.com
To: linux-mtd@lists.infradead.org
Message-ID: <C1256C0D.004BE77A.00@magnus.eni.wago.de>
Date: Tue, 6 Aug 2002 15:46:23 +0200
Subject: JFFS2 problem with MTD & 2.4.17
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
Content-Disposition: inline
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


Hello,

I am using JFFS2 (from CVS july 01 2002) and 2.4.17 linux kernel on a
specific board (ppc405gp with a nand flash : Toshiba TC58256FT/DC)
Before using my nand flash partition :

[root@serdmq7111 /root]# eraseall /dev/mtd1
[root@serdmq7111 /root]# mount -t jffs2 /dev/mtdblock1 /mnt/jffsp2 where
/mnt/jffsp2 is the NAND flash partition
[root@serdmq7111 /root]# cd /mnt/jffsp2
[root@serdmq7111 /mnt/jffsp2]# tar xvf /files.tar
[root@serdmq7111 /mnt/jffsp2]# cd
[root@serdmq7111 /root]# umount /mnt/jffsp2
reboot

*-1-* When I mounted my JFFS2 flash partition, I got the following on the
console.

Linux version 2.4.17_mvl21 (oeribon@ensun14) (gcc version 2.95.3 20010315
(release/MontaVista))
JFFS2 version 2.1. (C) 2001, 2002 Red Hat, Inc., designed by Axis
Communications AB.
NAND device: Manufacture ID: 0x98, Chip ID: 0x75 (Toshiba TC58256FT/DC)
Creating 2 MTD partitions on "Toshiba TC58256FT/DC":
0x00000000-0x00100000 : "boot"
0x00100000-0x02000000 : "partition 31Mo" <= I using only this partition
serdmq7111 login: root

[root@serdmq7111 /root]# mount -t jffs2 /dev/mtdblock1 /mnt/jffsp2
jffs2_scan_empty(): Empty block at 0x0179b588 ends at 0x0179b5f4 (with
0x1985e002)! Marking dirty

Time after time (after writting on flash) more and more blocks are indicated
as Empty block and Marking dirty.
Why ?
How can I solve this problem ? (because this message induce long time to
mount partition.)


*-2-* I have another problem with files :
for example when I do :
[root@serdmq7111 /root]# mkdir /mnt/jffsp2/dir where /mnt/jffsp2 is the NAND
flash partition
[root@serdmq7111 /root]# cp /MAKEDEV /mnt/jffsp2/dir/f0
[root@serdmq7111 /root]# cp /MAKEDEV /mnt/jffsp2/dir/f1
[root@serdmq7111 /root]# cp /MAKEDEV /mnt/jffsp2/dir/f2

[root@serdmq7111 /root]# umount /mnt/jffsp2
reboot
[root@serdmq7111 /root]# mount -t jffs2 /dev/mtdblock1 /mnt/jffsp2
no problem

but when I erase files, and for each mount I have the same message
[root@serdmq7111 /root]#rm -rf /mnt/jffsp2/dir
[root@serdmq7111 /root]# umount /mnt/jffsp2
reboot
[root@serdmq7111 /root]# mount -t jffs2 /dev/mtdblock1 /mnt/jffsp2
I got the following on the console.

Inode #???? was a directory with children - removing those too...
Cannot remove child "f0", ino #0, because it doesn't exist
Cannot remove child "f1", ino #0, because it doesn't exist
Cannot remove child "f2", ino #0, because it doesn't exist
Why ?
How can I solve this problem ? (because this message induce long time to
mount partition.)


*-3-* And after erasing files, the system periodically does not respond for
multiple "seconds" to
CR's on the bash prompt.
What's going on?

Thanks in advance for your time and your help !

Best regards,

Olivier
