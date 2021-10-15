Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE9FC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 20:06:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 706D760EE2
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 20:06:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 706D760EE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zHwnFwlqPwGdiHo0sJRSwPDeWsM5OGzBkfTsmeQdClw=; b=iG67tSmlUy2JZl
	pa1mE5UV8yu3+xTjLBnmooRNF8brZvId8AG2LoNCHOJGrsHKgXJqy6SD7XfNSDk4f32yVhdIMIsOK
	kftH/F6LOWvyVaND8riIB/8bUqbxjksUNeJW4gEqViTw5WqI9+XiU3C54y3QhOj/LqhPvnDb/MMVd
	nBt10tX7k0433g3JCEgKD9c22GZXsunet3xxb8UxZYAy55XLaoocRXEdboJkiDqojInXc3cXcmYOa
	jUkgr2w4WnuZoMUb/H99PWXhYXwgN53swv6FbPCMzkV7mpvpnpZE9gwVoduy2BU3BHMClK20nev5C
	KleGvB6kG96NbEXTuNaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbTSi-008g7I-8m; Fri, 15 Oct 2021 20:05:52 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbTSe-008g6k-9c
 for linux-mtd@lists.infradead.org; Fri, 15 Oct 2021 20:05:50 +0000
Received: by mail-ed1-x532.google.com with SMTP id ec8so42498010edb.6
 for <linux-mtd@lists.infradead.org>; Fri, 15 Oct 2021 13:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=vOEtaPNSFs11osxm82F/7qezNejb7ALjpBbHjGblxOc=;
 b=I+9dnB+typAjSFjAt2vf1Y59qpZ3U0l4rwU69Q7uz+CGYuInoNkV0CUye4Y/mqtwiG
 3qMCZJKTuksVAcjiL/ofXpNR5TZ+If8OyhFtE2i+lrqHmgUkVOoLWXec9pilfyFmlFVA
 RXUgw2Vr/m00z2UwKY06bPhd3uo2WWIMOyJQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vOEtaPNSFs11osxm82F/7qezNejb7ALjpBbHjGblxOc=;
 b=PvjXnd/3sE6ZmcAaQlWiPgrQHgCeSgRVGMmGZy0qL5D7N4FOLjlVZW9qnbuVhRiGBH
 OzFGP4a5tpft0qrASHMJ9wlrm8bHbjjTtuTtVnivWgAwu98rC1UcwvMg+zFbNdWl4qrl
 sCXddU54R4mgbwwLJubDYHrq86eDNV5mQ6ijKe0RXrAv3b9cX96bErzGrbDUEIJ4A4VG
 GHbBdloRjQkKTZXZNsg2XCtke3mmDvi4W6p/NRrMsUPxRUrdi50oRqfI2cNjlbE4Gk33
 S/2TMzLzcZf6a6Xa4MuPXDUGYNRXr4jx2Fvqr11G/Ta4ljjJHZbAGlvoUUsaS8GzTo4G
 1sMg==
X-Gm-Message-State: AOAM532XjGhZTJIdrJX+YrEyIARuS1U+WTrr0UVp65SF9CXvdPolPVov
 A5j/0o84+GRiLqsORq/AbKIKxvf0ThpgeXfB
X-Google-Smtp-Source: ABdhPJz6KQkwys1xMFsc//r/hRzdoqjiW9VOpEOrNoocw3afEBL89mJ34im2P5ARnP3C2GqAeBrt8w==
X-Received: by 2002:a17:907:939:: with SMTP id
 au25mr9459952ejc.166.1634328345332; 
 Fri, 15 Oct 2021 13:05:45 -0700 (PDT)
Received: from panicking (142-158-13-149.static.cpe.unicatlc.net.
 [149.13.158.142])
 by smtp.gmail.com with ESMTPSA id rk9sm4731852ejb.31.2021.10.15.13.05.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Oct 2021 13:05:44 -0700 (PDT)
