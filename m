Return-Path: <SRS0=3Hr+=C5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CDFBC43466
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 09:59:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D34920866
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2020 09:59:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zhC3WwaF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvksojqI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D34920866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7G5Y77UnoMk7fvQOakXRyhHYfErD+U+Vx5HQVBTNuq8=; b=zhC3WwaFzjiqGRRUoxt6K1X9c
	18jAHl0OvBe/nA4oyQO0b/ssoMamWtdrlV0usgNwTq5UeoIZ3Dw+s8qIk13cauK+2gJF6ae+hTEzd
	f5tzwqB0uufo3DcZBHJ+ZRZlvY6n/tQ0yY3bfnS22qsmi7BnowHLRnBcMD1BaIzC0kIJUOOitdfl2
	oqQFZQ1ktNNnIYMTCSzUbcLYMu15+XKF1OFBKXmHp4sfFc+WuLZ7QcKAgEuVbVs9fTrIAInXfrY4L
	R0JZ2pkwiqSF6AK/oWKnvZjXghpm4MxOj9kC/eBOVYRwVzACJao1R5LR/WFFcM8f+RQe/+wmW6GZ+
	AG0ljVr3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJw6e-0006sd-2F; Sun, 20 Sep 2020 09:58:04 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJw6b-0006rS-FG
 for linux-mtd@lists.infradead.org; Sun, 20 Sep 2020 09:58:02 +0000
Received: by mail-qk1-x741.google.com with SMTP id f142so11852453qke.13
 for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2020 02:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7qdhkRouPUBlhhUeuoTWCcVW3x0+uiY3ffJ1oCMZQUk=;
 b=PvksojqItdBGtMhfwgKVJlnT43Rh3sUoLBTo2Iu8ZudwahRjKwVfIa2w3ob8pTa587
 MwqTSxoHQGn17cO0HvQau/Az/czSlT8qzP/HdiabGHVsR89on1ljbFc3xxliPEtfJNlm
 iCIJG4gGaUnNLLBSXAJ7jeklc6N4f8m6Nf4LVoj0ikbId4Ul32cFhOBAsmdc/lTwP/JM
 g+tMG4TklMRz/m8LSzok7C3UksAmaq8Vca/WrOzJe703DgdPFeI4+6sO+732rk8SWvLD
 qHOVsyi1aPzt08ZPEZPCh2g4hK9mDxUmvXG3NF/jNoDFB3Th6PUwfHog9Ija68/O1iQO
 1S7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7qdhkRouPUBlhhUeuoTWCcVW3x0+uiY3ffJ1oCMZQUk=;
 b=A9R2Cn1PBvFdFjCMeHtObh8vyl8QMhAYTfxKdMWWxtb4uhHH/YNY6ASyo1pyq84ani
 ES39gk9riRTHJAVp5rGRAss9UlsA2pYF5pMD449AxHrkJ/Ar62UrP2GMIxBwzTJerJdI
 3l/PlwqdNqeinx/Noer6QEXhPiybCeJqRk5AIlO2gQFZzYK7CFMy4jwi1MvaPTPYcx+P
 19nE3nRkTitKP5sQ3Pwbt8cURxxTlmU9J2sCcmKtbZJ24RoUkKM+ZtwnUU+Yx90/hbBn
 Qzjoc+nXNB86Hz3sF65otrHiOFx5ne6y+H0Xv5gni3AzIKj+bIOiqCKiYonMUa+Lpcin
 /Naw==
X-Gm-Message-State: AOAM533tfV/Sai5o7JZ80IVxaSjLY0RojOC44rQYWYow7iD/4Mq8QQsS
 jEtmamQ/l2ZY3BtNG7H0I2U=
X-Google-Smtp-Source: ABdhPJw4fjyrkxIC+QZRszgyocPb227aTwysjA6Y6+BSsjmYj3MtfEQbRiHUZN+EhaJlycSon3FALA==
X-Received: by 2002:ae9:ebcf:: with SMTP id
 b198mr40726993qkg.488.1600595879999; 
 Sun, 20 Sep 2020 02:57:59 -0700 (PDT)
Received: from Ansuel-XPS.localdomain (93-39-149-95.ip76.fastwebnet.it.
 [93.39.149.95])
 by smtp.googlemail.com with ESMTPSA id w6sm6968323qti.63.2020.09.20.02.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Sep 2020 02:57:59 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 4/4] dt-bindings: net: Document use of mac-address-increment
Date: Sun, 20 Sep 2020 11:57:22 +0200
Message-Id: <20200920095724.8251-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200920095724.8251-1-ansuelsmth@gmail.com>
References: <20200920095724.8251-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200920_055801_543240_50A3F7DE 
X-CRM114-Status: GOOD (  17.30  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Russell King <linux@armlinux.org.uk>, Ansuel Smith <ansuelsmth@gmail.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Two new bindings are now supported by the of_net driver to increase (or
decrease) a mac-address. This can be very useful in case where the
system extract the mac-address for the device from a dedicated partition
and have a generic mac-address that needs to be incremented based on the
device number.
- mac-address-increment-byte is used to tell what byte must be
  incremented (if not set the last byte is increased)
- mac-address-increment is used to tell how much to increment of the
  extracted mac-address decided byte.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 .../bindings/net/ethernet-controller.yaml     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ethernet-controller.yaml b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
index fa2baca8c726..8174f64e79bd 100644
--- a/Documentation/devicetree/bindings/net/ethernet-controller.yaml
+++ b/Documentation/devicetree/bindings/net/ethernet-controller.yaml
@@ -32,6 +32,27 @@ properties:
       - minItems: 6
         maxItems: 6
 
+  mac-address-increment:
+    description:
+      The MAC address can optionally be increased (or decreased using
+      negative values) from the original value read (from a nvmem cell
+      for example). This can be used if the mac is read from a dedicated
+      partition and must be increased based on the number of device
+      present in the system. The increment will not overflow/underflow to
+      the other bytes if it's over 255 or 0.
+      (example 00:01:02:03:04:ff + 1 == 00:01:02:03:04:00)
+    minimum: -255
+    maximum: 255
+
+  mac-address-increment-byte:
+    description:
+      If 'mac-address-increment' is defined, this will tell what byte of
+      the mac-address will be increased. If 'mac-address-increment' is
+      not defined, this option will do nothing.
+    default: 5
+    minimum: 3
+    maximum: 5
+
   max-frame-size:
     $ref: /schemas/types.yaml#definitions/uint32
     description:
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
