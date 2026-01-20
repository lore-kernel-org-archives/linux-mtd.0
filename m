Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF79D2ED0F
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 09:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u74bdzr5g3Pb/+ABLLKIfTHrdUx3VLU44wKIxd+R+Dg=; b=fZupzGBB7L9MCV
	wluILv0TcsAVYdrJ1qB9x2dlG22hqm2p/O3Cm7FaPzlcarXIds0K7uR0ZSelmTn8n85rU9fFgrLgx
	sC0bgYEtfby9gCnhsuwpI1S8W5Artu34+5teAXP4igq/HvLPqrG4D1ISbx5dbL7xwaL2wqt7Y/qUz
	vQPGg38FgqmsNTKhEtLtas2jYVJvzU0xIHogm9KLMIsR1nrQzRXzi/p2r+pYU9g0weTRKtNLrNCDU
	wt9oWly2tQwdRoyIX9ChB/6+hUURlVKhzFR/0k62kSpiFP+2RJz8hnljvx6+KZ//DZRJlRGGIMRwz
	kImJ3KrE7NBosLsoJ4Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7eu-00000003VC2-3RAJ;
	Tue, 20 Jan 2026 09:04:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7es-00000003VBg-3XQN
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 09:04:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2499E437C9;
	Tue, 20 Jan 2026 09:04:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76EF7C19423;
	Tue, 20 Jan 2026 09:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768899858;
	bh=MN5D24zEMc520dPM1Py+TMz+LPimSRzyHfeoCh7ZTxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ET65+//jCX2UscF/MXtNYdgDvtYU+QIshghTZcm7TU9MCv7h0zskb2NNv7IKB0sRd
	 IZRfKjZvGU+oRp+Owc/DxXnUfEG2tXcfQlmCZvh06T7yFmD0MCSzUTl2HvDfd33t63
	 n5GJAbGpCRP1h4mFxGBBpEarmrefEFFpsEYpkCYdajYEk5jNzxzQw6Kr53gFvHX/NH
	 v0gihRwE3CL8+T0d9pW0zpPR04X/B35edwgSgdaViPpTLKF4a/gZozs2B5ot6e/o9x
	 97MuczfNqrrP2mQWj+hZLr/DgHVEeylDkcJBKVBnv658LZI6VvKwJoxstPIuXTNAh2
	 gF/9GOfU6RpqA==
Date: Tue, 20 Jan 2026 10:04:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>, 
	William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, David Sterba <dsterba@suse.com>, 
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Simon Glass <sjg@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Marcus Folkesson <marcus.folkesson@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Roger Quadros <rogerq@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: [PATCH v2 10/10] dt-bindings: mtd: partitions: Combine simple
 partition bindings
Message-ID: <20260120-origami-lori-of-genius-8fd944@quoll>
References: <20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org>
 <20260119-dt-mtd-partitions-v2-10-77ebb958a312@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119-dt-mtd-partitions-v2-10-77ebb958a312@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_010418_908368_8DB90AFC 
X-CRM114-Status: GOOD (  12.56  )
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

On Mon, Jan 19, 2026 at 07:48:31PM -0600, Rob Herring (Arm) wrote:
> Several partition node bindings are just a compatible plus properties
> defined in partition.yaml. Move all of these bindings to a single schema
> file.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> -        partition@200000 {
> -            compatible = "tfa-bl31";
> -            reg = <0x200000 0x100000>;
> -            align = <0x4000>;
> -        };
> -    };
> diff --git a/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm4908-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm4908-partitions.yaml
> index 159b32d12803..a6edf145df57 100644
> --- a/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm4908-partitions.yaml
> +++ b/Documentation/devicetree/bindings/mtd/partitions/brcm,bcm4908-partitions.yaml
> @@ -29,11 +29,7 @@ properties:
>  
>  patternProperties:
>    "^partition@[0-9a-f]+$":
> -    $ref: partition.yaml#
> -    properties:
> -      compatible:
> -        const: brcm,bcm4908-firmware
> -    unevaluatedProperties: false
> +    type: object

I think this is not specific enough now and you should have here $ref
(e.g. to simple-partition.yaml) with unevaluatedProperties. Otherwise
schema does not report:
1. bogus properties in partition@ nodes without compatibles (like the
   first one in the example),
2. partition@ nodes with some other compatibles (non-partition like,
   e.g. whatever I2C device stuffed there for which there is a schema of
   course)

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
