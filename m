Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35E3C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 08:58:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 726C161AF0
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 08:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 726C161AF0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zEKU9kvhqFmjWuJTAXqfD0QlhuU46aiINsL/OjRHCvk=; b=QrTLWZqFf+6Lr2
	pHW4BAhxGnApx+WBfFLtuJhxRhZsKlkQPTa3MVpXqdcD/t1EKhHIMlb0qM+vM4Wp09ZusSSM6qDO+
	cWS7DpzM80WLtfKWCbBxtXDjJ4U7sIV/cwbR43sceRAklahgm/3xE0Wo4WVMjWezfgzdcYbIUgYma
	trJpVw9vrCG7PgSEwtSLy/yA8MK5vj2TW92JDf66HZyKOvrbLdUJGGRdjumncJvBdWdIQI5FCR2LG
	rzi0XuZcCSuo6A9cfglI5P+kwco18SVIDj14fY3qOLNjBbLl7XBGA7ZZk13xhLXqeabQD0tWH2UuK
	Yb1Iw82gwpgzGaOrg+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnziD-009rn2-TH; Fri, 19 Nov 2021 08:57:37 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnzi9-009rkm-Sf; Fri, 19 Nov 2021 08:57:35 +0000
Received: by mail-ua1-f46.google.com with SMTP id n6so19881923uak.1;
 Fri, 19 Nov 2021 00:57:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cDmEtlUJW/U2TV/6uXra9mxD+3D+ySGPKfAlnRkVzM4=;
 b=gbGFdEBR0Duql8k716TLaC+MjpT/meXJcn4AzSStTI7pyUGy5o6PUgkfpPRYW/gRqy
 BVHzSEKFwHep3gVXyU1QutbPXuAagvNLYsiezBwMUYQ0AbD95X0VhYKWWheU/8J9MIQs
 4Jqo1RZm8qnWfrRA3ho0Bp65kY1fsr+EFGZQ8w6YcrWsFHArhdxW1yot2icVXL4cK2BU
 +nZJaGePCsqx9pEG8r7VAzKxAF5jTV6zIrMRQaxp2TFDFQixDVwbDc7oAbr+ZIHYG3Cq
 TstvQUyIH1kyh82HxVvz75G/jwwBATQ1OYa0ylp+ller4oAziSR4YGR9N4XIe/Q74NeJ
 ZQ/Q==
X-Gm-Message-State: AOAM532h4EtZdTfcE4/Sp9KLqv6JLkIONe33YMr3sSXUtLHfkIyC5+/n
 CFunhDCG8GUWaBQ1gu53vWf1wGx+3MgIcQ==
X-Google-Smtp-Source: ABdhPJzECl9IcQJ22qJn/R0be7yuC6lbvL4YpW4IMEv4l3wCNPjmEauB8IJoYvOA9vlSRLw22LwzBQ==
X-Received: by 2002:a9f:21d7:: with SMTP id 81mr46737879uac.39.1637312252304; 
 Fri, 19 Nov 2021 00:57:32 -0800 (PST)
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com.
 [209.85.222.46])
 by smtp.gmail.com with ESMTPSA id s10sm1320656vkf.9.2021.11.19.00.57.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Nov 2021 00:57:31 -0800 (PST)
Received: by mail-ua1-f46.google.com with SMTP id w23so19813424uao.5;
 Fri, 19 Nov 2021 00:57:31 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id
 cz16mr91656903vsb.9.1637312251119; 
 Fri, 19 Nov 2021 00:57:31 -0800 (PST)
MIME-Version: 1.0
References: <20211118111940.1275351-1-miquel.raynal@bootlin.com>
 <20211118111940.1275351-4-miquel.raynal@bootlin.com>
In-Reply-To: <20211118111940.1275351-4-miquel.raynal@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Nov 2021 09:57:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=QgdrVHZXcZtQvtx=BUrugM6sPynt4EXMyA3=JxUV4g@mail.gmail.com>
Message-ID: <CAMuHMdW=QgdrVHZXcZtQvtx=BUrugM6sPynt4EXMyA3=JxUV4g@mail.gmail.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: Add an entry for Renesas RZ/N1 NAND
 controller
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>, 
 Michael Walle <michael@walle.cc>,
 MTD Maling List <linux-mtd@lists.infradead.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jimmy Lalande <jimmy.lalande@se.com>, 
 Milan Stevanovic <milan.stevanovic@se.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Gareth Williams <gareth.williams.jx@renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_005733_980925_422640F4 
X-CRM114-Status: GOOD (  19.60  )
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

Hi Miquel,

CC Gareth

On Thu, Nov 18, 2021 at 12:19 PM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> Point to the driver and the bindings.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your patch!

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16004,6 +16004,13 @@ S:     Supported
>  F:     Documentation/devicetree/bindings/iio/adc/renesas,rzg2l-adc.yaml
>  F:     drivers/iio/adc/rzg2l_adc.c
>
> +RENESAS RZ/N1X NAND CONTROLLER DRIVER
> +M:     Miquel Raynal <miquel.raynal@bootlin.com>
> +L:     linux-mtd@lists.infradead.org
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/mtd/renesas,r9a06g032-nand-controller.yaml

.../renesas,rzn1-nand-controller.yaml

> +F:     drivers/mtd/nand/raw/rzn1-nand-controller.c
> +
>  RESET CONTROLLER FRAMEWORK
>  M:     Philipp Zabel <p.zabel@pengutronix.de>
>  S:     Maintained

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
