Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F78DC04E69
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Aug 2023 01:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ws/6P7fJJdshKIJzjBslCtI6JVulqJDZUPTWshd+bcM=; b=EA0oXFB4/53/eA
	mSlehst/MiPulkU9AjhFtDY5bYGwj3Rv8uZWoIfx61KsErFaXl5XFBZ/kKLG/lbm7eyOTJe2/sGhJ
	EwrgPevKQblyKUYuVoNNHMBPDHfkRkxWu1044FirxoLZ4IfqHxoMll34wmOjnRgnOCQJiXJ1kO2Fk
	L7+KbJRtyxvz/BVYsgoTwfpSK7mBmK0z6uK41lA8I+sV10u82plpq1IBXjcKptkoGhHrL0+NphvqB
	ejdXWwtai1D3l5E3tGzWAWamugrsZi/pJt82naVtlZY7pLgekfE9BvvApKVX0zymXUxrDnt0i/IUs
	YhODSrQtZBerShQDgVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUH6s-0095R1-1d;
	Fri, 11 Aug 2023 01:38:38 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUH6q-0095QB-0N
	for linux-mtd@lists.infradead.org;
	Fri, 11 Aug 2023 01:38:37 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qUH6h-000569-34;
	Fri, 11 Aug 2023 01:38:28 +0000
Date: Fri, 11 Aug 2023 02:38:20 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Randy Dunlap <rdunlap@infradead.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 7/8] mtd: ubi: populate ubi volume fwnode
Message-ID: <1faf99d4ae75fa9ac2b36e18fb71075469f246e1.1691717480.git.daniel@makrotopia.org>
References: <cover.1691717480.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1691717480.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_183836_149672_EE7BAA18 
X-CRM114-Status: GOOD (  12.69  )
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
 drivers/mtd/ubi/vmt.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/mtd/ubi/vmt.c b/drivers/mtd/ubi/vmt.c
index eed4b57c61bda..9db845a43ecfc 100644
--- a/drivers/mtd/ubi/vmt.c
+++ b/drivers/mtd/ubi/vmt.c
@@ -124,6 +124,31 @@ static void vol_release(struct device *dev)
 	kfree(vol);
 }
 
+static struct fwnode_handle *find_volume_fwnode(struct ubi_volume *vol)
+{
+	struct fwnode_handle *fw_vols, *fw_vol;
+	const char *volname;
+	u32 volid;
+
+	fw_vols = device_get_named_child_node(vol->dev.parent->parent, "volumes");
+	if (!fw_vols)
+		return NULL;
+
+	fwnode_for_each_child_node(fw_vols, fw_vol) {
+		if (!fwnode_property_read_string(fw_vol, "volume-name", &volname) &&
+		    strncmp(volname, vol->name, vol->name_len))
+			continue;
+
+		if (!fwnode_property_read_u32(fw_vol, "volume-id", &volid) &&
+		    vol->vol_id != volid)
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
@@ -223,6 +248,7 @@ int ubi_create_volume(struct ubi_device *ubi, struct ubi_mkvol_req *req)
 	vol->name_len  = req->name_len;
 	memcpy(vol->name, req->name, vol->name_len);
 	vol->ubi = ubi;
+	device_set_node(&vol->dev, find_volume_fwnode(vol));
 
 	/*
 	 * Finish all pending erases because there may be some LEBs belonging
@@ -597,6 +623,7 @@ int ubi_add_volume(struct ubi_device *ubi, struct ubi_volume *vol)
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
