Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sl58-0004FM-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2002 14:45:46 +0100
Received: from dagobert.svc.sysgo.de ([172.22.1.2])
	by dagobert.svc.sysgo.de (8.10.2/8.10.2/SuSE Linux 8.10.0-0.3) with ESMTP id g33Djhw15215
	for <linux-mtd@lists.infradead.org>; Wed, 3 Apr 2002 15:45:43 +0200
Date: Wed, 3 Apr 2002 15:45:43 +0200 (MEST)
From: Armin Schindler <acs@sysgo.de>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: mtd device for rootfs with kernel 2.4.18
Message-ID: <Pine.LNX.4.21.0204031527130.14746-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi,

I hope someone can help with the following :

- MTD Partitions
  (mtd from CVS about 2 weeks ago, no changes in the important
  parts since then)
- JFFS2 as root filesystem on one mtd partition
  (JFFS2 from CVS jffs2-2_4-branch)
- Kernel 2.4.18

The problem is, when the kernel tries to mount the rootfs, it just
hangs. This is because it waits for a semaphore s_umount of the
superblock structure.

This semaphore was introduced in kernel 2.4.4 (I believe) and is
down during the loop for fs_types in fs/super.c. It is still down,
when blkdev_put() is called, where the mtdblock's release function
is called. This release function calls invalidate_device() which also
calls other functions where the s_umount semaphore is "downed" too.

I'm not that familiar with the mount-rootfs or the mtdblock code to
propose a patch here. 
Maybe moving the up_write(&sb->s_umount); before the blkdev_put()
would be a solution, but I don't know the impact...

Or did I overlook something here ?

Thanx,
Armin
