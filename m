Return-Path: <SRS0=VmK4=VX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3617EC7618B
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 09:40:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09DA3206DD
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jul 2019 09:40:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UO1sv4Wo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09DA3206DD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jl4TkZ5uoM5sW46v6hQv4xWzPsRPdnPKroGOHsoD2GM=; b=UO1sv4WoPPlbak
	AEFtukQ1g948VMj+aO95TFX+bCkyGMZDm1cTUKGk0WW+byZmHvUlsjzVzXKThPLULuACThV8W24oo
	W5Eohu+d1jWoR+WhV/oAhFQDxCXkwa0SyC2PBCiG3HLFVU5CaKwcdmGVJa/hvLrUQ7FwD0+ZdzFr1
	AUwmWkbMtpZ9Q4w9H5QGly0AGy/G6YO83MFn35w8OvfBO8G6R7n5RoAGERop9CYi+FHzcTSOsrbSQ
	mZM7uhhsTg3RqcjQ+rrIAC0EFSUj42yytMFb3iovY6Cwcia2P1Ou/gYC8/GoiA91CylZd3QrvRYM5
	FCGkfFHikwyE0QbN/tFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hqwi2-0002uq-8F; Fri, 26 Jul 2019 09:40:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hqwhy-0002uN-Dh
 for linux-mtd@lists.infradead.org; Fri, 26 Jul 2019 09:40:16 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1hqwhv-00023Q-ID; Fri, 26 Jul 2019 11:40:11 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1hqwhu-0002wm-VZ; Fri, 26 Jul 2019 11:40:10 +0200
Date: Fri, 26 Jul 2019 11:40:10 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: rawnand: micron: handle "ecc off" devices correctly
Message-ID: <20190726094010.6sj4vrvco4hpjitu@pengutronix.de>
References: <20190726111716.591992c7@xps13>
 <20190726112001.4035f85f@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726112001.4035f85f@xps13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:37:44 up 69 days, 15:55, 52 users,  load average: 0.05, 0.06, 0.06
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190726_024014_642421_CF1471F9 
X-CRM114-Status: GOOD (  35.97  )
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
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On 19-07-26 11:20, Miquel Raynal wrote:
> Wrong address for Boris again, sorry for the noise.
> =

> > Hi Lucas, Marco,
> > =

> > Lucas Stach <l.stach@pengutronix.de> wrote on Fri, 26 Jul 2019 10:54:11
> > +0200:
> > =

> > > Hi Miguel,
> > > =

> > > Am Freitag, den 26.07.2019, 10:28 +0200 schrieb Miquel Raynal:  =

> > > > Hi Marco,
> > > > =

> > > > + Richard
> > > > + Working e-mail address for Boris
> > > >     =

> > > > > Marco Felsch <m.felsch@pengutronix.de> wrote on Fri, 26 Jul 2019 =
   =

> > > > 09:44:34 +0200:
> > > >     =

> > > > > Some devices don't support ecc "official". By "official" I mean t=
hat the  =

> > =

> >                                  ^ uppercase ECC
> > =

> > > > > feature can be set trough the "SET FEATURE (EFh)" command but isn=
't
> > > > > reported to the "READ ID Parameter Tables". Because the "ECC Fiel=
d"
> > > > > still says that it is disabled. This is applicable at least
> > > > > for the MT29F2G08ABAGA and MT29F2G08ABBGA devices. Even worse the
> > > > > datasheet describes the ECC feature in chapter "ECC Protection".  =

> > =

> > What about:
> > =

> > "Some devices are supposed to do not support on-die ECC but
> > experience shows that internal ECC machinery can actually be enabled
> > through the "SET FEATURE (EFh)" command, even if a read of the "READ ID
> > Parameter Tables" returns that it is not."
> > =

> > > > > =

> > > > > Currently the driver checks the "READ ID Parameter" field directl=
y after
> > > > > we enabled the feature. If the check fails we return immediately =
but
> > > > > leave the ECC on. Now all future read/program cycles goes trough =
the ecc
> > > > > and the host nfc gets confused and reports ECC errors.  =

> > =

> > And here:
> > =

> > "Currently, the driver checks the "READ ID Parameter" field
> > directly after having enabled the feature. If the check fails it returns
> > immediately but leaves the ECC on. When using buggy chips like
> > MT29F2G08ABAGA and MT29F2G08ABBGA, all future read/program cycles will
> > go through the on-die ECC, confusing the host controller which is
> > supposed to be the one handling correction."
> > =

> > > > > To address this in a common way we need to turn off the ECC direc=
tly
> > > > > after reading the "READ ID Parameter" and before checking the
> > > > > "ECC status".
> > > > > =

> > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>    =

> > > > =

> > > > Good catch! However you report that on-die ECC correction is working
> > > > but you still disable it; any reason to do so ? Would it be better =
to
> > > > actually enable on-die ECC and explicitly mark these two chips as
> > > > buggy (see [1] for checking the chip IDs)?    =

