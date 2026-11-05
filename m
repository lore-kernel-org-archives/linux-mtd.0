Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15C9606A331
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 19:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e1iuU1tY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yZrk3nCD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NuhuQZIf9+RWyZcFyMzqdhTJsTWPcnVamCIPgW5I+9k=; b=e1iuU1tYXllLvc6oGABCHvc6Ru
	WkJaufbcI9pByiPhvxMXLXKTuMDikJIyLg3WiYXXOAjr4Eh4dNMdIPuG1y62pu2gkbQU5FddJ0JL4
	blJ2OJK/KLabvkNvET1in6QagyeVQyBRgfGQnG4Z4fmlBB/DIoglQxR8yEGilyrV4zc7bDQi8bin8
	EmJvs0n41sPCR0xMcd7siEq7xeN7gD/5VkEBvGBPXbRxBvUQDwNV1XdOJzzkLkvz9SiejU7QgY5q8
	8JAvcdt8awGDZd7xQHzPD3zAX5DGRXDNC7YexO00b6ANuZxLomIHW1HW6xTuDoAR3FldgQlcn2bwl
	wD2kUtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2hZ-0000000AGVp-0UGk;
	Thu, 05 Nov 2026 19:00:45 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d7-0000000ADcO-2FsU
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:15 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-705cb6ceebaso1493792eaf.3
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904968; x=1794509768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=;
        b=yZrk3nCDPTF9P3GgfRY7zlhGvs+arS22SZi6ixzk/zr1t4A6I6ZbxTKT6BhrqEvGf7
         8k7K7UL8pafnKJ5Txwm685SOl9ixEDYmsnB7eaW+DHLz6iGoPRZjhE7MPdTdIzHXNPxo
         4vbzqWiNxv/iA0WKG/MZRxnAYhemR/WiBAfAGsky0x65er66xDTOE9B/tkB220kFgYd4
         FgY14KP6q2FHB9sEXrydvRjUwMiOVgok1kDUvNTb6ZFaUmFe8wDMIhkfVUO3rP2X6Y8A
         +gnxUUilawSFYulibtbhusnG7WHe4KdNtQj5sL6dbSuXDukFHCrJaJTB7c60ohQ+mF+0
         pPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904968; x=1794509768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KWxxvC68veJE9vLqTWwy/EexVQuI9OEnPBoyBsJoQls=;
        b=yoLVnbSgJBxXYvIAZ51LOv2bCuRellSgg6LN/QLHMxiP4zMfsO1QGY1NNL/IdkSHcO
         4OObaIuDvED0fGCfoMN56U4I0wLkW+h0X87vRGS0s/lnTFX+ySvvQrF0MtKvNRq3Raey
         DvH28WuiZ5RyBhiW4YosWRdbNuwu1MuI2mkhUuQxfoFMP4CqdfHxXT5od6oZRJmRHmka
         HynBz5wVotJqEDQNiSVPtN7eWivzEhif3XAWGaO+856bAw5HGAoI9QqlieiU7OIliqig
         i+rnGu8S49djdM+lXeb+AQwBhP/2+B0Px/myCqqNjjcZdtKEX5dcIexoI2Z31tVm97F9
         9Mtg==
X-Forwarded-Encrypted: i=1; AKwUvByxZkC8mIhglkg+wcW+/YtffyMeXNjFk1c9qn9wEDUdjFc5oAOFU9hpCoFrTVv3cVj9qOv9j972VGE=@lists.infradead.org
X-Gm-Message-State: APuU4Z/0O/WVHpcQinercPvZerSKoBDzmq7mgcNmlDdKDco4ZryRwV8W
	KffZULhVJI70xJkwFegbwIV04MAn0T7ar2UeiLAt3hgdynwkiZSeWN+x
X-Gm-Gg: AYBFou0sGDNbMDpJ7ZZATJXwCvvdbnH0TjCav8GZ1jdCcGsRNjvbfkWznvFbrwN7Jli
	I/m6omMqe8AYzbTlUky68d0wCfRO26/FCuYchjbzUQYbze6/IxmjWSjMtdbR5chRpXw4qf+jX6g
	9c4tXAN8MRJCN6dLqTfNBOawjeNZ4nzGwOhjUk34bHYmhq2V/MzMxLKxevev5QTgsIfaDM18lGC
	cgONevCqflbpiVF6XE3TN69aGkdNvCIP2HJhoMtpsuBe6l4/Mkb13w2KX/8iSO0h7Z2aR4HlF5j
	SMvIo+w0fh6BFD+wuCi9N0G8CH9YedroNX6ZsmP6w1aiMDmFrq8+oMwFNJgFRi+H9WDmlSrylOx
	Bev4U+rdnhzf3zc2kv6hXuLjW5VpkzCMxOj9madVliP11uW7JI4Bnec+p3qyzqmR3grXUkPKVJ2
	AW6XArG1d4R6tneu4IDtSyTSmez47R1lNrQD4yq+7rXRSWKcz+4JlzoPOQx1eGNUc9XFOv7D9Fx
	BjQP+vf6OXS0gt94HA3yODd/6f8HbonXHV46sFuIXaS9orAIjGVBFqR78APySbuL8Dx2p1zg0yA
	sMJJuCjvMN9t54Jg0A/pR/OOvT99pD+D+dFaA0Svh3GmcXM2UcWnUH9pJRLX1jyAbiTSUGrqFZs
	tAN6bp3KzbkrOUw8AdIacT79evZFzJvAVlaqF0dq4a9PQ3wFSmP6C8WjLY+4s8PhLJP9yk2VEb/
	y+/iOHV6dbips8RvYRGM5aJ1k5EtJaUYDj2X6x8z7MH3ztp62WnvQ3
X-Received: by 2002:a05:6820:16a9:b0:6f6:3762:5f9c with SMTP id 006d021491bc7-716e73de6d9mr410801eaf.11.1793904968458;
        Thu, 05 Nov 2026 10:56:08 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:08 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:41 -0700
Subject: [PATCH v10 25/26] dt-bindings: mtd: sunxi: Add randomized OOB flag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-25-dca1f6ed29a8@gmail.com>
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
In-Reply-To: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_105610_410371_F339F809 
X-CRM114-Status: GOOD (  12.86  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
index ccf616fabc91..4ed99054a8ab 100644
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
