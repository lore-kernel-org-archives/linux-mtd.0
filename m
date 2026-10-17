Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6926ECCF2C4
	for <linux-mtd@archiver.kernel.org>; Sat, 17 Oct 2026 19:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHPwnio+9Mx68TMaCUgzR2Qt+wOdESpLu6JLnQUcupA=; b=Oa+nFPK5bviohh
	Vj5/rO06DkT1rGCmYX+Vvbh7YTxgKgRKukX1imxAiXkWp69mppBxp3RQMLs0vQ6T/Kl400luc25FI
	kh0gMGmysS4WPckE/kJMhoMk58sB2ipSL34gVmgchVdhcqgFoZBGnfCc3nCRvSS+R13BDRqvrgkvj
	BvfcuGNFeNzAivbDmk6mj1Bzl0j/MN52ng1aThdUKraxLMSzvd+VuSYqYnds01ODRr/IR2wu9ay/j
	2Ku/7LgTz/FRhm3ipgFCUa3V/9kK7/rs8nRclR8mP++O3XtZXTNO2rIaROLVow47tcV+6GSpZw8c3
	gGUBFTE9H6fCDXJQI5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIATS-00000005BCx-3XlB;
	Sat, 17 Oct 2026 19:53:46 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIATQ-00000005B8c-0fJ4
	for linux-mtd@lists.infradead.org;
	Sat, 17 Oct 2026 19:53:45 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-824e6e6ed71so600843a34.1
        for <linux-mtd@lists.infradead.org>; Sat, 17 Oct 2026 12:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266823; x=1792871623; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=JQQyt18hzOtJWx5oJZCcalG8V/NQzb5jn2Kt2wojzaGoJIbXyzKoznp1TeTgvEaUhJ
         oaRcId/qDMj9Faqn0xmVP4LLAksEHjGYlm5PIUj6M45jWrYCbDLYd7N8OLbj7cmpUsvv
         n1sEbjc0QWhh2GKCcU6GvRXycsID/xRoYscFacxqMZPgsqHoQbY0HvQMKd2R7DrfdiFd
         ga/maH1zo7vTe06vBa/5zErLCZlkhTrilueEQhUX5hJM/J0FTaIDxA0X1LHoymeLfI0y
         I/+gQuIiObeRJDzJe2q1mCmjY6S7Z86SE9kyFBjW/JpaLwGOsOiGOAC1lVjJlFIGE2xO
         dLxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266823; x=1792871623;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=qxrtD90ohNiLhOaeE1g5G/0SwKy0XTeh7d/uYwAn06sNFYzpXrMKn/6Q4T9ZJhA894
         d17m1nTX+2vGwqkscXkBmkNVEGDyuS1mgkJHrQOkyM5q/EIyX4DyAfrTadXG10wvtoG/
         NdrBAFTagH+wkU3Yhy59Ufbc9CZtXV6ZN+fsTa0LM5ruxfZGFCC/J6R6SUkQshKbPrKD
         EsRBKZUrRRpjDq/UxpxNo2O7LtIrG9LdELMNBYwvxrhu5eVx4PdvYERJJTHzgD3RF+GV
         XBFIOsxRzfURPr0I+BuC+IzJvqT2o2VrrDs+NL8TpPB2SDLDCOUbAC6Yj2jP75/y+nbK
         3U8g==
X-Forwarded-Encrypted: i=1; AKwUvBwfxXOGhLbGkYqO9uSS9gKdR3EcE6zJvbP/rsq6GxgREkevY7VhgD9IhKNG7foZiiI8Am3Ry0AgAnw=@lists.infradead.org
X-Gm-Message-State: AFq9FYITfgUKimVey25USVkEYuMIVxI2h3PvAmHKrgayp26fSV3QI7Ax
	JxwlYx5eZMbK48L127CIm8Z/FCPhjcOa6oFPLuAp7S2yS6VkpbWMq6yX
X-Gm-Gg: AYBFou16lE7FhfDGgB4Qj03Rk115qV8304wBBn8DUgFXJQ6bGDEMftcZN2mK9ZwkDLS
	H/msr8yF7qhyeU61cADzE0W5+3/jb0+O3P36y7HEH3ThgnEiA2IIgLO3DLj6cmxdIA+6HTEW77H
	V+uvIxZg5lN0cFCCrlLM8PpHprDiddrh75JUABCtwxSslS/mqeZvzPaMoncjkZtQVUq/iNGnKxH
	AuB13Q6d7eBPRYPuATLyzXvJ/oAU1swKPHoWIEEtm7imCpwScDJVnkTsn0U7Mbn79saNJTRKy0L
	7IUdygPnJySjD4fMJPMSxC6L25IBVck0eL772rCbcWVh3yuPfoPC+0gtV52v35c5qdMx1hPnjgo
	rq1OvlgfZ1QJtv1hOpsnjrIoGod+X1DBW4/cQlFyIxt9sE+LK3ai4f0ouxxr4JcfgtN8NlRZdIA
	ixLZ0rWk9gB6PD+QkOqewhL3RVstWdD7nS4w8fE4WFCyYjzNOpRsQUGPUak6mwfUiJ77KeMa8LN
	Axs6L1MCquT3cVBpvmHM+2Qv81MFT7OXXoXFBLpxYAoIVMwOwi5y0+79kQYSZJr2sPCgBDJtayN
	LAq0Vy1GqZyWQP/tD9nI5V0VIPC027LiNM8Jkit1cFn3ZhQJkX4Tf5MdyaRXMJPBip17Ec3ZaiI
	IPCQ159ic2VR1zEtolPKwp5TVehWVR/LpC26gLDgbU2k=
X-Received: by 2002:a05:6830:4389:b0:806:3072:240c with SMTP id 46e09a7af769-84501cf7377mr3819310a34.29.1792266823279;
        Sat, 17 Oct 2026 12:53:43 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-845b9e280dbsm2212064a34.19.2026.10.17.12.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:53:41 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: James Hilliard <james.hilliard1@gmail.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	Richard Genoud <richard.genoud@bootlin.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Brian Norris <computersforpeace@gmail.com>,
	linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v9 17/18] dt-bindings: mtd: sunxi: Add randomized OOB flag
Date: Sat, 17 Oct 2026 13:53:06 -0600
Message-ID: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-17-5af9a1be16ef@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_125344_216892_3FE3C638 
X-CRM114-Status: GOOD (  12.57  )
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
