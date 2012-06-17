Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SgEGB-0007Xt-Rj
 for linux-mtd@lists.infradead.org; Sun, 17 Jun 2012 12:07:17 +0000
Received: from beldin (unknown [IPv6:2a01:e35:2f37:a360:a4e1:ac7d:7572:cd43])
 by smtp1-g21.free.fr (Postfix) with ESMTP id 773E4940138
 for <linux-mtd@lists.infradead.org>; Sun, 17 Jun 2012 14:07:08 +0200 (CEST)
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: linux-mtd@lists.infradead.org
Subject: Linux 3.5-rc2 and ubifs as root
Date: Sun, 17 Jun 2012 14:07:07 +0200
Message-ID: <87k3z616s4.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi all,

I have my root partition on a UBIFS, on top on my docg3 MTD.
With version 3.4, my kernel boots fine. With version 3.5-rc2, my kernel can't
find the root partition.

My command line is :
mtdparts=docg3.0:256k@3456k(barebox)ro,256k(barebox-logo),128k(barebox-env),4M(kernel),-(root)
ubi.mtd=4 rootfstype=ubifs root=ubi0:linux_root ro

Now, the funny thing : if I boot with the same kernel on my SD card (change on
the commandline to root=/dev/mmcblk0p2 for example), and then
issue "mount -t ubifs ubi0:linux_root /mnt", it works.

Did that happen to anybody else ?

Cheers.

-- 
Robert
