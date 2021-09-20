Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10400C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 21:19:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA0A161166
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 21:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CA0A161166
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nH6nBFcH968/OvE3BDO5TahImWM3hxS2L0NwDp3bo18=; b=qAWTmmgA4s/DmY
	siQkIuTAgtqhfGllrgP5Vf4TfTkg2bjNKnSwBRpXJhXpyYANz+FUyPCke+1cZOJ/B+ZHDNItV9PKH
	XtPWbV4E01c8xOKulhhcxjpiKEBtwaC6THs1l0/GdFv0IROe8teR0W/KtdznMsvZiAYa1KevI30we
	hifCy6DdN25d6QuDp0NT31d8F2nukt+v3tY6JD61+X8Eevew1AdW5s6fRhNaL4/jI1PuRkCGDR/Qs
	1OteKQa0awNgY8Ol2fiVqZJQ5kpfJ4uIaEgpeYgNjR/82FI0uKarOKJjj4nUQLMfFSdqIDsR8Kvys
	tSzhs2BNfmp6iCH8LnCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSQgx-0039hl-1p; Mon, 20 Sep 2021 21:19:11 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSQgu-0039gz-5t
 for linux-mtd@lists.infradead.org; Mon, 20 Sep 2021 21:19:09 +0000
Received: by mail-ot1-f51.google.com with SMTP id
 77-20020a9d0ed3000000b00546e10e6699so14382353otj.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Sep 2021 14:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aDwWZhZ+JqLWINJ9PBWjjprFme0I94GN+ZK2QmZSREg=;
 b=WY5bd3waNUJ7RQNGL2bYSjf35febZ5+WLmL6sVHTCoZh/pJcXENw7sZzzB4KdDIFw7
 4PnyxpJUwwn1Ts8Z9BnGo7UArR1u16Hj0XOvPa3zyHMDdE4zdnov9+vXI0nr6RVUmwJI
 0ylF/kKiUbTvdV7A5egxem5q28EDbwup9ZHC6ZL2BTQGByfl+xrFEMy+NxfLQhPCsdJH
 OArOnkZaQNwk8I/2fAaLFiQtEkc9RsoECUgBsH4NtlXLykV0JfURVqUnYraqpq5s4zql
 XCdRmvcRqYA0diEMyd2uAl9NfgHj/dvsxt93q+8Wp4zsqLCZr+pxBnUnM6Ysc8V3/nub
 4vXw==
X-Gm-Message-State: AOAM53054F20ZowdffvGwS5hcovVdYYY5ASnIlMI8paVyPWOJflJzjAP
 o6WES5JVXzvKZmD8mdDHLA==
X-Google-Smtp-Source: ABdhPJx3f4YFLCskuwGNYhf8vPy8jZ1Sjzlx0HNyVZO5/+wLIc/kmVv7xC42KpluZANdMdzendDhWg==
X-Received: by 2002:a05:6830:43a0:: with SMTP id
 s32mr22937285otv.284.1632172746595; 
 Mon, 20 Sep 2021 14:19:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id j17sm3737710ots.10.2021.09.20.14.19.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 14:19:06 -0700 (PDT)
Received: (nullmailer pid 785129 invoked by uid 1000);
 Mon, 20 Sep 2021 21:19:05 -0000
Date: Mon, 20 Sep 2021 16:19:05 -0500
From: Rob Herring <robh@kernel.org>
To: Apurva Nandan <a-nandan@ti.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Serge Semin <fancer.lancer@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, michael@walle.cc
Subject: Re: [PATCH v2 2/2] dt-bindings: snps,dw-apb-ssi: Use 'flash' node
 name instead of 'spi-flash' in example
Message-ID: <YUj6yUBx0xCY9QGj@robh.at.kernel.org>
References: <20210920142713.129295-1-a-nandan@ti.com>
 <20210920142713.129295-3-a-nandan@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920142713.129295-3-a-nandan@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_141908_266839_2C9B8E30 
X-CRM114-Status: GOOD (  16.71  )
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

On Mon, Sep 20, 2021 at 07:57:13PM +0530, Apurva Nandan wrote:
> Change the nodename in the example with spi-nand from 'spi-flash@1'
> to 'flash@1' to make the schema uniform with both spi-nand and spi-nor
> flashes. jedec,spi-nor.yaml uses 'flash@' nodename for spi-nor flashes,
> so make the spi-nand examples in dt-bindings use it too for uniformity.
> 
> Signed-off-by: Apurva Nandan <a-nandan@ti.com>
> ---
>  Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Fixes should come first. Maybe Mark can apply this before you respin.

Acked-by: Rob Herring <robh@kernel.org>

> 
> diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> index ca91201a9926..d7e08b03e204 100644
> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -171,7 +171,7 @@ examples:
>        cs-gpios = <&gpio0 13 0>,
>                   <&gpio0 14 0>;
>        rx-sample-delay-ns = <3>;
> -      spi-flash@1 {
> +      flash@1 {
>          compatible = "spi-nand";
>          reg = <1>;
>          rx-sample-delay-ns = <7>;
> -- 
> 2.25.1
> 
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
