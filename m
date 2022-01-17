Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B27DC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jan 2022 14:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTHjeaow4fr9y25pSy/NF8zFcIUVtGIVTjbJP/3OiH4=; b=yEUk3aPYOSLuFq
	iNROLYI7YO3D940xeAwTgF4rZ+3cMKc7j18Gu2LqaSi1+w1Wj3rqqVeGrM3De/ngXg8kZmyBLEUT2
	hQ0Lq8CTBhcUvm1mzpWHpW471GDTKhv2wFh0qqfVQ3Wi9Ts7P9I07s5S7EAXRUBVZLKPCgCWp98XB
	GdKMFq21PuFhcVxN/wfPQKmCmWuB3GPkaaij2hVvuHAzm2JJM61jYOSbL4mVuCtDk6nPKRVi11pX1
	Xbar+u6tsDs1KVucqtXOCGHNaMTnBIjvMJj5TTfzTJZdxZnoTZViIcx3Xu2UQXoEho+dVojpS5QlB
	BdcUBhfN9uRkK6Qegu6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Sgo-00F8SE-Nj; Mon, 17 Jan 2022 14:08:54 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9Sgl-00F8OU-1o
 for linux-mtd@lists.infradead.org; Mon, 17 Jan 2022 14:08:52 +0000
Received: by mail-lf1-x132.google.com with SMTP id d3so57919226lfv.13
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jan 2022 06:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x/F5VAIUnuZoKvZjwxrhtVdlFx14UE2p7e9E4YI4S8Q=;
 b=dtThkQCBCm+J6vmjue/Tmyk3oTBjYJ9zd+y8nd9e44YNb18prJSoUUJYV5sVSBLmqQ
 8PrQZai4p64TkxCs6UPRZcfIoD8uxIaWjFlf210TGtMVPQPxZf+84xJGO0+Qgv14dNQ3
 enuoVdwgz/Q0+8Hu9w1nS8foUn7Np+LrDcPQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x/F5VAIUnuZoKvZjwxrhtVdlFx14UE2p7e9E4YI4S8Q=;
 b=gUrVIsI8iS656ALugili9Lj3rG32bMJIFWrq3n5RmUB6Bf0Z8RPg2rbtJlpHAMiTGv
 HKfbegQd8qtlpQu55cawKbOALnd7wERTOongzXcbn+vxzHY0cirYfdAEh8n4pE8MVkr8
 C6lnkfdMC+wUZ8lwtNwD37tBpiStpgnbQ5C7sgwRJNUQg1s/r0WHnoDmor0edDQnh6ue
 /wV9592uKrFTq26rLIIBZCwsacn6ldnNAqqeFDK9BMsQmvftALPDDVFTfK5NVu3jFkE+
 criPgIoMPN3XT0nipc5wshZaD9oztGRozmHUtj2F5rZ90xQ3+Mh8ALpRIzHOhcejPmXT
 lBlg==
X-Gm-Message-State: AOAM5312YUa2ghWCUnMNnGWGmdaIA0khOYCV2UETgenZTD4ge7Aixg/S
 JTYjOf5TWB/47UansXvouM8jigv9+7R7cYFP7fmlFQ==
X-Google-Smtp-Source: ABdhPJwktiCc+IH1AlXibibrqA2zKQHxTNYida7J2+3yuEWDDJptN/B2nyIsF7B2Px06Sa49MDFZV59swqfh4sZebUA=
X-Received: by 2002:a2e:95cf:: with SMTP id y15mr14765814ljh.132.1642428521589; 
 Mon, 17 Jan 2022 06:08:41 -0800 (PST)
MIME-Version: 1.0
References: <20220117111829.1811997-1-dario.binacchi@amarulasolutions.com>
 <20220117111829.1811997-4-dario.binacchi@amarulasolutions.com>
 <YeVsnQpOkyXaBk0+@pengutronix.de>
In-Reply-To: <YeVsnQpOkyXaBk0+@pengutronix.de>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 17 Jan 2022 15:08:30 +0100
Message-ID: <CABGWkvruAWcOxX99U0jcK1sz+AoGKKJwHWbtn_kSO=SJsCO5Wg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/5] mtd: rawnand: gpmi: use a table to get EDO
 mode setup
To: Sascha Hauer <sha@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, 
 Michael Trimarchi <michael@amarulasolutions.com>, Han Xu <han.xu@nxp.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_060851_130333_C4DDD955 
