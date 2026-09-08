Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6427C79F99
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 06:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AOsM94/FPn6chZCx64vjHoeZWSChH6JMXAz3DWrurjw=; b=IeSIkJ7vlAwGdt
	CdX1EHnSysklBZtjAsHXUs1P6HMuiH+qwihH//jloQLT73O57GeC7ijP6Ellja97kq7Pu/ATxlsvE
	8JBy+zi5WeSxyZa/SCHqqMqp21m/6RULG8gmMr49PwmNT7GwWgXrxectQqFvq4N4/5G4lCN2QCwHs
	BbKZ2Os7j0jtdXDZorSbpK94ATRpfCTEUpxJA4qb4tVHyiRLejORbfH5o9Q+eZCBDcNmcm9U1lnBb
	0dN7BR7Y2gl9Khg/trgjsl48/TKGO57m3zh6mlG9XPOgpuJEi0/NwAwtDvbDGcc9xRhG5U4xue09s
	tiLQOejLHsrlVTrk+a1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3otR-000000087M4-2ZgJ;
	Tue, 08 Sep 2026 06:01:17 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3otP-000000087Le-0XBU
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 06:01:16 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84faf0fa17eso4292300b3a.2
        for <linux-mtd@lists.infradead.org>; Mon, 07 Sep 2026 23:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788847273; x=1789452073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rud7AzWXfFmh/miZcM84Tl0yKLFLgZncbdvuv1vQA1g=;
        b=e7QlR8ZE3DqQ6ag1OTeSYtWcQaR+RL0dp0BIsc0DRyMEmHIiFduFPhSLvbo3et+5ue
         f5JDWdnCn+2B0/6ANXC5wEYcYeZAepiJlPqd6I1+ImBXjUoI9WVgFr8k2iwo20X/TSKU
         pk+VpQSHNHmmX18YIxKiV9af4D0beGMpSm9LN9tyAT7DUaj4dNawHTBQBLWlgOzY2YkG
         CwLI6DOcuEaMRDsLLnDvIe8qEcT5sD+9VRU7IFX1DkD0N3oeATAr/FzQ4BlSRVTNQP0q
         kHSw9X0qjC2cQnSeiNesN+nkOMrQnU9zbaL2NF/a17AMIwFvUcY0o/IIHEDEXe2lPH6d
         IcHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788847273; x=1789452073;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rud7AzWXfFmh/miZcM84Tl0yKLFLgZncbdvuv1vQA1g=;
        b=oIlQOulZ4GMnXiKQZoH5S+mwOmMU+zDLnBW/Qh1hINVmX8afyaU/AUaiawgIPPkfRo
         ajQ8c8tsrD9vNSBda2l10zH3oiE84joHCLMiW9zIwbP8oNIHKKfSwrLoqryOXhT4MGWX
         Wp9a0goEmet1PxPp1Stgs337E3MEQvrVeJhpUts6W2v7lTMawzs5wlt0letij5W+FSgG
         Aht955QJLsenVMruDEvUcpvuurSAef+WIEua0UnB3MESWAeLzVxvHQskr9UrbPgBp3uv
         69/lszcOk5zVWp9cYbB2gDBDgevGn7UbCs/OWozBDI8pQab2FK8Cvtixouckp1RaZSKw
         DNEw==
X-Gm-Message-State: AFuF++mpEvyMwPly3/JjFpCky7LWRGni1IDxsBUiC78Jfwii+/gmWtCq
	cH4yenowgXME0XuJax7KsuLyQnzOKT0JW69P9Y7y489Lqy/QbTOEvlpGa4TrqQ==
