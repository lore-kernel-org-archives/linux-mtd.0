Return-Path: <SRS0=3akN=YV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44522CA9EC0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 14:34:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15254208C0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 14:34:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RCumk4Au";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="irsXVZVg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 15254208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bB3Jjqcm/1SfGBWuUmi9bxLRW2wizlcwxdl08DgyoyY=; b=RCumk4AuzNCydg
	wCGM7h/cORHBelGFTfEh7x81lYCRVtvwj2PIpomWIlUBgrsqDdVzjlJxA1YPo4/SbLxBIbbmrXsFu
	SceEvyjg21X6xQLcExSQyUQiJ7fL1iz13uRlfVKFpB3S3B62W8sXAN8kldHoCtQmT/Ktz0WgoNK4i
	rHwOaVrDsjWtTbf6GVIsdqjdfHJf8ZNYvBL3pFu2MZClWFh+OxSOY76ZFMWTlIYPX9BwWixJdmXyx
	95ROw+tI8c6a5XjL0WgBxzgRoqmLvYhDsxn2UvQfSyi0+eDxZVpRrwZjME0osC5orIYb6LFeJd1it
	qiaB08Uff0LDZjKKELWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP65X-0008T7-DV; Mon, 28 Oct 2019 14:33:43 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP65K-0008IJ-8K
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2019 14:33:31 +0000
Received: by mail-pf1-x441.google.com with SMTP id c7so5812730pfo.12
 for <linux-mtd@lists.infradead.org>; Mon, 28 Oct 2019 07:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jRXui8mziHn1dHv5sVSn9Ol454G9W6p0Jp5i7su5XVo=;
 b=irsXVZVgMMIM/IxRyTrk/qvcpBGoyEqBd5lsDi83dqdq4Ij85W6nXIMi6d68nrg5mP
 m6dlG15ZtcjLhwSGfAy8IBHJm0XFBTuLkMkcujDc+Jz1uFwMhqmA7fHXnnoH/eWLwHO6
 e9l/L2TkOw6FadXSJL0Je2cED/hKn7LLI0rEqqOzKqUSSuDmRm3Y94/BFnNdOFgvlK/u
 r6m3dcKiBjkSkA+6OC//ADulFoKMPfhnqdWnsN6mlCplwyHpgndtLX09a4EKzsqzZNF5
 inPLg24/mKcrAVmYDM9nEN9k7aOUFGcU2NUl/TD0RloUuibGiFYlPXJ91nIEUl6FoBJN
 QFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jRXui8mziHn1dHv5sVSn9Ol454G9W6p0Jp5i7su5XVo=;
 b=hhmeMg34vUYfIuuUgcjzr+4RFh/1if87UfgXUde0dD0DqIWpfEf8Re2i3fcJdKpzKd
 FiUjaJBzzfV41aZNBqQJEt5xxjulXRL/lA6jsd00U+yuOX9GwpQDkS5LAdf5mMj0htcn
 enbjaUa9ds9xExiIPwObO/3FoI4UWsW1RNfPZGlNSpAUodFpZdkbgcX3bV7JA2Zc3JFi
 3YUCdr5K3WFMQOUUfAVqSBIZ2NxW4SDhPOgCnqnBDXKPct/8igcIP8TboFa5ZhWzn/ar
 J6KMTRKKpeToM63av+63RpMmH5uDEmBE7je44r8JilIyKqobtncQnm7gD1uvCPqdTHYD
 +3vg==
X-Gm-Message-State: APjAAAV1qxBiQbeXA/tt4PrIWHnHEw2p22oy/BVx3FxUrPzstG+tV8CT
 wA4d4slg2RYrjIXgjGfj/7jy
X-Google-Smtp-Source: APXvYqzGnQ3oWUKcqs6cX+pDXEkapuTymujVJwAUXj1ZSC41/Q+HtHirj1nbVtMWKAisgsEBnI8rUA==
X-Received: by 2002:a63:4553:: with SMTP id u19mr20936350pgk.436.1572273208969; 
 Mon, 28 Oct 2019 07:33:28 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6004:d1fe:706d:952a:57bd:23b6])
 by smtp.gmail.com with ESMTPSA id o7sm5154561pjo.7.2019.10.28.07.33.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 28 Oct 2019 07:33:28 -0700 (PDT)
Date: Mon, 28 Oct 2019 20:03:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: Add support for w25q256jw
Message-ID: <20191028143317.GB29312@Mani-XPS-13-9360>
References: <20191024144235.3182-1-manivannan.sadhasivam@linaro.org>
 <20191024144235.3182-4-manivannan.sadhasivam@linaro.org>
 <bf435b43-f118-f3cb-73ed-5fa67905c4aa@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf435b43-f118-f3cb-73ed-5fa67905c4aa@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_073330_309582_723F9967 
X-CRM114-Status: GOOD (  20.92  )
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
Cc: devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, shawnguo@kernel.org,
 s.hauer@pengutronix.de, Tudor Ambarus <tudor.ambarus@microchip.com>,
 linux-kernel@vger.kernel.org, darshak.patel@einfochips.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, linux-imx@nxp.com, kernel@pengutronix.de,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>, festevam@gmail.com,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 prajose.john@einfochips.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Vignesh,

On Mon, Oct 28, 2019 at 05:20:40PM +0530, Vignesh Raghavendra wrote:
> Hi,
> 
> On 24/10/19 8:12 PM, Manivannan Sadhasivam wrote:
> > Add MTD support for w25q256jw SPI NOR chip from Winbond. This chip
> > supports dual/quad I/O mode with 512 blocks of memory organized in
> > 4KB sectors. 
> 
> 512 blocks of memory organized into 64KB sector, right? In additional
> flash also supports 4KB small sector.
> 

Yeah, the wording is wrong here. Will fix it.

Thanks,
Mani

> Regards
> Vignesh
> 
> > The device has been validated using Thor96 board.
> 
> 
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
