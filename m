Received: from wsip68-15-115-9.ok.ok.cox.net ([68.15.115.9] helo=mail.forestsidingsupply.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16uyh6-0005kN-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Apr 2002 17:42:08 +0100
Date: Tue, 9 Apr 2002 11:42:06 -0500
To: linux-mtd@lists.infradead.org
Subject: root jffs2 filesystem on blkmtd emulated device
Message-ID: <20020409114205.A21994@ns2.forestsidingsupply.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="nFreZHaLTZJo0R7j"
Content-Disposition: inline
From: mike@forestsidingsupply.com (Mike Mattice)
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

--nFreZHaLTZJo0R7j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I've got a flash based ide module which is too small for my needs w/o 
compression.  So, I'm trying to get this to use jffs2 as it's root 
filesystem type.   I've run into a bit of a problem.

After applying the following patch, using the attached config, and passing 
'blkmtd=/dev/hdc2' to the kernel and setting the root device to 
'/dev/mtdblock/0' via lilo, I get this on the console.  (hand typed, but 
should be very close)

Universal TUN/TAP device driver 1.4 (C)1999-2001 Maxim Krasnyansky
blkmtd: device = `/dev/hdc2' erase size = 128K readonly = no queue size = 512
blkmtd: found a block device major = 22, minor = 2
blkmtd: devname = ide1(22,2)
blkmtd: size = 15171584
blkmtd: init: found 3 erase regions
mtd: Giving out device 0 to blkmtd: /dev/hdc2
blkmtd loaded: version = 1.7 using /dev/hdc2 erase_size = 128K
blkmtd writetask: starting (pid = 10)
Net4: Linux TCP/IP 1.0 for NET4.0
<blah, blah>
NET4: Unix domain sockets 1.0/SMP for Linux Net4.0.
mtdblock_open
ok
mtdblock_open
mtdblock_release
invalidating device
ok
writing cached data
ok
mtdblock_open
mtdblock_release
invalidating device


At this point it just hangs.  Does anybody have any idea why it wouldn't be
able to invalidate the device in mtdblock_release?


diff -rNubBw linux-2.4.18.orig/drivers/mtd/devices/blkmtd.c linux-2.4.18.mtddevel/drivers/mtd/devices/blkmtd.c
--- linux-2.4.18.orig/drivers/mtd/devices/blkmtd.c	Tue Apr  9 11:08:22 2002
+++ linux-2.4.18.mtddevel/drivers/mtd/devices/blkmtd.c	Tue Apr  9 09:50:15 2002
@@ -53,6 +53,7 @@
 #include <linux/pagemap.h>
 #include <linux/mtd/compatmac.h>
 #include <linux/mtd/mtd.h>
+#include <linux/ctype.h>
 
 #ifdef CONFIG_MTD_DEBUG
 #ifdef CONFIG_PROC_FS
@@ -130,6 +131,8 @@
 int bs;          /* optionally force the block size (avoid using) */
 int count;       /* optionally force the block count (avoid using) */
 int wqs;         /* optionally set the write queue size */
+char bootdevice[64];
+int bootdevset = 0;
 
 
 #if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
@@ -1073,9 +1076,13 @@
 
   /* Check args */
   if(device == 0) {
+    if (bootdevset) {
+      device = &bootdevice;
+    } else {
     printk("blkmtd: error, missing `device' name\n");
     return -EINVAL;
   }
+  }
 
   if(ro)
     readonly = 1;
@@ -1312,6 +1319,26 @@
     __free_pages(erase_page, 0);
   return err;
 }
+
+static int __init blkmtd_setup(char *line)
+{
+        int i;
+        char ch;
+
+	bootdevset = 1;
+        memset (bootdevice, 0, sizeof bootdevice);
+        for (i = 0; i < sizeof bootdevice - 1; ++i)
+        {
+            ch = line[i];
+            if ( isspace (ch) || (ch == ',') || (ch == '\0') ) break;  
+	    // don't have to worry about setting the last char to \0, 
+	    // because the memset has taken care of that for us.
+            bootdevice[i] = ch;
+        }
+        return 1;
+}
+
+__setup("blkmtd=", blkmtd_setup);
 
 module_init(init_blkmtd);
 module_exit(cleanup_blkmtd);
