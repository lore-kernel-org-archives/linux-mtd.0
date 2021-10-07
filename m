Return-Path: <SRS0=3zw0=O3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15758C433F5
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 12:12:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF3E561058
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Oct 2021 12:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF3E561058
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3XvRRwt9OLXjnr5ySosKEItWku8sNRzSPPFKKO7AzM=; b=vJgvqYziXpsEH+
	y9MGGxFmeyK5omV+IJmM2kTVRAGYPOd9sEo3P1tpQkQjyxTSBDiF9h2+/CudfbyN4N7Hwq9SuW2DV
	r1QTJYp7Azs8RE7QNYvj4YR2/YoXR+CoiuSjFMMCbqNbBYPs4KwyDsPmUxWlXLnq5s2zp+kqhTL5m
	SjCas0aydE0WTj1EO6dt/85FCdi5fHWALwZLc7mgiBLmF0/J5hJSL9i24cXgiXXxULEhGTOzz9tAy
	FRlH9B6XyBBvpSUxfhBnW5Xujf+BpE/Txj/wckCR/TFts7piFcb81drujs6paZrqaFXUYqPO4D0C3
	sBaxuV+vv4h6rHzZ6pKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYSFV-00HCu2-S4; Thu, 07 Oct 2021 12:11:46 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYSCm-00HBrc-ED
 for linux-mtd@lists.infradead.org; Thu, 07 Oct 2021 12:08:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B305F61251;
 Thu,  7 Oct 2021 12:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633608536;
 bh=3+cLcaMOC8CpQ4MJQGuyQwQiXVuVoqjfIy0pWhuayzc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dxPodFD7BiDjUdlu32qc5MSFmO1PnjHT1jGhDne2NFGTXLbfOuHJb+pVi57xFq6a7
 izpC/TffdJjefh4NDbhIXeTzsRKquXMPaodDCX7rEiszZDVS9IHhgOgYam60EK33QP
 W6SekICiAak+HGe8cK04+azAnfNe2HYzKBmDlcS/BH+R5mbESP7nUYgBkJxhj5ADfn
 tHhygTKqaE9SN68d0mr52rErXEW5ylh3g84/Zbo1ZeteON3wEMCsWpamWrFvlfJgLg
 5JWhiRLQzYosmTf4KQssbbuzlqUhBEosJFjod8X13RnFg1e/+Za9PAVs/vohnXcU3I
 FLxdXc8K4bE0Q==
From: Roger Quadros <rogerq@kernel.org>
To: tony@atomide.com
Cc: robh+dt@kernel.org, grygorii.strashko@ti.com, nm@ti.com,
 lokeshvutla@ti.com, nsekhar@ti.com, krzysztof.kozlowski@canonical.com,
 miquel.raynal@bootlin.com, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>
Subject: [PATCH v5 7/8] ARM: dts: omap: Fix boolean properties gpmc,
 cycle2cycle-{same|diff}csen
Date: Thu,  7 Oct 2021 15:08:29 +0300
Message-Id: <20211007120830.17221-8-rogerq@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211007120830.17221-1-rogerq@kernel.org>
References: <20211007120830.17221-1-rogerq@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_050856_527967_DF49533A 
X-CRM114-Status: UNSURE (   7.62  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

gpmc,cycle2cycle-{same|diff}csen are boolean properties. Fix them
to prevent dtbs_check errors.

Signed-off-by: Roger Quadros <rogerq@kernel.org>
---
 arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi      | 4 ++--
 arch/arm/boot/dts/omap-zoom-common.dtsi        | 4 ++--
 arch/arm/boot/dts/omap2430-sdp.dts             | 4 ++--
 arch/arm/boot/dts/omap3-devkit8000-common.dtsi | 4 ++--
 arch/arm/boot/dts/omap3-sb-t35.dtsi            | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi b/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
index ded7e8fec9eb..ce6c235f68ec 100644
--- a/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
+++ b/arch/arm/boot/dts/omap-gpmc-smsc911x.dtsi
@@ -25,8 +25,8 @@
 		compatible = "smsc,lan9221", "smsc,lan9115";
 		bank-width = <2>;
 		gpmc,device-width = <1>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 		gpmc,cs-on-ns = <5>;
 		gpmc,cs-rd-off-ns = <150>;
 		gpmc,cs-wr-off-ns = <150>;
diff --git a/arch/arm/boot/dts/omap-zoom-common.dtsi b/arch/arm/boot/dts/omap-zoom-common.dtsi
index d4ad9e58b199..1e96c865d41d 100644
--- a/arch/arm/boot/dts/omap-zoom-common.dtsi
+++ b/arch/arm/boot/dts/omap-zoom-common.dtsi
@@ -27,8 +27,8 @@
 		gpmc,mux-add-data = <0>;
 		gpmc,device-width = <1>;
 		gpmc,wait-pin = <1>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 		gpmc,cs-on-ns = <5>;
 		gpmc,cs-rd-off-ns = <155>;
 		gpmc,cs-wr-off-ns = <155>;
diff --git a/arch/arm/boot/dts/omap2430-sdp.dts b/arch/arm/boot/dts/omap2430-sdp.dts
index 7d27e907533f..207070677e3a 100644
--- a/arch/arm/boot/dts/omap2430-sdp.dts
+++ b/arch/arm/boot/dts/omap2430-sdp.dts
@@ -43,8 +43,8 @@
 		gpmc,sync-clk-ps = <0>;
 		gpmc,mux-add-data = <2>;
 		gpmc,device-width = <1>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 		gpmc,cs-on-ns = <6>;
 		gpmc,cs-rd-off-ns = <187>;
 		gpmc,cs-wr-off-ns = <187>;
diff --git a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
index 2c19d6e255bd..5e55198e4576 100644
--- a/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
+++ b/arch/arm/boot/dts/omap3-devkit8000-common.dtsi
@@ -267,8 +267,8 @@
 		gpmc,mux-add-data = <0>;
 		gpmc,device-width = <1>;
 		gpmc,wait-pin = <0>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 
 		gpmc,cs-on-ns = <6>;
 		gpmc,cs-rd-off-ns = <180>;
diff --git a/arch/arm/boot/dts/omap3-sb-t35.dtsi b/arch/arm/boot/dts/omap3-sb-t35.dtsi
index fb9842fa922c..5ec0893415e0 100644
--- a/arch/arm/boot/dts/omap3-sb-t35.dtsi
+++ b/arch/arm/boot/dts/omap3-sb-t35.dtsi
@@ -108,8 +108,8 @@
 		reg = <4 0 0xff>;
 		bank-width = <2>;
 		gpmc,device-width = <1>;
-		gpmc,cycle2cycle-samecsen = <1>;
-		gpmc,cycle2cycle-diffcsen = <1>;
+		gpmc,cycle2cycle-samecsen;
+		gpmc,cycle2cycle-diffcsen;
 		gpmc,cs-on-ns = <5>;
 		gpmc,cs-rd-off-ns = <150>;
 		gpmc,cs-wr-off-ns = <150>;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
