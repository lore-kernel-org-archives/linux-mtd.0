Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61475C433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Dec 2021 10:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4NgDIqRKEo2+dKCgIrbM4bKf0UXvniGNxS0ByjzjbY=; b=bHhPjGBCw2KaLZ
	nq6/wCvvb7uTpSH4tDS0isPxiAbAOMc85RHVN8MBEOSE2cqncvlZ0KSmCNCieIF3v3q5UqliayqZ2
	D83Vno6PHJ7TkyUhMeYoffG653JxQXlsLbXxxBPJPgC0DNp6H6OJGiQTwWdukkr1UtZO3XP0iWTrH
	K9jwUKVSHXyi4kiIpwGi1MQdVjSwckMnHjqicaNuCilUO0pfODRueNXr0howE0zKFBzlW06Cacz+6
	Ydnns0rFD8VEfV4RecC//iSFHWtml7SV7bL5AKgnaApl0JJajWKT13lZtWEaKRT7CPKWqQgHr5EyA
	0gL5SxB9shvV3wJhIUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muAmf-003Eej-3P; Mon, 06 Dec 2021 09:59:45 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muAmO-003EZh-V9
 for linux-mtd@lists.infradead.org; Mon, 06 Dec 2021 09:59:30 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7FF7324000B;
 Mon,  6 Dec 2021 09:59:25 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, Mark Brown <broonie@kernel.org>,
 <linux-spi@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 <devicetree@vger.kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: mtd: spi-nor: Allow two CS per device
Date: Mon,  6 Dec 2021 10:59:19 +0100
Message-Id: <20211206095921.33302-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211206095921.33302-1-miquel.raynal@bootlin.com>
References: <20211206095921.33302-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_015929_162529_6B773565 
X-CRM114-Status: GOOD (  12.87  )
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
