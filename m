Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AB2C7EE32
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Mar 2023 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=98CEXNj0q8Sah6FekfD4TAGwttL8/5k9Fn/iJkPBtkQ=; b=N5z+KAI/W1OmWx
	ioVrst+NhHdo/edP15TpFmXIZKZ0eHDMyj0YsW2HIezf+9vAFI3B1iWcRXjIiMI7mSSFGrKekxHJf
	8FMTpeDvKjvCrtQXXt9Sm2515R9IKC4cIla5/6EXFuzSrIWLTSGUEV4C/9T3HAyFsQ4Zpsr7hfJlo
	FJeHsLBJb/d8xbe8qF4PiZJoWQkvJb3dD8Bt4PpH76sGwyKE1fttxW2pgaSUI7mE0HWpAVxWXxP3D
	35nXZnC3QiHwGAk9GU6eKqdTXZpsfgKae3TBj4MUp+o7azq/D5KBVpzI+vThpHzdUWNjavZsIKKSF
	vgIFKHLp8zosfAXMzCUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXOK5-00GYOY-UL; Wed, 01 Mar 2023 15:24:53 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXOK2-00GYN2-P8
	for linux-mtd@lists.infradead.org; Wed, 01 Mar 2023 15:24:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2C43E24000F;
	Wed,  1 Mar 2023 15:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1677684282;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OeSGRipvbXsFNKwStYkECuExZzDFDwyg9e30PZ6NqA4=;
	b=EBNog4cZDriLI4+aJls/0Q+a07EzFnKRiRLReYhZG12V/XSE6XWZgp2tCSJ/bomUSgaI9y
	tzkRXL8TIKMQw9tORr3WFYx/tptDyCegImk6us9DXr1zzsEFFJM0yXXC32mVCug7bJN1SI
	rT6NZw02/fzqNOZA2W+G6th+GoC7J5XDZQRTM940MF8fDOdrK3wkq8a8X1cIzHLB0gvr1G
	Dx5aLbLlZ2wxduEhy3ElUueNIlk0jLSoCVrv3IzhBbSF44gZDgz03rarDwEqU2tftEJbh/
	/KKbQ11GFxCwmLRzCx8M4BDAyODUXTsA/Yl4j5sC17VJCEZ0Ro34SPXewJK3HQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: Avoid printing error messages on probe deferrals
Date: Wed,  1 Mar 2023 16:24:40 +0100
Message-Id: <20230301152440.531465-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_072451_014336_6CD787A1 
X-CRM114-Status: GOOD (  13.21  )
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

There is no reason to complain about probe errors in case of deferrals.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/mtd/mtdcore.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 0feacb9fbdac..d163c690750a 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -518,6 +518,7 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 {
 	struct device_node *node = mtd_get_of_node(mtd);
 	struct nvmem_config config = {};
+	int ret;
 
 	config.id = -1;
 	config.dev = &mtd->dev;
@@ -535,12 +536,15 @@ static int mtd_nvmem_add(struct mtd_info *mtd)
 
 	mtd->nvmem = nvmem_register(&config);
 	if (IS_ERR(mtd->nvmem)) {
+		ret = PTR_ERR(mtd->nvmem);
 		/* Just ignore if there is no NVMEM support in the kernel */
-		if (PTR_ERR(mtd->nvmem) == -EOPNOTSUPP) {
+		if (ret == -EOPNOTSUPP) {
 			mtd->nvmem = NULL;
 		} else {
-			dev_err(&mtd->dev, "Failed to register NVMEM device\n");
-			return PTR_ERR(mtd->nvmem);
+			if (ret != -EPROBE_DEFER)
+				dev_err(&mtd->dev,
+					"Failed to register NVMEM device (%d)\n", ret);
+			return ret;
 		}
 	}
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
