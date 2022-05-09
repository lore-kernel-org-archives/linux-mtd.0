Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443FBC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  9 May 2022 12:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cVF0J2NIodazwsM5OiigbiLut4ksJYxYuFWYgRibJTE=; b=oJd/Dztmou8phb
	BGcUbD6YA0eWXZJSmCdFtiOrPWGfkc6GPtcIp74zdYrpsTZVsppei2Jc0CLfM0MFULMly5wHM8gAD
	HJBfa1BF4IZlls3+RAArSCADYXFriFTG8t5/6DpitUWhk3FxCWZtSfnNVNJkWLw+KRBY6jK564tja
	/WAIf0RJIQWRp1t8jPrTdDjdWOXH1TYdbAsa9a6eSn9VvViwRxnZqUuuuv1ofwh+8LW7yUxnweN5T
	pzwhaX0dk5At5J3bMy+A7ratcETy09u47fFEmBAgzFcI0BIZlS/vz1siPDtY1LBwbxHoY0YHgJw6G
	y71cBL1e+bo1NX9IdOjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no2Ui-00EN1a-PG; Mon, 09 May 2022 12:28:08 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no2Uf-00EMxs-Ev
 for linux-mtd@lists.infradead.org; Mon, 09 May 2022 12:28:07 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:8886:2b92:63eb:2922])
 by albert.telenet-ops.be with bizsmtp
 id UcTv270070moLbn06cTv0Z; Mon, 09 May 2022 14:27:58 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1no2UU-003XSj-Ik; Mon, 09 May 2022 14:27:54 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1no2UU-003Ba7-0r; Mon, 09 May 2022 14:27:54 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Bastian Hecht <hechtb@googlemail.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] dt-bindings: mtd: Remove Renesas FLCTL NAND controller
 support
Date: Mon,  9 May 2022 14:27:52 +0200
Message-Id: <ef70e24a57d2342458fe11b7b13775ffac1f1bd0.1652098726.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_052805_683405_18F0F1B3 
X-CRM114-Status: GOOD (  14.06  )
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

The DT bindings for the Renesas FLCTL NAND controller document only support a
single SoC, namely the Renesas R-Mobile AP4 (SH7372).
Linux dropped support for this SoC in commit 59b89af1d5551c12 ("ARM:
shmobile: sh7372: Remove Legacy C SoC code") in v4.1.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The FLCTL NAND controller (or an enhanced version) is also present on
SH-Mobile AG5 (sh73a0) and R-Mobile A1 (r8a7740), but the sole boards
supported upstream (KMC KZM-A9-GT resp. Atmark Techno Armadillo-800-EVA)
use eMMC NAND instead of raw NAND FLASH.

What's the policy w.r.t. stale DT bindings?
Should it be converted to json-schema instead?
drivers/mtd/nand/raw/sh_flctl.c still implements these bindings.
The driver cannot be removed, as it is also used on the non-DT
SH7723-based AP-325RXA platform.
---
 .../devicetree/bindings/mtd/flctl-nand.txt    | 49 -------------------
 1 file changed, 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/flctl-nand.txt

diff --git a/Documentation/devicetree/bindings/mtd/flctl-nand.txt b/Documentation/devicetree/bindings/mtd/flctl-nand.txt
deleted file mode 100644
index 427f46dc60add134..0000000000000000
--- a/Documentation/devicetree/bindings/mtd/flctl-nand.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-FLCTL NAND controller
-
-Required properties:
-- compatible : "renesas,shmobile-flctl-sh7372"
-- reg : Address range of the FLCTL
-- interrupts : flste IRQ number
-- nand-bus-width : bus width to NAND chip
-
-Optional properties:
-- dmas: DMA specifier(s)
-- dma-names: name for each DMA specifier. Valid names are
-	     "data_tx", "data_rx", "ecc_tx", "ecc_rx"
-
-The DMA fields are not used yet in the driver but are listed here for
-completing the bindings.
-
-The device tree may optionally contain sub-nodes describing partitions of the
-address space. See partition.txt for more detail.
-
-Example:
-
-	flctl@e6a30000 {
-		#address-cells = <1>;
-		#size-cells = <1>;
-		compatible = "renesas,shmobile-flctl-sh7372";
-		reg = <0xe6a30000 0x100>;
-		interrupts = <0x0d80>;
-
-		nand-bus-width = <16>;
-
-		dmas = <&dmac 1 /* data_tx */
-			&dmac 2;> /* data_rx */
-		dma-names = "data_tx", "data_rx";
-
-		system@0 {
-			label = "system";
-			reg = <0x0 0x8000000>;
-		};
-
-		userdata@8000000 {
-			label = "userdata";
-			reg = <0x8000000 0x10000000>;
-		};
-
-		cache@18000000 {
-			label = "cache";
-			reg = <0x18000000 0x8000000>;
-		};
-	};
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
