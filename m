Received: from fireext.wenk.be ([193.190.145.130] helo=hardy.denayer.wenk.be)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Axpc3-0003mK-Us
	for linux-mtd@lists.infradead.org; Mon, 01 Mar 2004 15:45:48 +0000
Received: from [192.168.0.150] (moet.denayer.wenk.be [10.30.30.235])
	QAA04147	for <linux-mtd@lists.infradead.org>;
	Mon, 1 Mar 2004 16:46:06 +0100 (MET)
From: Gerrit Van de Velde <gvd@denayer.wenk.be>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1078156118.4832.7.camel@nios>
Mime-Version: 1.0
Date: 01 Mar 2004 16:48:38 +0100
Content-Transfer-Encoding: 7bit
Subject: JFFS2 strange behaveour
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I've made a JFFS2 image from my root filesystem to use in an embedded
platform (Motorola MPC5200). Everything works, i can mount it when burnt
into flash but when I switch from root filesystem on NFS to the image
which resides in FLASH, I get following strange errors during startup:

jffs_scan_flash(): Did not find even a single chunk of free space. This
is BAD!
jffs_scan_falsh():Free size accounting screwed
jfffs_scan_flash():free_chunk_size1 == 0xd00000, free_chunk_size2 ==
0x0, fmc->free_size == 0x0
JFFS: Failed to mount device 1f:02.
VFS: Mounted root (jffs2 filesystem).

So JFFS states: mount failed,
VFS states: mount successful...

after that i get the login prompt and only after one minute i'm able to
login (don't know why)

after logged in i can retrieve the following information:

# df
Filesystem           1k-blocks      Used Available Use% Mounted on
rootfs                   13312      3920      9392  29% /
/dev/mtdblock2           13312      3920      9392  29% /

# dmesg
<snip>Kernel command line: root=/dev/mtdblock2 rw
ip=192.168.0.3:192.168.0.150:192.168.0.1:255.255.255.0:icecube::off
init=init
<snip>

# cat /etc/fstab
none /proc proc defaults

Does anyone know why df states two mounts on the /
and why the jffs errors occur during startup ?

Kind regards,
Gerrit Van de Velde
