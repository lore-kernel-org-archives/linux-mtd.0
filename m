Return-Path: <SRS0=kP5e=RE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EFAC43381
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 18:30:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CE592084F
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Mar 2019 18:30:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d/TC1cW4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="URExq/Md"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CE592084F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPO6QrAYQ+3VL/4sQj7fodndnnjX50wNEWAsS1rR78E=; b=d/TC1cW4OBkD+W
	ZvETdjjZ/xRbP2sDamprNKXCwMu1z2cTWDUhXlcELlXPZ1fwxXw+pAtLdpwcG4E6cTULzE2B2XAg3
	UatDRfIfGeZelUA9yODp+Hbzl/jBL5N1lLNXMhO2iQTOUM5wzyOCM/ZeB17atlY/SzdUE8QZ3wajl
	fWC7zinozqRrfYrZyA0qElzqznyIt4+Ol3/VrW9/Gv3QkfVUwHhFrDhy5BucoBY+5aPWw+QIGLIT2
	90mYoYVie73GXU1rJA2WVVoTavk9Nz2ihGfdr63UeDSp0EqXGRcdh+m268y4FYseu/YXcheorTCmZ
	RT0+OeRg3NVsbtZbVMTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gzmvK-0001CN-Br; Fri, 01 Mar 2019 18:30:18 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gzmup-0007wN-G7; Fri, 01 Mar 2019 18:29:49 +0000
Received: by mail-wm1-x341.google.com with SMTP id q187so13462992wme.5;
 Fri, 01 Mar 2019 10:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ncNcJQwDfiPhDXs8lF0Szc4vWY35aZvZb7KgVFzyX5I=;
 b=URExq/MdU1CtB9n0eev3RNX3Z8rgbn1RYMpZ2oI5fDT+J5pVKYLAhSyO4OX1jSj+7m
 6OIXVKnWOaax2masO02Kx3eNwMHCic6tZj++1PUutHSBfngBvr0gtl6DZM2X7JfW2FBV
 3sTzOcQ/bE64OGaGAjZvpa6H4zK9WUq/qVAvX3GE5fSU5OhLo9iKFwjhFbv1cKPt083q
 UZcq8NKgIZF9aPnYkyP7B1sdDZowrbirUcb+evU78pKhsByLxOYabGNXV6GCcLlHWDns
 8GXCvpAB3uGK8dSU2UH2zjTpNLO8jD0pyHn/vgydwrrOJ1FFAf2PojP1aHIpo4csPH5H
 GqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ncNcJQwDfiPhDXs8lF0Szc4vWY35aZvZb7KgVFzyX5I=;
 b=gZnuxKXR/0flNHdCID8GaCNNbIwTVgXQz19kTj5S0r9z5dKT/zCAJ0GJH8TOI/IVD1
 y2eAUfDjEPPDanQjTjWHIhU6hjw4GQfuvYfEByKxmyCc62BK92ADXD7bcDWVpL6VpERB
 REPS+4ay21XZ1Cb+gBCe4PCtKFqNNkFPcKzEMc38VzokOYYaxpV2Jf2jn7FDffNikYfX
 6vhqp6dYWxbpwfb6I0uKxaO8zuYtgzv1BBJAG0weLImHY26TBOvbg68pLy8kOdF0Lc8x
 0cRdRod9Ywqa2Z1eymZgpZc8uiHJaAwHuK+VHiqy1FJqLuE4u6/elNtK88XrdlBydVJf
 SyJg==
X-Gm-Message-State: AHQUAubn/zuyyawQghkDNae4ZTi0SbAE0oII8dII+2KdNT7elAgBvikh
 sDIk1XN5J+3xDjZ04hTfq4w=
X-Google-Smtp-Source: APXvYqyc6XRleJWg4NXBrYYv7pNcd/11bHNukuFm5PeHaiHZ58IoBn+q9XGMaaZaeGAuoA8TimxTTA==
X-Received: by 2002:a1c:f901:: with SMTP id x1mr4125319wmh.51.1551464985881;
 Fri, 01 Mar 2019 10:29:45 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD7109200428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d710:9200:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id l18sm21221367wrv.20.2019.03.01.10.29.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 01 Mar 2019 10:29:45 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: liang.yang@amlogic.com
Subject: [RFC PATCH nand-next 1/2] dt-bindings: nand: meson: add support for
 more SoCs
Date: Fri,  1 Mar 2019 19:29:21 +0100
Message-Id: <20190301182922.8309-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
References: <20190301182922.8309-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190301_102947_533324_388B7A03 
X-CRM114-Status: GOOD (  13.91  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jianxin.pan@amlogic.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Older Amlogic SoCs have a slightly different integration of the NFC
(NAND flash controller) than the new ones (GXL, GXM, AXG).

On GXL, AXG and newer the "NAND device clock" is shared with sd_emmc_c.
This requires muxing the signal of that clock between the sd_emmc_c
controller and the NAND controller. The "amlogic,mmc-syscon" property
exists for this purpose.

Older SoCs (Meson8, Meson8b, Meson8m2 and GXBB) have a dedicated "NAND
device clock". Thus we don't need to "amlogic,mmc-syscon" property for
muxing the clock on these older SoCs.

The clock implementation itself is also more advanced on newer SoCs
because the phase of the RX and TX clock can be controlled. Older SoCs
cannot change the phase of the "NAND device clock". Thus the "rx" and
"tx" clock-names are only required for the GXL, GXM and AXG SoCs.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/mtd/amlogic,meson-nand.txt | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
index 3983c11e062c..8766d4e82a74 100644
--- a/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/amlogic,meson-nand.txt
@@ -5,6 +5,9 @@ the MTD NAND bindings.
 
 Required properties:
 - compatible : contains one of:
+  - "amlogic,meson8-nfc"
+  - "amlogic,meson8b-nfc"
+  - "amlogic,meson-gxbb-nfc"
   - "amlogic,meson-gxl-nfc"
   - "amlogic,meson-axg-nfc"
 - clocks     :
@@ -13,12 +16,13 @@ Required properties:
 
 - clock-names: Should contain the following:
 	"core" - NFC module gate clock
-	"device" - device clock from eMMC sub clock controller
-	"rx" - rx clock phase
-	"tx" - tx clock phase
+	"device" - NAND device clock
+	"rx" - rx clock phase, only used on the GXL, GXM and AXG SoCs.
+	"tx" - tx clock phase, only used on the GXL, GXM and AXG SoCs.
 
-- amlogic,mmc-syscon	: Required for NAND clocks, it's shared with SD/eMMC
-				controller port C
+- amlogic,mmc-syscon	: Only used on the GXL, GXM and AXG SoCs.
+			  Required for NAND clocks, it's shared with SD/eMMC
+			  controller port C
 
 Optional children nodes:
 Children nodes represent the available nand chips.
-- 
2.21.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
