Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072ADC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jul 2022 19:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tVrPBd8ZgIQnn7syaYQTSoOqQR7vE+83kwy0idM4yQo=; b=zxhR4OqQo9u2f9
	JgE95+3uC2huLodYPNsQGDHOrBeBHpfRezMqVPht7bUKTFjVvBaVoYLN1zUP7tn5SdakLdgyZ9w1d
	wlU8yr3HQPnZ9bhlUwRqjkgsXt8AP8BChrWSsq4yM0OJbQ00m6F0CE7LIpOWbflrw6CEKpSUlN8I/
	E/PVkGIp67S8rDNy+u66BJlbzIrUg7kCaeEpWxZchXePIFvG68V4Npl4RBIZs0Ixa7N0ZsnyQvl9P
	2NISHec/C7lZ12/2BIX4xBZXuACYzHc3PWgXes/kgmnKAnZZnEBKVmRZFkR9yB58w0DpCKA4OnNVu
	oR4uOhbaO5mDTGiaDG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC4Nt-000Lpl-BM; Thu, 14 Jul 2022 19:20:25 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC4NX-000L9u-Na; Thu, 14 Jul 2022 19:20:05 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 2EAD91F986;
	Thu, 14 Jul 2022 19:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1657826398; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4IXIt9i4IIWMBr8dsDU+TZSGcKwpUFNYiCeI9reK8Fo=;
	b=ogcuG11BaEb+JOU64/DLbpgROHc29PvOwMkMSFEH8hy5UIsK9BC4cqqutMZKAfXGQ2z4LP
	qSEsQv9CuNeUmZ7y5YwBVvGA4WuJJUKfCsz4zm+SBeD0aNTKYbw5XJp6IPBjrWawJMqKEX
	QIPycGOXqiz9VCZE45SgE0f1ikUqMys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1657826398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4IXIt9i4IIWMBr8dsDU+TZSGcKwpUFNYiCeI9reK8Fo=;
	b=gbsPuTgJhHTRxWIuoej/HugirZJCurSMj40g+kYnzuvVo+0NexrRxKqgASXl/wBCVR5oJF
	be/0CDRYgEv7enDQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id CE1032C142;
	Thu, 14 Jul 2022 19:19:57 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: linux-sunxi@lists.linux.dev
Cc: Michal Suchanek <msuchanek@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH resend 2/2] ARM: dts: sunxi: Enable optional SPI flash on Orange Pi Zero board
Date: Thu, 14 Jul 2022 21:19:48 +0200
Message-Id: <62c4e6be12771f3120f67a328a51ac360dc468d2.1657826188.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
References: <701967b0c418db333c66b48d225df60aa9d03ead.1657826188.git.msuchanek@suse.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_122003_951261_15D40E24 
X-CRM114-Status: GOOD (  11.07  )
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

The flash is present on all new boards and users went out of their way
to add it on the old ones.

Enabling it makes a more reasonable default.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
Link: https://lore.kernel.org/all/20200929083025.2089-1-msuchanek@suse.de/
 arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
index 3706216ffb40..4f782b1bdf27 100644
--- a/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
+++ b/arch/arm/boot/dts/sun8i-h2-plus-orangepi-zero.dts
@@ -163,8 +163,8 @@ &ohci1 {
 };
 
 &spi0 {
-	/* Disable SPI NOR by default: it optional on Orange Pi Zero boards */
-	status = "disabled";
+	/* Enable optional SPI NOR by default */
+	status = "okay";
 
 	flash@0 {
 		#address-cells = <1>;
-- 
2.35.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
