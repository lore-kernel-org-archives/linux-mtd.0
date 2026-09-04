Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969B5C79F85
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 21:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEqAsC/zLdsvUNgCv0mbUFA6QyImxCRJjoCuNQtxN8E=; b=sSWqkpEtHBTtD1
	0PbNJ/p7fujB1jebW+ZHsrGXVjwbs/6C0m4+zjBiU3Q2HFHJwcF1BlTS2BpQNM8ii0mqv92qq11vM
	oCuy8wrF6UxJxvUJosurYUbzEMvg3ORTWZsznUqeyszBtigribAMRaMJE6ZSh05qxnqZ1ggtX386p
	/64cykwR0m2W05CA1PyEUlaBRJLJVUySiDuAfwLkzJqo3Voau9/ZZD6XJhji1wt1n0PEo1HdFNOie
	x2PHXPd5axLdplOzaug6vd3jLXw6rXnfD6l+4htnvije46aKJt6iPT+AmHBsju9VijQD2Yqbn4S0+
	Yn54tDvlfBAbbnp7Ra6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bNs-00000003Jdh-2T4T;
	Fri, 04 Sep 2026 21:23:43 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2bNp-00000003Jau-1qBW
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 21:23:39 +0000
Received: by mail-ot1-x335.google.com with SMTP id 46e09a7af769-7ee4f241f42so2116661a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 04 Sep 2026 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788557016; x=1789161816; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=hZzDFCEs2+Xbaco9WepFctFmQvXVLnTPBAy1/dbjRwhLKjL5h14Hyw7Z2wEy989DJB
         8zlfYsRX2nDmwb8NlIBIexuNdM8Axx+sziymyspIIAqj7j4vH/9aDttoGC8SP31uFR4U
         I7bSd0sFsogCU0ZDa/8WPSK1KWH/pQYIy9O2+QLqJ9N/kGzb/HxRT7g8Tw7uUHL6T+mF
         z+OxVvTXberv9fW6aOJvDvVO8fYW7z98f9amBTPwGzLY90Hx5DcQx1abHOTv1kPsHKP5
         E92cMI5e6TP1G62sdQNr0COgqxdZ9zakhYUBQtKqBUausm/xJ8D4x5OUTLUnbjcVrHqP
         Wtdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788557016; x=1789161816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SP5FgDVql885MI97WgCQyPWKLiok3M5jguE0MrKj3qI=;
        b=e1AS0w58P30zSnJzL2ghksPG+IDQeS9JNT2Vmg4fRNUZ+GTJDY/Sc6696gTTNSFf5I
         hmL7d6uA9AaZSm2ouItcmaCtdJZSt+f//38A8bAjGasm59LWyCmDZCnbIOzlWVTwFjCT
         kwgmtTieeqtoUgyQnpD4LCGpzEkWeR2tqxDJaWtmop/u3Fnem0fmayYGCCE/BasYqEId
         Tloys88hheIC3BCJE6pQNC5Gru/4KRkL4EXiACvkE1LetwZ0tCj++Dx23gfEn6Ob073h
         CW9Pcq59lphBB3DHgq2VrwS04vinPF1ykGSvYL4Qz2JsnUf8XYGOphOWVX2y9Zrxqvf0
         Opgw==
X-Gm-Message-State: AFuF++l4O5mDHsUhwZZp9CUMToMrCKjVvx5eUV2Z/a4WrzE71k7dAwmT
	UVWqNF+MNk7csETSf16dQxFX7v5bSiPGSY3FR1KQ329WMwCcZZWM1lLG
X-Gm-Gg: AYBFou0gl9vrczjGgH7Iv79ugVafgsVut35vtatY17tr5MatmcmESEcShfU3rm/Sjie
	slYkgCVY2kgDZlYc4VkJnxYQG3uXQF1tzaF1OPewpuUHY8iWN7QY2PAHzXhzP0T2c1GFp/vltfW
	yqAg2V1xkBk3APE1XCOdTlAmdjP1adf7lRHNng+G+El0BHlUtu1Ou6vyJfrZ3zi6ROP66yoIorH
	DrlEscB6PGfnXchjH0UeDZ1urTE761GYuBkLW4jXniiWY1i5OL6rDhHeBCMlemMMqXAh8k7KgGl
	UbGv+0Nrc6xJIRRwEIWxYSkCZvAd86qLwykYNh0verrY8taS1UqUaEZw+nv5x4unvcNhoJmto7V
	l0xaDYPG6bfxM92gE2JvvdtpyqkRTuFtzi4ZeVOLm2RJLeLevAv0+gmG10EMBR2WHcyRrkDOmNM
	Hxj2IWD5uoltYdyOYcoXUJxxTOh1OCVlxEyeutUgGxU9yWlsl2OOwgtYvUgVFwAI8yo3T+H/P9h
	X6sxxf1jTMSdUIhQsOZG/ejVf7QEhkQo2ZbQz0ooMC7fJgvEgpWfxDiQ2Ym+8g0g25meOuxcd/8
	wC/P0Z8SOMifvP+FRtnwyeBaVUykEK8exlp2QiqrvKxnWeBQOd6sNoATHaDJt6IZEEK0TIfOu2j
	bBI6SutWUw8fTeUOqEjY=
X-Received: by 2002:a05:6820:1521:b0:6b5:ec3f:4983 with SMTP id 006d021491bc7-6b71ff594bfmr2962915eaf.30.1788557016267;
        Fri, 04 Sep 2026 14:23:36 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b6dbedc6fasm4492259eaf.3.2026.09.04.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 14:23:35 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 04 Sep 2026 15:22:11 -0600
Subject: [PATCH v2 1/3] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Message-Id: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-1-b12074f4aca7@gmail.com>
References: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
In-Reply-To: <20260904-submit-sunxi-nand-vendor-oob-layout-v1-v2-0-b12074f4aca7@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_142337_487903_0000E89D 
X-CRM114-Status: GOOD (  12.31  )
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
