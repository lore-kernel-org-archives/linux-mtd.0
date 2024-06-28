Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87540C3064D
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2024 14:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZVBFX6HKxsXhz7yhvDwvIHe8rJSdXXnYnLSgY5jukGo=; b=QrlihWhmRCfgXF
	QM5UwhxP3p2iVRZ3BKCIrx+q2asCp/aPb2EDwkhmWb4Mhm7ksnQvdEVj/8U5IOa8zotRFIlNe9d5j
	ZJQCUIRTIaEhMoCjzgVqubA6ebmzNopYQYk0DDYxvmqG7BhMUfuanHh200d3J4HXGnDtPMW1Z1dsw
	9+vHTmo0/LzKOt4pdOXjzzeqwzCcvHOiRATG9SwXTtg8Dbr7fihJ2gUE2WhSdo/pTOW5pVFrE/evu
	2tJA6EeUKOfTwcNWaSagpxLbnX7T/ri9krCJIvqyE5VtefGnYaC1ScpHb8/cQ3eePQAtPOPyFmiGF
	uGQV+OZr+GRz6swqYDHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCDB-0000000Dv3L-0gTg;
	Fri, 28 Jun 2024 14:04:25 +0000
Received: from chessie.fmt1.pfcs.com ([66.220.13.234] helo=chessie.everett.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNCD7-0000000Dv0H-0I3D
	for linux-mtd@lists.infradead.org;
	Fri, 28 Jun 2024 14:04:22 +0000
Received: from localhost.localdomain (unknown [31.16.248.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by chessie.everett.org (Postfix) with ESMTPSA id 4W9ccV3YWKzMQLS;
	Fri, 28 Jun 2024 14:04:10 +0000 (UTC)
From: Erez Geva <erezgeva@nwtime.org>
To: linux-mtd@lists.infradead.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Erez Geva <ErezGeva2@gmail.com>
Subject: [PATCH 3/4] dt-bindings: mtd: macronix,mx25l12833f: add SPI-NOR chip
Date: Fri, 28 Jun 2024 16:03:27 +0200
Message-Id: <20240628140328.279792-4-erezgeva@nwtime.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240628140328.279792-1-erezgeva@nwtime.org>
References: <20240628140328.279792-1-erezgeva@nwtime.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_070421_221601_9718AF50 
X-CRM114-Status: UNSURE (   9.69  )
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

From: Erez Geva <ErezGeva2@gmail.com>

Add Macronix SPI-NOR mx25l12833f.

Signed-off-by: Erez Geva <ErezGeva2@gmail.com>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 6e3afb42926e..625a618a7992 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -22,7 +22,7 @@ properties:
               n25q(32b|064|128a11|128a13|256a|512a|164k)))|\
               atmel,at25df(321a|641|081a)|\
               everspin,mr25h(10|40|128|256)|\
-              (mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|\
+              (mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|12833f|25635e)|\
               (mxicy|macronix),mx25u(4033|4035)|\
               (spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|\
               (sst|microchip),sst25vf(016b|032b|040b)|\
-- 
2.39.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
