Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF1ACD8CBF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Jun 2026 08:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tI4kj8CPrx88e+rZ5+7TC6B3aRlrsMRO2palkYG31DQ=; b=PRZiQjQ35jSjyB
	l/eHV06b16Mo1nNRpErioGzWWP6QMlBjC52y3YzpEhRsvyAxNZ0g61hjr0LUr5SpFKGJF+3cAHT/V
	iGmbFouGaFz69Vz46/uJ9FOrssRMYJZZXZb/+ZKMX6UaM+XbSvmdEIabDqyVc3x3dij05zY7XgTt9
	KPVrTvVg17Um3IZNgzIenW9hnRExowXRE9pVi03RTWsOTd1Rz/23TktEtaob3OF3aKU5j5OQtgR8T
	4HsVljaRXcAdjQtTb0digj4YCjCndg+NbCV9+GdQsA8JlG5VLCxn8PKrbGvcLcsShBHAv2I/6oENH
	HWD1LcqX4Z5wJbwF3ryA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs5h-000000055zc-35S2;
	Tue, 09 Jun 2026 08:45:45 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWs5b-000000055yf-3UyT
	for linux-mtd@lists.infradead.org;
	Tue, 09 Jun 2026 08:45:43 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c86215c4122so870742a12.3
        for <linux-mtd@lists.infradead.org>; Tue, 09 Jun 2026 01:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780994739; x=1781599539; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMZKKG2BBX9CHEXIGFRRZh0XQLWC1SczIy5eW5H9mYA=;
        b=IdeRPHHSwZBOedeUpbLN3rpFKtYJ+N0hRgZpyoLnHf+CmBGj/tBT6BCSsTyTGWG/lx
         sJD3cOx99OlbKc5NN7tObF1gE5pGc2W03dDF5Xp21NBbKwDB3opBFHJDZmiJkvtuu2Qi
         WsQ6lQ8NDw7nc1JeUENM2kb3KqViruI3Xc1CyGPAijZTmgc3wPyMgDfg45kN9eOnR49k
         /0oqT/g5QccndHZ96xLlXB7lxIgHuHULYFBgPdb4jRORbs/U5gwNSEK34mQSnymQLXIs
         4DqWeq+61wmVSFePgMD0DeaJb5rnKE+eRvJeqUVORFCOFSsYm+Fun/LqTaRt8txF0EA1
         7iNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780994739; x=1781599539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XMZKKG2BBX9CHEXIGFRRZh0XQLWC1SczIy5eW5H9mYA=;
        b=E2zmk+gE7oFQtipI8E59jpt4kQ0pR/9bMOok5JAl+iJ3Ugz+PMF4eEFDSuK8ZvPo/L
         EkqAYsuMU/KvFcHbB5/4DRgXKKt9adGG2UpZpRDFc7cSGBmXMDeCl2KOLrqLRMDHrhTQ
         k5EkL38F8hhS1e/v8SiFbPXVH1JRIGjWf/8U33Um8Scys96WNaGZ68CV/tSfmhLZ/Agy
         aflbi+Px3C7dVPDF43Eyy2hBEo1uO1EOtZCAGdYrRJVg9k92J0MEmGS0Q1Qj4KtHq2Jw
         1yPCrCGYq8z3GEM1kFIiEQ+JQQG2IS9YvaawV/6rJ+zWZQ9szQeTttyd5AKKIFNYO3v3
         hX3w==
X-Gm-Message-State: AOJu0YyASf8hpcUEUGaFGcwUuZiSNBRPfy3vY4h2W9QhGp+17kjLMC3p
	ZWQql2G6+O0WCbmyLmk1OP9WEu+T8zKAW38zHvrCav3YKcAcLyq40iX+
X-Gm-Gg: Acq92OGmvmgnxa8FHMKqNdVGdqBjuVpL3w1bcUNrlQq+h39jFf5EU9yzSzfaz829bvJ
	uuM/HUC8ANVCM+6fVGPeQ7YTD5kGpl4WtxVmUakrcmMoaL+qfty6aPRTVb38sKaCQG8Cwl9NNdd
	he68bCXuSO9l7Z0jVtoxO2QBx2QqmvAdg4KBsVnCIHBUsQUBA4pe4a3QwHVMqoyHj5QJSR5YLwj
	DeRPk711WCJVQqRpMhtmDcJyQXxKu21Y/TDqgau8SMyEcnjluog31kr2wiRw7LoVciKJEQ02vcH
	HE4mKgCPb394f91C4OaxOiqGuR9UgBtuw4vZc3ec2+wGfjVr9Wz3x07SuoHkAfGingb3rSktKeE
	v9kxrZ40Yv9MLkaYHzQg3WVMkOxu/jXCSk6+qP5K3awfqVzvGFo7uUEeb4KbHzHxDjAgSXi6qLE
	zbMjE8MUvBNkH7F2dEARUBI0uLe0tYWEgblrnTX/a1zJ8wmEbSvT/Nzw==
X-Received: by 2002:a05:6a21:6492:b0:3b4:6dee:a42b with SMTP id adf61e73a8af0-3b4cd003836mr23118277637.34.1780994738981;
        Tue, 09 Jun 2026 01:45:38 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:37c9:44fa:729b:6aaa])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85deeb2bdesm17608599a12.0.2026.06.09.01.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:45:38 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH v2 2/2] mtd: slram: simplify register_device() cleanup
Date: Tue,  9 Jun 2026 16:45:28 +0800
Message-ID: <20260609084528.5-3-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260609084528.5-1-ruoyuw560@gmail.com>
References: <20260609084528.5-1-ruoyuw560@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_014542_263919_A04F45FF 
X-CRM114-Status: GOOD (  15.15  )
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

