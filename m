Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4436AC001E0
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 19:14:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cr0ybC17N3Bmp/ncIq1PmUdwYt+ijUVSzcDpZcqRL3k=; b=3Mo5th6m3/VlFN
	udsS188wnLBxnXtii7kYBybHPZc+WDhlzLdpXfkzsHftuKpYzhLqBiBD4sptjCxV91LW3o/WUFLoD
	Ied/4pYDXfPKiyOdG84JGLyjakjwFYpbrj5WrZ8BdYgkNSGEtwE4a+rZjGzpCU8DRxFcWy5tkwIMX
	3SPlHYkNf8qEh/k3H29sLoPWJ0RuyUfJpmh2ZueXqqEc/GaQtxEMf9okN6OWyBg17xNBe9G2WQIzh
	9DBT27Vv+QvECWR98oJaFyTZ8QzmYj4Lwv1WYbouWI6grAHXfgisDEZJsOl2xauBOGJg4ULc8/mmI
	5YJ/eab2xG1qC/jLa+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYLF-00H5aF-1x;
	Mon, 31 Jul 2023 19:14:05 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQYLC-00H5Yv-2y
	for linux-mtd@lists.infradead.org;
	Mon, 31 Jul 2023 19:14:04 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qQYL8-0001iX-2t;
	Mon, 31 Jul 2023 19:14:00 +0000
Date: Mon, 31 Jul 2023 20:13:47 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH 5/6] mtd: ubi: populate ubi volume fwnode
Message-ID: <3efb1ac62048dd6818688737e22cdaabb9f65ce3.1690823629.git.daniel@makrotopia.org>
References: <cover.1690823629.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1690823629.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_121402_957687_01610701 
X-CRM114-Status: GOOD (  13.36  )
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

Look for the 'volumes' subnode of an MTD partition attached to a UBI
device and attach matching child nodes to UBI volumes.
This allows UBI volumes to be referenced in device tree, e.g. for use
as NVMEM providers.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/mtd/ubi/vmt.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index eed4b57c61bda..3b997256cfba7 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -124,6 +124,35 @@ static void vol_release(struct device *dev)
 	kfree(vol);
 }
 
+static struct fwnode_handle *find_volume_fwnode(struct ubi_volume *vol)
+{
+	struct fwnode_handle *fw_vols, *fw_vol;
+	const char *volname;
+	u32 reg;
+
+	fw_vols = device_get_named_child_node(vol->dev.parent->parent, "volumes");
+	if (!fw_vols)
+		return NULL;
+
+	fwnode_for_each_child_node(fw_vols, fw_vol) {
+		if (!fwnode_property_read_string(fw_vol, "volname", &volname) &&
+		    strncmp(volname, vol->name, vol->name_len))
+			continue;
+
+		/*
+		 * volume id (reg) in device tree greater than UBI_MAX_VOLUMES
+		 * can be used to match by volname only
+		 */
+		if (!fwnode_property_read_u32(fw_vol, "reg", &reg) &&
+		    reg < UBI_MAX_VOLUMES && vol->vol_id != reg)
+			continue;
+
+		return fw_vol;
+	}
+
+	return NULL;
+}
+
 /**
  * ubi_create_volume - create volume.
  * @ubi: UBI device description object
@@ -223,6 +252,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	vol->name_len  = req->name_len;
 	memcpy(vol->name, req->name, vol->name_len);
 	vol->ubi = ubi;
+	device_set_node(&vol->dev, find_volume_fwnode(vol));
 
 	/*
 	 * Finish all pending erases because there may be some LEBs belonging
@@ -597,6 +627,7 @@ int ubi_add_volume(struct ubi_device *ubi, struct ubi_volume *vol)
 	vol->dev.class = &ubi_class;
 	vol->dev.groups = volume_dev_groups;
 	dev_set_name(&vol->dev, "%s_%d", ubi->ubi_name, vol->vol_id);
+	device_set_node(&vol->dev, find_volume_fwnode(vol));
 	err = device_register(&vol->dev);
 	if (err) {
 		cdev_del(&vol->cdev);
-- 
2.41.0

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
