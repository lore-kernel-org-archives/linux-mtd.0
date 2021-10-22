Return-Path: <SRS0=wahI=PK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE676C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 08:46:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1FEC610A4
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Oct 2021 08:46:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A1FEC610A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=phytec.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWBJNs6v9p2VQXOO8DPkthwVfjS0rmJ/Wuk2ZDp5MTU=; b=NsbwGDbqvTcdYl
	P90pW4mGPg/oW7mRgoETbHt4eWcK50i/J49Hp1UwIUZD95vxB9NF2xhEFWFejSVFRvjK+Q1+o7Zro
	EltVuzY9nvwz65ELj+SooRiG7wZ7oPoFjv7RZDuTq0EcjqbFcqka4U2GcietvLa2JasrrJUq/n8gc
	d1rpKVo2eeIiTDTEAlrhcm0iOQJteefnB2PPVhUDQGT4uqx+/P4J9cxY1ldA9OBWaTDeDpqcVtwOR
	6F938fNx4n5CxRK1vAr92Y+KCFQhX6OIVw/R4f3U9v7CeK1Yo0Ba616EAba6l8voSEX1SvcB3Za0c
	FMIBprWfGxcF5qL0e45w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdqBd-00AEAO-GM; Fri, 22 Oct 2021 08:46:01 +0000
Received: from mickerik.phytec.de ([195.145.39.210])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdqBZ-00AE8z-W2
 for linux-mtd@lists.infradead.org; Fri, 22 Oct 2021 08:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
 q=dns/txt; i=@phytec.de; t=1634892352; x=1637484352;
 h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=exck2CFcPBjtTxL+nS9OWHMeOFAiVWxBopE66CSjlhU=;
 b=K1dowOWpfYFKF+JtPYeFjfWU2X3EWLgJC14wLwag+Y1ji/0YtBy57Pg1KJ1VkyTF
 DMkmhmLdNcevXmSIpJrJp3FAQiYDAtIprRnKFUtDStHlGKYGquKNsCmrn4fhETD0
 6EULc+/SOHCFUyhtAqpymJg68XZi1hirFQJUADtAois=;
X-AuditID: c39127d2-c63ec70000001d24-82-61727a403453
Received: from Diagnostix.phytec.de (Diagnostix.phytec.de [172.16.0.119])
 (using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client did not present a certificate)
 by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id FD.5B.07460.04A72716;
 Fri, 22 Oct 2021 10:45:52 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Diagnostix.phytec.de
 (172.16.0.119) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 22 Oct
 2021 10:45:52 +0200
Received: from Berlix.phytec.de ([fe80::6d58:38d4:5df2:e4ad]) by
 berlix.phytec.de ([fe80::6d58:38d4:5df2:e4ad%3]) with mapi id 15.01.2308.014; 
 Fri, 22 Oct 2021 10:45:52 +0200
From: =?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <S.Riedmueller@phytec.de>
To: "han.xu@nxp.com" <han.xu@nxp.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "michael@amarulasolutions.com" <michael@amarulasolutions.com>,
 "ceggers@arri.de" <ceggers@arri.de>, "bbrezillon@kernel.org"
 <bbrezillon@kernel.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "gerg@kernel.org" <gerg@kernel.org>,
 Christian Hemp <C.Hemp@phytec.de>
Subject: Re: [RFC PATCH 2/2] gpmi-nand: Add ERR007117 protection for
 nfc_apply_timings
Thread-Topic: [RFC PATCH 2/2] gpmi-nand: Add ERR007117 protection for
 nfc_apply_timings
Thread-Index: AQHXv0fgZeaCUwiGl02m7VsJcpCtpKvQPsMAgA5jlgA=
Date: Fri, 22 Oct 2021 08:45:52 +0000
Message-ID: <92d463460324d4501523f8a1da1f07c12fd6490f.camel@phytec.de>
References: <20211011084607.27a840e0@xps13>
 <20211012090224.4101984-1-s.riedmueller@phytec.de>
 <20211012090224.4101984-2-s.riedmueller@phytec.de>
 <20211013050148.2w373kpbfaeuxbwm@umbrella>
