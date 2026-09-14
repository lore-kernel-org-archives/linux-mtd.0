Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2224AC88E5C
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 03:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEqAsC/zLdsvUNgCv0mbUFA6QyImxCRJjoCuNQtxN8E=; b=iE3pJU//s6JZPa
	Vx372J1t4uLefI3OzlRPK+tsVYP3I9TfzxdBkLdjzeTHZXj3B7Hm3dk14lyNnBkuov/rkzdpxN7Yj
	2FR6fDOmXgnjtLMwTWKCI24+trcXRD3BLbCXUgbnefm5Z9r5CmuS4OQ6/rJ61bgvGfqPx0sq+/jXx
	Hnn5gKLLm02A4EyJzRK+pC2dxQY8rvTxPPa6boKbcPkLNcdByhkbytolE4D7q8nRe98USWva1P1vh
	vR55v/UgAm8GjrhsITQ5sdGK/USy0xR3V9B3IUpTHFiYTs+a1AU+D3j5nBACaYDsTuMtPLWsoolCz
	y/X+Dyqk9aU8p//xB2fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxU-00000002DOp-2Mbf;
	Mon, 14 Sep 2026 03:02:16 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5wxB-00000002Cqf-1Ybw
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 03:02:01 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 46e09a7af769-804f7045f3eso379767a34.2
        for <linux-mtd@lists.infradead.org>; Sun, 13 Sep 2026 20:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354916; x=1789959716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=eUopBvFRfwiATU8ZaIfDCAgUAL25Pn1ejr4/cnkg9q8KFLmofdEtXGaVtzEPvUwl+i
         rnyD7qMjUFyujIDT9DbkHZw6Y5wwszd9Yo/8lJS882gDjCsbnOIP5PUXAigUT7To4HfA
         I+Bqy4sopknqJ3Tz65G5QYolwu7oEUyYil2xU2eWYsNDKW7P1J120nTADyYxWogPlAGj
         sA3Y22Ux3Yg/R6NQBPLUsEvga29v6r1yz16Dome1ZHwlBPgI2qOnr7WJLwdG7FcB/X4I
         7870YbaqHxcwZiu+NyMqe1Go9qlH/fqMf6p0Wa5UP8PT8klGWFy9/5yA6xDi8yN9Da+Q
         pbDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354916; x=1789959716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=mZ7YebLaEN+p4lajrvamXhIiYGkmr5JdNLH3gIcgmOsieDjSv6D4HB7Mcn4hlfSd+B
         5hN+b4xsWNpXqNG6pZzIzG8WQ7V6lVBUp35/aVYpwOOV2e4gPUO+vt03OgYIaQszNUqq
         ooOzmZhGkuBkjBx0fK6YWl9lHR+vVpUpD+C7dS7oiRT0NkbHeBQKlaEMH64KmROl1WMl
         Mi5cNdVFeY0uww+7eWH4QlWvo6a1ZiNUAS7r9UY7ZMZNDxmwBVv77zEMZMSuXYP/+vGJ
         RyXvri2l6w0DrGUT2FSr0+rxbUqhLt0b+1DzACBFw0d54o5GKn0AKOw0dtgY/M8aRP5U
         4q0g==
X-Gm-Message-State: AFuF++kf72PJ2fRfN58pKrObcCFHacWPVnmKsqbYhV/Ow5j6ZAzoWxK+
	lOdim+syvrO8CmVjpHypzbC+ciP1DVu1NoHxfV3yk/SOZA2x3WLfbOr/
X-Gm-Gg: AYBFou3ADXnQUlnrP6TOmcdrxB7NcwndrPCZn0W/96UjLzP3G9BpEupzihdViGa14V9
	xAOIht+AT1SHLIECVRF3mW14QZ3UHNTOH/4TDJzsViuv35UuMyVXgKE9Ivq80S6yo6xfammYPR2
	/CAtllZ9a4oak6jmdnlkHNL0J4K9D7I+jsPjhZ8i5RjZ29UcsVZQUerjan3FQt7KO3YYWxsj0Qg
	n/UxnKxPAamiGQW4HD+pgpodPUv4uQh9VQeWO0f89NmNcdWWq3RzROR6dU07Y8Nbb49eZPCfG6k
	z5ZkmVBlu3tYS8TqAhRgx258sPNCOVb0InTuiLc+qHqkle/WT10X6UTYwg1jToxwmgc75XodDS2
	HnbNWbLpdGEwrl7RnX0oVidGDDRoT0sisuNMvIfAUzc0q1l3gPpPCGChlerCpla+cWgOqQy1jiB
	lDP8x0hKbqGDJls6JgPT5oMZPg23ky8M2VNGWrB4MBs4RFGye9sNLkp8Ofim6giEXEJFkwbd08o
	9UMnNA6UsolIgbR/Y+rLkhkN7+1a92WI2cCsisilTi/tptWzJwTOywR4AaN1boiKO8TTOzKgI83
	kjfhVe4QNQ0HN8iemsWZmWZovkcjLjNaVNShsnaWqbbpA9gGOZuLhIS83UoxwSC4NdAMwiJNyJh
	fYMgUNw15sTsM1CbVKrrQCDnkute7i6/aXjgLjuZ4
X-Received: by 2002:a05:6830:230f:b0:7fa:ab72:9dfe with SMTP id 46e09a7af769-80899b4c24bmr292105a34.22.1789354915667;
        Sun, 13 Sep 2026 20:01:55 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-803f60feba1sm10619014a34.13.2026.09.13.20.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:01:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Sep 2026 21:01:18 -0600
Subject: [PATCH v5 12/18] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Message-Id: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-12-7d711076a6f7@gmail.com>
References: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
In-Reply-To: <20260913-submit-sunxi-nand-vendor-oob-layout-v1-v5-0-7d711076a6f7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_200157_466975_8F92E9DA 
X-CRM114-Status: GOOD (  12.16  )
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

Allwinner NAND firmware stores the bad block marker through the
controller randomizer. The mainline driver instead compensates the first
two randomized bytes so that the marker remains plain on flash.

On H6 and H616, the firmware also uses a fixed protected user-data
placement while mainline fills the OOB space left after ECC. Add an
opt-in property selecting the firmware's normal-page format for the
configured controller hardware-ECC geometry. This covers the
vendor-specific randomizer, bad block marker representation and protected
user-data placement needed to access BSP-derived images.

The property does not change raw-access semantics. Raw operations still
bypass ECC and randomization and expose physical main and OOB bytes.

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
