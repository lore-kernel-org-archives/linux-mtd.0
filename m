Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3602FC2BA4C
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 11:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/pDJ1zGMDW78+os+vTrBsWp0js/2OqVMEfXL9JmXP5Y=; b=Kzhy6pIj+PZpOY
	zyjWh3dUHX3RbXHpnTcZpFjkdBrk2hQnDkt0Gqf+AHwgW9/bY7+3qQr0P8R5Nrsl0xKh5zQkrHPFT
	zCAFDrxX9sCeBqyxBZACHtS0ISz8s060RfiMDRUjIkDZu/Mv01cFXi1Z7hrmsqXxy8S8ITeQ4xjB5
	EMiVg1xSearMc9dICqLYGfxscCGbb1gCkzMr67q7vo4V36VFpEqSNYbc6HD6zQN0m9tLlvquEIQGH
	MSj267k1VSIw6ZI5JJrQmtqo6S0Bb5R6yLmQz8q9/gl0jPUYNS3Zd/u9y8Gd+B4FQ9pFFcU2oUJDJ
	vlma9WIPRtMqcU1qXU3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgVY-00BULV-GA; Wed, 26 Jan 2022 11:30:36 +0000
Received: from relay3-d.mail.gandi.net ([2001:4b98:dc4:8::223])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCgRK-00BTKJ-1I
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 11:26:15 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id ACC126000D;
 Wed, 26 Jan 2022 11:26:10 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/3] dt-bindings: mtd: spi-nor: Allow two CS per device
Date: Wed, 26 Jan 2022 12:26:05 +0100
Message-Id: <20220126112608.955728-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220126112608.955728-1-miquel.raynal@bootlin.com>
References: <20220126112608.955728-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_032614_283337_73B0B1C6 
X-CRM114-Status: GOOD (  13.55  )
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

The Xilinx QSPI controller has two advanced modes which allow the
controller to behave differently and consider two flashes as one single
storage.

One of these two modes is quite complex to support from a binding point
of view and is the dual parallel memories. In this mode, each byte of
data is stored in both devices: the even bits in one, the odd bits in
the other. The split is automatically handled by the QSPI controller and
is transparent for the user.

The other mode is simpler to support, it is called dual stacked
memories. The controller shares the same SPI bus but each of the devices
contain half of the data. Once in this mode, the controller does not
follow CS requests but instead internally wires the two CS levels with
the value of the most significant address bit.

Supporting these two modes will involve core changes which include the
possibility of providing two CS for a single SPI device

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 39421f7233e4..4abfb4cfc157 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -47,7 +47,8 @@ properties:
       identified by the JEDEC READ ID opcode (0x9F).
 
   reg:
-    maxItems: 1
+    minItems: 1
+    maxItems: 2
 
   spi-max-frequency: true
   spi-rx-bus-width: true
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
