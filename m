Received: from wa-out-1112.google.com ([209.85.146.183])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1I88Pw-0008Lw-Nl
	for linux-mtd@lists.infradead.org; Tue, 10 Jul 2007 01:37:46 -0400
Received: by wa-out-1112.google.com with SMTP id v33so1505772wah
	for <linux-mtd@lists.infradead.org>;
	Mon, 09 Jul 2007 22:37:43 -0700 (PDT)
Message-ID: <9b52d64c0707092237x48c149cdy24b6eaf1d0baa184@mail.gmail.com>
Date: Tue, 10 Jul 2007 11:07:42 +0530
From: "Vinit Agnihotri" <vinit.agnihotri@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: overflows while calculating volume->used_bytes
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

I was experiencing overflows in multiplications for
volume->used_bytes in vmt.c & vtbl.c, while creating & resizing large volumes.

vol->used_bytes is long long however its 2 operands vol->used_ebs &
vol->usable_leb_size
are int. So their multiplication for larger values causes integer overflows.
Typecasting them solves the problem.

My machine & flash details:

64Bit dual-core AMD opteron, 1 GB RAM, linux 2.6.18.3.
mtd size = 6GB, volume size= 5GB, peb_size = 4MB.

heres patch which does the fix.

Signed-off-by: Vinit Agnihotri <vinit.agnihotri@gmail.com>
================================================================
diff -ruN linux-2.6.18.3-vanila/drivers/mtd/ubi/vmt.c
linux-2.6.18.3-mod/drivers/mtd/ubi/vmt.c
--- linux-2.6.18.3-vanila/drivers/mtd/ubi/vmt.c	2007-07-09
15:24:28.000000000 +0530
+++ linux-2.6.18.3-mod/drivers/mtd/ubi/vmt.c	2007-07-09 15:26:07.000000000 +0530
@@ -280,7 +280,8 @@
 	if (vol->vol_type == UBI_DYNAMIC_VOLUME) {
 		vol->used_ebs = vol->reserved_pebs;
 		vol->last_eb_bytes = vol->usable_leb_size;
-		vol->used_bytes = vol->used_ebs * vol->usable_leb_size;
+		vol->used_bytes = (long long)vol->used_ebs *
+							(long long)vol->usable_leb_size;
 	} else {
 		bytes = vol->used_bytes;
 		vol->last_eb_bytes = do_div(bytes, vol->usable_leb_size);
@@ -538,7 +539,8 @@
 	if (vol->vol_type == UBI_DYNAMIC_VOLUME) {
 		vol->used_ebs = reserved_pebs;
 		vol->last_eb_bytes = vol->usable_leb_size;
-		vol->used_bytes = vol->used_ebs * vol->usable_leb_size;
+		vol->used_bytes = (long long)vol->used_ebs *
+							(long long)vol->usable_leb_size;
 	}

 	paranoid_check_volumes(ubi);
@@ -739,7 +741,7 @@
 		goto fail;
 	}

-	n = vol->used_ebs * vol->usable_leb_size;
+	n = (long long)vol->used_ebs * (long long)vol->usable_leb_size;
 	if (vol->vol_type == UBI_DYNAMIC_VOLUME) {
 		if (vol->corrupted != 0) {
 			ubi_err("corrupted dynamic volume");
diff -ruN linux-2.6.18.3-vanila/drivers/mtd/ubi/vtbl.c
linux-2.6.18.3-mod/drivers/mtd/ubi/vtbl.c
--- linux-2.6.18.3-vanila/drivers/mtd/ubi/vtbl.c	2007-07-09
15:26:52.000000000 +0530
+++ linux-2.6.18.3-mod/drivers/mtd/ubi/vtbl.c	2007-07-09
15:28:51.000000000 +0530
@@ -531,7 +531,8 @@
 		if (vol->vol_type == UBI_DYNAMIC_VOLUME) {
 			vol->used_ebs = vol->reserved_pebs;
 			vol->last_eb_bytes = vol->usable_leb_size;
-			vol->used_bytes = vol->used_ebs * vol->usable_leb_size;
+			vol->used_bytes = (unsigned long)vol->used_ebs *
+								(unsigned long)vol->usable_leb_size;
 			continue;
 		}

@@ -561,7 +562,8 @@
 		}

 		vol->used_ebs = sv->used_ebs;
-		vol->used_bytes = (vol->used_ebs - 1) * vol->usable_leb_size;
+		vol->used_bytes = (unsigned long)(vol->used_ebs - 1) *
+							(unsigned long)vol->usable_leb_size;
 		vol->used_bytes += sv->last_data_size;
 		vol->last_eb_bytes = sv->last_data_size;
 	}
@@ -578,7 +580,8 @@
 	vol->usable_leb_size = ubi->leb_size;
 	vol->used_ebs = vol->reserved_pebs;
 	vol->last_eb_bytes = vol->reserved_pebs;
-	vol->used_bytes = vol->used_ebs * (ubi->leb_size - vol->data_pad);
+	vol->used_bytes = (unsigned long)vol->used_ebs *
+						(unsigned long)(ubi->leb_size - vol->data_pad);
 	vol->vol_id = UBI_LAYOUT_VOL_ID;

 	ubi_assert(!ubi->volumes[i]);

Thanks & Regards
Vinit.
