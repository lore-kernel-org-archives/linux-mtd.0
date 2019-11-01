Return-Path: <SRS0=gsLZ=YZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2BECA9ECF
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Nov 2019 14:58:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D286217D9
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Nov 2019 14:58:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZJij582r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I1/WHsVy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D286217D9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GgBHC6BhOf6D28lyfaSRu6FJI1w/UB98ydkAeXIzXeA=; b=ZJij582rMT2BSs
	SjquVzQBulfGM+RLkDDbXpbX/ZE1JShnbIhulTBNYcSK1J+1QbdY84d9o3EoR/sfWBWKearHu3uH0
	aycG2IiglQ/Vw67zH+O6t9GxoSP5iSEO7jG4a3LbZTKoTaU4hNmWuUlO+CRhzxdAE1Qf4mFbr5LvH
	sQB68cgCbr+004nw5btKrOBv1tEeFXH7gBwELeOLbyBmZHdQ0I0rCuDi26aY32c5EF4Piw4k45xhx
	6DH2C1OWDn+466t3ggy28xjf1VGc+gGBFgWEB1xR0F4cuDlc+BzT3tGvAFZemq/XQG3HCP7TOS5BG
	LXei8VfABooQt5pCFa9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQYNe-0000UR-6c; Fri, 01 Nov 2019 14:58:26 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQYNW-0000NR-U1
 for linux-mtd@lists.infradead.org; Fri, 01 Nov 2019 14:58:20 +0000
Received: by mail-pf1-x443.google.com with SMTP id c184so7272010pfb.0
 for <linux-mtd@lists.infradead.org>; Fri, 01 Nov 2019 07:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=o3PotZZzGd3n0vtfT41UhnCQaaRUmL4E0PRscYzEIDo=;
 b=I1/WHsVyWQVAH+7YIQ9FJxjw/3+UZ4eJ1j/SDFWtIEofNsreSoGawixnCPLXHfjS4I
 xlDwa3u66eEwoOJUAPlHK0dUeT0aet3AJF7Hh7vmKlsgkC0XBk6UfewUnoYtCFXoeX5g
 7fSank49zBRoLLYkoib3osby1hKIjugYLT3XialA5XwBx2NicKvLZ0AL8HaA0MYN2gGJ
 6I7li89dPySlSyjub59Y1gl2eGkUAndynwIHLXQ4f01kEq7g1XzQ0k9tdlQaGRx6v+Xw
 shsJV6s6wDw/l6GpKrmsUj23FJcOIaobHKjzfOKXCDKJMXhdUTkbzBcGYz4z5yGtH0e+
 thcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=o3PotZZzGd3n0vtfT41UhnCQaaRUmL4E0PRscYzEIDo=;
 b=Mi9EfXIC25o/fr8X2DjPKadU1W0Gll161Tley+PPSr3YwH/W5D4eYqJTp52CCPgJuV
 mww0ov1g8y1JUa+X4oAPinPi3nr8kJA7jusHijE1OTDNopF+ZIi4HSDpD3mzN4VNhwhR
 AbOr3TZuiElcb73S95YrpN3LlUebX4aT8iC2ZjyPQUnUxizX+6QhNP7ohgF4NkEaQizi
 q9apncnpeWzWfsmeMvcv9j36aaN6m/LpTGO1b88klHf87YbtZxQkCL2fZp+kcwQfSp+2
 o5OgIdgfoP2NjUByETDtL1xseGt0ASzwCIFt9j56flVgyK7YhAsUXs7JPiCUXhRZNF4l
 +5Nw==
X-Gm-Message-State: APjAAAUKQwzEH6LKzD3OKyeNlctvN3gSFrgmqNi5t3L9wrNxZLFDua+c
 UWJ+caWSYXo9NCCuuSv9yszw
X-Google-Smtp-Source: APXvYqyyHMBHWz8vbhnckMVAipVVWfbs6zJpy+GNzFBfp8NvRJbt08PIocOSMFo+vTjHOv8EaNNmig==
X-Received: by 2002:a05:6a00:51:: with SMTP id
 i17mr14214665pfk.8.1572620297826; 
 Fri, 01 Nov 2019 07:58:17 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6413:fc8c:9538:d2ea:eab:d2c0])
 by smtp.gmail.com with ESMTPSA id z21sm6644869pfa.119.2019.11.01.07.58.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 Nov 2019 07:58:17 -0700 (PDT)
Date: Fri, 1 Nov 2019 20:28:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v2 4/4] mtd: spi-nor: Add support for w25q256jw
Message-ID: <20191101145806.GB13101@Mani-XPS-13-9360>
References: <20191030090124.24900-1-manivannan.sadhasivam@linaro.org>
 <20191030090124.24900-5-manivannan.sadhasivam@linaro.org>
 <87e0b459-8dbf-26cc-611f-1b1b5266aa55@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87e0b459-8dbf-26cc-611f-1b1b5266aa55@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191101_075818_993260_BBC55F75 
X-CRM114-Status: GOOD (  21.03  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, richard@nod.at, marek.vasut@gmail.com,
 vigneshr@ti.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, darshak.patel@einfochips.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-imx@nxp.com, kernel@pengutronix.de,
 miquel.raynal@bootlin.com, computersforpeace@gmail.com, festevam@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org,
 prajose.john@einfochips.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On Fri, Nov 01, 2019 at 01:48:17PM +0000, Tudor.Ambarus@microchip.com wrote:
> 
> 
> On 10/30/2019 11:01 AM, Manivannan Sadhasivam wrote:
> > External E-Mail
> > 
> > 
> > Add MTD support for w25q256jw SPI NOR chip from Winbond. This chip
> > supports dual/quad I/O mode with 512 blocks of memory organized in
> > 64KB sectors. In addition to this, there is also small 4KB sectors
> > available for flexibility. The device has been validated using Thor96
> > board.
> > 
> > Cc: Marek Vasut <marek.vasut@gmail.com>
> > Cc: Tudor Ambarus <tudor.ambarus@microchip.com>
> > Cc: David Woodhouse <dwmw2@infradead.org>
> > Cc: Brian Norris <computersforpeace@gmail.com>
> > Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> > Cc: Richard Weinberger <richard@nod.at>
> > Cc: Vignesh Raghavendra <vigneshr@ti.com>
> > Cc: linux-mtd@lists.infradead.org
> > Signed-off-by: Darshak Patel <darshak.patel@einfochips.com>
> > [Mani: cleaned up for upstream]
> 
> Can we keep Darshak's authorship? We usually change the author if we feel that
> we made a significant change to what was originally published.
> 
> If it's just about cosmetics, cleaning or rebase, you can specify what you did
> after the author's S-o-b tag and then add your S-o-b, as you did above.
> 

I'd suggest to keep Darshak's authorship since he did the actual change in
the bsp. I have to clean it up before submitting upstream and I mentioned
the same above.

> The patch looks good.
> 

Thanks,
Mani

> Cheers,
> ta
> 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> > index 1d8621d43160..2c25b371d9f0 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -2482,6 +2482,8 @@ static const struct flash_info spi_nor_ids[] = {
> >  	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >  	{ "w25q256jvm", INFO(0xef7019, 0, 64 * 1024, 512,
> >  			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> > +	{ "w25q256jw", INFO(0xef6019, 0, 64 * 1024, 512,
> > +			     SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ) },
> >  	{ "w25m512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
> >  			SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
> >  
> > 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
