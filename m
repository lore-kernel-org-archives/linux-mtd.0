Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA1B6C6FA8F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 15:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x8SxUXT949DesAQo69WR5V7gw7sg42k7K2ajTEV26ys=; b=2Zi3cA0azqkeFb
	HMpEJybyFONKuuXt69TZKQRnvXNgRxNdzvB5hLCCTVHCZ1Pn3y9qQ8kjYXMppHJ9a+oiWpEK3mhHS
	moe6ROOgRVi5Nju6PVeN+rSLxzaqjCzEObJ/p+w6miDkuB4y57PL1DGPdYpAITnEo0kRYZ+92B1gV
	VBvWGExvIfgEne4etoSIlq4KdZRndk0gD9Sic8Q2Yw1zo3Zem2yL/+igepKwtA9ihLSCktKjSxaaE
	BISkVLEQhwDm1ptNqtAA+7JNcx+Vmz/T9OfQNkffOllH4xtToEsazcSZZi74JlaeFuFgLBROH29ef
	JcQ/mVVxGru3aUoOHFnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbMrT-00DjvI-1Z;
	Wed, 30 Aug 2023 15:12:03 +0000
Received: from michel.telenet-ops.be ([2a02:1800:110:4::f00:18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbMrQ-00Djuz-2J
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 15:12:01 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6c13:6b1b:7366:87c0])
	by michel.telenet-ops.be with bizsmtp
	id frBy2A0043874jb06rByNY; Wed, 30 Aug 2023 17:11:58 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbMrC-0023oY-5R;
	Wed, 30 Aug 2023 17:11:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qbMrO-005Lst-1O;
	Wed, 30 Aug 2023 17:11:58 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Cercueil <paul@crapouillou.net>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] mips: dts: ingenic: Remove unneeded probe-type properties
Date: Wed, 30 Aug 2023 17:11:55 +0200
Message-Id: <75d57f5e6dd25d5e8eff1260d289e905bb5cfad2.1693408196.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_081200_896190_6433FE7C 
X-CRM114-Status: UNSURE (   7.34  )
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

The "probe-type" property was only needed when used with the
(long obsolete) "direct-mapped" compatible value.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/mips/boot/dts/ingenic/jz4725b.dtsi | 1 -
 arch/mips/boot/dts/ingenic/jz4770.dtsi  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/mips/boot/dts/ingenic/jz4725b.dtsi b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
index acbbe8c4664c110e..c5c5a094c37d2e08 100644
--- a/arch/mips/boot/dts/ingenic/jz4725b.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4725b.dtsi
@@ -366,7 +366,6 @@ bch: ecc-controller@130d0000 {
 
 	rom: memory@1fc00000 {
 		compatible = "mtd-rom";
-		probe-type = "map_rom";
 		reg = <0x1fc00000 0x2000>;
 
 		bank-width = <4>;
diff --git a/arch/mips/boot/dts/ingenic/jz4770.dtsi b/arch/mips/boot/dts/ingenic/jz4770.dtsi
index 9c0099919db7aba9..504e895e916e57bf 100644
--- a/arch/mips/boot/dts/ingenic/jz4770.dtsi
+++ b/arch/mips/boot/dts/ingenic/jz4770.dtsi
@@ -461,7 +461,6 @@ usb_otg: usb@13440000 {
 
 	rom: memory@1fc00000 {
 		compatible = "mtd-rom";
-		probe-type = "map_rom";
 		reg = <0x1fc00000 0x2000>;
 
 		bank-width = <4>;
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
