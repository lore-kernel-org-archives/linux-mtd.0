Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mCd2-0007Zj-00
	for <linux-mtd@lists.infradead.org>; Tue, 03 Sep 2002 13:17:56 +0100
Date: Tue, 3 Sep 2002 14:23:14 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [patch][untested] remove read only devices from mtdchar.c
Message-ID: <20020903122314.GB18497@wohnheim.fh-wedel.de>
References: <20020903111404.GB15756@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="ZPt4rx8FFjLCG7dd"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020903111404.GB15756@wohnheim.fh-wedel.de>
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

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, 3 September 2002 13:14:04 +0200, Jörn Engel wrote:
> This removes the horrible ro-devices from mtdchar.c.
> 
> Note:
> My job has ended, and so has my access to any test hardware. Until I
> have uml working or some hardware of my own, someone else has to do
> the testing. Sorry!
> 
> Jörn

--ZPt4rx8FFjLCG7dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="diff_no_rodev.patch"

diff -Naur 0_staa/drivers/mtd/mtdchar.c 0_staa_no_rodev/drivers/mtd/mtdchar.c
--- 0_staa/drivers/mtd/mtdchar.c	Tue Jul 16 18:28:45 2002
+++ 0_staa_no_rodev/drivers/mtd/mtdchar.c	Tue Sep  3 13:01:29 2002
@@ -24,7 +24,6 @@
 
 static devfs_handle_t devfs_dir_handle;
 static devfs_handle_t devfs_rw_handle[MAX_MTD_DEVICES];
-static devfs_handle_t devfs_ro_handle[MAX_MTD_DEVICES];
 #endif
 
 static loff_t mtd_lseek (struct file *file, loff_t offset, int orig)
@@ -61,7 +60,7 @@
 static int mtd_open(struct inode *inode, struct file *file)
 {
 	int minor = MINOR(inode->i_rdev);
-	int devnum = minor >> 1;
+	int devnum = minor;
 	struct mtd_info *mtd;
 
 	DEBUG(MTD_DEBUG_LEVEL0, "MTD_open\n");
@@ -69,10 +68,6 @@
 	if (devnum >= MAX_MTD_DEVICES)
 		return -ENODEV;
 
-	/* You can't open the RO devices RW */
-	if ((file->f_mode & 2) && (minor & 1))
-		return -EACCES;
-
 	mtd = get_mtd_device(NULL, devnum);
 	
 	if (!mtd)
@@ -478,12 +473,6 @@
 			DEVFS_FL_DEFAULT, MTD_CHAR_MAJOR, mtd->index*2,
 			S_IFCHR | S_IRUGO | S_IWUGO,
 			&mtd_fops, NULL);
-
-	sprintf(name, "%dro", mtd->index);
-	devfs_ro_handle[mtd->index] = devfs_register(devfs_dir_handle, name,
-			DEVFS_FL_DEFAULT, MTD_CHAR_MAJOR, mtd->index*2+1,
-			S_IFCHR | S_IRUGO,
-			&mtd_fops, NULL);
 }
 
 static void mtd_notify_remove(struct mtd_info* mtd)
@@ -492,7 +481,6 @@
 		return;
 
 	devfs_unregister(devfs_rw_handle[mtd->index]);
-	devfs_unregister(devfs_ro_handle[mtd->index]);
 }
 #endif
 

--ZPt4rx8FFjLCG7dd--
