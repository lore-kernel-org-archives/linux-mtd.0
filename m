Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AF5606D80A
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Nov 2026 18:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IoxCK0hB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=p9yrIV90;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=plYZu0hj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3c6DXNWiEVuFzBYH1W8QwCW337+jYMtmIIhqBPIR1t4=; b=IoxCK0hBAg0jlS+MbNIXBHJ3mC
	lS8AWRSrKVTGUbinPDH17pU0v1eRWsK3Tg0vqjSBHvzYqrnWU47eLE795jjpifFwgSh1AI0ZDM/As
	P/j8ULfW54uLJr8czIEyext07fv2WW89wPsuGlqsCeBrJUbAjdtgoZprc8wUVWKvT6/IAVnh5Fd6P
	LDJkpv9zIPnmP3d56lvqayZH6AqYKl5vrLC9tooV0jvQ0soQLOrIuyQK8Djpjt2a3M3jcUygAiDJt
	0mwNKmIi8FZVJuW/yBCPbVHzHUT7KUBYOJE9BbRyYcRGr8LT0tMJ2jLX0y0mqDWY9B5LJU8KD9JYF
	iw/62/pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2gV-0000000AFnA-2woJ;
	Thu, 05 Nov 2026 18:59:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d5-0000000ADYt-1WBX
	for linux-mtd@bombadil.infradead.org;
	Thu, 05 Nov 2026 18:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=fuAnLXLxkTRIWi+f3sZBwdM4q2MUL37Wpqf++mUfWMk=; b=p9yrIV90h1ZpIG4YzD8jAUnCt9
	HVyAG68nUwE60LPykfR71VmyzM7sbQu41EpM41CQIQ+5C+eDPxFwU1jtRN9JBDE/5n1Y5PUITaMoF
	BGO1mC4iuC/C+b2ba8DjXnMSuS7UIO0oX9ko4t0OqxgZE2ExaAcRuO59Au7JJXItN9Tbz2QL3v7bQ
	boucb5HzvkUuVosI+/oONEAUfy37BiLxwqfQIu9IsXweP1GhvnRdmFBtc+5C5uA3UllRM1LAEWqnD
	dIdLZTA+JZj4SO0Q63Y/kh5WgieFwkE0psZVFiYQcgSRkB0VzJts41L8jPvPz9OmJXpDN/o7GqV8s
	lQn2xOeQ==;
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP2d2-00000003R4R-2TE4
	for linux-mtd@lists.infradead.org;
	Thu, 05 Nov 2026 18:56:06 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-70b875f6f1fso2047576eaf.2
        for <linux-mtd@lists.infradead.org>; Thu, 05 Nov 2026 10:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793904962; x=1794509762; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fuAnLXLxkTRIWi+f3sZBwdM4q2MUL37Wpqf++mUfWMk=;
        b=plYZu0hj92Ytk17GtC65jqg7JT91qr29BjChJUgvkhrxvT9MglGMhS2+B/dSHLBw3+
         xA8atBrlR5XkWLrg1gsMDIuLwDQlbGF37524G/YrOAtFseIWs1hUyY5ZgQ1HVitPlv92
         FbqoBeU56hCSes9ncHSkvjWAogTmLj6HWe3FIeCSiBwlYQVZ/5JjjZrea7b87Yo+gHsG
         KUKRdvDma7QrKDfSeI7pzxct5+gP1F818rF/acSeoX4n8WbbX50TUnnCBw0SzvVU6Hvh
         XxKd1roWyco1zpLkv3g2NDJOCX6IjZy3U6szZs1BhD/9TM1GgVimKqI1piUpEo5EwXy8
         JhZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793904962; x=1794509762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuAnLXLxkTRIWi+f3sZBwdM4q2MUL37Wpqf++mUfWMk=;
        b=jIjXAFzB87jVG51nUVjKTznqjEb9g59Zzdej0NBZjs9Xeo+o/l3rHufFMuhJse8rsj
         HGyZYtuN2/Q/e+coaMPxjzZo/USLeOOJ2gYw+0C+XncHzkL4gzQuotgvsVSNe5HzzXcX
         cdtB0RQNQlOVgYjvsjAvyovi235vlhUBIjTzAT4lA9R+Kjh1F0RDQ4DQUbBmQyTFzGwt
         EMjR/4lavVzwvei7FTFFZok9D5TKlOLSKDebcuCQ6UwiFjN4AEFS1ieLgVnrdYryocEQ
         bIb8n22VjgPpaHUZe+aDVJeUAYMelsOijYA5FTUN86KSu42bYgbtyPuGU1zXlKZbsteh
         LDAw==
