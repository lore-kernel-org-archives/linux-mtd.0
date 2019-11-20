Return-Path: <SRS0=AqdO=ZM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60042C432C0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2019 18:22:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 336D6208C0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Nov 2019 18:22:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rwEm7MKT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnQMCFO2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 336D6208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JQ3w1TVakyZQBHbWp9nXEcsDCgl5/b2T10JJ6SO3ElU=; b=rwEm7MKTGOVBKeotaef8GaFHfc
	QEm0zGGJjxeslKu3c33KLkM059A3H7LlMcagiBloGjjEL5F3tF+uksgqTfXlvclSWvQUcD0Z5x4yd
	0N0eUBHdlNT3ZlRQ2oST9zcN98mw4sQGMOdICZGal9Huxz4rh+sMpvHJHGzSLNY673VzSWp5HK7aY
	QrhNogX7zPIWV400R27g0bwbw+p+uUvhAhp3WPOLvA9mfBOTlNQDbbV6XAC+hVyBSMMccWhIcLrdX
	GF4e70SUXDx/z6Z2QImsHi9z6xFwDAE/jsFsfQfcDd5ytlqSZfda/83qBrGa4mVARp5zEy7cUt7Ko
	hcYYpZ0A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXUcW-0008OE-NK; Wed, 20 Nov 2019 18:22:28 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXUcT-0008Ln-5K
 for linux-mtd@lists.infradead.org; Wed, 20 Nov 2019 18:22:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id b17so728630wmj.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 Nov 2019 10:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kzLVnx6I7dFbl8GGlRwfZsz6Y4gNG6PLh1f7Jaid6/Y=;
 b=SnQMCFO2/IL49vHRpz/dxgzfpuTcw0d7WNJIwKN4npFfzvpk0VPBHK4Zf0SU/XPdbt
 qRujFXrwp6jpgk7vfBrfU8itNyC560k0+bL+fyT1iqB2sdffaoOhJnvo87yPoom5ApuT
 dd9C4Wi3sM0O84RU/fRcz1bX+Czns1B4cmfQARrAe8GRDbtHN3qR4hjxS04mplQlKj2c
 gnvuUgSxfAQ+X2XqInwDpV9/BWNpgpA98dUcE9Q1MIHxtN3z+1Gwy9xujCLR80GLDw1F
 lOuFwVTORdFFvCuO0iCZnC/1lmR14/X/KlUb8Ptby3T2LURrTATJYRg+GAQEuBHm5i9P
 rsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kzLVnx6I7dFbl8GGlRwfZsz6Y4gNG6PLh1f7Jaid6/Y=;
 b=bakKQsU6sJ77b2iP4lOjYbsrcxm+dw0HHqHc9woehODfmQHPKiFMUoyPSoljNZFh9A
 y21d3vMc7mzN3bxDmw4ybn+Lp+CC8YseceH/V/iQXHdrgtgXgucVqC8njiUKMKgErP8M
 jAXW/uIQtkOywUPFSCb77InW1VTugZ3qQmn8xV07B/If/9gXtJRdO6AYHkR2pfacH44z
 MwjjAdRd380KMoFK9XzaBA2hXLEoLcF7xt2Klwci+eyLeFxj3SHYwoWFtADiX6oJWX/S
 t6UHK58zJo0SEL2M9wC1xYbCjZaxKJixhw/Gwafj3zr1K1xUZ/Vz2y/aNVMMOyeqgN5w
 gaFg==
X-Gm-Message-State: APjAAAXCr/l6nnP9p19iyyV/VRJMhYwGBoMpOYaKnBW7gLtkdyX8sU3Y
 dBASzqTgkqtGgzyyXxBsJM+kmKzc
X-Google-Smtp-Source: APXvYqz3eG2xTl37gXsceUkNr8q+XgQZyURIW79GwEq+1+sKKxqalz7YBLE14Ldh+mq/AyQqighQrA==
X-Received: by 2002:a1c:6146:: with SMTP id v67mr5078168wmb.102.1574274143317; 
 Wed, 20 Nov 2019 10:22:23 -0800 (PST)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id x205sm151153wmb.5.2019.11.20.10.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2019 10:22:22 -0800 (PST)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/3] arch: mips: brcm: Add 7425 flash-edu support
Date: Wed, 20 Nov 2019 13:20:58 -0500
Message-Id: <20191120182153.29732-2-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120182153.29732-1-kdasu.kdev@gmail.com>
References: <20191120182153.29732-1-kdasu.kdev@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_102225_200261_61A44D74 
X-CRM114-Status: GOOD (  11.00  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Florian Fainelli <f.fainelli@gmail.com>, Paul Burton <paulburton@kernel.org>,
 Kamal Dasu <kdasu.kdev@gmail.com>, James Hogan <jhogan@kernel.org>,
 Kevin Cernekee <cernekee@gmail.com>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-mips@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, bcm-kernel-feedback-list@broadcom.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Nand controller v5.0 and v6.0 have nand edu blocks that enable
dma nand flash transfers. This allows for faster read and write
access.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm7425.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm7425.dtsi b/arch/mips/boot/dts/brcm/bcm7425.dtsi
index 410e61ebaf9e..aa0b2d39c902 100644
--- a/arch/mips/boot/dts/brcm/bcm7425.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm7425.dtsi
@@ -403,8 +403,8 @@
 			compatible = "brcm,brcmnand-v5.0", "brcm,brcmnand";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg-names = "nand";
-			reg = <0x41b800 0x400>;
+			reg-names = "nand", "flash-edu";
+			reg = <0x41b800 0x400>, <0x41bc00 0x24>;
 			interrupt-parent = <&hif_l2_intc>;
 			interrupts = <24>;
 			status = "disabled";
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
