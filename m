Received: from mail-qy0-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MHbql-0002PP-8F
	for linux-mtd@lists.infradead.org; Fri, 19 Jun 2009 11:01:46 +0000
Received: by qyk9 with SMTP id 9so2481481qyk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Jun 2009 04:01:38 -0700 (PDT)
MIME-Version: 1.0
Sender: brijesh.s.singh@gmail.com
Date: Fri, 19 Jun 2009 16:31:38 +0530
Message-ID: <6b5362aa0906190401l51bcf28bg44b9a7a9f49aa773@mail.gmail.com>
Subject: [PATCH] [UBI] Volume table update fix
From: Brijesh Singh <brij.singh@samsung.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
  This patch fixes the consistency problem during volume update.
  UBI writes two copies of vtbl during volume update. If
the first copy was successfully written, and second copy fails,
UBI returns failure.
  But UBI recovers updated vtbl during next mount. So it should have
returned success. It should go to read only mode to avoid further failures.

Signed-off-by: Brijesh Singh <brij.singh@samsung.com>
---
diff --git a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
index 1afc61e..c776037 100644
--- a/drivers/mtd/ubi/vtbl.c
+++ b/drivers/mtd/ubi/vtbl.c
@@ -84,7 +84,7 @@ static struct ubi_vtbl_record empty_vtbl_record;
 int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
 			   struct ubi_vtbl_record *vtbl_rec)
 {
-	int i, err;
+	int copy, err, err1;
 	uint32_t crc;
 	struct ubi_volume *layout_vol;

@@ -99,19 +99,41 @@ int ubi_change_vtbl_record(struct ubi_device *ubi, int idx,
 	}

 	memcpy(&ubi->vtbl[idx], vtbl_rec, sizeof(struct ubi_vtbl_record));
-	for (i = 0; i < UBI_LAYOUT_VOLUME_EBS; i++) {
-		err = ubi_eba_unmap_leb(ubi, layout_vol, i);
+	for (copy = 0; copy < UBI_LAYOUT_VOLUME_EBS; copy++) {
+		err = ubi_eba_unmap_leb(ubi, layout_vol, copy);
 		if (err)
-			return err;
+			goto out_error;

-		err = ubi_eba_write_leb(ubi, layout_vol, i, ubi->vtbl, 0,
+		err = ubi_eba_write_leb(ubi, layout_vol, copy, ubi->vtbl, 0,
 					ubi->vtbl_size, UBI_LONGTERM);
 		if (err)
-			return err;
+			goto out_error;
 	}

 	paranoid_vtbl_check(ubi);
 	return 0;
+
+out_error:
+	/* If first copy was written,volume creation is successful.
+	* But switch to read only mode as we have only one copy.
+	* If first copy itself was not written, older version is in copy 2.
+	* Unmap first copy and call wl_flush.
+	* Volume creating is unsuccessful.
+	*/
+	ubi_err("Error writing volume table copy #%d", copy+1);
+	err1 = ubi_eba_unmap_leb(ubi, layout_vol, copy);
+	if (!err1) {
+		ubi_wl_flush(ubi);
+		/* Don't bother about error in flush
+		 * We are going read only any ways
+		 */
+	}
+	ubi_ro_mode(ubi);
+	ubi_msg("Try detaching and attaching UBI again");
+	if (copy > 0)
+		return 0;
+	else
+		return err;
 }

 /**