X-CRM114-Status: GOOD (  33.17  )
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

Hi Sascha,

On Mon, Jan 17, 2022 at 2:18 PM Sascha Hauer <sha@pengutronix.de> wrote:
>
> Hi Dario,
>
> On Mon, Jan 17, 2022 at 12:18:27PM +0100, Dario Binacchi wrote:
> > +struct edo_mode {
> > +     u32 tRC_min;
> > +     long clk_rate;
> > +     u8 wrn_dly_sel;
> > +};
> > +
> > +static const struct edo_mode edo_modes[] = {
> > +     {.tRC_min = 30000, .clk_rate = 22000000,
> > +      .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
> > +     {.tRC_min = 30000, .clk_rate = 22000000,
> > +      .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
> > +     {.tRC_min = 30000, .clk_rate = 22000000,
> > +      .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
> > +     {.tRC_min = 30000, .clk_rate = 22000000,
> > +      .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS},
> > +     {.tRC_min = 25000, .clk_rate = 80000000,
> > +      .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY},
> > +     {.tRC_min = 20000, .clk_rate = 100000000,
> > +      .wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY},
> > +};
> > +
> >  /*
> >   * <1> Firstly, we should know what's the GPMI-clock means.
> >   *     The GPMI-clock is the internal clock in the gpmi nand controller.
> > @@ -657,22 +678,18 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
> >       int sample_delay_ps, sample_delay_factor;
> >       u16 busy_timeout_cycles;
> >       u8 wrn_dly_sel;
> > +     int i, emode = ARRAY_SIZE(edo_modes) - 1;
> >
> > -     if (sdr->tRC_min >= 30000) {
> > -             /* ONFI non-EDO modes [0-3] */
> > -             hw->clk_rate = 22000000;
> > -             wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
> > -     } else if (sdr->tRC_min >= 25000) {
> > -             /* ONFI EDO mode 4 */
> > -             hw->clk_rate = 80000000;
> > -             wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
> > -     } else {
> > -             /* ONFI EDO mode 5 */
> > -             hw->clk_rate = 100000000;
> > -             wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
> > +     /* Search the required EDO mode */
> > +     for (i = 0; i < ARRAY_SIZE(edo_modes); i++) {
> > +             if (sdr->tRC_min >= edo_modes[i].tRC_min) {
> > +                     emode = i;
> > +                     break;
> > +             }
>
> The first four entries of edo_modes[] all have the same value, so this loop
> will never end on the second, third or fourth element. These elements are just
> there to match 'emode' with the existing ONFI mode numbers, but then 'emode' is
> never used as an ONFI mode number, instead it's only used as an index to the
> array. You could equally well remove the second till fourth array entries.
>
> Then with only three entries left in the array I wonder if you're not better
> off with the original code and change it to something like:

This implementation is justified by the next patch in the series ([RFC
PATCH v2 4/5] mtd: rawnand: gpmi: validate controller clock rate).
I thought that clock rate validation could be better implemented by
indexing a table. The replication of the second, third and fourth
elements
makes the index also the edo mode (used in the debug printout). Using
a less redundant table (three elements) requires the edo mode
to be stored in it if you want to keep the debug printing or remove
the debug message.

>
>         if (sdr->tRC_min >= 30000) {
>                 /* ONFI non-EDO modes [0-3] */
>                 hw->clk_rate = 22000000;
>                 min_rate = 0;
>                 wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_4_TO_8NS;
>         } else if (sdr->tRC_min >= 25000) {
>                 /* ONFI EDO mode 4 */
>                 hw->clk_rate = 80000000;
>                 min_rate = 22000000;
>                 wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
>         } else {
>                 /* ONFI EDO mode 5 */
>                 hw->clk_rate = 100000000;
>                 min_rate = 80000000;
>                 wrn_dly_sel = BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
>         }
>
>         hw->clk_rate = clk_round_rate(r->clock[0], hw->clk_rate);
>         if (hw->clk_rate < min_rate)
>                 return -EINVAL;
>
> I think this would be easier to follow.

I think the key point is to decide if the patch "[RFC PATCH v2 4/5]
mtd: rawnand: gpmi: validate controller clock rate" makes sense.
I thought of this patch to facilitate that implementation, since it
compares the real GPMI clock rate to that of the previous edo mode.
I thought it wasn't elegant to implement another switch case.

Thanks and regards,
Dario

>
> Sascha
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |



--

Dario Binacchi

Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