Use local variables for the list entry, mtd_info, and private data while
initializing a new device. This keeps the initialization path easier to
read and publishes the new list entry only after mtd_device_register()
has succeeded.

Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/mtd/devices/slram.c | 86 ++++++++++++++++++-------------------
 1 file changed, 42 insertions(+), 44 deletions(-)

diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index 48c2bc6b65eec..aa38ecdffc975 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -129,6 +129,9 @@ static int slram_write(struct mtd_info *mtd, loff_t to, size_t len,
 static int register_device(char *name, unsigned long start, unsigned long length)
 {
 	slram_mtd_list_t **curmtd;
+	slram_mtd_list_t *new_mtd;
+	struct mtd_info *mtdinfo;
+	slram_priv_t *priv;
 	int ret = -ENOMEM;
 
 	curmtd = &slram_mtdlist;
@@ -136,73 +139,68 @@ static int register_device(char *name, unsigned long start, unsigned long length
 		curmtd = &(*curmtd)->next;
 	}
 
-	*curmtd = kmalloc_obj(slram_mtd_list_t);
-	if (!(*curmtd)) {
+	new_mtd = kmalloc_obj(slram_mtd_list_t);
+	if (!new_mtd) {
 		E("slram: Cannot allocate new MTD device.\n");
 		return(-ENOMEM);
 	}
-	(*curmtd)->mtdinfo = kzalloc_obj(struct mtd_info);
-	(*curmtd)->next = NULL;
-
-	if ((*curmtd)->mtdinfo)	{
-		(*curmtd)->mtdinfo->priv =
-			kzalloc_obj(slram_priv_t);
+	new_mtd->next = NULL;
 
-		if (!(*curmtd)->mtdinfo->priv) {
-			kfree((*curmtd)->mtdinfo);
-			(*curmtd)->mtdinfo = NULL;
-		}
+	mtdinfo = kzalloc_obj(struct mtd_info);
+	if (!mtdinfo) {
+		E("slram: Cannot allocate new MTD device.\n");
+		goto err_free_list;
 	}
+	new_mtd->mtdinfo = mtdinfo;
 
-	if (!(*curmtd)->mtdinfo) {
+	priv = kzalloc_obj(slram_priv_t);
+	if (!priv) {
 		E("slram: Cannot allocate new MTD device.\n");
-		goto err_free_list;
+		goto err_free_mtdinfo;
 	}
+	mtdinfo->priv = priv;
 
-	if (!(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start =
-		memremap(start, length,
-			 MEMREMAP_WB | MEMREMAP_WT | MEMREMAP_WC))) {
+	priv->start = memremap(start, length,
+			       MEMREMAP_WB | MEMREMAP_WT | MEMREMAP_WC);
+	if (!priv->start) {
 		E("slram: memremap failed\n");
 		ret = -EIO;
 		goto err_free_priv;
 	}
-	((slram_priv_t *)(*curmtd)->mtdinfo->priv)->end =
-		((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start + length;
-
-
-	(*curmtd)->mtdinfo->name = name;
-	(*curmtd)->mtdinfo->size = length;
-	(*curmtd)->mtdinfo->flags = MTD_CAP_RAM;
-	(*curmtd)->mtdinfo->_erase = slram_erase;
-	(*curmtd)->mtdinfo->_point = slram_point;
-	(*curmtd)->mtdinfo->_unpoint = slram_unpoint;
-	(*curmtd)->mtdinfo->_read = slram_read;
-	(*curmtd)->mtdinfo->_write = slram_write;
-	(*curmtd)->mtdinfo->owner = THIS_MODULE;
-	(*curmtd)->mtdinfo->type = MTD_RAM;
-	(*curmtd)->mtdinfo->erasesize = SLRAM_BLK_SZ;
-	(*curmtd)->mtdinfo->writesize = 1;
-
-	if (mtd_device_register((*curmtd)->mtdinfo, NULL, 0))	{
+	priv->end = priv->start + length;
+
+	mtdinfo->name = name;
+	mtdinfo->size = length;
+	mtdinfo->flags = MTD_CAP_RAM;
+	mtdinfo->_erase = slram_erase;
+	mtdinfo->_point = slram_point;
+	mtdinfo->_unpoint = slram_unpoint;
+	mtdinfo->_read = slram_read;
+	mtdinfo->_write = slram_write;
+	mtdinfo->owner = THIS_MODULE;
+	mtdinfo->type = MTD_RAM;
+	mtdinfo->erasesize = SLRAM_BLK_SZ;
+	mtdinfo->writesize = 1;
+
+	if (mtd_device_register(mtdinfo, NULL, 0)) {
 		E("slram: Failed to register new device\n");
 		ret = -EAGAIN;
 		goto err_unmap;
 	}
+	*curmtd = new_mtd;
 	T("slram: Registered device %s from %luKiB to %luKiB\n", name,
 			(start / 1024), ((start + length) / 1024));
-	T("slram: Mapped from 0x%p to 0x%p\n",
-			((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start,
-			((slram_priv_t *)(*curmtd)->mtdinfo->priv)->end);
-	return(0);
+	T("slram: Mapped from 0x%p to 0x%p\n", priv->start, priv->end);
+	return 0;
 
 err_unmap:
-	memunmap(((slram_priv_t *)(*curmtd)->mtdinfo->priv)->start);
+	memunmap(priv->start);
 err_free_priv:
-	kfree((*curmtd)->mtdinfo->priv);
+	kfree(priv);
+err_free_mtdinfo:
+	kfree(mtdinfo);
 err_free_list:
-	kfree((*curmtd)->mtdinfo);
-	kfree(*curmtd);
-	*curmtd = NULL;
+	kfree(new_mtd);
 	return ret;
 }
 
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
