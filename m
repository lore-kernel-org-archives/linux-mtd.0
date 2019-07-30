Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0546C0650F
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 13:38:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD390206B8
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 13:38:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k/rGfzX3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD390206B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g504aEUhkOBlTM2BmK5OVIWxK6ReK1vUFr2CpRTjhx8=; b=k/rGfzX3Ge12IJ
	ZFuG0hkCGKUCf/iE6BrRsGladWliRFXKEFuNKGwn/Tzjb9pXEy6GkSvdplX5ljGrStLbtymxZkGwg
	3KgbpH0PKMoKpe3/uw1i+tO5D4bCh6uc2049sPgHMl1Wk2eryIhr95lfAVDw8IUTTv2TXaxdBUGsC
	ODNENNZVswVV1nI6Xn3v/YQNZGPfCNM/kMDW/pHgu1ojwZd+fwE40cWkgJEg2S5ktO4kSyKPBXafU
	hEpl75wXDphLn4eOcckttlsVBaDT/4mCgolpkNDeUd2WibB9vosySMH14dzTAaHdrdor6wu6Z6eTC
	5bcz95///5/wWPTXjo4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsSKG-0000vC-9T; Tue, 30 Jul 2019 13:38:00 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsSKA-0000uY-5K
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 13:37:58 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1hsSK6-0003PY-2j; Tue, 30 Jul 2019 15:37:50 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1hsSK4-0003QO-Ci; Tue, 30 Jul 2019 15:37:48 +0200
Date: Tue, 30 Jul 2019 15:37:48 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2] mtd: rawnand: micron: handle on-die "ECC-off" devices
 correctly
Message-ID: <20190730133748.dzzst6p6u77tvke7@pengutronix.de>
References: <20190729070652.12629-1-m.felsch@pengutronix.de>
 <20190729095715.2de79aea@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729095715.2de79aea@collabora.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 15:36:39 up 73 days, 19:54, 49 users,  load average: 0.04, 0.02, 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_063754_197251_193856FB 
X-CRM114-Status: GOOD (  24.01  )
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
Cc: richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, stable@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Boris,

On 19-07-29 09:57, Boris Brezillon wrote:
> On Mon, 29 Jul 2019 09:06:52 +0200
> Marco Felsch <m.felsch@pengutronix.de> wrote:
> 
> > Some devices are supposed to do not support on-die ECC but experience
> 
> 		^ are not supposed to support

Fixed both, thanks. I will keep you rb-tag okay?

Regards,
  Marco

> > shows that internal ECC machinery can actually be enabled through the
> > "SET FEATURE (EFh)" command, even if a read of the "READ ID Parameter
> > Tables" returns that it is not.
> > 
> > Currently, the driver checks the "READ ID Parameter" field directly
> > after having enabled the feature. If the check fails it returns
> > immediately but leaves the ECC on. When using buggy chips like
> > MT29F2G08ABAGA and MT29F2G08ABBGA, all future read/program cycles will
> > go through the on-die ECC, confusing the host controller which is
> > supposed to be the one handling correction.
> > 
> > To address this in a common way we need to turn off the on-die ECC
> > directly after reading the "READ ID Parameter" and before checking the
> > "ECC status".
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: dbc44edbf833 ("mtd: rawnand: micron: Fix on-die ECC detection logic")
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> > v2:
> > - adapt commit message according Miquel comments
> > - add fixes, stable tags
> > - add Boris rb-tag
> > 
> >  drivers/mtd/nand/raw/nand_micron.c | 14 +++++++++++---
> >  1 file changed, 11 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/nand_micron.c
> > index 1622d3145587..fb199ad2f1a6 100644
> > --- a/drivers/mtd/nand/raw/nand_micron.c
> > +++ b/drivers/mtd/nand/raw/nand_micron.c
> > @@ -390,6 +390,14 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
> >  	    (chip->id.data[4] & MICRON_ID_INTERNAL_ECC_MASK) != 0x2)
> >  		return MICRON_ON_DIE_UNSUPPORTED;
> >  
> > +	/*
> > +	 * It seems that there are devices which do not support ECC official.
> 
> 								    ^officially.
> 
> > +	 * At least the MT29F2G08ABAGA / MT29F2G08ABBGA devices supports
> > +	 * enabling the ECC feature but don't reflect that to the READ_ID table.
> > +	 * So we have to guarantee that we disable the ECC feature directly
> > +	 * after we did the READ_ID table command. Later we can evaluate the
> > +	 * ECC_ENABLE support.
> > +	 */
> >  	ret = micron_nand_on_die_ecc_setup(chip, true);
> >  	if (ret)
> >  		return MICRON_ON_DIE_UNSUPPORTED;
> > @@ -398,13 +406,13 @@ static int micron_supports_on_die_ecc(struct nand_chip *chip)
> >  	if (ret)
> >  		return MICRON_ON_DIE_UNSUPPORTED;
> >  
> > -	if (!(id[4] & MICRON_ID_ECC_ENABLED))
> > -		return MICRON_ON_DIE_UNSUPPORTED;
> > -
> >  	ret = micron_nand_on_die_ecc_setup(chip, false);
> >  	if (ret)
> >  		return MICRON_ON_DIE_UNSUPPORTED;
> >  
> > +	if (!(id[4] & MICRON_ID_ECC_ENABLED))
> > +		return MICRON_ON_DIE_UNSUPPORTED;
> > +
> >  	ret = nand_readid_op(chip, 0, id, sizeof(id));
> >  	if (ret)
> >  		return MICRON_ON_DIE_UNSUPPORTED;
> 
> 

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
