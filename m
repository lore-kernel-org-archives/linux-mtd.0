Received: from rdu162-229-047.nc.rr.com ([24.162.229.47] helo=gateway.house)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ACnh-00031e-00
	for <linux-mtd@lists.infradead.org>; Sat, 01 Dec 2001 16:15:37 +0000
Received: from gromit.house (gromit.house [192.168.1.133])
	by gateway.house (8.11.6/8.11.2) with ESMTP id fB1GJUs19663
	for <linux-mtd@lists.infradead.org>; Sat, 1 Dec 2001 11:19:30 -0500
Subject: JFFS2: cannot execute /bin/bash: Permission denied
From: Michael Rothwell <rothwell@holly-springs.nc.us>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 01 Dec 2001 11:27:37 -0500
Message-Id: <1007224058.1712.2.camel@gromit>
Mime-Version: 1.0
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


I'm building a JFFS2 filesystem on a 16MB CF card. If I try to run
bin/bash (really ash) from the mounted filesystem, it runs. But it will
not run when booting from the flash card, or chrooting into it:

[root@gromit flash]# chroot /mnt/flash
chroot: cannot execute /bin/bash: Permission denied

I have also tried real bash, just to see.

[root@gromit flash]# ls -al bin/*ash
-rwxr-xr-x    1 root     root        94364 Nov 30 23:47 bin/ash
-rwxr-xr-x    1 root     root       519964 Dec  1 11:17 bin/bash

Permissions seem to be correct. Busybox init complains that it cannot
execute /etc/rc.sysinit (specified in inittab, and exists with correct
permissions, #!/bin/sh at the top, etc.) This happens with sh as a
symlink to busybox, to ash, and to bash.

I get no error messages from JFFS2. On my desktop, I'm using a USB CF
reader, and the flash shows up as /dev/sda. On the device that boots
this card, it's /dev/hda. Same symptoms, "Permission denied"

/dev/mtdblock0 on /mnt/flash type jffs2 (rw)
/dev/sda1 on /mnt/flash/boot type ext2 (rw)

Any ideas?
