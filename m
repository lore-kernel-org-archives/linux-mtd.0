Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9819FC79FAD
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 08:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEqAsC/zLdsvUNgCv0mbUFA6QyImxCRJjoCuNQtxN8E=; b=pjuQa15FLIiAQy
	Oq8Cwj592SaVzn2ycT9suz6PlKmN8ler4zNI22Mv1NEg1DketqiE3garNITdyQ/sFgmFTNHDCJ0bH
	dcCLsgMB+RSw7QufQN1UIL5rADYfd1u7KfoKGzODpdm3CFhP3V4y/lKMi9JolKZy8t9wP3YFRz0Xq
	dgl52bHcOqGUwM2UnMzuoRFtNqFPceG/2WlirOD+O4fGT+gzzMjHjyMcjrgQhEnRUU1Am+BAM4QCA
	h6y1Pc1uThfpyryOWA4nBqUCpm8q6qNmghlaBMnmjgzDzvjpNz2XJxTfBrFOmOp5wVtNjCLRVyds+
	ADJtfLwrjH7oBEWHo7JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dik-0000000B70P-0G7a;
	Wed, 09 Sep 2026 08:31:54 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Dhz-0000000B6Rr-0UGh
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 08:31:21 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-6b13496112cso4165593eaf.2
        for <linux-mtd@lists.infradead.org>; Wed, 09 Sep 2026 01:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942666; x=1789547466; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=Y1S93XEK6pEPlaEPCLDDhuYaab+YEG5Le0RcbHb+6LnmNw48oVKnU81QtT2OM0/VEu
         V/1F3n/qWeB/UNJJDW8Gx8ULOEenAxjFFkCqKUkxtD9PgH6pRhBaNYmYA8gaxaZypiUe
         U4FjdwSKyrd07Ouydv6lR8AmQa9E89j6zND0zYwhHfVGLme/TesuljFkWIeullYkrX5C
         CwkJ6/tuMyQJBjp2WhWrIJdNa0sN2Jse3Z3Ij2LEJHAuzwdfZJK/k4g3ZeN1kmlq7+Wj
         DLpGdJOruukoiYfiJg/mZhoWB1k0v3B8329hcETHRrWGzAp9f/Z/N6Yz1ErdHPkVTw/r
         aMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942666; x=1789547466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=ps1idF1T+l4PFHkqw2OHdzcBByl/GZPtnG6ADHZuKqdYr56SBUDtH1ecQDvREOIQEu
         ta4GdwcP4ffAizFRlL5hPsKMTqvfveE4Zs8UXmQlTlUolpB7c7YOQQugiaVLmTumb91h
         vaVSBMAJTKpBVrvr3aM8rcVXoxK+0FgbRUt4kXVf/GQjl3o54JARagDL0UbSjjneT1nd
         nDrkw6H9LdMOL3aqlArgt8hWE1vwWKLbVlk6NTo00MTf6KTXC9ldwhg1tVIrtN4nDCKG
         xz79mU9LHOL6FuFoHP3kNniMdArUErGifmBKBFgutd/tyd61AcdoA2avVANUxOD4JEPj
         sIWQ==
X-Gm-Message-State: AFuF++m3xNphJsMi+lXfATQ8RXRFY66XHKIxqKXEJM2ii0Kqcb/ScNYt
	c0dYzwxCI3AO4+7kkQBZZ8QIh+lqqyB9ofsEQx24jMcRPydjxwn9wTfv
X-Gm-Gg: AYBFou0o1gMA93HM88VSjwnxGOjInUg7SrdQEV/F9L1SQY+nQamjAvfbe/HMiE6ENgM
	2SP3fhBeHndWYvGyCVH3NmUwSLNwcQV9NmDafcIYke4kzEV41+dcOROZHj0EA/1enFIxbon0hq5
	f9Dwnmm0UxrerqFpAe6jqALtpe1ZlNZbau5XndloTdquQgch4PJEMrAVGyXhT0P4FEInEM3tRMa
	Dzorc0kc1upMasBp6xzX8SfnvN2tY254a2nkcTBzwHm54VKr9gfx40gyTVN2UDpaKPHUMsDoT4A
	qRx7mNmffQsD4L0h9J9SeXHyhJVAJZjq2wdqBpOTh8nJrrQhFNw8NrIZwVfMpPu0+JCYZZIVkGc
	jjqonjymWH1MhZlETAxCMIwQlV8LXeDBcC5nIAHdsfYUp8NqkrRx2Hv3ZX0EngyVgLVLhyh9wuk
	fg95/0VKSrHJwTLQt/rQg2mdJie5SeXywXC8tQNZIT0CZAtTrIC4Y8/K1tEasghNCJvuW+/plPf
	DYkZOLq7EmTum40peGyvobLuUq5ViaWrpHINoJHVtbRbefBhao7QKJDnvuN0zgKgBa5sl0BZ1AU
	Lwuwjp34dD9zNIqYj7+5OvjndpnKQdLTW0B71A88pCxrOiTMzMXmZ3K/APiYfE5rEx/23Gmep5A
	C3GK2uVySXRn2M8ac/viKB9ME7rNg
X-Received: by 2002:a05:6820:c84:b0:6b1:a0b6:72d9 with SMTP id 006d021491bc7-6b6fd3d694amr18766040eaf.25.1788942665879;
        Wed, 09 Sep 2026 01:31:05 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6a0sm19031004eaf.5.2026.09.09.01.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 09 Sep 2026 02:30:42 -0600
Subject: [PATCH v3 09/15] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Message-Id: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-9-838cb0ba1547@gmail.com>
References: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
In-Reply-To: <20260909-submit-sunxi-nand-vendor-oob-layout-v1-v3-0-838cb0ba1547@gmail.com>
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
X-CRM114-CacheID: sfid-20260909_013107_583973_EFBA36CC 
X-CRM114-Status: GOOD (  12.74  )
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
