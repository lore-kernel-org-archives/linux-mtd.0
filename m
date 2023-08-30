Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA6D8C83F01
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 15:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5E/qK1FtLnd1bGL5F4t2Fsj+0aFBu5iRIuIppuqNGXM=; b=IY+9HO1t/3vNyb
	NapyKPzLv0rhXQK50RxDhRkNpE8LGziJ9Qr6yXx1kpL2DQM1yCQqXfSOnvC0BEVq1dV/1JkIlfDRC
	yqiAjpLyFgtkHjJ/7Mpmo0FZuoAebKMLClI+URvm0tGavx8llNKVGQUJ54B/J8B+k4Bl4W6hKjvso
	TVXfsR7tlElWgPtqIz/t4BrfDIC2RGv0jDzE3OhCPgJ0NdOp15TsKQUShFP2VICZy2ffmr5WmgaF/
	nnBjSuTJZ77MCz2E09Mfi5A24Zxkukan5RPfBfCqOPGffhZZfKz75GDoJ8Q/S0dWxsLtns/BpjXCP
	itdFUHyqWjPeElc6xIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbMiy-00Dj8l-06;
	Wed, 30 Aug 2023 15:03:16 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbMiv-00Dj7R-0f
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 15:03:14 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
	by michel.telenet-ops.be with bizsmtp
	id fr352A00s3874jb06r35SN; Wed, 30 Aug 2023 17:03:08 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbMib-0023nS-HN;
	Wed, 30 Aug 2023 17:03:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbMin-005LpJ-Dx;
	Wed, 30 Aug 2023 17:03:05 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Ricardo Ribalda <ribalda@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: arm: realview: Fix development chip ROM compatible value
Date: Wed, 30 Aug 2023 17:03:04 +0200
Message-Id: <946079fe606d18b97578db42dd57a31acf38b26a.1693407641.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_080313_401336_CC9B7E98 
X-CRM114-Status: GOOD (  12.11  )
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

When the development chip ROM was added, the "direct-mapped" compatible
value was already obsolete.  In addition, the device node lacked the
accompanying "probe-type" property, causing the old physmap_of_core
driver to fall back to trying all available probe types.
Unfortunately this fallback was lost when the DT and pdata cases were
merged.

Fix this by using the modern "mtd-rom" compatible value instead.

Fixes: 5c3f5edbe0a1dff3 ("ARM: realview: add flash devices to the PB1176 DTS")
Fixes: 642b1e8dbed7bbbf ("mtd: maps: Merge physmap_of.c into physmap-core.c")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested due to lack of hardware.
---
 arch/arm/boot/dts/arm/arm-realview-pb1176.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
index efed325af88d206f..d99bac02232b3703 100644
--- a/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
+++ b/arch/arm/boot/dts/arm/arm-realview-pb1176.dts
@@ -451,7 +451,7 @@ pb1176_serial3: serial@1010f000 {
 
 		/* Direct-mapped development chip ROM */
 		pb1176_rom@10200000 {
-			compatible = "direct-mapped";
+			compatible = "mtd-rom";
 			reg = <0x10200000 0x4000>;
 			bank-width = <1>;
 		};
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
