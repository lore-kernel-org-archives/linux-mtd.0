Received: from wa-out-1112.google.com ([209.85.146.182])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I61yB-0003Qz-7W
	for linux-mtd@lists.infradead.org; Wed, 04 Jul 2007 06:20:24 -0400
Received: by wa-out-1112.google.com with SMTP id v33so2822951wah
	for <linux-mtd@lists.infradead.org>;
	Wed, 04 Jul 2007 03:20:21 -0700 (PDT)
Message-ID: <9b52d64c0707040320h26d41c9bta5dab5bfce56dd45@mail.gmail.com>
Date: Wed, 4 Jul 2007 15:50:20 +0530
From: "Vinit Agnihotri" <vinit.agnihotri@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: bug in UBI
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

When attaching a UBI to a mtd device, UBI reports following mesage
UBI: attached mtd0 to ubi1


I use AMD 64Bit dual core processor with 2.6.18.3 kernel.
heres my /proc/mtd output
[root@localhost ~]# cat /proc/mtd
dev:    size   erasesize  name
mtd0: 0000000008000000 0000000000400000 "mtd0"

After insertion of UBI module, UBI displays message
UBI: attached mtd0 to ubi1

However UBI creates device entry as /dev/ubi0, so message is incorrect.
I looked into code & it requires some code lines to be ordered properly.

heres the patch:

signedoff by Vinit Agnihotri
--- build.c.orig	2007-07-04 15:49:44.000000000 +0530
+++ build.c	2007-07-04 15:50:32.000000000 +0530
@@ -593,7 +593,6 @@
 	if (err)
 		goto out_detach;

-	ubi_devices_cnt += 1;

 	ubi_msg("attached mtd%d to ubi%d", ubi->mtd->index, ubi_devices_cnt);
 	ubi_msg("MTD device name:            \"%s\"", ubi->mtd->name);
@@ -624,6 +623,7 @@
 		wake_up_process(ubi->bgt_thread);
 	}

+	ubi_devices_cnt += 1;
 	return 0;

 out_detach:
