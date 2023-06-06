Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A303C77B73
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 10:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y600kGPZHmO5BoW+Ql3KSNc30SeZ/nbfibgM17+f3yQ=; b=XaQp0ZQ8dxmZRB
	CUOAagXZe+qcBRh9yl+NJ22nYKe96DR7GiEOQ2DE3dWu+6ieAcSEIAfj4oK5Snba3eHacGygcjckm
	wlsW1qTasM2rCgbcuYwm41OBsq0ZHieImvZblnl5ghZuw+MZsVkPhqzS5u73QtFYO7ISCa4gwXSqU
	v9FbGlGxYKjdKi0wlZ185QQzwMIo5elB2tB8eACWM4ScQIHVWZy0CaZyyAt3i1wSvkoT7WnF1XmMK
	1dc48dCVwcCETlgHxiDTKlPHNrcUecuMXM4/LMrcxb398u8z7muunJR3RyaGUD6OjtgKRhQ074dp4
	G338u/1D1GCDPbwYlJBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ty3-001BXu-31;
	Tue, 06 Jun 2023 10:31:11 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ty0-001BUb-2e
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 10:31:10 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686047467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/XqwqUEqxTRlwuqyScbemHhCwtlpbBoBEzWo4M8PRqg=;
	b=eVRsuvQOID4SslV5pOtJFf6FwsVvh+pzjF7/1v7gtPn1HGM/Wog5CPSFVjvLr0CE1b25uq
	ayetjfpNHYQsVCFo7fwCIgJXBnEARxK6z/H1bDk0vZRV8edsniTtmC3dHkemDaqBm2EyEt
	HgwCl8LhvV0GQH8gGCOKYwZqk6eYB5dCYp9R3lE7PV/+IZ1b5BCnmSM0IhlDODDkC3mX+Q
	BLNEni6DUPO+DuBSTpoLl+k6uD9xOjNfBL20ha3k/j1pnTO5w+77sywQZQA5CQe9QuDydi
	Q8KfT4XSAYYFT9N85WpgY/gSBrlKhLdSCPOwB7ijcA24BJqveIgJYnLuhn2Umg==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5FE2DFF814;
	Tue,  6 Jun 2023 10:31:05 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/3] dt-bindings: mtd: ingenic: Prevent NAND chip unevaluated properties
Date: Tue,  6 Jun 2023 12:30:57 +0200
Message-Id: <20230606103057.137711-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606103057.137711-1-miquel.raynal@bootlin.com>
References: <20230606103057.137711-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_033108_991333_509E658D 
X-CRM114-Status: UNSURE (   8.82  )
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

List all the possible properties in the NAND chip as per the example and
set unevaluatedProperties to false in the NAND chip section.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/ingenic,nand.yaml         | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
index a7bdb5d3675c..facb44ebcaa6 100644
--- a/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ingenic,nand.yaml
@@ -40,6 +40,8 @@ patternProperties:
   "^nand@[a-f0-9]$":
     type: object
     properties:
+      reg: true
+
       rb-gpios:
         description: GPIO specifier for the busy pin.
         maxItems: 1
@@ -48,6 +50,15 @@ patternProperties:
         description: GPIO specifier for the write-protect pin.
         maxItems: 1
 
+      nand-ecc-step-size: true
+      nand-ecc-strength: true
+      nand-ecc-mode: true
+      nand-on-flash-bbt: true
+
+      partitions: true
+
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
