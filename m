Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4A9C0015E
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DD74TJxN3epN7YUs8CoftDF8THfsCbmY9JEb/z66nBY=; b=3pGP9vg8xefw6C
	Poo7QgiBMNNHReDi0ughc6c2wvZ6kZKl4p5abS8FoDNIog5saQEhZa+yvhuGotu0aujuEDvdGF1c6
	IOkLMRXrUTvefXVRMbzVVcy8p6w7RxaoNqufFCi/wIAZb7+bzwfwf/PPSqMI64noRXP5gscv2qQgM
	BPa3TPOTjzMSmbPzSG2J1U1R8ansBzfqdu5I3ePASaZiaVsE0K3H9es5DFOdOvq5fKtDKtYob/MfX
	14JIY3ZxA4JJLzINqjz88Z5EvCQDP6Qq/OktUYYmqITzKF7dnf8Mar1Ct7jPp8CkdPzAx8R3ZRWqN
	0tBr2lMa4piCjJQvaVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCV-0080Sr-0h;
	Mon, 19 Jun 2023 09:29:31 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCR-0080Pq-35
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:29 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gBTcCZaAvZqmTZ9xZNZW5ygOpX3IIBILCLO63d3iJ9E=;
	b=eWEjPK2a/xekHlJtMX/qHoKNYq7m/0WbCvojPrz+zc2wuhQ2ThOyLrJrgtci7SMjDgLk0G
	lo/eg1AE+km7d63oXZrQ/QxkZxy/TLoFjYJoDo//BDsrICG3/J2KeA+PJZgHcajM0pXjaz
	c1DmyVCUSmlIqfg/EDWFtmrXaGS2JKRO3zwDuNMXhIm5n0taDaSvIISpCHLZ0zASMw0D/B
	6AQbMSMCf5A4zwzDp1Hw6uQrI0HUqEao25dmRl11ceSM+LumJfXJGmt/16hMFLHal6Zcm0
	PQj2RhIAi0FIwoG9iPioHJwK+UB6RTkFjRP1ZRrKVTo519IcNRfEr6GcPXny1Q==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 28CCF1BF203;
	Mon, 19 Jun 2023 09:29:25 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/17] dt-bindings: mtd: Mark nand-ecc-placement deprecated
Date: Mon, 19 Jun 2023 11:29:02 +0200
Message-Id: <20230619092916.3028470-4-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022928_159131_3118A74E 
X-CRM114-Status: UNSURE (   8.99  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml b/Documentation/devicetree/bindings/mtd/raw-nand-chip.yaml
index 2caa6a9a73d3..a0488bf60971 100644
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