Date: Fri, 15 Oct 2021 22:05:41 +0200
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Greg Ungerer <gerg@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: GPMI iMX6ull timeout on DMA
Message-ID: <20211015200541.GA55401@panicking>
References: <00b31833-69ba-42c5-57c9-37fa1f70efc5@kernel.org>
 <20190812093129.75888dad@collabora.com>
 <a47792dc-b19f-8af3-8748-5a21fb63271e@kernel.org>
 <CAOf5uwmPzCU8WFRQ1tQBdN7OVGZZ9SvdAG0YqVAyxmA1zwtUhg@mail.gmail.com>
 <2e9e1f1c-ee57-425d-1791-70c66de52637@kernel.org>
 <CAOf5uwm93+ARf=_BckjMar1tpeBs6YHeUwORj5cyhFfvu5fNWQ@mail.gmail.com>
 <20210201151335.210af8ca@xps13>
 <CAOf5uwkivHhMX_mPJymBZxQge_wc4K1p_1S3gsQYHPV40aaj3w@mail.gmail.com>
 <CAOf5uwnXB-2xXXXxvH9Fo3ngscccA5Hv7iNTbUYRNFs_iLGJqw@mail.gmail.com>
 <20210201161433.0c4ff0e3@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201161433.0c4ff0e3@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_130548_798103_92344119 
