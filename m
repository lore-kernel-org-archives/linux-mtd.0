Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F66C5DF81
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Aug 2026 20:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WaArplvYfNoZUoXEKv8gh7/nBsmgQf+4oCO+T526vnA=; b=dU0N7PJs4HlN0N
	W92omZMiUDHr3x3tuwbkyF85s8gB2u7ddYDmtbjltvNxV/MCq9b79folohBH3PkIw846jpfhw5pSB
	Bz9xN/+XAh0iI1501W/11E1JcUPCp4uXUlr5fTppswujoLg55yf8a+As7F58yW5u4QZpSzxMeu6HR
	LlYXw2gCQti/7U3/Woqk7O5ddqjLaTsFY6MW4oW0PvS98UZPkHfcYPNwCptmUgTAETrskHKYBc3wH
	QjMKAvNYfT7u26M9P3eOnnHaKNUEHEZtKJjVoyLhsLLYrg/bAZB7eOoLA8ZgJVwVywRGNMKvOQZlq
	fLflJq5ipOFtp3kGZHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybAh-0000000HMFq-0BAo;
	Mon, 24 Aug 2026 20:21:31 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybAZ-0000000HMEX-2Fak
	for linux-mtd@lists.infradead.org;
	Mon, 24 Aug 2026 20:21:27 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-848643382fcso4067649b3a.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Aug 2026 13:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787602883; x=1788207683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gNp5G+obRtae82vOvBIyYYK4Xe2jxDTBbOvoR67emq8=;
        b=F/39jhO6HwBIVmR3VFhOHIMOUd+fJXNSt4MHDO5EldgXdjI5EL8diFxXo+dB/OobBI
         AWjnG9QJUxINVpQttdwOs/N1WhYbtZFZpA1DmFpR2AA7zE7T02qfaWteFxCC0nCCUdOh
         1M8F9fEg801FoOrofy8uwOnFcYYz8gtRzw+rj8BBVMv3z9n/XThI7CtiZmoqrxj1Txdi
         EMP9QmYYDwD6fpjWHy/qy1OjeCQhMKwsyfGIxwzVrSt/ZKG1UEMtQF8N9pYUmMrCTQG4
         K2ZdwT0Lb/Bh+20sLaK5WJ7VuBMCPx/PQ5m3q/3tRRQt7vxK8/4DyD06OPXR/chr8fSO
         XX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602883; x=1788207683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gNp5G+obRtae82vOvBIyYYK4Xe2jxDTBbOvoR67emq8=;
        b=oslOU2YYnVlBAlbGYyDMw/Uk0bWPKvc2tc4ejaGLxDuY6cFDOcdgyut0fMfNcz4Zy1
         kLBNnbSqzDxTaMFmfVw4bfEDPy2fNFRkAtJcOdwKhsjcvUtLK8zeRxsjgZ7ALMTpV6OA
         c0kiXMEJM+XUUmJ0PjVqiXd5UsdH/MPp4z9vAa6gWtNiy7VpRlRC+Npc+3fSB18bwsJ9
         Ir+bbOM9p59zpUFNRVNRPATPQbV3HkkC66BbJ+uzZyg9vGHWL+CyJVXER0V+rV4HqVun
         Dg+bxtNpPNREtsQN5bKs/acWDms8mujOxWTbFQhQMb9EyevQ70wr4SIdlHkr/siYMJqG
         +Qiw==
X-Gm-Message-State: AFuF++mQZ+CyY+hLmYJQajVAKPIjsVXPuZuGrf+5iWufax2gfmEUOR8P
	quMrqJezT6DHls+tBruGgKAE9y7w6AinI0dlSjAjf5c6MnkYkuCVJVve2X/MZA==
