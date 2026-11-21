Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AC9606A337
	for <linux-mtd@archiver.kernel.org>; Sat, 21 Nov 2026 01:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cUmUCwVY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wifND194
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BQ39NmDQe4evOYx2hOFzNO4384NKwbfI7qrlqwwh8aA=; b=cUmUCwVYOPRHt4THtiWN8iGq9Z
	T1bG8k2kmlDwcRqhlQYFtJsav7tbS+O9KhvdkYiKrJYvKYbx8jFZEwVBL0YragBTCH17bmiTqb4rw
	1eaFro8gcZLGnDl5i+6K6F9ERz9OC1Il6iCfY1kTtPKQC/kuggmXzLpuNL/iCwdAYseKGfWm1mhR5
	9BbGvRPdAelHBrhblgTZT6qkQJZw1iY1/0PSQud31Rb9rrlOpIwtQAGrtGBGTSUIcyZ3gLAOLKuhG
	zJd3UZBpn/WhG/JoHVKd/hzbJLn2MO0cIRJjeMSCW33c2DnMCf/KYBp5g7UGUGYyz8NIhWLvd9//8
	TSTv44/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZg8-0000000Gbdi-2vPO;
	Sat, 21 Nov 2026 01:14:08 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUZdY-0000000GZcv-23zk
	for linux-mtd@lists.infradead.org;
	Sat, 21 Nov 2026 01:11:43 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-55650fe1f0dso924897b6e.2
        for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2026 17:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795223488; x=1795828288; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=;
        b=wifND194wwqqQlTz88eQK1TpjcT9i1YSvwNfW+B69b4jVXhU4+GSW6TuPOe2QW31w7
         YOGKNvrD/hLgr2dt+nNawpfio/HIjp1A/5L+rNFP2nusQdmwdwYpaW+FmkrDeJOU2AQQ
         8NTGmfL26uT7mjzddq+v45RSsIBWrI/0fJrkJ1mO9o1CgQyldV/9TBV7oYn0QcbKMOWU
         rVZuvL1F4fzkiy9FZCw+DXhPuLyvBwTyA06qyy3/I9l1ZxyNha1YB8F1FubhmflPeT/2
         BsbRIEGoBrloNxAKDdrSYbliYJUMYbYOVHKSwGabdb7YsZg//8Ofm4MS5WfNaa0pB82t
         Qv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795223488; x=1795828288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8wmwptSly1/jnXieQYc5MDUwaGqVqpFqBShPCzacVyA=;
        b=yXMpt2dUMAzFxaQfsUVvdA1ephKb8YV0pTbUAk0q0rWbaOCbiykmgiKVTMrqwL+17U
         Avwj39dptYghQMffynHJdXj3z9/pD3IpjAhcUSZOuGhekdNiAij34/t3RzFILcezgHwP
         O1K/xXMGRE/SsksJbnx6M2RvXnfKlD7OhNUWgMkVSttpsu5zjIcsE5rLBKUpgtxZMbM+
         lp+scTOtQRHyIJ/GKnHbzTkgVCMeE3NSwpBrJio7TPhIe4IvRK3FBp++WsxX6o1j1y+f
         Uh5EuIQ05V40tgzJVk4eVmtGdeUYTR4L069678Np9tmfT8m5udyht7Y+mbfZqc5mngVF
         yg3Q==
X-Forwarded-Encrypted: i=1; AL+hErFjBEFXDykPiatWSNOvy1P+mhkyn9701YBt7pU6oB3kns5JBjy9NqZnbegDRjQJ8vdiIu4eXIVHw48=@lists.infradead.org
X-Gm-Message-State: APuU4Z/ZGUyhTp7ghRgAN/zBl/2EYdYjXxWXUfXgxhuSxweJ5bnuNLm5
	Fe3grG9OBnMRPq5I+oa1fLRISSlNKjG23/D3F7jtJ9UThNuqmX9tz9hD
X-Gm-Gg: AYBFou3IFfIAQhDZCY8azup3yqFphEiNLzh1rnIwFsAsd1Z9Pf9xoHXBfbFdcZHmdms
	AtMMq3XD7NCQxTzBTi4RwatLbmmmMOjO+9SagwNjiTPEP+oTysfxfKr5vfH4EU8UqlvLDPZQrDq
	bjfbEfbG/Qn2aULWTLCnuZCQz9guEW3lkaDecXk+tzoW3kzDJ1oDdWA9l1dHZv3ymkYVG1KHWSw
	PRofNVb8R2DVnXw5GdJeuhvRptQi3SxKZsU/lI/SsIeWUhEOR3+70ft6gYQFI/z/grEcEDch+y1
	ByRrSVYYISydGTg3Lv7ESmj7CnWqvw2ttvpWwfGyJC8shpUswOk70AnRQrgCn7EKGw1JChlGGAl
	Y6Uzi5D17hHYBNUzirncHf/kGgZKwVR1SrEDfOXIBcrzlomqLJLkXv104KLNrZO6Ek0Cp3ovuar
	91eyw5aOz01F5/OudtWNnAG4G0p/S3olCzw1zBjMBbF27agFlBHVus/XLzXP9fdpRVxA248EU62
	AfJvagdnvCDHnNGE/Bd4CL7EE//+u2azR+Xy0bPv773xsSA4qmhfpnRORA2yDqJ+FjZoUJDPH0s
	t8++D1AP5rEVPMass04gSG9NjqLCjgHyMXjKkMMMWl6QmVc2qjpUFk/PzETja+Ohp+4KiuoJdsi
	gZ3Cn0n8tiFIh4jPKvOrCxOCpWP5mscAOJsAhMqmSissrQ7vLzYeoOkxF/EqiqzKcxfaMRNnW74
	g27yiw1Lpo/cb/Dck2A00whfa2RGow19YdtlrYeCAjwSk/ydXzYA5u
X-Received: by 2002:a05:6808:2220:b0:572:e8eb:36a6 with SMTP id 5614622812f47-57a0bc9d273mr5655190b6e.56.1795223487680;
        Fri, 20 Nov 2026 17:11:27 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm3291532b6e.9.2026.11.20.17.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 17:11:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 20 Nov 2026 18:10:46 -0700
Subject: [PATCH v11 23/26] dt-bindings: mtd: sunxi: require the H616 AHB
 reset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-23-9721b1905ef4@gmail.com>
References: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
In-Reply-To: <20261120-submit-sunxi-nand-vendor-oob-layout-v1-v11-0-9721b1905ef4@gmail.com>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_171128_976555_5EBA0C61 
X-CRM114-Status: GOOD (  10.27  )
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

Normal NAND reads and writes worked on H616. Fault injection exposed a
failure when recovering from an aborted internal DMA transfer: the
controller's soft reset could leave the first subsequent read displaced,
sometimes without an ECC error. This was not observed during ordinary
I/O.

The controller needs its AHB reset to stop internal DMA and restore data
ordering after an aborted transfer. Require resets and reset-names for
the H616 compatible so the binding describes the reset needed for
recovery. The in-tree H616 SoC description already supplies the named
reset. Older descriptions that omit it were valid under the previous
binding and do not describe the reset needed after a DMA abort.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 9d061e2216cb..ccf616fabc91 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -119,6 +119,9 @@ allOf:
           minItems: 4
         clock-names:
           minItems: 4
+      required:
+        - resets
+        - reset-names
 
 examples:
   - |

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