X-Forwarded-Encrypted: i=1; AKwUvBwM5XGJCb8bdd/2Bv16AyrJ/AqkxziceBuEKhuuqJOm2VX9B2p0OhuKiClmpzkg4rr79YhSNYeoUqI=@lists.infradead.org
X-Gm-Message-State: APuU4Z9MkQHy4YutPPmVlc/3I6Xi4z5hgQ3RkHXrt2dKgq6tQg9CwV9L
	raY8qiaf6NQiAgEuM4yWwi6RnNVwSTpY8CkAkwbCiVccOrBHP2R2h0az
X-Gm-Gg: AYBFou0MtqSv/nyVE2EbyFvn6N6TDSuQMcLfmU9ECE97LM5Z13FrlCuXycMyJbKdZsU
	UdL4p12ZDJ59acxVVy4x3x9heSN55yHAGp9Bpi8Xx9xQgrF1k44mVaMIyhjNDVAnhISIrqLMx4z
	MIJz3D00WbCfXj9m/6aXQoJ9UzbP0BlE+xzIU6ckb4WSXbLB1hr2wbvzGlPOQduFzQXrqKA5Dx9
	xUYXQKUoU8NzGsjh0MVDFwts2vq55+4okdVm4OEaIvkX3ouAw3CJSAT06KB5A3NSAF7NzaHpCA7
	g92cPvhl2N8rEJAsX/vTWU62tU6/poW2+ca171dNbuLn8lFr/60yIuCWkEP074q4Szk6Nyw6dGF
	SrtJv8fQ6E2aHHFJ7ZUZXGDwJZtCEZ8H/hDudTe7TmwGhgA7Rz0tSY6uS0+royvPN1aP0s74v2n
	NaHxYgEeXJYo+oyO7S76qUJwDKOYSVhdobhas/IGVb2APHRzw1THKiJN+nle1Vnf40VGjSTjTAI
	BDF9I5xcpm7LfSiok2trm1Pw/kCMeKN2OvEaJLvl6E4WZpYGSOrIzA2V6oKEu7uWW/5maaFEkEC
	m9wgpAV6J92RP1MZ/f3LNpTbxzW80LlFtDA3xbfAhEbW23ZTKiDUhJhJgYRbYRJxw5VFw8yrO0M
	moJhfrJhniHx6oGlAAc8+sFfn1cMx7fV4vWX4j/d7nz9ygRlYG0TouYL3ph4selURkKrN+3mMNV
	hMQjr+qG9F38H0rUBrJGQJO44tN2Vrg26ueBT48lsfkkHh25yuk6BH
X-Received: by 2002:a05:6820:c91:b0:706:50ad:fd7f with SMTP id 006d021491bc7-716e7b33226mr291273eaf.87.1793904962431;
        Thu, 05 Nov 2026 10:56:02 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-716e99465dbsm115897eaf.0.2026.11.05.10.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 10:56:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 11:55:36 -0700
Subject: [PATCH v10 20/26] dt-bindings: mtd: sunxi: require the H616 AHB
 reset
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-20-dca1f6ed29a8@gmail.com>
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
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_185604_624898_B1CFA2CD 
X-CRM114-Status: GOOD (  10.49  )
X-Spam-Score: 0.1 (/)
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

The H616 NAND controller needs its AHB reset to stop internal DMA and
restore data ordering after an aborted transfer. The controller's soft
reset alone can leave the next read displaced.

Require resets and reset-names for the H616 compatible so the binding
describes the reset needed for recovery. The existing H616 SoC description
already provides the named AHB reset.

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
