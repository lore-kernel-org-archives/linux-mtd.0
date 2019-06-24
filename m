Return-Path: <SRS0=yEN0=UX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 561BAC43613
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 07:08:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 299B7205F4
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Jun 2019 07:08:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="txZcJwrX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 299B7205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=asem.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TDmqTMzhAA080iH8yjDWiebY1MBsvTfdcXnJDHvy+Fc=; b=txZcJwrXNC5Csa
	Qb1+dfr7J6j8qzaKWhqw9OmUgJTkkM91YhMIGnEq8N0dEktbVPFIHuJs1R/2VgkQ/gIenjtQrhe2r
	bh7RFxkoongIL17WqglOyu9UEtK6zd2WTxEzVDLQIp+yjmSfgTtLNBcalff9YQ8TlkvpRGsC7XTZz
	Lwz+6E8zLXb6eQtR3xAh+XjizETRW/ePm4wpP+siKDQcc3iHs39PX4HadujEArzpoxUsZoPgpzxNd
	HAklbOe+78IQ5x0MPSb+kjhal6ePrApc3fwOuFE1WhT5nktd476uy3ncdvrCzhZpBiPGelvMXdEUU
	6HUlKCsntlb1ZtBRfgYQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hfJ5K-0000vU-0B; Mon, 24 Jun 2019 07:08:14 +0000
Received: from smtp.asem.it ([151.1.184.197])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hfJ5D-0000uF-Uf
 for linux-mtd@lists.infradead.org; Mon, 24 Jun 2019 07:08:10 +0000
