Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1B8CC6B38
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2026 03:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qHPwnio+9Mx68TMaCUgzR2Qt+wOdESpLu6JLnQUcupA=; b=wJXvlAb1v0cSWL
	OCUqQc+O+d3dnMe+8YSpYmxw/KTcJEnDnQAlZM76d6u0YXOgRTuTOHcqHbbYHX9d1LTTL8okIaGsW
	9H/OkMPE0yLJtaVn37/4d3kCoWjkkdQ5OAg2LRfrOJktj3demp2ETUmiYyrKj3/6PzoB81/fOjkPq
	i5Pi8++oz10ptc7DrCyhzpaSnPqDkXsBfUkAcMUkYDFCMiX+APvkgZfDUN47d5ExZCMWSge3Bdk08
	EpMT/ohVJ5tkoiySEXyywRWy6dxfteA995ieJCjdp82zcWYBcjqvKPT9Fd7UcPxETHKPB2IH5a1QB
	gOaLkagEBtwskAKQyO/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtU-00000001t8b-17Hi;
	Fri, 16 Oct 2026 03:46:08 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHYtI-00000001sjE-3Z0i
	for linux-mtd@lists.infradead.org;
	Fri, 16 Oct 2026 03:45:58 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-824e6e6ed71so2262393a34.1
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 20:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792122356; x=1792727156; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=g95XIbaGyoxjl7r5twuMVgoV+947+UIVioXdshH9PMidi9KZOtvMalHjmxiBy7rugY
         VpE6vP4eHeuFwN5GJIr982njtMHwVjwGwWPFGvOgt6w1cPapSOcBqZUrkY9RgE/wrgpC
         z4uLZSdRGgwK7bFpS2gmZi0HeHmbIreSros5c0piHB5AMEr5Fun0mgXH/cjB3TxtnOWI
         qKekajygrzgA6pO/Pf3mIRhDZ8u3YmJAmAAwAUfqyOX7pr+pIu5lWA94CgA12JQdpZ1Q
         AT6ONWksunjs+AHShuOKU1cZ/+TN8oEOsxTMUYorBDW+/x0OY9XSAh1fIVvIdsNrFDz1
         ElPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792122356; x=1792727156;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZlPUbRtpg3L6gM16/NW0SgMi7XxBEFvrpndyBx+kMc4=;
        b=UAJNV/ICTM3Jjuq5pxam+R0LYzva4msxRBO5a4XtM5UZ5Q6Lj3ZSpRmVYG49w/5XXc
         /PL2sVxTIOgzLAb4asEpL5a0cjj33j51zTffZRIePdb2luWORVcn2N7TRQcEM37bZIqz
         gC0qDwTn4vUVu1qVpntjZWWHCPusBFQPX9hPFuX3ZlbRweYVlUEcSM6+VNbmr7zalLZn
         TEiNvgZitfGLcEM8/hPszB8YepA+Zzd5cqfvDZWcieK8G0XPhNJ1v/9y4mU/WLIVg5+U
         CA2tCTmvWfZ03aU0fagNyLWqd+AkQg+Ot9Vv8uo68Zd3yD5ceJWSeEIO33gi82iLsv4P
         8aog==
X-Forwarded-Encrypted: i=1; AKwUvByknXHNWFdObJBIb3CP5+r05oY1ImNDsw9ltvjPSWv6XeG2v1DEkoTiaUfe/WBUpZUG9o2txeEQSAg=@lists.infradead.org
X-Gm-Message-State: AFq9FYIryeNwViQWuYXsS1rNOKfR8Xwmp8K0OhfEQyLaEdtxV+dxTJFb
	04r8GhUwu00u9S9MY/rQYtWtlXyb46uBcgN8ByXgoyR7wbF6wCpCWEED
X-Gm-Gg: AYBFou3aJcTS6queQTZnNvwgUcUZr2ZwTBxttGO2HYHL4PYG35nV5E0Frw1eQi0zRyM
	ti2Zfh5DvhN9buzmR+1mAk3r/2cz8WOO9sXH1m4jJIBS1K0dGpuy8xwfcXHXqIbfD6e7GLt+6aA
	x5KGWYwkLpmMIAXwjxGFKG+hF9nAQsppL3ZttQE5nol0N3GgIBzn7ScUnckbiTM1FzjYlFAfgcn
	l12s/A9bwAEj2oXeOzZP2iB2ZdOed5q2lOjGyEvxZwhoZEl/QdLDH1Dimq5+oc1cXriRxSc5cMN
	6njkHC4YtaX2o+dTytYJEbhSHMh8XLX9FuuYTWUV9wencUIXw+QbcGhNJJK5v6dzW+R2q0rJSrd
	tZfY5NaxnIbBcwHOe6ZnPlMQRCPJfJirmuotlCZEa6FcswKLDJbANXTuGKiMSKMRg2wyc+UlSOB
	/ES62MJR8cXK32tILFQc/szAbjPb7sDeCLjWMPmd44NmSazqS5ezf+pxw9dvGtCQTq00cLnQJzt
	6siP6AF2Hvd0FJrzUWw+ZTEir8R69vylckrVtZL3y7ACUdVEXbJk7/Hzr+FSpA7SqbTqghkZZ+X
	t6rJlNQrDxjvPlZZZHZACb5O0dRiuaWdB7J9y/479nawhyoLK+c7soSo+aEgBhGEneCiJ77UUHC
	RSOB1fhSDOpfBpJXSft7MXA==
X-Received: by 2002:a05:6830:43a0:b0:81c:4784:a5e2 with SMTP id 46e09a7af769-83094e738d8mr20216845a34.6.1792122356017;
        Thu, 15 Oct 2026 20:45:56 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm834402a34.0.2026.10.15.20.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:45:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 15 Oct 2026 21:45:31 -0600
Subject: [PATCH v8 16/17] dt-bindings: mtd: sunxi: Add randomized OOB flag
MIME-Version: 1.0
Message-Id: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-16-8ba4881fbee8@gmail.com>
References: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
In-Reply-To: <20261015-submit-sunxi-nand-vendor-oob-layout-v1-v8-0-8ba4881fbee8@gmail.com>
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
X-CRM114-CacheID: sfid-20261015_204556_928584_FEDC1CDD 
X-CRM114-Status: GOOD (  12.69  )
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