diff -rNubBw linux-2.4.18.orig/drivers/mtd/mtdblock.c linux-2.4.18.mtddevel/drivers/mtd/mtdblock.c
--- linux-2.4.18.orig/drivers/mtd/mtdblock.c	Thu Oct 25 15:58:35 2001
+++ linux-2.4.18.mtddevel/drivers/mtd/mtdblock.c	Tue Apr  9 10:57:05 2002
@@ -371,17 +371,24 @@
 	if (inode == NULL)
 		release_return(-ENODEV);
 
+	DEBUG(MTD_DEBUG_LEVEL1, "invalidating device\n");
+	  
 	invalidate_device(inode->i_rdev, 1);
 
+	DEBUG(MTD_DEBUG_LEVEL1, "ok\n");
+
 	dev = MINOR(inode->i_rdev);
 	mtdblk = mtdblks[dev];
 
+	DEBUG(MTD_DEBUG_LEVEL1, "writing cached data\n");
+
 	down(&mtdblk->cache_sem);
 	write_cached_data(mtdblk);
 	up(&mtdblk->cache_sem);
 
 	spin_lock(&mtdblks_lock);
 	if (!--mtdblk->count) {
+	  DEBUG(MTD_DEBUG_LEVEL1, "freeing device\n");
 		/* It was the last usage. Free the device */
 		mtdblks[dev] = NULL;
 		spin_unlock(&mtdblks_lock);
diff -rNubBw linux-2.4.18.orig/fs/jffs2/scan.c linux-2.4.18.mtddevel/fs/jffs2/scan.c
--- linux-2.4.18.orig/fs/jffs2/scan.c	Thu Oct  4 17:13:18 2001
+++ linux-2.4.18.mtddevel/fs/jffs2/scan.c	Tue Apr  9 10:41:30 2002
@@ -171,7 +171,7 @@
 		return 1;	/* special return code */
 	}
 	