X-CRM114-Status: GOOD (  45.45  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi

On Mon, Feb 01, 2021 at 04:14:33PM +0100, Miquel Raynal wrote:
> Hi Michael,
> =

> Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote on
> Mon, 1 Feb 2021 16:08:23 +0100:
> =

> > Hi
> > =

> > On Mon, Feb 1, 2021 at 3:32 PM Michael Nazzareno Trimarchi
> > <michael@amarulasolutions.com> wrote:
> > >
> > > Hi
> > >
> > > On Mon, Feb 1, 2021 at 3:13 PM Miquel Raynal <miquel.raynal@bootlin.c=
om> wrote:  =

> > > >
> > > > Hi Michael,
> > > >
> > > > Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote on
> > > > Sat, 30 Jan 2021 10:41:29 +0100:
> > > >  =

> > > > > Hi Miquel
> > > > >
> > > > > commit f8e6ad14388067f91b26d044185d95623fbc9535
> > > > > Author: Michael Trimarchi <michael@amarulasolutions.com>
> > > > > Date:   Fri Jan 29 08:46:53 2021 +0100
> > > > >
> > > > >     mtd: nand: Calculate the clock before enable it
> > > > >
> > > > >     Signed-off-by: Michael Trimarchi <michael@amarulasolutions.co=
m>
> > > > >     Change-Id: I79b0da39de0a9b32ea0b002fa200d7f44d4f8ce7
> > > > >
> > > > > diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
> > > > > b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
> > > > > index 322a008290e5..0bca52b3bc8f 100644
> > > > > --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
> > > > > +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c
> > > > > @@ -377,6 +377,7 @@ static void gpmi_nfc_compute_timings(struct
> > > > > gpmi_nand_data *this,
> > > > >                                      const struct nand_sdr_timing=
s *sdr)
> > > > >  {
> > > > >         struct gpmi_nfc_hardware_timing *hw =3D &this->hw;
> > > > > +       struct resources *r =3D &this->resources;
> > > > >         unsigned int dll_threshold_ps =3D this->devdata->max_chai=
n_delay;
> > > > >         unsigned int period_ps, reference_period_ps;
> > > > >         unsigned int data_setup_cycles, data_hold_cycles, addr_se=
tup_cycles;
> > > > > @@ -440,6 +441,8 @@ static void gpmi_nfc_compute_timings(struct
> > > > > gpmi_nand_data *this,
> > > > >                 hw->ctrl1n |=3D BF_GPMI_CTRL1_RDN_DELAY(sample_de=
lay_factor) |
> > > > >                               BM_GPMI_CTRL1_DLL_ENABLE |
> > > > >                               (use_half_period ? BM_GPMI_CTRL1_HA=
LF_PERIOD : 0);
> > > > > +
> > > > > +       clk_set_rate(r->clock[0], hw->clk_rate);
> > > > >  }
> > > > >
> > > > >  void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
> > > > > @@ -449,8 +452,6 @@ void gpmi_nfc_apply_timings(struct gpmi_nand_=
data *this)
> > > > >         void __iomem *gpmi_regs =3D r->gpmi_regs;
> > > > >         unsigned int dll_wait_time_us;
> > > > >
> > > > > -       clk_set_rate(r->clock[0], hw->clk_rate);
> > > > > -
> > > > >         writel(hw->timing0, gpmi_regs + HW_GPMI_TIMING0);
> > > > >         writel(hw->timing1, gpmi_regs + HW_GPMI_TIMING1);
> > > > >
> > > > > Right now I have this change applied and seems fine. That is the =
only
> > > > > difference I get. Clock is apply a bit earlier that when is enabl=
ed
> > > > > it.  =

> > > >
> > > > This is very interesting. So this would mean the issue you are
> > > > experiencing comes from the clock driver which kind of returns too
> > > > early from clk_set_rate()? Could you report this to the clk ML/NXP =
clk
> > > > maintainers and keep us in copy? If it is as global as it sounds, we
> > > > might not be the only ones affected.
> > > >  =

> > >
> > > The imx28 is broken too, so it's a general problem. I need to trace i=
t down
> > > I have a reverting for lts but it\s not the way to go
> > >  =

> > =

> > For imx28 you ask to set the rate to 22Mhz but you don't care about the=
 clock
> > that you get back. You get back 12Mhz because the base clock is 24 Mhz =
and seems
> > that it can not get the point. You need to check if the clock
> > requested is in range or ask
> > for set_rate_clk_min to avoid to have somenthing lower. Then for
> > imx6ull because is sporadic
> > I think that is more connected to the clk_set_rate and when you change
> > the register. Can not be a
> > setting time?
> =

> So, if I understand correctly, we face two different problems:
> - imx6*: seems like a clock issue regarding the clock settlement
> - imx28: actual NAND driver issue (does not check the validity of the
>   new frequency). This should be handled properly in
>   ->setup_interface().
>

Somenthing like this? Not compile/tested

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/=
raw/gpmi-nand/gpmi-nand.c
index 4d08e4ab5c1b..cc8146ab1b78 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -644,7 +644,7 @@ static int bch_set_geometry(struct gpmi_nand_data *this)
  *         RDN_DELAY =3D -----------------------     {3}
  *                           RP
  */
-static void gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
+static int gpmi_nfc_compute_timings(struct gpmi_nand_data *this,
 				     const struct nand_sdr_timings *sdr)
 {
 	struct gpmi_nfc_hardware_timing *hw =3D &this->hw;
@@ -656,6 +656,7 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_d=
ata *this,
 	int sample_delay_ps, sample_delay_factor;
 	u16 busy_timeout_cycles;
 	u8 wrn_dly_sel;
+	long clk_rate;
 =

 	if (sdr->tRC_min >=3D 30000) {
 		/* ONFI non-EDO modes [0-3] */
@@ -671,6 +672,10 @@ static void gpmi_nfc_compute_timings(struct gpmi_nand_=
data *this,
 		wrn_dly_sel =3D BV_GPMI_CTRL1_WRN_DLY_SEL_NO_DELAY;
 	}
 =

+	clk_rate =3D clk_round_rate(r->clock[0], hw->clk_rate);
+	if (clk_rate < hw->clk_rate || clk_rate <=3D 0)
+		return -ENOTSUPP;
+
 	/* SDR core timings are given in picoseconds */
 	period_ps =3D div_u64((u64)NSEC_PER_SEC * 1000, hw->clk_rate);
 =

@@ -746,6 +751,7 @@ static int gpmi_setup_interface(struct nand_chip *chip,=
 int chipnr,
 {
 	struct gpmi_nand_data *this =3D nand_get_controller_data(chip);
 	const struct nand_sdr_timings *sdr;
+	int ret =3D 0;
 =

 	/* Retrieve required NAND timings */
 	sdr =3D nand_get_sdr_timings(conf);
@@ -761,11 +767,11 @@ static int gpmi_setup_interface(struct nand_chip *chi=
p, int chipnr,
 		return 0;
 =

 	/* Do the actual derivation of the controller timings */
-	gpmi_nfc_compute_timings(this, sdr);
-
-	this->hw.must_apply_timings =3D true;
+	ret =3D gpmi_nfc_compute_timings(this, sdr);
+	if (!ret)
+		this->hw.must_apply_timings =3D true;
 =

-	return 0;
+	return ret;
 }
 =

 /* Clears a BCH interrupt. */
> Thanks,
> Miqu=E8l

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
