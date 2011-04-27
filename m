Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1QF6Vp-0005P5-OK
	for linux-mtd@lists.infradead.org; Wed, 27 Apr 2011 15:18:46 +0000
Received: from [192.168.0.34] (col31-4-88-188-83-94.fbx.proxad.net
	[88.188.83.94])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 48168EC
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Apr 2011 17:18:33 +0200 (CEST)
Message-ID: <4DB833CD.5020305@free-electrons.com>
Date: Wed, 27 Apr 2011 17:18:37 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: onenand_2x_program: optional or required ?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I have a board with a 2-planes OneNAND chip and, for the purpose of a
tutorial, I'm trying to put a squashfs rootfs on it.
I noticed that when the kernel doesn't have the
CONFIG_MTD_ONENAND_2X_PROGRAM option, it prints error like:

[    4.946594] SQUASHFS error: squashfs_read_data failed to read block
0x224366
[    4.954437] SQUASHFS error: Unable to read metadata cache entry [224366]
[    4.961791] SQUASHFS error: Unable to read inode 0xbf70504

and fails to mount the squashfs.


Can someone confirm or invalidate that this option really is necessary
when dealing with 2-planes onenands or is it merely meant to be an
improvement for supported chips ? Will flash-oriented filesystems also
have that problem w/o the option ?

I thought this option only affected write-functions but it seems it also
has an impact on reads.

Thanks
-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
