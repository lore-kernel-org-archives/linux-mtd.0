Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA1FCF6493
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Sep 2024 12:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=12euPOWYc5sOjPFf7yGsvTsPutXVYD6V+juK2cIdrj0=; b=EQHLNmf87eyqpM
	qZbuQEnmn4XcWQyNSZK47dQFMH8VNGKHP3Epq4iBTo+KoO7XgUubfMLvAAycwby/dpYiTWtpZBd/w
	LFZCXDCScrjPPmyKfgI5XcHfB26JXOHdN/pEpxB/m4aI3bhEr0jKMhkIWAHxVZ96+g4rYBpy5O8FS
	GdbLtvyQFiExUVEXiImtlmTyoFRi28vRyzancpLkO+c+bPzC8DcAFw6Fio9q8M8+I3QhEr5H7eAmk
	IjQCQrbY5vYGsL9pbvD0z+t+xA6P8mMcMNpM4n1X44i9YIw07s3Gmbw8lMR2zts0Gn7xWwX5msj6W
	oEX/eZZUOKmcZ6LJHDew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1suWs8-0000000D4YA-25Fl;
	Sat, 28 Sep 2024 12:48:28 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1suWs3-0000000D4XC-2ZpK
	for linux-mtd@lists.infradead.org;
	Sat, 28 Sep 2024 12:48:25 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98)
	(envelope-from <daniel@makrotopia.org>)
	id 1suWrr-000000004VK-3Rm6;
	Sat, 28 Sep 2024 12:48:11 +0000
Date: Sat, 28 Sep 2024 13:48:08 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Daniel Golle <daniel@makrotopia.org>,
	John Crispin <john@phrozen.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RFC 2/2] mtd: ubi: add support for protecting critical volumes
Message-ID: <b43a7155f80995c3986893951c092291caf3a5f4.1727527457.git.daniel@makrotopia.org>
References: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e0936674dd1d6c98322e35831b8f0538a5cfa7a3.1727527457.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_054823_680169_0C4DEDCE 
X-CRM114-Status: GOOD (  21.26  )
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

Allow the boot firmware to define volumes which are critical for the
system to boot, such as the bootloader itself if stored inside a UBI
volume. Protect critical volumes by preventing the user from removing,
resizing or writing to them, and also prevent the UBI device from
being detached if a critical volume is present.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/build.c | 29 +++++++++++++++++++++++++++++
 drivers/mtd/ubi/cdev.c  | 33 +++++++++++++++++++++++++++++++++
 drivers/mtd/ubi/ubi.h   |  1 +
 drivers/mtd/ubi/vmt.c   | 27 ++++++++++++++++++++++++++-
 4 files changed, 89 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
index 30be4ed68fad..7a96329c5fd9 100644
--- a/drivers/mtd/ubi/build.c
+++ b/drivers/mtd/ubi/build.c
@@ -314,6 +314,30 @@ struct ubi_device *ubi_get_by_major(int major)
 	return NULL;
 }
 
