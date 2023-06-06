Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C23C7EE2C
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 17:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hZcI0lZmQv/vrZkca2Hh6r4wsyQf8JQWsAfWsmdb9pw=; b=wi/lWJPsDLS6KH
	VDMSyXLZU/TFYjMyD2s8KSHwWZAmnXB4XAovXP1zKdUJYB1aG2pg1qyC2tIb4zAvknhoDWcG8+ml7
	FRDaApRToX5WMWGWdtsqpO6WwDnbeI+uMlbjLqMXCKjkbn7iNOqn4/VP0t8X/02gAZ83NvSVj7ZAc
	C1JmWYmPpDAS6DHFjr/Wa4o4LkDHhql8PDIaH7KyMcDYFZfb2Y7WU5uzb1X1xDS6rmwqHQXAvIRI4
	YiyiBWx70Kgpj2JJSEWc6IFx75tXIrGaRgU0ehtwedxGUryRflGjIDvpLlW+dUa3w0+V0XPPj54XI
	eoV6ioUH92i2RQ/uhVMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arh-002ee8-24;
	Tue, 06 Jun 2023 17:53:05 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6are-002ebq-0E
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 17:53:03 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686073979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XYEflyWrdQq7NnR+M3do34DTSoIu1SU7PFnCb6APN3o=;
	b=YmSl4dZqtuAUM2FexUD4hQNtKoD4d24ft/sxcxfOQCxOS9yWss8aLsPza/74R3tLbZe+Rm
	5Npuzt9hJEj13E/j7AOBz1TPERITzrLERIh9zjabP0f84oTdAXWMBuhfcWRj4/6RowTpOM
	6qdgabXtxMo0XMg5ZlFjjYSorG2LpFuN8JHRniitz2pFU3kd1KA4ZsPBvq4R+REl7oik2R
	/mJ2OGwYRbkBDIk0OUjWB70Zh78PlsAMSEPC17QPiAbW5bGlp2YYb/4Z0C/LRFrq/S7Ul7
	zMFtgXhaRh71IkWRDzMYnkwYCtnf5H9Rk9+h4Mv49dY7bYbLIx2aPH9KFsTxJA==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6366E1C000B;
	Tue,  6 Jun 2023 17:52:58 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 03/17] dt-bindings: mtd: Mark nand-ecc-placement deprecated
Date: Tue,  6 Jun 2023 19:52:32 +0200
Message-Id: <20230606175246.190465-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_105302_260674_23ACA99B 
X-CRM114-Status: UNSURE (   8.73  )
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

The nand-ecc-placement property has been deprecated for a long time
already, it does not really mean something useful for the ECC engines
and is anyway in the vast majority of cases totally useless. Just mark
it deprecated to avoid appealing people to use it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
index 81b77ee6fb88..0b220e99450d 100644
--- a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
@@ -39,6 +39,7 @@ properties:
       bytes will be interleaved with regular data in the main area.
     $ref: /schemas/types.yaml#/definitions/string
     enum: [ oob, interleaved ]
+    deprecated: true
 
   nand-bus-width:
     description:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
