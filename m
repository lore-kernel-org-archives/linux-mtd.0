Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428B7C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 07:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6b3E6TmafovmASYOTabcJuYm0SULTYeW7nmt7dZicPU=; b=BYjc7wk34XPuIa
	vkp0AInhMXN9RVINM6mzgdbWbHAZE5qy1V55B6+N4MbnSMmDEHKo3CWVZvVbaUD6tWQei/DVmQ8uK
	8xbdFqV4f9qMTFb95oGr1MIjEGjGB8TXv+yaqM4405bZC7o7XPphZ2gScNCug0AfL5IXFbU1QQbWz
	1o8raJ71aOCxxRignGb4wItgiYOb7SiMoM1QXtXd55UANCbn/jQbvPv6fmGBHLmuWZ0kKpPnF3gy5
	msGpTF1MZGqxJS//xc+wQDxImh+B2BWh0U077BYyWvjjorLMMCxwg0HZMgQbMRuOXzxRC+YSop/g5
	WZV2GP4Duy5f0TxKIZYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfGOI-009B9b-2J; Fri, 15 Apr 2022 07:29:14 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfGOF-009B8e-9R
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 07:29:12 +0000
Received: by mail-oi1-x22d.google.com with SMTP id b188so7716399oia.13
 for <linux-mtd@lists.infradead.org>; Fri, 15 Apr 2022 00:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sbIMr271cmn6ZzuRI3nbnuj6zILsFRiHoTF1eSBmRpw=;
 b=elnI+MJOSQ5Wt24HDoGCPEMZBOHoUtiIh10WHeUIbcFcUFKnrkRfMcEZbwaF/MSdX1
 SxhO2zN79ttE0loQ0LadOaXj0AZxzBSJk69gwex8gOVAPEtYTgQuCvYO8uDN3Hze0SS7
 UeolHwVgMH9YghMWrHVYWXm28KZ9h9jt9MGh1jezZYKUEIIWsrnKFedrOtWj07XJrS2L
 79tsLPePCIRqMqBPmx9Bb/eJUF8BBghPfgp0clU5Z0BG6kBsDqvVGLX+SAw6Xq7uE/Oy
 HjrHkgzTSd3Q9gIyKJWrXKkgiYnL5Z/uqoZ72UuHvkW5n7GUEggJgd7BxJgThfuHyR0M
 UQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sbIMr271cmn6ZzuRI3nbnuj6zILsFRiHoTF1eSBmRpw=;
 b=JMgggc1ODm34Dor/jm3RnjpdLHHhc4hpQ/TxvhP+GTsd9HbI2UER8OjgN2WXU9bcTv
 ttApoyHFfNxnY+i7mFFvnl6FVDx1wue8iZ4dPkp55UoRCgUc8vDMwhy5IFSJgqMrfMGE
 byIwz5T/19EibeQQKNujK/arKfsoNr31PozYRRHJb7Qv4in+tWevuP6C83P9eTvyFunp
 MxWctdUlEcsyuijioP0Yt78jTEuRw9A6c0ZXNjYMZ7kuMAv8IKd2hhL+xmHdv0AAB8AA
 y5gdTeV888l/PYQyJ05dA1L3h6tihDP8Sr4jHIeSEZC+ugcAUQnKwMwXnNLCd8n6OcQ3
 NiPw==
X-Gm-Message-State: AOAM530ohlZXueJztkIkvuGUOAxUaJGnj4ewfdW7p1H/kyimqw4xUaD3
 4FYyqKMt9E7Eik5tNqfOeHTHT21CFIjibdJHKI0=