> > > =

> > > It's the other way around. The chip is not supposed to have on-die ECC
> > > according to the datasheet and correctly reflects this fact in the
> > > READ_ID, so Linux should not try to use the on-die ECC.  =

> > =

> > Ok I understood the opposite because of the "Even worse the datasheet
> > describes the ECC feature [...]" which implied to me that the on-die ECC
> > feature was actually expected despite the status bit not being set.
> > =

> > Marco, can you rephrase a bit the commit log? I proposed something,
> > feel free to adapt.

Thanks for the fast reply :) Of course I can adapt it and adding Boris rb-t=
ag.

Regards,
  Marco

> > > The bug is that the NAND is not supposed to have on-die ECC and repor=
ts
> > > this correctly, but then actually enables a on-die ECC unit when asked
> > > to, probably due to the same die being used for on-die ECC and ECC off
> > > devices. The consequence is that Linux (correctly) assumes that the
> > > full OOB size is available to the controller, but the on-die ECC unit
> > > scribbles over some of the OOB data.
> > > =

> > > I think this fix the most robust solution, as it makes sure to disable
> > > the on-die ECC unit to avoid the issue, which might also be present on
> > > other NAND chips we don't know about yet.
> > > =

> > > Regards,
> > > Lucas =

> > >   =

> > > > [1] https://elixir.bootlin.com/linux/v5.3-rc1/source/drivers/mtd/na=
nd/raw/nand_macronix.c#L83
> > > >     =

> > > > > ---
> > > > > =A0drivers/mtd/nand/raw/nand_micron.c | 14 +++++++++++---
> > > > > =A01 file changed, 11 insertions(+), 3 deletions(-)
> > > > > =

> > > > > diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nan=
d/raw/nand_micron.c
> > > > > index 1622d3145587..fb199ad2f1a6 100644
> > > > > --- a/drivers/mtd/nand/raw/nand_micron.c
> > > > > +++ b/drivers/mtd/nand/raw/nand_micron.c
> > > > > @@ -390,6 +390,14 @@ static int micron_supports_on_die_ecc(struct=
 nand_chip *chip)    =

> > > > > > > =A0	=A0=A0=A0=A0(chip->id.data[4] & MICRON_ID_INTERNAL_ECC_MA=
SK) !=3D 0x2)
> > > > > > > =A0		return MICRON_ON_DIE_UNSUPPORTED;    =

> > > > > =A0    =

> > > > > > > +	/*
> > > > > > > +	=A0* It seems that there are devices which do not support E=
CC official.
> > > > > > > +	=A0* At least the MT29F2G08ABAGA / MT29F2G08ABBGA devices s=
upports
> > > > > > > +	=A0* enabling the ECC feature but don't reflect that to the=
 READ_ID table.
> > > > > > > +	=A0* So we have to guarantee that we disable the ECC featur=
e directly
> > > > > > > +	=A0* after we did the READ_ID table command. Later we can e=
valuate the
> > > > > > > +	=A0* ECC_ENABLE support.
> > > > > > > +	=A0*/
> > > > > > > =A0	ret =3D micron_nand_on_die_ecc_setup(chip, true);
> > > > > > > =A0	if (ret)
> > > > > > > =A0		return MICRON_ON_DIE_UNSUPPORTED;    =

> > > > > @@ -398,13 +406,13 @@ static int micron_supports_on_die_ecc(struc=
t nand_chip *chip)    =

> > > > > > > =A0	if (ret)
> > > > > > > =A0		return MICRON_ON_DIE_UNSUPPORTED;    =

> > > > > =A0    =

> > > > > > > -	if (!(id[4] & MICRON_ID_ECC_ENABLED))
> > > > > > > -		return MICRON_ON_DIE_UNSUPPORTED;    =

> > > > > -    =

> > > > > > > =A0	ret =3D micron_nand_on_die_ecc_setup(chip, false);
> > > > > > > =A0	if (ret)
> > > > > > > =A0		return MICRON_ON_DIE_UNSUPPORTED;    =

> > > > > =A0    =

> > > > > > > +	if (!(id[4] & MICRON_ID_ECC_ENABLED))
> > > > > > > +		return MICRON_ON_DIE_UNSUPPORTED;    =

> > > > > +    =

> > > > > > > =A0	ret =3D nand_readid_op(chip, 0, id, sizeof(id));
> > > > > > > =A0	if (ret)    =

> > > > > =A0		return MICRON_ON_DIE_UNSUPPORTED;    =

> > > > =

> > > > Thanks,
> > > > Miqu=E8l
> > > >     =

> > =

> > =

> > Thanks,
> > Miqu=E8l
> =

> =

> =

> =

> Thanks,
> Miqu=E8l
> =


-- =

Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
