Return-Path: <SRS0=4NdN=HE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221F1C433DB
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 04:17:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D596564ED7
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Feb 2021 04:17:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D596564ED7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZxpyzzgSKdVIrTCzDPHu7GEa4v8r/rT9ROxMK1rhEN8=; b=rZVY0b3bJIiksFa59vlvp+CIT
	6XnUIp3wKL5h8OBRDXH60dRoYGagUO7sbpBoCUld8HLwnk0mjKkbdPIqAYqb+W3mMEbIbrfb+HOk1
	GpbJcaPfd7mbQDZQuB/pojo0Bmd9TmLfhQQRGu6JGSTmwRftprPPXaOaAI6Td1Eg7o01w8U16mShP
	muidpulSHISdIo2vwZKSvJa1s9Zs/YfEHSxzQRBrHNx4abihaB6wZdT4S7rZ8oxZ0aCLEmvFER2hL
	PR4OgHx1//zeDgJjiezu4mjwer61VpOujUQCtDKaHW3Xkn02YqAKeXcY4cE6sG/Wx/aOOWGVgRLZb
	0cWjAt1NA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6n73-0002jP-5F; Tue, 02 Feb 2021 04:16:25 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6n6z-0002iW-UX
 for linux-mtd@lists.infradead.org; Tue, 02 Feb 2021 04:16:23 +0000
Received: by mail-pg1-x52b.google.com with SMTP id b21so14044025pgk.7
 for <linux-mtd@lists.infradead.org>; Mon, 01 Feb 2021 20:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=voXjzMFXu6z+viPuy/BWrmyMPRk9jtrQCw1WWpPx03o=;
 b=pEP+WfeazvjfFZlIx1bIoJGWjjlwEvSWlNVjbhUv1TxoUXLnsPEQW4mdPsyArWY/2g
 ruLtdpvOtbUXO0taNxCXVhRzia059Zi8ze96oKMr4wxKjI3YDL2rW44CyszxN6sI2mUh
 snf9M++3pL+0nPpXuXrstV+X1WFZEur2GFFCIwiAs98vx25shanCDYZDbUN7yrHqA5bq
 GirtT1SF9x8DwVJ7IwN2mHsPtVYYjilvE3nccHSTPaOpDIi1VQcfmT/PbcPnXAYKJGdw
 7yBpG2to8UWenGoTZINfTNzh6MNUJrDrqdreSAKP1Jx3kjKac5vyr4DjR0GxFemv9CS6
 ksTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=voXjzMFXu6z+viPuy/BWrmyMPRk9jtrQCw1WWpPx03o=;
 b=eYWi39nH3pxrXJd9rwxJTgsMSVzi7xEde2IPPbwWVDJYce0vBc9DTp6hN37ijcQb9H
 Ib5Kp+Gpe29rMlq0Bf8J2/CN69wi2DCyWWhvfEr5nG+BO0QVHcBK1O5WXzTnGe+0ZDgx
 7ylycJME/XDgKzVfEqUg201VeS063Ftcw/cz+0eTiz8Q/2KaQpi/PYM7EoYOO5Xvv+1Z
 4eVI1OrVgwsfBXMjqmdJZcXgJ4DxLSiJNK+w0qUnQFhiOZcxaSlRcMsEJH4d7o0RADW8
 QRiSu9/Fqs5WPUauJcmgsYMWtqL63T9DSW4OKD12j946ejxOIcK9roGqLs1MK8Tv8ZdB
 fCdA==
X-Gm-Message-State: AOAM530PzenzTTA1bhAWoe4gwxcGe0bwOVNZc/WzeyZ6ybP3ytFx1YXC
 9MDn01vEsf3lhcpSAR2vsGmL
X-Google-Smtp-Source: ABdhPJw5Jt+ornFBPPnaCufSVeoU97SdnZ7+6U94Fqu8kywGM+I9lYLblJtPxaOxtmRemL7eOpJ9NA==
X-Received: by 2002:a63:e10b:: with SMTP id z11mr20098899pgh.40.1612239379381; 
 Mon, 01 Feb 2021 20:16:19 -0800 (PST)
Received: from work ([103.77.37.138])
 by smtp.gmail.com with ESMTPSA id i22sm995929pjv.35.2021.02.01.20.16.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 01 Feb 2021 20:16:18 -0800 (PST)
Date: Tue, 2 Feb 2021 09:46:14 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: Do not check for bad block if bbt is
 unavailable
Message-ID: <20210202041614.GA840@work>
References: <20210130035412.6456-1-manivannan.sadhasivam@linaro.org>
 <20210201151824.5a9dca4a@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201151824.5a9dca4a@xps13>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_231622_320280_DF4C18CB 
X-CRM114-Status: GOOD (  30.11  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 bjorn.andersson@linaro.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Feb 01, 2021 at 03:18:24PM +0100, Miquel Raynal wrote:
> Hi Manivannan,
> =

> Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> wrote on Sat,
> 30 Jan 2021 09:24:12 +0530:
> =

> > The bbt pointer will be unavailable when NAND_SKIP_BBTSCAN option is
> > set for a NAND chip. The intention is to skip scanning for the bad
> > blocks during boot time.
> =

> I don't have the same understanding: this flag skips the bad block
> table scan, not the bad block scan. We do want to scan all the devices
> in order to construct a RAM based table.
> =

> > However, the MTD core will call
> > _block_isreserved() and _block_isbad() callbacks unconditionally for
> > the rawnand devices due to the callbacks always present while collecting
> > the ecc stats.
> > =

> > The _block_isreserved() callback for rawnand will bail out if bbt
> > pointer is not available. But _block_isbad() will continue without
> > checking for it. So this contradicts with the NAND_SKIP_BBTSCAN option
> > since the bad block check will happen anyways (ie., not much difference
> > between scanning for bad blocks and checking each block for bad ones).
> > =

> > Hence, do not check for the bad block if bbt pointer is unavailable.
> =

> Not checking for bad blocks at all feels insane. I don't really get the
> scope and goal of such change?
> =


The issue I encountered is, on the Telit FN980 device one of the
partition seems to be protected. So trying to read the bad blocks in
that partition makes the device to reboot during boot.

There seems to be no flag passed by the parser for this partition. So
the only way I could let the device to boot is to completely skip the
bad block check.

AFAIK, MTD core only supports checking for the reserved blocks to be
used for BBM and there is no way to check for a reserved partition like
this.

I agree that skipping bad block check is not a sane way but I don't know
any other way to handle this problem.

Thanks,
Mani

> > =

> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/mtd/nand/raw/nand_base.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > =

> > diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/na=
nd_base.c
> > index c33fa1b1847f..f18cd1db79a9 100644
> > --- a/drivers/mtd/nand/raw/nand_base.c
> > +++ b/drivers/mtd/nand/raw/nand_base.c
> > @@ -4286,6 +4286,9 @@ static int nand_block_isbad(struct mtd_info *mtd,=
 loff_t offs)
> >  	int chipnr =3D (int)(offs >> chip->chip_shift);
> >  	int ret;
> >  =

> > +	if (!chip->bbt)
> > +		return 0;
> > +
> >  	/* Select the NAND device */
> >  	ret =3D nand_get_device(chip);
> >  	if (ret)
> =

> Cheers,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
