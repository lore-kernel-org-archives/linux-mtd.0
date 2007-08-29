Received: from smtp4-g19.free.fr ([212.27.42.30])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IQOGS-0006tm-7n
	for linux-mtd@lists.infradead.org; Wed, 29 Aug 2007 10:11:27 -0400
Received: from smtp4-g19.free.fr (localhost.localdomain [127.0.0.1])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 9C19F6F34F
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Aug 2007 16:11:21 +0200 (CEST)
Received: from [192.168.111.252] (cla34-1-88-160-215-156.fbx.proxad.net
	[88.160.215.156])
	by smtp4-g19.free.fr (Postfix) with ESMTP id 804A76EFB7
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Aug 2007 16:11:21 +0200 (CEST)
From: Saravanan Chanemouganandam <schane@osmozis.com>
To: linux-mtd@lists.infradead.org
Subject: transfer jffs2 rootFS to Nand flash
Date: Wed, 29 Aug 2007 16:10:50 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200708291610.50617.schane@osmozis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

I am fascing problem in mounting jffs2 root file system on the cm-x270 board
after flashing the jffs2 root file system image on to the MTD Nand partition
with the following steps....

1. boot cm-x270 with NAND, NOR and JFFS2 drivers built into kernel
2. mounted root file system via "nfs"
3. checked the partitions
        cm-debian:~# cat /proc/partitions
        major minor  #blocks  name
         254     0     513576 nand
          31     0       4096 mtdblock0            ( NOR)
          31     1     524288 mtdblock1          (NAND)
        cm-debian:~# cat /proc/mtd
        dev:    size   erasesize  name
        mtd0: 00400000 00010000 "phys_mapped_flash"
        mtd1: 20000000 00020000 "cmx270-0"
        cm-debian:~#

4. cm-debian:~#flash_eraseall -j /dev/mtd1          

5. on the host created jffs2 rootfs image using #mkfs.jffs2 -r cmrootfs -n -o
cmrootfs.img -e 0x20000 --pad=0x20000000

6. copied cmrootfs.img to the cm-x270 board

7. on the cm-x270, flashed rootfs image using mtd-utilities
        cm-debian:~# nandwrite /dev/mtdblock1 /mnt/net/cmrootfs.img
	.....
        Writing data to block 1ffe0000
	Data did not fit into device, due to bad blocks
	: Success
	cm-debian:~#

8. Tested the jffs2 rootFS using mount
        cm-debian:~# mount -t jffs2 /dev/mtdblock1 /mnt/test

	cm-debian:/mnt/net# ls /mnt/test
	bin   dev  home    lib         media  opt           proc  sbin  sys  usr
	boot  etc  initrd  lost+found  mnt    packages.txt  root  srv   tmp  var

After reboot, I am getting the kernel panic  with boot option for root as
root=/dev/mtdblock1 rootfstype=jffs2"

...
...
IP-Config: Complete:
      device=eth0, addr=192.168.6.202, mask=255.255.255.0, gw=192.168.6.1,
     host=cm-x270, domain=, nis-domain=(none),
     bootserver=192.168.6.1, rootserver=192.168.6.1, rootpath=
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 nodes
empty_blocks 0, bad_blocks 8, c->nr_blocks 4096
VFS: Cannot open root device "mtdblock1" or unknown-block(31,1)
Please append a correct "root=" boot option
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(31,1)

Could anyone please tell me where I am wrong ? and why is the JFFS doesn't
mount the file system?

Thanks
Sara