+/**
+ * ubi_device_got_critical_volume - check if device contains critical volume
+ * @ubi: UBI device description object
+ *
+ * This function checks if any volume on a given UBI device is critical.
+ *
+ * Context: Expects ubi_devices_lock to be held by caller.
+ * Returns: True if there is a critical volume, false otherwise.
+ */
+static bool ubi_device_got_critical_volume(struct ubi_device *ubi)
+{
+	int i;
+
+	for (i = 0; i < ubi->vtbl_slots; i++) {
+		if (!ubi->volumes[i])
+			continue;
+
+		if (ubi->volumes[i]->critical)
+			return true;
+	}
+
+	return false;
+}
+
 /**
  * ubi_major2num - get UBI device number by character device major number.
  * @major: major number
@@ -1102,6 +1126,11 @@ int ubi_detach_mtd_dev(int ubi_num, int anyway)
 		return -EINVAL;
 
 	spin_lock(&ubi_devices_lock);
+	if (ubi_device_got_critical_volume(ubi)) {
+		spin_unlock(&ubi_devices_lock);
+		return -EPERM;
+	}
+
 	ubi->ref_count -= 1;
 	if (ubi->ref_count) {
 		if (!anyway) {
diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c
index 0d8f04cf03c5..897791ebb71c 100644
--- a/drivers/mtd/ubi/cdev.c
+++ b/drivers/mtd/ubi/cdev.c
@@ -328,6 +328,9 @@ static ssize_t vol_cdev_write(struct file *file, const char __user *buf,
 	struct ubi_volume *vol = desc->vol;
 	struct ubi_device *ubi = vol->ubi;
 
+	if (vol->critical)
+		return -EPERM;
+
 	if (!vol->updating && !vol->changing_leb)
 		return vol_cdev_direct_write(file, buf, count, offp);
 
@@ -390,6 +393,11 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 	{
 		int64_t bytes, rsvd_bytes;
 
+		if (vol->critical) {
+			err = -EPERM;
+			break;
+		}
+
 		if (!capable(CAP_SYS_RESOURCE)) {
 			err = -EPERM;
 			break;
@@ -430,6 +438,11 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 	{
 		struct ubi_leb_change_req req;
 
+		if (vol->critical) {
+			err = -EPERM;
+			break;
+		}
+
 		err = copy_from_user(&req, argp,
 				     sizeof(struct ubi_leb_change_req));
 		if (err) {
@@ -464,6 +477,11 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 	{
 		int32_t lnum;
 
+		if (vol->critical) {
+			err = -EPERM;
+			break;
+		}
+
 		err = get_user(lnum, (__user int32_t *)argp);
 		if (err) {
 			err = -EFAULT;
@@ -495,6 +513,11 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 	{
 		struct ubi_map_req req;
 
+		if (vol->critical) {
+			err = -EPERM;
+			break;
+		}
+
 		err = copy_from_user(&req, argp, sizeof(struct ubi_map_req));
 		if (err) {
 			err = -EFAULT;
@@ -509,6 +532,11 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 	{
 		int32_t lnum;
 
+		if (vol->critical) {
+			err = -EPERM;
+			break;
+		}
+
 		err = get_user(lnum, (__user int32_t *)argp);
 		if (err) {
 			err = -EFAULT;
@@ -537,6 +565,11 @@ static long vol_cdev_ioctl(struct file *file, unsigned int cmd,
 	{
 		struct ubi_set_vol_prop_req req;
 
+		if (vol->critical) {
+			err = -EPERM;
+			break;
+		}
+
 		err = copy_from_user(&req, argp,
 				     sizeof(struct ubi_set_vol_prop_req));
 		if (err) {
diff --git a/drivers/mtd/ubi/ubi.h b/drivers/mtd/ubi/ubi.h
index 1c9e874e8ede..21b8ce77426b 100644
--- a/drivers/mtd/ubi/ubi.h
+++ b/drivers/mtd/ubi/ubi.h
@@ -364,6 +364,7 @@ struct ubi_volume {
 	unsigned int updating:1;
 	unsigned int changing_leb:1;
 	unsigned int direct_writes:1;
+	unsigned int critical:1;
 
 #ifdef CONFIG_MTD_UBI_FASTMAP
 	unsigned long *checkmap;
diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index 5a3558bbb903..a16b84e009a1 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -370,6 +370,11 @@ int ubi_remove_volume(struct ubi_volume_desc *desc, int no_vtbl)
 		return -EROFS;
 
 	spin_lock(&ubi->volumes_lock);
+	if (vol->critical) {
+		err = -EPERM;
+		goto out_unlock;
+	}
+
 	if (vol->ref_count > 1) {
 		/*
 		 * The volume is busy, probably someone is reading one of its
@@ -472,6 +477,12 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
 		return PTR_ERR(new_eba_tbl);
 
 	spin_lock(&ubi->volumes_lock);
+	if (vol->critical) {
+		spin_unlock(&ubi->volumes_lock);
+		err = -EPERM;
+		goto out_free;
+	}
+
 	if (vol->ref_count > 1) {
 		spin_unlock(&ubi->volumes_lock);
 		err = -EBUSY;
@@ -578,9 +589,22 @@ int ubi_resize_volume(struct ubi_volume_desc *desc, int reserved_pebs)
  */
 int ubi_rename_volumes(struct ubi_device *ubi, struct list_head *rename_list)
 {
-	int err;
+	int err = 0;
 	struct ubi_rename_entry *re;
 
+	spin_lock(&ubi->volumes_lock);
+	list_for_each_entry(re, rename_list, list) {
+		struct ubi_volume *vol = re->desc->vol;
+
+		if (vol->critical) {
+			err = -EPERM;
+			break;
+		}
+	}
+	spin_unlock(&ubi->volumes_lock);
+	if (err)
+		return err;
+
 	err = ubi_vtbl_rename_volumes(ubi, rename_list);
 	if (err)
 		return err;
@@ -641,6 +665,7 @@ int ubi_add_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 	vol->dev.groups = volume_dev_groups;
 	dev_set_name(&vol->dev, "%s_%d", ubi->ubi_name, vol->vol_id);
 	device_set_node(&vol->dev, find_volume_fwnode(vol));
+	vol->critical = device_property_read_bool(&vol->dev, "volume-is-critical");
 	err = device_register(&vol->dev);
 	if (err) {
 		cdev_del(&vol->cdev);
-- 
2.46.2

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
