Received: from fgwmail7.fujitsu.co.jp ([192.51.44.37])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Geuo-0002is-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 12:34:10 +0000
Received: from m7.gw.fujitsu.co.jp by fgwmail7.fujitsu.co.jp (8.9.3/3.7W-MX0205-Fujitsu Gateway)
	id WAA04388 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 22:04:38 +0900 (JST)
	(envelope-from tkato@cs.fujitsu.co.jp)
Received: from stbrain.utsfd.cs.fujitsu.co.jp by m7.gw.fujitsu.co.jp (8.12.1/Fujitsu Domain Master)
	id gAQD4cnI002596 for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 22:04:38 +0900
	(envelope-from tkato@cs.fujitsu.co.jp)
Received: from cs.fujitsu.co.jp (kato.utsfd.cs.fujitsu.co.jp [10.20.71.81])
	by stbrain.utsfd.cs.fujitsu.co.jp (8.11.6+Sun/3.7W) with ESMTP id gAQD4bi20394
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 22:04:37 +0900 (JST)
Message-ID: <3DE37160.A152A2F5@cs.fujitsu.co.jp>
Date: Tue, 26 Nov 2002 22:04:32 +0900
From: Takeharu KATO <tkato@cs.fujitsu.co.jp>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: [PATCH] Linux-2.4.18 block MTD dead-lock
Content-Type: multipart/mixed;
 boundary="------------88B9FA3A2316667412ABB1E7"
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

This is a multi-part message in MIME format.
--------------88B9FA3A2316667412ABB1E7
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit

MTD developers:

 I found a bug relevant to MTD device and Linux-2.4.18.
I post the report about the issue.

P.S. I attach the patch to fix this problem.
    If you have no time to read following report.
    please see this patch.

-- the report --

1. The symptom
 When we was trying to mount MTD-block-device twice,
second mount process fall in dead-locked state. This 
is due not to be able to obtain the semaphore of 
the superblock().

 We met this with Linux-2.4.18 kernel on PPC405GP. 
This issue has never taken place with Linux-2.4.2.


2. The reason 
 We found  this was caused in the release method of 
MTD. In particular, this method indirectly call 
sync_super with calling ``invalidate_device'' 
in this method.

 When the kernel attempt to mount the block device,
it call ``get_sb_bdev'' function in fs/super.c. This 
function return the super block information to caller 
and this function perform following operations.

       Step1.  Open the block device to be mounted.

       Step2.  Obtain semaphore of the super block to
              update super block information.

       Step3.  Search the block device in super block list  
              for mounted devices.

       Step4. If the device has been already mounted, 
             it close the block device using its release 
             method then return the super block information.

       Step5  If the device has not been mounted yet,
             the file system read the super block from 
             the device and return the information.

 The reason of the deadlock is that the process
keep waiting for the semaphore owned by itself 
when it call MTD release method.
 The process has already obtained the semaphore since
the Step2 was performed. 

3. The solution

We changed the sequence of the function called ``get_sb_bdev''
 in fs/super.c.  We changed the function to make the block device 
to be mounted checked before opening the device. 
 Please refer the patch to make out the changes in detail.

-- the report --

Sincerely, yours.

-- 
Takeharu KATO
Fujitsu Limited
Email:tkato@cs.fujitsu.co.jp (ext. 7112-4621)
--------------88B9FA3A2316667412ABB1E7
Content-Type: text/plain; charset=iso-2022-jp;
 name="linux-2.4.18-getsbdev-fix.patch"
Content-Disposition: inline;
 filename="linux-2.4.18-getsbdev-fix.patch"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by stbrain.utsfd.cs.fujitsu.co.jp id gAQD4bi20394

--- linux-2.4.18/fs/super.c	Tue Mar 12 15:04:10 2002
+++ linux-2.4.18-getsbfix/fs/super.c	Tue Nov 26 21:58:02 2002
@@ -15,7 +15,7 @@
  *  Added kerneld support: Jacques Gelinas and Bjorn Ekwall
  *  Added change_root: Werner Almesberger & Hans Lermen, Feb '96
  *  Added options to /proc/mounts:
- *    Torbj=F6rn Lindh (torbjorn.lindh@gopta.se), April 14, 1996.
+ *    Torbj=1B-A=F6rn Lindh (torbjorn.lindh@gopta.se), April 14, 1996.=1B=
$)B
  *  Added devfs support: Richard Gooch <rgooch@atnf.csiro.au>, 13-JAN-19=
98
  *  Heavily rewritten for 'one fs - one tree' dcache architecture. AV, M=
ar 2000
  */
@@ -645,21 +645,16 @@
 	dev =3D to_kdev_t(bdev->bd_dev);
 	if (!(flags & MS_RDONLY))
 		mode |=3D FMODE_WRITE;
-	error =3D blkdev_get(bdev, mode, 0, BDEV_FS);
-	devfs_put_ops (de);   /*  Decrement module use count now we're safe  */
-	if (error)
-		goto out;
 	check_disk_change(dev);
 	error =3D -EACCES;
 	if (!(flags & MS_RDONLY) && is_read_only(dev)) {
-		blkdev_put(bdev, BDEV_FS);
+		devfs_put_ops (de);   /*  Decrement module use count   */
 		goto out;
 	}
-
 	error =3D -ENOMEM;
 	s =3D alloc_super();
 	if (!s) {
-		blkdev_put(bdev, BDEV_FS);
+		devfs_put_ops (de);   /*  Decrement module use count   */
 		goto out;
 	}
=20
@@ -675,16 +670,24 @@
 		    ((flags ^ old->s_flags) & MS_RDONLY)) {
 			spin_unlock(&sb_lock);
 			destroy_super(s);
-			blkdev_put(bdev, BDEV_FS);
+		devfs_put_ops (de);   /*  Decrement module use count   */
 			goto out;
 		}
 		if (!grab_super(old))
 			goto restart;
 		destroy_super(s);
-		blkdev_put(bdev, BDEV_FS);
+		devfs_put_ops (de);   /*  Decrement module use count   */
 		path_release(&nd);
 		return old;
 	}
+	/*
+	 * 2002.11.08 moved by T. KATO =20
+	 * To make MTD worked.
+	 */
+	error =3D blkdev_get(bdev, mode, 0, BDEV_FS);
+	devfs_put_ops (de);   /*  Decrement module use count now we're safe  */
+	if (error)
+		goto out;
 	s->s_dev =3D dev;
 	s->s_bdev =3D bdev;
 	s->s_flags =3D flags;

--------------88B9FA3A2316667412ABB1E7--
