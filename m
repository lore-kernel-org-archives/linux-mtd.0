Received: from ip10.savigear.adsl.uk.xo.com ([195.147.222.170] helo=xerp.secret.org.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17TRGb-0005dP-00
	for <linux-mtd@lists.infradead.org>; Sat, 13 Jul 2002 19:05:14 +0100
Received: from spoinky.renegade.org.uk ([192.168.1.2])
	by xerp.secret.org.uk with esmtp (Exim 3.33 #1)
	id 17TRIX-0004GF-00
	for linux-mtd@lists.infradead.org; Sat, 13 Jul 2002 19:07:13 +0100
Received: from localhost ([127.0.0.1] helo=secret.org.uk)
	by spoinky.renegade.org.uk with esmtp (Exim 3.35 #1 (Debian))
	id 17TRGY-0001q2-00
	for <linux-mtd@lists.infradead.org>; Sat, 13 Jul 2002 19:05:10 +0100
From: Simon Evans <spse@secret.org.uk>
To: linux-mtd@lists.infradead.org
Subject: minor permissions patch to mtdchar 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 13 Jul 2002 19:05:09 +0100
Message-Id: <E17TRGY-0001q2-00@spoinky.renegade.org.uk>
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

Are there any objections to me commiting the following?

It:

1. sets the permission on /dev/mtd/*ro to 444 rather than 666
2. Disallows MEMWRITEOOB & MEMERASE ioctls if the device is not opened with
   write permissions.

cheers
si

Index: mtdchar.c
===================================================================
RCS file: /home/cvs/mtd/drivers/mtd/mtdchar.c,v
retrieving revision 1.44
diff -u -p -r1.44 mtdchar.c
--- mtdchar.c	2 Oct 2001 15:05:11 -0000	1.44
+++ mtdchar.c	13 Jul 2002 17:50:35 -0000
@@ -287,7 +287,12 @@ static int mtd_ioctl(struct inode *inode
 
 	case MEMERASE:
 	{
-		struct erase_info *erase=kmalloc(sizeof(struct erase_info),GFP_KERNEL);
+		struct erase_info *erase;
+
+		if(!(file->f_mode & 2))
+			return -EPERM;
+
+		erase=kmalloc(sizeof(struct erase_info),GFP_KERNEL);
 		if (!erase)
 			ret = -ENOMEM;
 		else {
@@ -338,6 +343,9 @@ static int mtd_ioctl(struct inode *inode
 		void *databuf;
 		ssize_t retlen;
 		
+		if(!(file->f_mode & 2))
+			return -EPERM;
+
 		if (copy_from_user(&buf, (struct mtd_oob_buf *)arg, sizeof(struct mtd_oob_buf)))
 			return -EFAULT;
 		
@@ -474,7 +482,7 @@ static void mtd_notify_add(struct mtd_in
 	sprintf(name, "%dro", mtd->index);
 	devfs_ro_handle[mtd->index] = devfs_register(devfs_dir_handle, name,
 			DEVFS_FL_DEFAULT, MTD_CHAR_MAJOR, mtd->index*2+1,
-			S_IFCHR | S_IRUGO | S_IWUGO,
+			S_IFCHR | S_IRUGO,
 			&mtd_fops, NULL);
 }
 
