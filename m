Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6319FC05027
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Feb 2023 15:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sE306vLcgqo80jbJPIXgChw6ogfLSsDpxxH+DIZcbr0=; b=b/El720PIzpZNO
	boxwpnDNCoUozlMF8gpwk44XLmj8pO3tuUl5iYUwdEP5L+RGK0hYQDel1kLWLt3TNwv4Pr9UScyFz
	nuelE9xItSFE+1I+BCCEHRc10u5G0AQfSpYfAMqAiS0IYYb7AOKmRJtEJeL5SCXRCE8yceUoTLREV
	JsFz3ZRSysQl45xwggCy0ek/9lwx5ex26QosshAneUpct9K/Qfz4LzwSvOFqLJ581fYczfZjJP4Ql
	AAYeYqEKWtC4QJaWbAdZhdTfuDhXjMCbX/SobPtReEv7BC0oCvnihQcHzsqYaMChJtR+YGc4QFKpe
	MCC1g/vrg/28Iy7vUWQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwq1-002NPc-Ox; Tue, 14 Feb 2023 15:03:21 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwGs-00296M-Vx
	for linux-mtd@lists.infradead.org; Tue, 14 Feb 2023 14:27:04 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:2521:459c:4528:7ba9])
	by albert.telenet-ops.be with bizsmtp
	id M2So2900B4e7GJY062Sola; Tue, 14 Feb 2023 15:26:52 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pRwGJ-0090hz-R9;
	Tue, 14 Feb 2023 15:26:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pRwGe-003wYY-KD;
	Tue, 14 Feb 2023 15:26:48 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Brown <broonie@kernel.org>
Cc: linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA support
Date: Tue, 14 Feb 2023 15:26:43 +0100
Message-Id: <afe470603028db9374930b0c57464b1f6d52bdd3.1676384304.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_062703_208732_9728E69F 
X-CRM114-Status: UNSURE (   7.32  )
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

SPI EEPROMs typically support both SPI Mode 0 (CPOL=CPHA=0) and Mode 3
(CPOL=CPHA=1).  However, using the latter is currently flagged as an
error by "make dtbs_check", e.g.:

    arch/arm/boot/dts/r8a7791-koelsch.dtb: flash@0: Unevaluated properties are not allowed ('spi-cpha', 'spi-cpol' were unexpected)
	    From schema: Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml

Fix this by documenting support for CPOL=CPHA=1.

Fixes: 233363aba72ac638 ("spi/panel: dt-bindings: drop CPHA and CPOL from common properties")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index f86255ce13af0871..bb62ac4585822982 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -76,6 +76,13 @@ properties:
       If "broken-flash-reset" is present then having this property does not
       make any difference.
 
+  spi-cpol: true
+  spi-cpha: true
+
+dependencies:
+  spi-cpol: [ spi-cpha ]
+  spi-cpha: [ spi-cpol ]
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