X-Gm-Gg: AYBFou2uNzLwThBR0UqtRG0PsJbWTHHssEg8Veccr59H4jfQ10Og7OCenXekK6NA+DT
	g6M2kuDeszSOYIYuGD6Fi6Zz5cHK627E+SpSfVQ6H1JRFokLiYZxw/IxLM3XUCQv9115b+nTHiM
	dXSyfy7Ez+9ywPtS5PCndWSKquZRAovldXyNJDu8wRkF8f59SWoqxBSgxBk+IclzKJk7OGIeXf/
	FgdW4MHb/Rf7h/oc9KtPczzPcN2ciCZCA8SDKMrgDY3fBPi9wYmXV8LLP984WBh6rQ5UF58mBt9
	/ngrZlQDqReHo0Ka+gL5ukG1VIOcNO1DsTLFedt9I8UguM3SK+HQDFgHCKzaVJ5Kit7bG9FUVnM
	HEC6s9C/lYFw425ken9n8eXuNLSsoE8IjdhCqAtGWlSNC4uDTP5+ZNYtI0fV6jk13HP2BGAojH0
	p98muRXIxz8uh1BQhm7qdcdHZ2t0ygZfk8unf05+aMdeYcihwZNGsAjmvQfnOOc2hupStJ9bKX4
	MwZcVNGWkND/LNuB+vwYrf9UKj2wVlwBuRvcojNL/+wqJm6RquU/n/Fog+JrAWTWvRCVAVgejRu
	qj2ru8ivZTv+E8qHhz5k7IKqUuDcCnD4ybw8X6z/0Dy4taOVyg==
X-Received: by 2002:a05:6a21:d84:b0:3d2:2011:d184 with SMTP id adf61e73a8af0-3da3a096045mr45740365637.14.1788847273403;
        Mon, 07 Sep 2026 23:01:13 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc455485c25sm4850041a12.26.2026.09.07.23.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:01:12 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] mtd: rawnand: fsl_ifc: allocate shared ctrl with devm_kzalloc
Date: Mon,  7 Sep 2026 23:01:11 -0700
Message-ID: <20260908060111.41244-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_230115_173114_3E62C537 
X-CRM114-Status: GOOD (  13.22  )
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

Allocate the shared fsl_ifc_nand_ctrl structure against the controller
device, which outlives all NAND child devices, so it is freed
automatically.  This drops the manual kfree() and the broken chip
counter that was decremented in remove() but never incremented
anywhere, leaking the structure and leaving the freed pointer in
ctrl->nand on re-probe.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: rebase.
 drivers/mtd/nand/raw/fsl_ifc_nand.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/fsl_ifc_nand.c b/drivers/mtd/nand/raw/fsl_ifc_nand.c
index a88ac2cfaccd..4c2d95461c2e 100644
--- a/drivers/mtd/nand/raw/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/raw/fsl_ifc_nand.c
@@ -50,7 +50,6 @@ struct fsl_ifc_nand_ctrl {
 	unsigned int index;	/* Pointer to next byte to 'read'	*/
 	unsigned int oob;	/* Non zero if operating on OOB data	*/
 	unsigned int eccread;	/* Non zero for a full-page ECC read	*/
-	unsigned int counter;	/* counter for the initializations	*/
 	unsigned int max_bitflips;  /* Saved during READ0 cmd		*/
 };
 
@@ -1033,15 +1032,13 @@ static int fsl_ifc_nand_probe(struct platform_device *dev)
 
 	mutex_lock(&fsl_ifc_nand_mutex);
 	if (!fsl_ifc_ctrl_dev->nand) {
-		ifc_nand_ctrl = kzalloc_obj(*ifc_nand_ctrl);
+		ifc_nand_ctrl = devm_kzalloc(fsl_ifc_ctrl_dev->dev, sizeof(*ifc_nand_ctrl),
+					     GFP_KERNEL);
 		if (!ifc_nand_ctrl) {
 			mutex_unlock(&fsl_ifc_nand_mutex);
 			return -ENOMEM;
 		}
 
-		ifc_nand_ctrl->read_bytes = 0;
-		ifc_nand_ctrl->index = 0;
-		ifc_nand_ctrl->addr = NULL;
 		fsl_ifc_ctrl_dev->nand = ifc_nand_ctrl;
 
 		nand_controller_init(&ifc_nand_ctrl->controller);
@@ -1121,14 +1118,6 @@ static void fsl_ifc_nand_remove(struct platform_device *dev)
 	nand_cleanup(chip);
 
 	fsl_ifc_chip_remove(priv);
-
-	mutex_lock(&fsl_ifc_nand_mutex);
-	ifc_nand_ctrl->counter--;
-	if (!ifc_nand_ctrl->counter) {
-		fsl_ifc_ctrl_dev->nand = NULL;
-		kfree(ifc_nand_ctrl);
-	}
-	mutex_unlock(&fsl_ifc_nand_mutex);
 }
 
 static const struct of_device_id fsl_ifc_nand_match[] = {
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