Received: from webmail.asem.it by asem.it (smtp.asem.it)
 (SecurityGateway 5.5.0) with ESMTP id SG003964369.MSG 
 for <linux-mtd@lists.infradead.org>; Mon, 24 Jun 2019 09:08:00 +0200S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
 (172.16.16.44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35; Mon, 24
 Jun 2019 09:07:59 +0200
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
 mapi id 15.01.1261.035; Mon, 24 Jun 2019 09:07:59 +0200
From: Flavio Suligoi <f.suligoi@asem.it>
To: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>
Subject: RE: [PATCH 1/1] mtd: spi-nor: add a presence check for non-JEDEC spi
 nor
Thread-Topic: [PATCH 1/1] mtd: spi-nor: add a presence check for non-JEDEC spi
 nor
Thread-Index: AQHU3+V6wpgiM/sAo06qkyb8EDJ5fKapDvWAgAHkbDA=
Date: Mon, 24 Jun 2019 07:07:59 +0000
Message-ID: <c7ce7a2966a4414a90e84f30929cede1@asem.it>
References: <1553172946-2251-1-git-send-email-f.suligoi@asem.it>
 <55f74662-c5f6-2cdf-f1a0-c685f7ff1913@microchip.com>
In-Reply-To: <55f74662-c5f6-2cdf-f1a0-c685f7ff1913@microchip.com>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.208]
MIME-Version: 1.0
X-SGHeloLookup-Result: hardfail smtp.helo=webmail.asem.it (does not match
 172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B0210.5D1076D0.005F, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190624_000808_566089_C3703396 
X-CRM114-Status: GOOD (  31.62  )
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
Cc: "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.or" <linux-kernel@vger.kernel.or>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

> -----Original Message-----
> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
> Sent: domenica 23 giugno 2019 06:00
> To: Flavio Suligoi <f.suligoi@asem.it>; marek.vasut@gmail.com;
> dwmw2@infradead.org; computersforpeace@gmail.com; bbrezillon@kernel.org;
> richard@nod.at
> Cc: linux-mtd@lists.infradead.org; linux-kernel@vger.kernel.or
> Subject: Re: [PATCH 1/1] mtd: spi-nor: add a presence check for non-JEDEC
> spi nor
> 
> Hi, Flavio,
> 
> On 03/21/2019 02:55 PM, Flavio Suligoi wrote:
> > External E-Mail
> >
> >
> > This patch fixes the following kernel error message:
> >
> > "flash operation timed out"
> >
> > that occurs when a non-JEDEC spi-nor, declared in a Device Tree, but not
> > physically present on the board, is involved in a write operation, as:
> >
> > cat datafile > /dev/mtd0
> >
> > In some cases, with enough quantity of data, the writing hangs for
> minutes.
> >
> > This situation can happen, for example, in some embedded systems, when
> > a non-JEDEC spi-nor is mounted using a removable add-on board. So is
> > important to find a method to check a non-JEDEC device presence before
> > using it.
> >
> > The presence of a JEDEC compliant device is implicitly verified during
> the
> > JEDEC auto-detect procedure.
> > But for a non-JEDEC device, the presence must be explicitly checked,
> > reading one or more known registers, according to the chip features.
> >
> > Without any check, if the spi-nor is declared in a Device Tree but not
> > physically present on the board, the driver (i.e. m25p80) is loaded
> anyway
> > and the correspondent mtd device is also created.
> > In this way any read operation on this device returns 0xff (or 0x00,
> > depending on the driver and the hardware used) and any write operation
> > hangs until the flash operation timeout occurs, with the "flash
> operation
> > timed out" error message.
> >
> > This patch adds the non-JEDEC spi-nor presence check before initializing
> > the device.
> >
> > Note: currently this presence check supports only the Everspin mr25h40,
> >       reading its status register.
> >
> >       The support for other non-JEDEC devices has to be added.
> >
> > Signed-off-by: Flavio Suligoi <f.suligoi@asem.it>
> > ---
> >  drivers/mtd/spi-nor/spi-nor.c | 43
> +++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-
> nor.c
> > index fae1474..d2cb710 100644
> > --- a/drivers/mtd/spi-nor/spi-nor.c
> > +++ b/drivers/mtd/spi-nor/spi-nor.c
> > @@ -3981,6 +3981,42 @@ static const struct flash_info
> *spi_nor_match_id(const char *name)
> >  	return NULL;
> >  }
> >
> > +/**
> > + * check_nojedec_nor_presence() - check the real presence of a non-
> JEDEC nor
> > + * @nor: pointer to a 'struct spi_nor'
> > + *
> > + * The presence of a JEDEC compliant device is implicity verified
> during the
> 
> s/implicity/implicitly
> 
> > + * JEDEC auto-detect procedure.
> > + * For a non-JEDEC device, the presence have to explicity checked,
> reading
> 
> s/explicity/explicitly
> 
> > + * one or more known registers, according to the chip features.
> > + *
> > + * Return: 0 on success, -errno otherwise.
> > + */
> > +int check_nojedec_nor_presence(struct spi_nor *nor)
> 
> all functions should start with spi_nor_*. How about naming it
> spi_nor_check_nojedec_presence()?
> 
> > +{
> > +	struct device *dev = nor->dev;
> 
> you use dev once, no need to declare a local variable for it.
> 
> > +	const struct flash_info *info = nor->info;
> 
> this will probably disappear, see below
> 
> > +	int ret = 0;
> 
> initialization not needed
> 
> > +	u8 val;
> > +
> > +	/* Check presence for Everspin mr25h40 MRAM */
> > +	if (!strcmp(info->name, "mr25h40")) {
> 
> Couldn't we make this check for all non-jedec flashes? Aren't we safe to
> assume
> that all the flashes have a Status Register that contains a WEL bit which
> come
> with value zero by default?

I don't know if all the non-JEDEC flashes have a Status Register with
the same configuration and with the same default values. So for this 
reason I thought to add a specific test for each single flash.
In this way, every person who work with a specific flash can add
a proper flash presence test.
What do you think about this?

> 
> > +		/* Read the status register */
> > +		ret = nor->read_reg(nor, SPINOR_OP_RDSR, &val, 1);
> > +		if (ret)
> > +			return ret;
> > +
> > +		dev_dbg(dev, "%s - status register = 0x%2.2x\n",
> 
> %hhx?
> 
> > +			info->name, val);
> > +
> > +		/* The factory preset of the status register is 0x00 */
> 
> if we generalize this, the comment will become irrelevant. How about
> something
> like: "Check if flash is connected."
> 
> > +		if (val == 0xff)
> > +			return -ENODEV;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  int spi_nor_scan(struct spi_nor *nor, const char *name,
> >  		 const struct spi_nor_hwcaps *hwcaps)
> >  {
> > @@ -4158,6 +4194,13 @@ int spi_nor_scan(struct spi_nor *nor, const char
> *name,
> >  			return ret;
> >  	}
> >
> > +	/* Check non-JEDEC nor presence */
> > +	if (!info->id_len) {
> 
> if (name && !info->id_len)?
> 
> How about moving the entire if block to
> https://elixir.bootlin.com/linux/v5.2-rc6/source/drivers/mtd/spi-nor/spi-
> nor.c#L4037?
> 
> Cheers,
> ta
> 
> > +		ret = check_nojedec_nor_presence(nor);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	/* Send all the required SPI flash commands to initialize device */
> >  	ret = spi_nor_init(nor);
> >  	if (ret)
> >

Thanks,
Flavio
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
