Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1665EC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Dec 2021 17:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pWfCMN6i5hMjtXyqGHvN2JOAtY94IlwD6nCcb2plrJA=; b=m8XeZIxASCRhEL
	N5wX3NKUgPQibyVJnfxbd2sLZk/nibP6PITYsDDqkybCZmI+Dh+Ep+IBGeSZZv+B4eAgU+35/RGgw
	goiLRj4n4HhhgCla+pPB9bAlArByM8qwDCj2au1wNHinbS3fewIxvFck4UectzK2fPOyW7nc+Dgv/
	QKFVAcbsrjaZFLCXjVB61uujTfRGVzvVjTgOWc8B/ClbUywSPIHdB+FKkyORxamOtOnbCEbwFBROJ
	o7vKNryGNk0cjXna57ZwCCKK2KZ0nZUAPY1DP28O1igOqFJ8GKO3dbi8d1m1tLbfqYpg8g0slf7as
	hHr8T7caG8BfKY//+/FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mziX4-007fQr-FO; Tue, 21 Dec 2021 17:02:34 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mziVi-007eqr-CO
 for linux-mtd@lists.infradead.org; Tue, 21 Dec 2021 17:01:11 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 84F6D240017;
 Tue, 21 Dec 2021 17:01:07 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	<devicetree@vger.kernel.org>
Cc: Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v5 3/3] spi: dt-bindings: Add an example with two stacked
 flashes
Date: Tue, 21 Dec 2021 18:00:58 +0100
Message-Id: <20211221170058.18333-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211221170058.18333-1-miquel.raynal@bootlin.com>
References: <20211221170058.18333-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_090110_578361_7491DC70 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
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

Provide an example of how to describe two flashes in eg. stacked mode.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/spi/spi-controller.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-controller.yaml b/Documentation/devicetree/bindings/spi/spi-controller.yaml
index 36b72518f565..0f4d40218400 100644
--- a/Documentation/devicetree/bindings/spi/spi-controller.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-controller.yaml
@@ -139,4 +139,11 @@ examples:
             spi-max-frequency = <100000>;
             reg = <1>;
         };
+
+        flash@2 {
+          compatible = "jedec,spi-nor";
+          spi-max-frequency = <50000000>;
+          reg = <2>, <3>;
+          stacked-memories = /bits/ 64 <0x10000000 0x10000000>;
+        };
     };
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
