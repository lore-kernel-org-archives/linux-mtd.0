Received: from postman.ateme.net ([217.167.236.59])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BPkM1-0007vz-88
	for linux-mtd@lists.infradead.org; Mon, 17 May 2004 16:48:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by postman.ateme.net (Postfix) with ESMTP id 2276E4B8015
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 May 2004 17:48:32 +0200 (CEST)
Received: from postman.ateme.net ([127.0.0.1])
	by localhost (lserver [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11587-06 for <linux-mtd@lists.infradead.org>;
	Mon, 17 May 2004 17:48:31 +0200 (CEST)
Received: from pc-179.ateme.net (pc-179.ateme.net [172.16.16.179])
	by postman.ateme.net (Postfix) with ESMTP id 53E164B800D
	for <linux-mtd@lists.infradead.org>;
	Mon, 17 May 2004 17:48:31 +0200 (CEST)
From: Frederic Janot <f.janot@ateme.fr>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Message-Id: <1084808911.1659.20.camel@localhost>
Mime-Version: 1.0
Date: Mon, 17 May 2004 17:48:31 +0200
Content-Transfer-Encoding: 7bit
Subject: jffs2_get_inode_nodes(): Data CRC failed on NAND chip
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I've got a problem when using jffs2 filesystem on a nand flash device.

I've created a root file system image on my pc (little-endian) from
/rootfs directory which contain all needed files. I burn this image into
a nand flash (samsung k9f5608 - 32MB nand with 512+16 bytes per pages)
on a board with a power pc processor (big-endian).

So, on the pc, i do :
# mkfs.jffs2 -p --root=/rootfs -e 16384 -b -o fs_img

My flash partitions are :
# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 00400000 00004000 "Nand Flash Kernel"
mtd1: 01a00000 00004000 "Nand Flash RootFS"
mtd2: 00200000 00004000 "Nand Flash Test"

On my target, from an nfs mount root file system, i do :
# nandwrite -j /dev/mtd1 /fs_img

After that, I reboot my board and make the kernel boot from nand root
file system. The first boot is ok but when i reboot one more time, I
have the following message :
Empty flash at 0x0047b900 ends at 0x0047ba00
jffs2_get_inode_nodes(): Data CRC failed on node at 0x015fc000: Read
0x5a62bf55, calculated 0x349968c2

And each time I reboot, there is one message more. (I do nothing else
than login and reboot)
Empty flash at 0x0047b900 ends at 0x0047ba00
Empty flash at 0x015fc268 ends at 0x015fc400
jffs2_get_inode_nodes(): Data CRC failed on node at 0x015fc000: Read
0x5a62bf55, calculated 0x349968c2
jffs2_get_inode_nodes(): Data CRC failed on node at 0x015fc778: Read
0xdf13fb17, calculated 0xbdff7e75

etc ...

Do you have any idea on what happens ?

Thanks

Frederic Janot
