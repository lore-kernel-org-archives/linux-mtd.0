Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF0DC47DD9
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 00:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4LWi00poG5ffvsiKgbg63y2luU//0jrCWflZ0CRO4WM=; b=zPnpOzAEji88DD
	E5CsjCkrBPfALmNlVcoHNzaKAHJ2ZyXnb3h1lNiOyPqE6jOR5e7GTiKQlVjwqNwTMn+OB5LwkaBnT
	4j8cjkrWKCGLuA9+9+nBDo9lq+t0UCcm385cHkI72J5mc1yX0rGVy+3LDqcbcP2re7ZH4/98dfDcj
	1j4CJq61PXz//0MC0k6xjhEC1j2ZVdHRyHX/MjCmsDiAt9Hs3bmxs82ykyE8T5GpxQ8NsK5P7kHJo
	Z2GRggqIemJjuNm/bOr+w1VaVIACNM0mTyA8tExYQs3se8sFeLsgfvS0Km/VZSLlnqGptDPpEbEWC
	WL1HIi36bwCMcRpMjm1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reOmN-0000000FztI-1gFR;
	Mon, 26 Feb 2024 00:23:35 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reOmK-0000000FzqZ-2Qwj
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 00:23:33 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1reOmE-0001pn-25;
	Mon, 26 Feb 2024 00:23:26 +0000
Date: Mon, 26 Feb 2024 00:23:23 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 5/7] mtd: ubi: introduce pre-removal notification for UBI
 volumes
