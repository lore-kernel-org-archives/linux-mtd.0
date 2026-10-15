Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8610CC6B34
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 01:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHPwnio+9Mx68TMaCUgzR2Qt+wOdESpLu6JLnQUcupA=; b=W6QeCbrdAKd5BH
	S2jw26Q4w94rGlNZPkkKRRGd2vMRMyXLORG5BOn2NSI15ELdrucomE+Q5oXqQ6umYHdRB8bQ31RvR
	9v+vHBd6gRO5Wj7zV3Q4ctqioNR6RFRwmye0nlE71sO1DkfQ3Jtq6zC7wCxgGY/P+bmmyb7oBoXTZ
	Rdu3p02DEY+rUVtg0C1296YGboEXuKxG0kEhUCDtIZ538epRjL0ZK18dx2BilmJhD1+M1901yAjN3
	xIRFgrChzUWKK6C/ocrRfSIzGZpTqABSz4489hcHPD+FVAU4PM1eCeRlEgElEynE5ceCMfgsv9SUB
	RI4ASqFpnaY7D97/Y1CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAN3-0000000GZJS-2Rl1;
	Thu, 15 Oct 2026 01:35:01 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHAMi-0000000GYZV-3oEm
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 01:34:42 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-6dde81a6820so1183972eaf.2
        for <linux-mtd@lists.infradead.org>; Wed, 14 Oct 2026 18:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028080; x=1792632880; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=eF+y6r1UccFu6xdutg2mJSN5sp1hux1ZWvxSZBmKM5h+rDMiJFTeT0zcli8pC436hO
         w0t0gFWF5pggPWItwtaLqknAPlFABGPB2nQpC0ROtPFinDLo9k0UkypJCCedOXNRGB+2
         0Pb74Ur2F7E//F+O+wzNzhEaUrFsw5u5T27lGhwMIbLXStEVagbrwZnwnDVcJbVEoKnz
         fiEjzAue/yWv/4BF6Y/W/OORhoCbXGJJfyMqBcuhsJ1YrqYkUSdNsZ7FTOgtHWJqkjbJ
         m4JR8yWc39cTTwCiXOc/tlNlJdyKnu0SXxC9KmMA86mUjoBhaOtqUHE6PJ8F1BfaS8mh
         DuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028080; x=1792632880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=UapRQ5MyQk7JCGF9efzG39GhHUdYP3/GawRTrEW/G8fi41UmfsiWzOg3jiCQb8q6MW
         QRinNNnm39DDw8qTAKVb1c2GZlgrpevaUnsu85zHzwzV6sCnNS/ayfBThEMm5y3JWh/N
         QDT0lMCZ2qftws4WifGlI34baJphB1/LCvvd0SXwACrPt+g/t90Bs8XfIMPA/ytM79GY
         jyhasUqBYm3WvsYrda8KkkRSvfjKj/zysjj0IZjxOhJ5rndRVXrzxzxf9adZvmM77Qee
         CnIOeDdOTsJr0IC/hbuTF68v0pqhmN7D41G56nzZBqr+Qk6G5p4q1n8pF+psUgim5euN
         V2mQ==
X-Forwarded-Encrypted: i=1; AKwUvBxkJa1LyPjzGrP74ycnfKT/y2oJKb9l8i/9pftuf97Pnky8uqjh1FQksMZC53Q0kLmiHoSpadVkTjI=@lists.infradead.org
X-Gm-Message-State: AFq9FYJdV5sD0U+Af5CY9hO1GmEtIkJ4k7VXuRjRZYPhjXQUK/Fc9Fgs
	Fw+0fM7SvLEx6WbNZgZA0hIHnXST9a2RixYI8eQuZbbYx8UFI8HemX7G
X-Gm-Gg: AYBFou2OBXsTVBNmONolEAGLX3Y9oakqNJ9kWWDdUOhb93Rq1u2am+fEQE/BXqt90AR
	CvRiEvuS5s4f9FI3W7BqKmk+oEcEQTyqNpilPOHnUvxNI2FRW2K8zzvIQKYOZm0QBitNkvobMsm
	K0KNogK4rTJBLp7/rxyYXmrgaM0jnsXg/yvJd5Ogsyy69kopQDL+Omr7ScY9jZ0teP7V99yWQO+
	DLcv2Ds/UzkZucQrdspyh8P0jqs/00vrwkwH1tTGZ6mG4v0vkun8zELG8t92gzn/9cDzkPMREUQ
	QqFWyfoRcTdxCXPqBvmWgoLJBvCGgd2/xBdCnNl12lLiDoko+EVZlkOu1ungQrTCDavBxHLZQKC
	UpOTL+8xpxXd6foLqM6y6RnCP1dOkhllVGJuiCmGSYlPXTP6LQCqCn34nxIlVO/ZKlYhEXFKaIU
	g3iXakXuhg1HV+7KfHB2ewIQVJiejpEr5toarFFpqtzvYJyRyJ87Gd3UQLOrt8AMqK37bFF0NzM
	qUSsLynm6Ts9A7tC865LF2OVIs5MOP+bX1er7uPWm1mp1DSO/Gb16CpFzVKctcA9sPIy0tybCvK
	MUoHu5RN90CuDZycwbRIvBMKWBI+okh2p/EGTbgwsEur/s6vpxCEOlSVmOfsRXdq94eVXRVlgPC
	ahVsUysVt7hseediXnNV4
X-Received: by 2002:a05:6820:4b0c:b0:6dc:3be3:bb81 with SMTP id 006d021491bc7-6ef10492c39mr14343257eaf.35.1792028079883;
        Wed, 14 Oct 2026 18:34:39 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a6dfb41452sm3428139fac.4.2026.10.14.18.34.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 18:34:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Oct 2026 19:34:02 -0600
Subject: [PATCH v7 15/16] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Message-Id: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-15-5d3fc6ad2da1@gmail.com>
References: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
In-Reply-To: <20261014-submit-sunxi-nand-vendor-oob-layout-v1-v7-0-5d3fc6ad2da1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_183441_036305_4187F644 
X-CRM114-Status: GOOD (  12.78  )
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

Allwinner NAND firmware writes the bad-block marker as part of the
controller's randomizer stream. The mainline driver compensates those
two bytes so that the physical marker instead remains plain, even when
the rest of the page is scrambled. On H6/H616, the firmware also places
a fixed amount of ECC-protected user data before the first parity
region, whereas mainline distributes available OOB space among the ECC
steps.

Add an opt-in property selecting that firmware page format for the
configured controller hardware-ECC geometry. It identifies how existing
flash contents must be interpreted, rather than changing the format of
all NAND attached to a controller compatible. Without it, retain the
mainline marker representation and protected-OOB placement.

The property applies to normal ECC transfers. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes,
including the physical randomized marker.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml      | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..8ecafc40ddcb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -79,6 +79,16 @@ patternProperties:
           minimum: 0
           maximum: 1
 
+      allwinner,randomized-oob:
+        type: boolean
+        description:
+          Select the normal-page format used by Allwinner NAND firmware for
+          the configured controller hardware-ECC geometry. Normal page
+          transfers use the controller randomizer, the bad block marker remains
+          in its data stream instead of being compensated to stay plain on
+          flash, and protected user data uses the controller-specific placement
+          expected by the firmware.
+
     unevaluatedProperties: false
 
 required:

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
