Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C2DC004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 14:33:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B45A2087F
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 14:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M+iRokMZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2B45A2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cujChGNDNjyXPg0M1ABauDgz0wlgvJjHQP1erj78sVs=; b=M+iRokMZ/z/Ur3
	gb6PjDwLAetu6SDxrE25qCB7RiT0zJz3w0d9X1MQAw8jFWmnwDjoaTzq0NMss1M4bk/ecv+b75NQn
	2+5x123sPNnesGW64iJO7priGN1+jPdo9rUyB2hwRpp1MWs1o+/e+/K/WPibruTHeyw7uuuaPQ4Y4
	3N3nnDffgILXIr7Mq8EdL6PwKpTYz2X+d5xz4WG3I4OrPO+Yz+AgYLNQ0xiu/cayPoQOUe85kgREo
	nPfzNmXcHCsxKe3v5ycYqsfQxyovnVVRqfdd3uLLE8Peo9xtkVXJrCaFu+FFdSnazzTzKmfCNXWJw
	mMAyeuGKTUhWvhjX8NTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO1AC-0002UC-FC; Tue, 07 May 2019 14:33:48 +0000
Received: from mail-ua1-f67.google.com ([209.85.222.67])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO1A9-0002Tt-6s
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 14:33:46 +0000
Received: by mail-ua1-f67.google.com with SMTP id v7so3793891ual.6
 for <linux-mtd@lists.infradead.org>; Tue, 07 May 2019 07:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2+nW9Fa/RTU+kRi8Kjd9YcSYvGzElthXAVs65d+tibQ=;
 b=WXtbmQANEqIyLphGR9HuET05SyOnvvpXlnrsA3jq6fwe4AmvcmBShadvUAkrr1YrX5
 2beN7VREQpC307Us22B6sCnJjtp1CRYTWMwDd37CGhPGZ+ApxgrwZYcx8nBH3rctvBP9
 IRMhqyh5I9fMzYACQIPo/msgPSORDVp9FtIsUtTuwif1tuplKLIjJBbVVyi7veVEx/AT
 J7GnYC1gF5fvWQkoxvCXUNwu7FHVRWf+CRSAh/6Xu/CKCTXBFdcgb66S2LUM/GRJaxy8
 49rb91kOpw50MsiGFoK6LEiAwMKPrGS6QcovDWkDO6OC+vXEausTtV3oXNx0uGzOZe6K
 uKmQ==
X-Gm-Message-State: APjAAAXfim6akC2zRnd/CpOpJEdnXRqb2kAOYrYvr1+R0V7J7P9J4MWI
 LFdrva3YdZXKT7J675JHRTwZtgUPg96sSpIRLDo=
X-Google-Smtp-Source: APXvYqyRJBFuMI4/6SrePGR2PEWd4v4APR9kNxFQAR6mYPQ+bUkCVpjNeBgKi6yNF0zZO11+y9M34blQ2ACJ2/i1JBE=
X-Received: by 2002:ab0:6419:: with SMTP id x25mr16594003uao.86.1557239623947; 
 Tue, 07 May 2019 07:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190320071605.4289-1-jonas@norrbonn.se>
 <20190320071605.4289-3-jonas@norrbonn.se>
 <CAMuHMdVH85iFJngkU6W61ybwR2j3YQ7=cugPxgC57hUgBOc5KA@mail.gmail.com>
 <1f33e1e5-d7bf-76a0-c4d3-ecbc35fbfd4f@microchip.com>
 <CAMuHMdU83vLeVSqMZuJwR4yd382mau-OE1saMAOC2+6HodsHvg@mail.gmail.com>
 <fac5fa6d-95e9-cfb0-4d5a-6b16d4470190@norrbonn.se>
 <CAMuHMdUEdNr5rgCdaGAFJ-WK4oL2DC419smk+QYOJ7qJvkWA8A@mail.gmail.com>
 <a9ad3641-1eb8-782c-9dfd-0db41256d3f1@microchip.com>
 <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
In-Reply-To: <ad49240c-2073-4045-c11c-fb6bad231321@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 7 May 2019 16:33:31 +0200
Message-ID: <CAMuHMdVcp--qRo3m8kSQ=++Vx33kvxBWEHFVHfh-j=pq1x-GPQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] spi-nor: s25fl512s supports region locking
To: Tudor Ambarus <Tudor.Ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_073345_248049_7C56E5D1 
X-CRM114-Status: GOOD (  11.89  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Jonas Bonn <jonas@norrbonn.se>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Marek Vasut <marek.vasut+renesas@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On Tue, May 7, 2019 at 3:25 PM <Tudor.Ambarus@microchip.com> wrote:
> On 05/07/2019 04:15 PM, Tudor Ambarus wrote:
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 73172d7f512b..b94a6eaaaca5 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -1551,6 +1551,7 @@ static int spansion_read_cr_quad_enable(struct spi_nor *nor)
> >         u8 sr_cr[2];
> >         int ret;
> >
> > +       dev_err(dev, "%s\n", __FUNCTION__);

This one isn't triggered.

> >         /* Check current Quad Enable bit value. */
> >         ret = read_cr(nor);
> >         if (ret < 0) {
> > @@ -3911,6 +3912,12 @@ static int spi_nor_setup(struct spi_nor *nor,
> >  static int spi_nor_init(struct spi_nor *nor)
> >  {
> >         int err;
> > +       u8 val;
> > +       u8 mask = SR_BP2 | SR_BP1 | SR_BP0;
> > +
> > +       /* Check current Quad Enable bit value. */
> > +       val = read_cr(nor);
> this should have been:
>         val = read_sr(nor);
> sorry.
>
> > +       dev_err(nor->dev, "%s val = %02x\n", val);
> and here
>         dev_err(nor->dev, "%s val = %02x\n", __FUNCTION__, val);

m25p80 spi0.0: spi_nor_init val = 00

so the masking trick doesn't help :-(

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