X-Gm-Gg: AR+sD13sGLDUjYhJv9dBbwTWKvb2z+JfMNX34NPY6WhTXeaB+ygmdifspb6IcWGzA5j
	etexDHiN9WUD/6KJiDBvKQlU9dDbSNHWj5CLvEHOzaoO6JL1fWWPsr4F6SJcOeXKFDtE/ubG3Y0
	FsGbPswPL+xV+QUyr9yAqxX5QY3z/yJ0tOlOkVTRFHBgc30EjWjoQPe7sVS9fwTfQfU43P3y4DH
	Lz3+LIwQNM1n+HIN1AVIx4kfPr0hcaoEKG2FfuxNwd46oHZeQ+0w1IYSRM9tR//qiHFUXTmw7pS
	GkDOGQe5bTyMFFNwM7g9ymfUpyKMIfBdOOR+vH3y1XQT1jxXVIhyQYI9WxwWxhQRG1eXeNXNi9S
	H3QtL4lRlj03ag2RvnhFQQOXm8cZ22R8sei1U8p72L0KMiaiJP3tkToInIkwMH/NKkFxxqQGGun
	HgnKmmNuFDsXlGLmNqujf3OIWnFi3z6wAkWWhnpfVIs8W9F9W3ut/PIHnLfn/1m9f5ISFEz8KOZ
	GK0BI1nZ1q+7gvw/27XWagc87dlsAlJMv+KDCSo9Qy5XnotK2TXOo9XdUvt1BgnKT4yTgeVAxDO
	gp2rszwHSZChkUpDxcxaW/HuLZ/sZ6rwEWCCmHRBLNQ=
X-Received: by 2002:a05:6a00:2d26:b0:848:5cf5:5040 with SMTP id d2e1a72fcca58-851f9f4ba99mr46085836b3a.10.1787602882600;
        Mon, 24 Aug 2026 13:21:22 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520f16a9ccsm2330961b3a.58.2026.08.24.13.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:21:22 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	David Woodhouse <David.Woodhouse@intel.com>,
	Sean MacLennan <smaclennan@pikatech.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] mtd: rawnand: ndfc: use devm_platform_ioremap_resource()
Date: Mon, 24 Aug 2026 13:21:20 -0700
Message-ID: <20260824202120.12280-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_132125_446853_5A822731 
X-CRM114-Status: GOOD (  13.46  )
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

Replace the open-coded of_iomap()/iounmap() with the managed
devm_platform_ioremap_resource() helper. This fixes a mapping leak on
driver remove (the old code never called iounmap()) and simplifies the
error path by dropping the manual cleanup in ndfc_probe().

There is no overlapping memory-region concern introduced by this
change: each supported board DT describes a single ndfc node with a
unique 0x2000 register region, and the EBC parent uses dcr-reg rather
than a MEM reg resource, so the newly added request_mem_region() cannot
conflict with an existing reservation. Distinct chip selects map to
distinct 64-bit physical addresses, so CS instances do not overlap.

Fixes: a808ad3b0d28 ("[MTD] [NAND] ndfc driver")
Cc: stable@vger.kernel.org
Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v2: add Fixes: and Cc: tags
 drivers/mtd/nand/raw/ndfc.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/nand/raw/ndfc.c b/drivers/mtd/nand/raw/ndfc.c
index a48274297d3b..d6db04d48c45 100644
--- a/drivers/mtd/nand/raw/ndfc.c
+++ b/drivers/mtd/nand/raw/ndfc.c
@@ -185,10 +185,15 @@ static int ndfc_chip_init(struct ndfc_controller *ndfc,
 static int ndfc_probe(struct platform_device *ofdev)
 {
 	struct ndfc_controller *ndfc;
+	void __iomem *ndfcbase;
 	const __be32 *reg;
 	u32 ccr;
 	u32 cs;
-	int err, len = 0;
+	int len = 0;
+
+	ndfcbase = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(ndfcbase))
+		return PTR_ERR(ndfcbase);
 
 	/* Read the reg property to get the chip select */
 	reg = of_get_property(ofdev->dev.of_node, "reg", &len);
@@ -210,11 +215,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 	ndfc->ofdev = ofdev;
 	dev_set_drvdata(&ofdev->dev, ndfc);
 
-	ndfc->ndfcbase = of_iomap(ofdev->dev.of_node, 0);
-	if (!ndfc->ndfcbase) {
-		dev_err(&ofdev->dev, "failed to get memory\n");
-		return -EIO;
-	}
+	ndfc->ndfcbase = ndfcbase;
 
 	ccr = NDFC_CCR_BS(ndfc->chip_select);
 
@@ -232,13 +233,7 @@ static int ndfc_probe(struct platform_device *ofdev)
 		iowrite32be(be32_to_cpup(reg), ndfc->ndfcbase + offset);
 	}
 
-	err = ndfc_chip_init(ndfc, ofdev->dev.of_node);
-	if (err) {
-		iounmap(ndfc->ndfcbase);
-		return err;
-	}
-
-	return 0;
+	return ndfc_chip_init(ndfc, ofdev->dev.of_node);
 }
 
 static void ndfc_remove(struct platform_device *ofdev)
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
