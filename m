Received: from dsl-210-15-250-78.nsw.netspace.net.au ([210.15.250.78]
	helo=mail.magtech.com.au)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cb8nU-0001HD-Ai
	for linux-mtd@lists.infradead.org; Sun, 05 Dec 2004 21:40:21 -0500
Received: from mail.magtech.com.au (localhost [127.0.0.1])
	by localhost.magtech.com.au (Postfix) with ESMTP id D52BF895801
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Dec 2004 13:40:13 +1100 (EST)
Received: from [192.168.65.196] (unknown [192.168.65.196])
	by mail.magtech.com.au (Postfix) with ESMTP id C29368945FF
	for <linux-mtd@lists.infradead.org>;
	Mon,  6 Dec 2004 13:40:13 +1100 (EST)
Message-ID: <41B3C68C.8080808@magellan-technology.com>
Date: Mon, 06 Dec 2004 13:40:12 +1100
From: Aras Vaichas <arasv@magellan-technology.com>
MIME-Version: 1.0
To: MTD-LIST <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: problem with mtdblock dev entries over 9
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm using the 2.4.x version of the MTD cvs.

I recently created over 9 MTD partitions and I noticed that /dev/mtdblock had 
incorrect names for entries 10 and 11 instead they were ":" and ";". The 
/dev/mtd directory was OK though.

e.g

/root # ll /dev/mtdblock
drwxr-xr-x    1 root     root            0 Jan  1  1970 ./
drwxr-xr-x    1 root     root            0 Jan  1  1970 ../
brw-rw-rw-    1 root     root      31,   0 Jan  1  1970 0
brw-rw-rw-    1 root     root      31,   1 Jan  1  1970 1
brw-rw-rw-    1 root     root      31,   2 Jan  1  1970 2
brw-rw-rw-    1 root     root      31,   3 Jan  1  1970 3
brw-rw-rw-    1 root     root      31,   4 Jan  1  1970 4
brw-rw-rw-    1 root     root      31,   5 Jan  1  1970 5
brw-rw-rw-    1 root     root      31,   6 Jan  1  1970 6
brw-rw-rw-    1 root     root      31,   7 Jan  1  1970 7
brw-rw-rw-    1 root     root      31,   8 Jan  1  1970 8
brw-rw-rw-    1 root     root      31,   9 Jan  1  1970 9
brw-rw-rw-    1 root     root      31,  10 Jan  1  1970 :
brw-rw-rw-    1 root     root      31,  11 Jan  1  1970 ;

solution (assuming number of partitions does not exceed 99!):

--- drivers/mtd/mtd_blkdevs-24.c.orig   2004-12-06 13:29:21.568417264 +1100
+++ drivers/mtd/mtd_blkdevs-24.c        2004-12-06 13:35:25.443099904 +1100
@@ -476,10 +476,9 @@
         }
  #ifdef CONFIG_DEVFS_FS
         if (!tr->part_bits) {
-               char name[2];
+               char name[3];

-               name[0] = '0' + new->devnum;
-               name[1] = 0;
+               sprintf( name, "%d", new->devnum );

                 new->blkcore_priv =
                         devfs_register(tr->blkcore_priv->devfs_dir_handle,

regards,

Aras Vaichas
