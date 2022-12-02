Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30345C4321E
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Dec 2022 13:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/GpsP8g93SvyFNm65QOoWhooOmspTPB3FJi3BzTsVAE=; b=BL0pUw8XEgbVbM
	ATi8bS/r0XbGxW9A+ocMm1+NUNAfpKzXi+HXvnci8ZBCZPOXL4UgEyog1ToOxjwpGU3/mMdZ5TZRy
	RmE4sQ4hokkeNyFNY+kxq81sRuQysunQ8EAo3WF5/GTosyxi+MkD3ePRkybsOpAJqqEvNJP6btL1y
	iJPrZxAP22i2rEFVUyaWOlj0RwqiAaJgmFqZRd0g0nwmJSJXvLJtkRda2VP5iVsD9G+prRzEbBNPA
	7xPgyRoDzpdAHjygYyugadi51Wzlb7DD97LNpqVpGMdDIe2K5A4ZwwtP/o7ev1Z6xn9baMZKpR9YK
	3AZl/AcDdHTvqgoVOG2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16F4-00Geq7-M7; Fri, 02 Dec 2022 13:38:14 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16F1-00GeLb-AG
	for linux-mtd@lists.infradead.org; Fri, 02 Dec 2022 13:38:12 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2d07:19c5:4d8b:89d9])
	by laurent.telenet-ops.be with bizsmtp
	id rRe1280020ys3B701Re1nn; Fri, 02 Dec 2022 14:38:03 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1p16Eq-002J3A-FC; Fri, 02 Dec 2022 14:38:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
	(envelope-from <geert@linux-m68k.org>)
	id 1p16Ep-005wSu-Ma; Fri, 02 Dec 2022 14:37:59 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document support for more MT25QU parts
Date: Fri,  2 Dec 2022 14:37:58 +0100
Message-Id: <363186079b4269891073f620e3e2353cf7d2559a.1669988238.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_053811_536705_25472C8A 
X-CRM114-Status: UNSURE (   9.78  )
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

Document support for the Micron MT25QU256A and MT25QU512A Serial NOR
FLASHes.

Merge the new entries with the existing entry for MT25QU02G.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
mt25qu512a is already in active use, causing "make dtbs_check" errors.
mt25qu256a is supported by the Linux spi-nor driver, but there are no
upstream users yet.
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 6cc491083650a0f9..92f65f682059a6ea 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - pattern: "^((((micron|spansion|st),)?\
               (m25p(40|80|16|32|64|128)|\
+              mt25qu(02g|256a|512a)|\
               n25q(32b|064|128a11|128a13|256a|512a|164k)))|\
               atmel,at25df(321a|641|081a)|\
               everspin,mr25h(10|40|128|256)|\
@@ -34,7 +35,6 @@ properties:
       - items:
           - enum:
               - issi,is25lp016d
-              - micron,mt25qu02g
               - mxicy,mx25r1635f
               - mxicy,mx25u6435f
               - mxicy,mx25v8035f
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
