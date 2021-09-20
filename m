Return-Path: <SRS0=k7nY=OK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08DDDC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 14:36:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A56DB610CE
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Sep 2021 14:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A56DB610CE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0NIOMT+/abZ1k56w6J2nlUuU0A6pusAhYlMj2a1Unrs=; b=UiXWgau8/AboVs
	ci4MGVY3HAQJ5TVBzXfnjNCWVOC3TLt7ItacwF0UU1pRLm8rav21PQHjBskbRMfd0FAatGcHKXdBM
	qz8dbXUMwslmW0mrA/lDGd7t3RgK6t0LEcJ9x4wJBrjYqUNN2AM2dggCxa4XFPK46zqaLbGFXs7C8
	M4zXmjEbnDOu9+C+uQoIwiY08D9cGnWt0Z1CtQPNknRNqqhWjkIvMXNs0QGX1AAYwxhrS5E1xhiIM
	mgAFsfuMyLupasogfZWne+rGwrKK6IiJ28xXPTM4iXc6X9EPpBZO3AEriy+rHF1GA0aM00hjqqRcF
	HKvuM0d+NQ9uLi7wJcbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSKOA-001xjZ-1u; Mon, 20 Sep 2021 14:35:22 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSKLg-001wVS-B9; Mon, 20 Sep 2021 14:32:49 +0000
Received: by mail-ua1-f44.google.com with SMTP id 109so11262726uag.13;
 Mon, 20 Sep 2021 07:32:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d1fA9sD4Re6cy9QvKdyaIPvjv83NrwqIwiME67fS8gw=;
 b=uOsE6ZyzJ/ZFAJT8yYI2/STSemRpSyhfTNdPFXgv9qHMZlSHFBOm4Ux9BCrye1QkYB
 kUzfkz20J+p7cn1O30mU5py2TX9QqmiHdWCGwzsTwMIZqKh0iXCOP1oE2lFG9tbp+8Uw
 ZqyWjacevKPzm1kPWAVoLgHTix7w15iyeihO87C94TUFFfpYRLz+6Hyq7tJdxxWcbEoP
 1dUf62cg96xsr8JdR2WWMSHpF7/Ds6nIlHBc7aoZLHeUoK33ImH2cZ0zaasyi8u+ZJN2
 1kLqnNNC/3JusRcPpKpOZRWxw6JllAcmcMcpd1Jr5rxMFUXfNwRB2+GAR3ORCBvVnlA/
 2b3g==
X-Gm-Message-State: AOAM532ecTew6w0HGrlBa9x+QO/xijAL5FSc646fpJX+wVdQZfI4jr74
 gs7RlSV9yCT+XdblHfZBhuNxMjKDp2PFl1sJiek=
X-Google-Smtp-Source: ABdhPJyMCIfZZUlLRlGgiTjNjprimvUPIgx9dDOJ6a13gJeOJZt/lIf4W4G47j5QN8TUNgkF0wEBIumzqn+a8381x10=
X-Received: by 2002:ab0:311a:: with SMTP id e26mr12181930ual.122.1632148366041; 
 Mon, 20 Sep 2021 07:32:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210920132830.152802-1-krzysztof.kozlowski@canonical.com>
 <20210920132830.152802-4-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210920132830.152802-4-krzysztof.kozlowski@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Sep 2021 16:32:34 +0200
Message-ID: <CAMuHMdX5vhihbKrXh4x_VyA2Cc=nR+53g_fZPHsuHVF56rBvMQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] riscv: dts: microchip: drop unused pinctrl-names
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_073248_431344_3ACB62AC 
X-CRM114-Status: GOOD (  19.36  )
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

Hi Krzysztof,

On Mon, Sep 20, 2021 at 3:28 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> pinctrl-names without pinctrl-0 does not have any sense:
>
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: sdhc@20008000: 'pinctrl-0' is a dependency of 'pinctrl-names'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> ---
>
> Changes since v1:
> 1. Add review.

> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -33,6 +33,7 @@ properties:
>        - items:
>            - enum:
>                - issi,is25lp016d
> +              - issi,is25wp256
>                - micron,mt25qu02g
>                - mxicy,mx25r1635f
>                - mxicy,mx25u6435f

This one looks like an accidental addition?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
