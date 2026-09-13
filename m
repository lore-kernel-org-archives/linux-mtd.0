Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E570C88E65
	for <linux-mtd@archiver.kernel.org>; Sun, 13 Sep 2026 04:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEqAsC/zLdsvUNgCv0mbUFA6QyImxCRJjoCuNQtxN8E=; b=OmF9UuxsTGeDmA
	F5BR4E9Ax0p2SRBqH299RolaKxr+AylUi+awAMquI5UluYN3hhe6jh2qaU2WERPSdv+4vRBJZDJJf
	cd7CCtF31mpBBqE+o/cvaJWKH7PxFwDfzL5WL9CKPJOEFJo8Pgu6zfNJPzH1E/qB1he3O14EWgKEW
	9DI0hy1RDVCYufyJsk105H8ePokrYhBv0sFmcqHUmUXn2SMqZP1jr4i1LwG19cXRTH5KVKy9qJSNa
	nPbZDMSUrbuGgQLc5BUuWRDZOmntamnv1cc6hEwF1LIMyhnUPJnGUo6/u1otPwbpwPr4ZmZ7c0EM9
	AtjNgYE5asnFcF9Qx3OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bTb-00000001N9g-3uf8;
	Sun, 13 Sep 2026 04:05:59 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5bT1-00000001MOi-0VI1
	for linux-mtd@lists.infradead.org;
	Sun, 13 Sep 2026 04:05:25 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466ccbd478bso223806fac.3
        for <linux-mtd@lists.infradead.org>; Sat, 12 Sep 2026 21:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789272322; x=1789877122; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=EmvclDjwN+5sxK+SiNPsfG4poEc/uclU+GObiCRex8fz08CB2KFibfwerlsYPADlg3
         5jAVqdEvGd9VlZl/JJufvkl3BeCp+wQEdHYM77mW/4jTgkSZ+crwnkCC0BmRagVDeTUt
         u+AFg9TNRiPrxTSgVt75gMhsQwxJH2h/5x5YhCq7Nqv3y/ZqObV70eTHljK9hOWaSft1
         XQow8kcMgZ48ZQvi1BtsYKHb6wg1hGYamLWRDgiwmGE+dBPC1xuP0H0umgZ6455309js
         hHlccSl1CcOkWAsQqe7hD7BXnEqkrEhP0zju7QKyRFxHhzRZiEACNxoa7wkZf4gJypkt
         VMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789272322; x=1789877122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=X4AiURqj8ZgwWWwC2Tfiwq7CwufWckne0kjLhHKXuZYCq0GC/lwX4HJ5G5zgyRTUob
         k0wrFizk66o8jnbAZ5OB47RgNUZVXDnWfzU5ZYwxYzNz9ESX5SHNMNFiizT6yc2GO/mo
         VdGmaw3i1MxSnpDTqyqA+VYp73fHxxI+0cbOEwwYu6r3sLTwTno7SVFzNJbyoebxxvjC
         byKbTiyL7XGSqXRQPFVSkNKGA57TLGZqJKv0+/ebr38ufdBZPPD9SjMrEFzqm9bwiQro
         UPb3q9ZlzUYQxahEi71bSuuEZrCYhOTwm/EHEZyHUzPlOlzOqyelhZuz77YpXiI2b4I3
         lM9w==
X-Gm-Message-State: AFuF++ncJhOeajIasbSTby8Ny4YFCLJTwgI4wFPBH2ZDn5t90i+5Mm96
	mgGR4mkyURNNxxIZQNaXM1dWtIDeQLf4VkUVjmxxXyEdeyW/5bOYEJFw
X-Gm-Gg: AYBFou32aPjoQGrimIeYGOsVtpplzLvp415KYKDjLprSxsNdNKIKVLbYClNpzyWCS6Z
	hrYIU7pdZ+xHZfXde10mS4al8oYTVUOjwSaRAha1uwirPr45pSuP8PCoxbCxkJY/1UAW5tLP3Np
	AKalY5bV4JzgFqBhFXhRg0GKyodPhfJniF8TD2zmTIrRTiCyOb/ohNw+tnHUbHlaxO7wtDRz6J7
	9xxXK858Pn+VMpXl71YBIN2hRzwk1VPNXh5DMz6aHItDK5sZmZtrNCp8mc5/5oj6tJC96/0/k3Q
	Lp+BYKhR9clZPw0SC7fWUo3YjzgNGdDwa4O5OHIQgs2KsDKaRl0D/RtQ/vjjwz4phdtE0cHd+ib
	/os8MT1gjzXbuDAcZ9ojGxVOLkWWZFccnB6uhzEaTukic7FRCMHMVScBaNPkjZGTdb68h5hvKdL
	9T/opveyVa3Fe+iBuOyKsSxj+SAvoD9XtVxHsa9LsoCeNAv5vWkoIk+d20n1LAk2jKOsSA6NNVn
	127oOMWmXcc4e9cijBm4nERwB+QZDVUD6rAP9s0i+kvTQ/fk7UXLo3jr4bxyEk1Ksuw6KdD6FXF
	BIM5VrfL7b75abI2z3oFmCVB+m4O2q0wudQWBGGk9ccmA7u23dzn+GS7AobfchEDzcIfwyszyLH
	BespHBqX2YRlUH3xyyinziPShOi6xtw==
X-Received: by 2002:a05:6870:82ac:b0:475:e0a7:9f32 with SMTP id 586e51a60fabf-47f59ca2579mr2988460fac.32.1789272322076;
        Sat, 12 Sep 2026 21:05:22 -0700 (PDT)
Received: from [127.0.1.1] (184-96-157-145.hlrn.qwest.net. [184.96.157.145])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699647sm6011535fac.5.2026.09.12.21.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 21:05:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 12 Sep 2026 22:05:01 -0600
Subject: [PATCH v4 10/17] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Message-Id: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-10-4a64bed94229@gmail.com>
References: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
In-Reply-To: <20260912-submit-sunxi-nand-vendor-oob-layout-v1-v4-0-4a64bed94229@gmail.com>
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
X-CRM114-CacheID: sfid-20260912_210523_269330_2A8FD18C 
X-CRM114-Status: GOOD (  11.96  )
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