In-Reply-To: <20211013050148.2w373kpbfaeuxbwm@umbrella>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-ID: <0858370D8C4BA5488B29E367F3864215@phytec.de>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCIsWRmVeSWpSXmKPExsWyRoChXNehqijRYP4iVYvVLdMZLRp7rzNa
 7Hi1hdFi4Y8GZovdTcvYLU41trJYHG7fx2rxd/smFgcOj7Uf77N6HFuzmdVj3ppqj02rOtk8
 Ni+p99j4bgeTR/9fgwD2KC6blNSczLLUIn27BK6MlQv+MhV8Uau496+fuYHxi2oXIyeHhICJ
 xITDh1m6GLk4hATWM0ksmfGXGcJ5xijx/80tdpAqIYFNjBLndhmB2GwCLhKf276xgdgiAqoS
 bx80MIE0MAvMYJbY8beHBSQhLBAhcXjXAWaIokiJ/usv2CFsK4nrW68zgdgsQM0XH+wEi/MK
 uEl8urId6oyjjBL/Pl5iBUlwCphLrL98DayBUUBWorPhHZjNLCAusenZd1aIHwQkluw5zwxh
 i0q8fPwPKq4g0dbTCVTPAVSvKbF+lz5Eq4VE2/6pzBC2osSU7odQNwhKnJz5hGUCo/gsJBtm
 IXTPQtI9C0n3LCTdCxhZVzEK5WYmZ6cWZWbrFWRUlqQm66WkbmIExvThieqXdjD2zfE4xMjE
 wXiIUYKDWUmEd3dFfqIQb0piZVVqUX58UWlOavEhRmkOFiVx3vs9TIlCAumJJanZqakFqUUw
 WSYOTqkGxkizrVWTdYxXL91W6e25Ov9Tw+cVMc8fHr8ldX6bmUxi0LPF3Ob/1TszJkstuTBL
 kccqXavGzfLK/avTykunCdSkBUtW8595GhGlJ+c7w+aZyDy7tuZTknJ/pgi2vu+tm5N1ye7h
 j71drxguPGc8ePTlCYMXLpdr7s9cWqOmsjdC5eml7+t+JimxFGckGmoxFxUnAgBrBbdb1wIA
 AA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_014558_393183_12FA91C5 
X-CRM114-Status: GOOD (  29.32  )
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

Hi Han,

sorry it took me some time to get back to you.

On Wed, 2021-10-13 at 00:01 -0500, Han Xu wrote:
> On 21/10/12 11:02AM, Stefan Riedmueller wrote:
> > According to i.MX 6 erratum ERR007117 gpmi clocks need to be gated off
> > when doing a gpmi_io clk rate change. So gate the clocks off before
> > the rate change in nfc_apply_timings and ungate them again after the
> > change.
> > 
> > Otherwise this rate change can lead to an unresponsive GPMI core which
> > results in DMA timeouts and failed driver probe:
> > 
> > [    4.072318] gpmi-nand 112000.gpmi-nand: DMA timeout, last DMA
> > ...
> > [    4.370355] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -110
> > ...
> > [    4.375988] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> > [    4.381524] gpmi-nand 112000.gpmi-nand: Error in ECC-based read: -22
> > [    4.387988] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> > [    4.393535] gpmi-nand 112000.gpmi-nand: Chip: 0, Error -22
> > ...
> > 
> > Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> > ---
> > Hi,
> > 
> > I'm not sure about the error handling here, if it is actually neccessary.
> > So some feedback would be nice here.
> > 
> > Thanks,
> > Stefan
> > ---
> >  drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 21 +++++++++++++++++++--
> >  1 file changed, 19 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > index a1f7000f033e..326c8a895f1f 100644
> > --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> > @@ -713,15 +713,28 @@ static void gpmi_nfc_compute_timings(struct
> > gpmi_nand_data *this,
> >  			      (use_half_period ? BM_GPMI_CTRL1_HALF_PERIOD :
> > 0);
> >  }
> >  
> > -static void gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
> > +static int gpmi_nfc_apply_timings(struct gpmi_nand_data *this)
> >  {
> >  	struct gpmi_nfc_hardware_timing *hw = &this->hw;
> >  	struct resources *r = &this->resources;
> >  	void __iomem *gpmi_regs = r->gpmi_regs;
> >  	unsigned int dll_wait_time_us;
> > +	int ret;
> > +
> > +	if (GPMI_IS_MX6Q(this)) {
> 
> Not only for 6Q but for GPMI_IS_MX6

Can you confirm that i.MX 6SX and i.MX 7 are affected by the ERR007117 erratum
as well? Because the i.MX 6UL/ULL are included by the GPMI_IS_MX6Q already.

Or do we need another macro for i.MX 6UL/ULL as Christian has suggested
earlier?

Thanks,
Stefan

> 
> > +		ret = __gpmi_enable_clk(this, false);
> > +		if (ret)
> > +			return ret;
> > +	}
> >  
> >  	clk_set_rate(r->clock[0], hw->clk_rate);
> >  
> > +	if (GPMI_IS_MX6Q(this)) {
> > +		ret = __gpmi_enable_clk(this, true);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >  	writel(hw->timing0, gpmi_regs + HW_GPMI_TIMING0);
> >  	writel(hw->timing1, gpmi_regs + HW_GPMI_TIMING1);
> >  
> > @@ -739,6 +752,8 @@ static void gpmi_nfc_apply_timings(struct
> > gpmi_nand_data *this)
> >  
> >  	/* Wait for the DLL to settle. */
> >  	udelay(dll_wait_time_us);
> > +
> > +	return 0;
> >  }
> >  
> >  static int gpmi_setup_interface(struct nand_chip *chip, int chipnr,
> > @@ -2271,7 +2286,9 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
> >  	 */
> >  	if (this->hw.must_apply_timings) {
> >  		this->hw.must_apply_timings = false;
> > -		gpmi_nfc_apply_timings(this);
> > +		ret = gpmi_nfc_apply_timings(this);
> > +		if (ret)
> > +			return ret;
> >  	}
> >  
> >  	dev_dbg(this->dev, "%s: %d instructions\n", __func__, op->ninstrs);
> > -- 
> > 2.25.1
> > 
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