Message-ID: <d890e8fa4438fa4123c2d9cb3b1e015ae2699273.1708906456.git.daniel@makrotopia.org>
References: <cover.1708906456.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1708906456.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_162332_700267_06FD2671 
X-CRM114-Status: GOOD (  21.66  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Introduce a new notification type UBI_VOLUME_SHUTDOWN to inform users
that a volume is just about to be removed.
This is needed because users (such as the NVMEM subsystem) expect that
at the time their removal function is called, the parenting device is
still available (for removal of sysfs nodes, for example, in case of
NVMEM which otherwise WARNs on volume removal).

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/build.c | 19 ++++++++++++++-----
 drivers/mtd/ubi/kapi.c  |  2 +-
 drivers/mtd/ubi/ubi.h   |  2 ++
 drivers/mtd/ubi/vmt.c   | 17 +++++++++++++++--
 include/linux/mtd/ubi.h |  2 ++
 5 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 8c3f763e4ddb8..a7e3a6246c0e9 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -93,7 +93,7 @@ static struct ubi_device *ubi_devices[UBI_MAX_DEVICES];
 /* Serializes UBI devices creations and removals */
 DEFINE_MUTEX(ubi_devices_mutex);
 
-/* Protects @ubi_devices and @ubi->ref_count */
+/* Protects @ubi_devices, @ubi->ref_count and @ubi->is_dead */
 static DEFINE_SPINLOCK(ubi_devices_lock);
 
 /* "Show" method for files in '/<sysfs>/class/ubi/' */
@@ -261,6 +261,9 @@ struct ubi_device *ubi_get_device(int ubi_num)
 
 	spin_lock(&ubi_devices_lock);
 	ubi = ubi_devices[ubi_num];
+	if (ubi && ubi->is_dead)
+		ubi = NULL;
+
 	if (ubi) {
 		ubi_assert(ubi->ref_count >= 0);
 		ubi->ref_count += 1;
@@ -298,7 +301,7 @@ struct ubi_device *ubi_get_by_major(int major)
 	spin_lock(&ubi_devices_lock);
 	for (i = 0; i < UBI_MAX_DEVICES; i++) {
 		ubi = ubi_devices[i];
-		if (ubi && MAJOR(ubi->cdev.dev) == major) {
+		if (ubi && !ubi->is_dead && MAJOR(ubi->cdev.dev) == major) {
 			ubi_assert(ubi->ref_count >= 0);
 			ubi->ref_count += 1;
 			get_device(&ubi->dev);
@@ -327,7 +330,7 @@ int ubi_major2num(int major)
 	for (i = 0; i < UBI_MAX_DEVICES; i++) {
 		struct ubi_device *ubi = ubi_devices[i];
 
-		if (ubi && MAJOR(ubi->cdev.dev) == major) {
+		if (ubi && !ubi->is_dead && MAJOR(ubi->cdev.dev) == major) {
 			ubi_num = ubi->ubi_num;
 			break;
 		}
@@ -514,7 +517,7 @@ static void ubi_free_volumes_from(struct ubi_device *ubi, int from)
 	int i;
 
 	for (i = from; i < ubi->vtbl_slots + UBI_INT_VOL_COUNT; i++) {
-		if (!ubi->volumes[i])
+		if (!ubi->volumes[i] || ubi->volumes[i]->is_dead)
 			continue;
 		ubi_eba_replace_table(ubi->volumes[i], NULL);
 		ubi_fastmap_destroy_checkmap(ubi->volumes[i]);
@@ -1099,7 +1102,6 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 		return -EINVAL;
 
 	spin_lock(&ubi_devices_lock);
-	put_device(&ubi->dev);
 	ubi->ref_count -= 1;
 	if (ubi->ref_count) {
 		if (!anyway) {
@@ -1110,6 +1112,13 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 		ubi_err(ubi, "%s reference count %d, destroy anyway",
 			ubi->ubi_name, ubi->ref_count);
 	}
+	ubi->is_dead = true;
+	spin_unlock(&ubi_devices_lock);
+
+	ubi_notify_all(ubi, UBI_VOLUME_SHUTDOWN, NULL);
+
+	spin_lock(&ubi_devices_lock);
+	put_device(&ubi->dev);
 	ubi_devices[ubi_num] = NULL;
 	spin_unlock(&ubi_devices_lock);
 
diff --git a/drivers/mtd/ubi/kapi.c b/drivers/mtd/ubi/kapi.c
index fbf3a7fe2af79..f1ea8677467fb 100644
--- a/drivers/mtd/ubi/kapi.c
+++ b/drivers/mtd/ubi/kapi.c
@@ -152,7 +152,7 @@ struct ubi_volume_desc *ubi_open_volume(int ubi_num, int vol_id, int mode)
 
 	spin_lock(&ubi->volumes_lock);
 	vol = ubi->volumes[vol_id];
-	if (!vol)
+	if (!vol || vol->is_dead)
 		goto out_unlock;
 
 	err = -EBUSY;
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index a588381c50adc..32009a24869e7 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -337,6 +337,7 @@ struct ubi_volume {
 	int writers;
 	int exclusive;
 	int metaonly;
+	bool is_dead;
 
 	int reserved_pebs;
 	int vol_type;
@@ -561,6 +562,7 @@ struct ubi_device {
 	spinlock_t volumes_lock;
 	int ref_count;
 	int image_seq;
+	bool is_dead;
 
 	int rsvd_pebs;
 	int avail_pebs;
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 2c867d16f89f7..ee80c04d1d5d0 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -59,7 +59,7 @@ static ssize_t vol_attribute_show(struct device *dev,
 	struct ubi_device *ubi = vol->ubi;
 
 	spin_lock(&ubi->volumes_lock);
-	if (!ubi->volumes[vol->vol_id]) {
+	if (!ubi->volumes[vol->vol_id] || ubi->volumes[vol->vol_id]->is_dead) {
 		spin_unlock(&ubi->volumes_lock);
 		return -ENODEV;
 	}
@@ -189,7 +189,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 
 	/* Ensure that the name is unique */
 	for (i = 0; i < ubi->vtbl_slots; i++)
-		if (ubi->volumes[i] &&
+		if (ubi->volumes[i] && !ubi->volumes[i]->is_dead &&
 		    ubi->volumes[i]->name_len == req->name_len &&
 		    !strcmp(ubi->volumes[i]->name, req->name)) {
 			ubi_err(ubi, "volume \"%s\" exists (ID %d)",
@@ -352,6 +352,19 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 		err = -EBUSY;
 		goto out_unlock;
 	}
+
+	/*
+	 * Mark volume as dead at this point to prevent that anyone
+	 * can take a reference to the volume from now on.
+	 * This is necessary as we have to release the spinlock before
+	 * calling ubi_volume_notify.
+	 */
+	vol->is_dead = true;
+	spin_unlock(&ubi->volumes_lock);
+
+	ubi_volume_notify(ubi, vol, UBI_VOLUME_SHUTDOWN);
+
+	spin_lock(&ubi->volumes_lock);
 	ubi->volumes[vol_id] = NULL;
 	spin_unlock(&ubi->volumes_lock);
 
diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
index a529347fd75b2..562f92504f2b7 100644
--- a/include/linux/mtd/ubi.h
+++ b/include/linux/mtd/ubi.h
@@ -192,6 +192,7 @@ struct ubi_device_info {
  *			or a volume was removed)
  * @UBI_VOLUME_RESIZED: a volume has been re-sized
  * @UBI_VOLUME_RENAMED: a volume has been re-named
+ * @UBI_VOLUME_SHUTDOWN: a volume is going to removed, shutdown users
  * @UBI_VOLUME_UPDATED: data has been written to a volume
  *
  * These constants define which type of event has happened when a volume
@@ -202,6 +203,7 @@ enum {
 	UBI_VOLUME_REMOVED,
 	UBI_VOLUME_RESIZED,
 	UBI_VOLUME_RENAMED,
+	UBI_VOLUME_SHUTDOWN,
 	UBI_VOLUME_UPDATED,
 };
 
-- 
2.44.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
