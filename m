Received: from wa-out-1112.google.com ([209.85.146.178])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IAlb3-0001iN-HS
	for linux-mtd@lists.infradead.org; Tue, 17 Jul 2007 07:52:06 -0400
Received: by wa-out-1112.google.com with SMTP id v33so1869077wah
	for <linux-mtd@lists.infradead.org>;
	Tue, 17 Jul 2007 04:52:04 -0700 (PDT)
Message-ID: <9b52d64c0707170452v6c8b8ae0vf2dcf7304947a0c0@mail.gmail.com>
Date: Tue, 17 Jul 2007 17:22:03 +0530
From: "Vinit Agnihotri" <vinit.agnihotri@gmail.com>
To: linux-mtd@lists.infradead.org, dedekind@infradead.org
Subject: UBI: PATCH: -EINTR do not causes ubi to switch to read-only mode.
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

With reference to previous mails, I am posting patch to handle -EINTR
separately.
Now ubi wont switch to read-only mode on receiving -EINTR signal while
writing or erasing.

patch is here:

Signed-off-by: Vinit Agnihotri <vinit.agnihotri@gmail.com>
================================================================
diff -ruN linux-2.6.18.3-vanila/drivers/mtd/ubi/eba.c
linux-2.6.18.3-mod/drivers/mtd/ubi/eba.c
--- linux-2.6.18.3-vanila/drivers/mtd/ubi/eba.c	2007-07-09
14:28:28.000000000 +0530
+++ linux-2.6.18.3-mod/drivers/mtd/ubi/eba.c	2007-07-17 16:59:28.000000000 +0530
@@ -616,6 +616,10 @@
 			ubi_warn("failed to write data to PEB %d", pnum);
 			if (err == -EIO && ubi->bad_allowed)
 				err = recover_peb(ubi, pnum, vol_id, lnum, buf, offset, len);
+			if (err == -EINTR) {
+				leb_write_unlock(ubi, vol_id, lnum);
+				return err;
+			}
 			if (err)
 				ubi_ro_mode(ubi);
 		}
@@ -673,7 +677,18 @@

 write_error:
 	if (err != -EIO || !ubi->bad_allowed) {
-		ubi_ro_mode(ubi);
+		if (err == -EINTR) {
+			err = ubi_wl_put_peb(ubi, pnum, 1);		
+			if (err || ++tries > UBI_IO_RETRIES) {
+				ubi_ro_mode(ubi);
+				leb_write_unlock(ubi, vol_id, lnum);
+				ubi_free_vid_hdr(ubi, vid_hdr);
+				return err;
+			}
+			err = -EINTR;
+		}
+		else
+			ubi_ro_mode(ubi);
 		leb_write_unlock(ubi, vol_id, lnum);
 		ubi_free_vid_hdr(ubi, vid_hdr);
 		return err;
@@ -799,7 +814,17 @@
 		 * something nasty and unexpected happened. Switch to read-only
 		 * mode just in case.
 		 */
-		ubi_ro_mode(ubi);
+		if (err == -EINTR) {
+			err = ubi_wl_put_peb(ubi, pnum, 1);		
+			if (err || ++tries > UBI_IO_RETRIES) {
+				ubi_ro_mode(ubi);
+				leb_write_unlock(ubi, vol_id, lnum);
+				ubi_free_vid_hdr(ubi, vid_hdr);
+				return err;
+			}
+			err = -EINTR;
+		} else
+			ubi_ro_mode(ubi);
 		leb_write_unlock(ubi, vol_id, lnum);
 		ubi_free_vid_hdr(ubi, vid_hdr);
 		return err;
diff -ruN linux-2.6.18.3-vanila/drivers/mtd/ubi/wl.c
linux-2.6.18.3-mod/drivers/mtd/ubi/wl.c
--- linux-2.6.18.3-vanila/drivers/mtd/ubi/wl.c	2007-07-09
14:28:28.000000000 +0530
+++ linux-2.6.18.3-mod/drivers/mtd/ubi/wl.c	2007-07-17 16:37:44.000000000 +0530
@@ -1103,6 +1103,10 @@
 		 * this physical eraseblock for erasure again would cause
 		 * errors again and again. Well, lets switch to RO mode.
 		 */
+		if (err == -EINTR) {
+			err = schedule_erase(ubi, e, 0);
+			return -EINTR;
+		}
 		ubi_ro_mode(ubi);
 		return err;
 	}