X-Google-Smtp-Source: ABdhPJyDql2TgAh6NQrOzqQCNI9XwI3L2UDtGcp6OXunw6CeCHJ4ZwFCHWXsK5cHYTcJiZzal6Zl9nsxwJjkmSJuA9c=
X-Received: by 2002:a05:6808:10d4:b0:322:2f79:bd2c with SMTP id
 s20-20020a05680810d400b003222f79bd2cmr1085461ois.53.1650007749099; Fri, 15
 Apr 2022 00:29:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220415034844.1024538-1-gch981213@gmail.com>
 <20220415034844.1024538-3-gch981213@gmail.com>
 <20220415090058.5044ae17@collabora.com>
In-Reply-To: <20220415090058.5044ae17@collabora.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 15 Apr 2022 15:28:57 +0800
Message-ID: <CAJsYDVKbm+X8ARkgH6z9T0JaZ=cYkG+_3m-dtsbgAwWCrZeO8A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mtd: spinand: add support for detection with param
 page
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Mark Brown <broonie@kernel.org>, 
 Daniel Palmer <daniel@0x0f.com>, open list <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_002911_389159_224C0611 
X-CRM114-Status: GOOD (  23.60  )
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

Hi!

On Fri, Apr 15, 2022 at 3:01 PM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
> +#define SPINAND_IDR_EN BIT(6)

Looks like you're redefining CFG_OTP_ENABLE, why not use that
definition directly?

Oh. I didn't know that was available. I'll use it.
(IDR_EN comes from a toshiba datasheet if I remember correctly.)

>
> On Fri, 15 Apr 2022 11:48:43 +0800
> Chuanhong Guo <gch981213@gmail.com> wrote:
>
> > +
> > +static const struct spinand_manufacturer *spinand_onfi_manufacturers[] = {};
>
> Do we really need a separate manufacturer array? Looks like we could
> re-use the one we have in core.c and do the matching against it (we
> just need an extra NULL sentinel to detect the end of this array).

I'll do it.
I'll also add a onfi_nchips to spinand_manufacturer to share the same
manufacturer entry between two types of ID list.

>
> > +
> > +static const struct spinand_onfi_info *
> > +spinand_onfi_chip_match(struct nand_onfi_params *p,
> > +                     const struct spinand_manufacturer *m)
> > +{
> > +     size_t i, j;
> > +
> > +     for (i = 0; i < m->nchips; i++)
> > +             for (j = 0; m->onfi_chips[i].models[j]; j++)
> > +                     if (!strcasecmp(m->onfi_chips[i].models[j], p->model))
> > +                             return &m->onfi_chips[i];
> > +     return NULL;
> > +}
>
> > +/**
> > + * struct spinand_onfi_info - Structure used to describe SPI NAND with ONFI
> > + *                         parameter page
> > + * @models: Model name array. Null terminated.
> > + * @flags: OR-ing of the SPINAND_XXX flags
> > + * @eccinfo: on-die ECC info
> > + * @op_variants: operations variants
> > + * @op_variants.read_cache: variants of the read-cache operation
> > + * @op_variants.write_cache: variants of the write-cache operation
> > + * @op_variants.update_cache: variants of the update-cache operation
> > + * @select_target: function used to select a target/die. Required only for
> > + *              multi-die chips
> > + *
> > + * Each SPI NAND manufacturer driver should have a spinand_onfi_info table
> > + * describing all the chips supported by the driver.
> > + */
> > +struct spinand_onfi_info {
> > +     const char **const models;
> > +     u32 flags;
> > +     struct spinand_ecc_info eccinfo;
> > +     struct {
> > +             const struct spinand_op_variants *read_cache;
> > +             const struct spinand_op_variants *write_cache;
> > +             const struct spinand_op_variants *update_cache;
> > +     } op_variants;
> > +     int (*select_target)(struct spinand_device *spinand,
> > +                          unsigned int target);
> > +};
>
> Can't we just extend spinand_info instead of defining a new struct.

Yeah, that's better. I'll do it.

> AFAICT, the only difference is that model is replaced by a model array,
> and devid is dropped, and I think we can rework the existing ID-based
> matching logic to return ->models[0] instead of ->model.

In fact we don't even use this model string anywhere at the moment.

-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
