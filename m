Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF3D9C79F8C
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 00:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z4AJW0PfPmset+rvUa7HjxvjeW6w8xNT6/OeV6ISIAg=; b=1vhjjP6E4NGXg7
	gFAbmR/PCEQEog/EliW5UNd4n+aByMWab4Xw6OQGwR6ficChRmmz+i1jb0NzkQp0+muTOz+xIQyik
	DPo0I0nRMInEAXBgOp8cBxaXwTtqT5u/Shil+QiIZAsqcqZw/R/b0A7kxZg+LTeOXSh4Qta+Xmy7e
	vBvKGdm/qFSi2b5AeheYdIZ01D0r7q7rNhME9Uo80yFzJGDu8Ajn7kBk0/SkoaYf/JFYDlS3cKYu1
	ZY0guDrMRGYxDUzLGoHvUy1GQUp+3aq91h5R0mhc/VzgaiGVCcgTwFz8/JqwL+FKqQWNEc0THEODU
	EH9dRH2HObSsMOTh4//w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3NXw-00000005eaf-0UNy;
	Mon, 07 Sep 2026 00:49:16 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3NXt-00000005eaJ-0ml3
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 00:49:14 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so2307138a12.2
        for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2026 17:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788742152; x=1789346952; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2XV7N8oiIfPwNA3+WEAPB+6Qv6pN5TtTgVk3F9R8Ps=;
        b=OWYQq/4YvtPlIZhOU95HUP/oaCVWON0+s7skjPOLDYn28MsXDx+lE68ExjTYB8BF4N
         Nev6gA9yEo5aNv8wIHvyX6mDtxfxqJqGUn+EO1vwAasB4+Ep5AMRVE8loCCW7kEt5nVt
         7VTKLLsxTyiuCic6VvJ7J8FmzZcWidUxnVTWyhEJf1C7ztSFUXQ7WFgdZ1RV7FwE7/L+
         fEeny6VjJiFXCaH+oqkXSCM/TKR4FZ9sYlY5O/fwk3cdyxt0xLlDlOnKQ8sJuQBWQUl6
         JmxpVATBiSLGTvAhyxOxjTRtoRRbXRbJ5HGVusgwT7+guCpY2ZScxCP7L5/bX+RBAnVQ
         tYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788742152; x=1789346952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2XV7N8oiIfPwNA3+WEAPB+6Qv6pN5TtTgVk3F9R8Ps=;
        b=UcRNE23aCAS403i7pZvyHAVR2wg6fuWtF5OImT5QriyuFc+pkojWKuDHZhzpkO0sBx
         H0fvgVHq8cDUAkIyQTjBJfw6n+hCTv6kvUpja7fe4Lcn5vE0IW1SBxxKOHHBlgTTJzMM
         FR1ORcKaMaIRhQzfJfejeCuVKXkH22ghgZp3sPEBSKX1+rkGuLydanLmoGDVGBW+rIZz
         Pxs4SZEb5iKH/VMZcHSm/ZmEXn/oC4+xgubxn4YYKZ9ijC5y6GxuoUSuMWFBqMcC5vnF
         2MYjm1Meu6Iptc9RqAbVCt4H24QrbURtzcMZNEKzSOv5iy7LQigW+22LG1P5xgU39yht
         c3yw==
X-Gm-Message-State: AFuF++lUZ1dFSTKY4yY7pdaM6QJd7nG8qJYbv4HbRTL/R+Mwjn5IypIj
	dbbLZD2M9ynNsKwyOOqSQzWNbxAptLJx4PCRZLGU+6jb7E41haPhCYAhVjZgRQ==
X-Gm-Gg: AYBFou1RwGHUnkLP/LRuvp3nzJ8oRq/spSw9RP35QqRDLYoEreZ2aYNxyxfuPxaMFBM
	aal/Mg43mM4SCszqQLzzU8HCLSBNyU52vwPmiJn+mgn8QjoFZhU9Vm3Mj4rBNrwt6vbfKhcw9rn
	23it+IJMkQGJjwKQdK9pxufjOs255tYeBBYblm0LLAKiiJxTeVzMPZHf6UCDRRgLunAwxr2dqQD
	HZVqdQ0eOGssUpY4dpvVaDlusdxFY7k8cTDa6X6EbHJwM69oVAh32cdA+S1vtAvnr7WgIYN1E9z
	11r3z/GVUT6mgZNrnpfNH2GWh0KAzPKTMlqDqGLwUOfdC6dt0czzInMaR19k1OMaYrmg7VYPIHO
	518xRh4Y0tVrAjZ+Cy8snXg/hPVkufyFeEGQZB2dDMZjMS1wdI75v34VqvRyrSxNsMrvYWNY1cd
	9MsQIw1qWklFvOAYudRF/HQGvX9UIywmaQnErWq7Qr0VaCc666P2wA0x7I+4mfbBm/5cCkYktMV
	/IlwqImT1EjcH40PLXezLOAV1bTQud2Pr23db8OJAdpVxAQlDSrQCG20/2O2x1Tq6iAdWDD+fmo
	mYUwhjZchuiazGIYxQdUzhViztSJPury5i3Q/ac=
X-Received: by 2002:a05:6a21:138c:b0:3d3:afd9:6040 with SMTP id adf61e73a8af0-3da3a1f77f2mr31242218637.27.1788742152360;
        Sun, 06 Sep 2026 17:49:12 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm22771048eec.9.2026.09.06.17.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 17:49:11 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] mtd: docg3: use devm_platform_ioremap_resource()
Date: Sun,  6 Sep 2026 17:49:10 -0700
Message-ID: <20260907004910.226013-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_174913_365378_5288217E 
X-CRM114-Status: GOOD (  12.49  )
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

Replace the open-coded platform_get_resource(IORESOURCE_MEM, 0) plus
devm_ioremap() sequence with devm_platform_ioremap_resource(), which folds
the resource lookup, region reservation and mapping into one step and
returns an ERR_PTR checked with IS_ERR()/PTR_ERR().

The canonical docg3 register window is DOC_IOSPACE_SIZE (0x2000), which is
the size any platform provides for this device, so mapping the full
resource is equivalent to the previous fixed-size devm_ioremap().

Built for ARM (multi_v7_defconfig + CONFIG_MTD_DOCG3) with LLVM=1;
drivers/mtd/devices/docg3.o compiles cleanly.

Assisted-by: opencode:hy3-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/devices/docg3.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
index 603fd0efc2ea..bbdf3bfb0e70 100644
--- a/drivers/mtd/devices/docg3.c
+++ b/drivers/mtd/devices/docg3.c
@@ -1971,25 +1971,15 @@ static int __init docg3_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtd_info *mtd;
-	struct resource *ress;
 	void __iomem *base;
 	int ret, floor;
 	struct docg3_cascade *cascade;
 
-	ret = -ENXIO;
-	ress = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!ress) {
-		dev_err(dev, "No I/O memory resource defined\n");
-		return ret;
-	}
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	ret = -ENOMEM;
-	base = devm_ioremap(dev, ress->start, DOC_IOSPACE_SIZE);
-	if (!base) {
-		dev_err(dev, "devm_ioremap dev failed\n");
-		return ret;
-	}
-
 	cascade = devm_kcalloc(dev, DOC_MAX_NBFLOORS, sizeof(*cascade),
 			       GFP_KERNEL);
 	if (!cascade)
-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