-	noise = 10;
+	noise = 0; // mdm - 10
 
 	while(ofs < jeb->offset + c->sector_size) {
 		ssize_t retlen;

--nFreZHaLTZJo0R7j
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="clean-config.gz"
Content-Transfer-Encoding: base64

H4sICOsSszwCA2NsZWFuLWNvbmZpZwB1lct64jAMRvfzNIFCv3bBQrGVREN8qa0E2o2eo28/
ZihFDmGHzi/J0cXGBN9RL+e318P3H3M1KMPdmMhulIbniIkceobxTt1ex5dkcopyCumYJRxr
gfw8xr5mxsWzGRbwDNbWpM0niDWKIYKtzkinjE4u6Uq8wNiHRDy4OmzciAEzoOSBOj7stTbl
gjmR72W3rApG6v2leNkslBhTkA69wTv3YaB+cKgOz04VMMCMYtHIGIyqwCMvWhYEIplFCcHA
uODRUGVIH8B/1qilkGtiKaHhmnlwqNyGwHGc1IDyZ54pmgoYVhtxNCGh4NjdUUu+cywQJn6A
laNjWxmlR60+/BfJjKkNGQ8bLbV1O6/oWCWNXo2hiCXdLAncKpRMX+WIZrtrfuPBHPWUysg6
GhnTHS3tydNZXbFqyBTFTSOTgVxT30kxPCfQFV2FjuMSUTIPKDK0o57llTtgM5Q9B8al5IFX
UKkRLdqlwpB65JIuf0yYwK5lW/uuC64r0KG37j+DlvLxUTDOvu6alRl+bZqmWU1U3ZirXd4E
KKtL6WP9aAf1PbtpUJQq14+nwMThWaqVIvJ+/9I8JHqaRFywerxlsYpCRjM7OaeeAZ585S/I
Aya/WOi6yrfNyzsH9Qkz69+XNc1hVNPK5W9C/0Vc9v/9TSJ/5jVYEkyeD9v9603723V5K53y
vpGf92D7W4+L2q28xKaKK/0oQY/E/T9Sw8i1H565/gSXbcjl+icmpqDaOPegevAPDoFUx1YH
AAA=

--nFreZHaLTZJo0R7j
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="mtddevel.patch.gz"
Content-Transfer-Encoding: base64

H4sICH8YszwCA210ZGRldmVsLnBhdGNoAJ1Ve0/jRhD/2/kUUyodDrYTOyEEkgNxB+GEmgsV
B6gSIHdjb8heHG/Oa5OjPb57Z2fzhKPQWkrs3Xk/fjOxGAzAy3pF/+MUEpEW371aZbsS7FZk
Ju6qcSbueaaq4zyuxvxeRFxV+8kIj5VonR2vkIEn/ypS8jzvP1qxLgoOHyYZwB4EQcvfbdVq
UPP9WslxnP/hwqo+f6/V8FtBw+g7PASvUXd3wMH/JhweluBXkUZJEXN4T4aqE3bHx2xSGR48
p2ljkRxPWD5m0Ysc2gekOU9pUf4w4SSl5QYxH8DRWe/k9FP4+eI4PO58vPz0lPD7+dlRePKF
/A7qvnY8qAfuLnku0hz6qg2Lp7oFcpILmbIkeYCBzCIO+ZBDP5HRCJT4i4PN7qWIoVAivSvD
VtVoiWSR5u03aSHWF9RMv614s65G8ZyUTDORc/hWcKwQOYSyTjRkGfSlzE0hr3e2b9slh8Iz
l1p6H/y2zhylCLqnvcs/wqvO+ZfTs154dHbcgYN9+K1z3ut059d2za25ftkkz2/W3T3Mnt/c
cYM65a9kvDwacoyLZXeKAgEQA9s4AvtotAx/lxyga7CX/iyuAebM8G4ZQ9sQH4EniiMrMU4y
jGlkb5g+bQHPMpm5MBZK5xH+NKKbkLIxv0k3ym0jlvG8yFLwOqe9qw9dunzU6h9NCOhuJstz
VhbLFPO9D0F71jVBbdY2e25thwLXTxgOMs5D3e3K5hlT5tvFgMnCzCi6iEc0V3JUznIRUaHD
UKQCq0NxhJiNYmJTEbew03m55CxyA8Qv2ssz8UXDtlZprdU3WOEa87G+tJcZRc9cahk5WOmV
8ooMtirYghoFBLx/zgwe2gDHEeWl0IqnxjuU10Fci9v2OknXH7BUE4aaMNwy/Pih37pLNt3N
teONj+cy9LEeI4QERkqQqAJWZzOHIbtHTEmYyix7ANaXRa4Rkusu0ChJmMpNopDpBuNeKujz
iBXKIHKWpCFTkLMRTyFiGQcMOR+ynNJRqMp6ECsoE7cYKhViTnxcfs7Kr0tCxQ9nVZ717v6G
u1b9MkFzLOMi4dQbtv4LDYsmzkj8O5KihLO0mCyp8dsXFP5oDr1pNS2Z37CUlszWxbCAsyiH
WgOCRqux26rT+gjeuI5WNa0sNr/VaLb8lUVUbwZu0ARHv2vbhExLN5lIZUyzp3fZ7SKwLSvj
mDJEqKmK7XV6OPCuKOmORYvDXqyQsNu56nQDFzZEes8SETNqK1N0M1V0M2lbczoPDdVY9g5E
mOGFC8FrFuRophC1oQT20+fT3tn5uh6txKKcjJDBfKhrJNy+ol3vCu16xKIhjwEdZSvm5DS1
3xlt3gGxYCuOyRgtmdCIhVrMNnxExCb+uRjS1ESkoS7dnEXRieR0ZX7xvIWo3oO0BDCZL4ag
Z+zT7GM9ceuc4rrUuJ2jvVA4fStwggJ0OZtYeiNZ1mrSwPQF6SF/i/SnHr8CqoGqfh0MVK2q
Ipa+iKYnXC/A6AnXAj+wDUGzFdRbwe5r+HmmYg0420Gr7i+BEyBgEDfmRbCxFvNK51ZNeCRY
Mh9ikYYTJRI3plXyrFQKpfd14GsszE+4NXC+juOxXhM+9cN0KBJuy4HCbfKV970DiT7ixHUg
8g4Uj3KZhXrL6D7Q5dDfYa7tJjxtl/4BRW7CHHkLAAA=

--nFreZHaLTZJo0R7j--
