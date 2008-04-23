Received: from n1.cetrtapot.si ([89.212.80.162])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoeZk-0007YZ-50
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 12:59:52 +0000
Received: from localhost (localhost.dmz.cetrtapot.si [127.0.0.1])
	by n1.cetrtapot.si (Postfix) with ESMTP id 8A3A5BE2C
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 14:59:49 +0200 (CEST)
Received: from n1.cetrtapot.si ([127.0.0.1])
	by localhost (n1.dmz.cetrtapot.si [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ydQf+e-TUHbf for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 14:59:46 +0200 (CEST)
Received: from fubar.kranj.cetrtapot.si (inside.kranj.cetrtapot.si
	[192.168.66.2])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by n1.cetrtapot.si (Postfix) with ESMTP id 8CDF1BE27
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 14:59:46 +0200 (CEST)
Message-ID: <480F32C1.6050003@cetrtapot.si>
Date: Wed, 23 Apr 2008 14:59:45 +0200
From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: hang on jffs2 mount
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,

We are using ancient kernel 2.6.12 on our embedded devices.
After being in the wild about two/three years the devices
started having issues with mounting jffs2 rootfs that is
located on NOR flash. The devices are turned off on daily
basis without any power management - power is just cut
off from the board while jffs2 filesystems are still
mounted!!! I think this might be the main reason for
the hangs we are experiencing.

I've managed to start the device with NFS mounted rootfs
and then manually mounted the flash rootfs.
If using 2.6.12 kernel for this 'rescue' procedure it hangs
the device - not responding anymore.
More success was achieved using 2.6.25 kernel - it actually
managed to mount the offending flash rootfs with following
dmesg messages:


# mount -t jffs2 /dev/mtdblk2 /mnt

jffs2_scan_eraseblock(): Node at 0x00213f54 {0x1985, 0xffff, 0xffffffff) has invalid CRC 0xffffffff (calculated 0x19861e00)
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x260320. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x260364. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x2602ac. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x2603a8. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x2603ec. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x260268. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x260430. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x260474. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x260224. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x2604b8. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x2604fc. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x260540. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x2601e0. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x260584. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x2605c8. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (656) jffs2_get_inode_nodes: Node header CRC failed at 0x26060c. {ffff,ffff,ffffffff,ffffffff}

Seeing those ffff, ffffffff values makes me thinking that
info was read from erased flash sector or similar!?

Would upgrade to more recent kernel fix the hangs during
bootup or can this be solved only with clean umount before
poweroff?

Regards,
Hinko

-- 
ČETRTA POT, d.o.o., Kranj
Planina 3
4000 Kranj
Slovenia, Europe
Tel. +386 (0) 4 280 66 03
E-mail: hinko.kocevar@cetrtapot.si
Http: www.cetrtapot.si
