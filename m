Received: from mail-lb0-f178.google.com ([209.85.217.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UnCjj-000439-Rk
 for linux-mtd@lists.infradead.org; Thu, 13 Jun 2013 18:59:08 +0000
Received: by mail-lb0-f178.google.com with SMTP id y6so8577541lbh.37
 for <linux-mtd@lists.infradead.org>; Thu, 13 Jun 2013 11:58:43 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 13 Jun 2013 14:58:43 -0400
Message-ID: <CA+mubHooA5aaOhOacMUvyt3X4jaK0wm8eu+jR+2nTyM_s4QKEg@mail.gmail.com>
Subject: Jffs2 errors
From: harsh poshtiwala <hiharsh@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I am using TI OMAP AM3517 with Linux 2.6.32.
>From time to time I see errors when I update mtd partitions

i use the following commands
flash_eraseall -j /dev/mtd10
mount -t jffs2 /dev/mtdblock10 /tmp/nand
cd nand
tar -xzf rootfs.tar.gz

the erase operation goes successfully, however I see the following
errors at the time of mount/writing

,ffffffff}
JFFS2 notice: (429) jffs2_get_inode_nodes: Node header CRC failed at
0xe1018d4. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (429) jffs2_get_inode_nodes: Node header CRC failed at
0xe101690. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (429) jffs2_get_inode_nodes: Node header CRC failed at
0xe10144c. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (429) jffs2_get_inode_nodes: Node header CRC failed at
0xe101208. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (429) jffs2_get_inode_nodes: Node header CRC failed at
0xe100fc4. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (429) jffs2_get_inode_nodes: Node header CRC failed at
0xe100d80. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (429) jffs2_get_inode_nodes: Node header CRC failed at
0xe100b3c. {ffff,ffff,ffffffff,ffffffff}
JFFS2 notice: (429) jffs2_get_inode_nodes: Node header CRC failed at
0xe100000. {ffff,ffff,ffffffff,ffffffff}

and finally, I see the following messages before I get the command prompt

JFFS2 warning: (429) jffs2_do_read_inode_internal: no data nodes found
for ino #11487
Returned error for crccheck of ino #11487. Expect badness...
Header CRC failed on REF_PRISTINE node at 0x11f57414: Read 0xffffffff,
calculated 0x44660075
Header CRC failed on REF_PRISTINE node at 0x11f57ba8: Read 0xffffffff,
calculated 0x44660075
Header CRC failed on REF_PRISTINE node at 0x11f5abfc: Read 0xffffffff,
calculated 0x44660075
Node CRC ffffffff != calculated CRC f09e7845 for node at 11f5adfc
read of old metadata failed in jffs2_garbage_collect_metadata(): -5
Error garbage collecting node at 11f5adfc!
No space for garbage collection. Aborting GC thread
Node CRC ffffffff != calculated CRC f09e7845 for node at 11f5adfc
read of old metadata failed in jffs2_garbage_collect_metadata(): -5
Error garbage collecting node at 11f5adfc!
Node CRC ffffffff != calculated CRC f09e7845 for node at 11f5adfc
read of old metadata failed in jffs2_garbage_collect_metadata(): -5
Error garbage collecting node at 11f5adfc!
Node CRC ffffffff != calculated CRC f09e7845 for node at 11f5adfc
read of old metadata failed in jffs2_garbage_collect_metadata(): -5
Error garbage collecting node at 11f5adfc!


One more thing I found is that the target keeps throwing the following messages.
root@ti-omap3-am3517-evm:/tmp# Node CRC ffffffff != calculated CRC
f09e7845 for node at 11f5adfc
read of old metadata failed in jffs2_garbage_collect_metadata(): -5
Error garbage collecting node at 11f5adfc!

Also, when I type some of the commands it fails with the errors

root@ti-omap3-am3517-evm:/tmp# umount nand
JFFS2 warning: (1183) jffs2_get_inode_nodes: Eep. No valid nodes for ino #11253.
JFFS2 warning: (1183) jffs2_do_read_inode_internal: no data nodes
found for ino #11253
iget() failed for ino #11253
-bash: umount: command not found


I would really appreciate your comments to fix this.

--
Thanks & Regards
Harsh
