Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A84C10F1A
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2024 12:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+RHSvGuxn+AOBkt4Y1FPUQAl1B5dEq9P0/tFwTMacWk=; b=nam2G34lPZX+MD
	/OLl4v0OWmEXRdxS/hdHsgR86wH6+cBxnldIu8H7rcmV0dfYPHtu5yCSfxF6SKpbbw8gVcbjR27dN
	yJyFfUhczrccy3gSSFjssfQqprK3KaE7BVjJyLoHfyDXs8FJ8IadFRCpcnGGQ5ShXhC3XLlMqb+p2
	0Gg3VhKoRcSLA3zDvnX455ZLSThucuyLzpTi/yX0t32W/oIi2AwnERTMU6yPJ81jhlyIdnQ4Oj78l
	TuPWfCrHkogJjUqFb4e7KLWCaeQApjo9MMAitZCMME/kkjV6hP0LKSLLHPfttmDfS2fW+fpZtwxT0
	uZwDz2aAQzeX0sYil+FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4K4v-0000000Ay1V-1ko5;
	Tue, 07 May 2024 12:37:53 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4K4s-0000000Axzw-02al
	for linux-mtd@lists.infradead.org;
	Tue, 07 May 2024 12:37:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1s4K4i-00039G-Cp; Tue, 07 May 2024 14:37:40 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1s4K4g-00065t-US; Tue, 07 May 2024 14:37:38 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1s4K4g-00GQDk-2g;
	Tue, 07 May 2024 14:37:38 +0200
Date: Tue, 7 May 2024 14:37:38 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: Ensure ECC configuration is propagated to
 upper layers
Message-ID: <ZjogkgrQ46H1hXSi@pengutronix.de>
References: <20240507085842.108844-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240507085842.108844-1-miquel.raynal@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_053750_079165_F6BCD126 
X-CRM114-Status: GOOD (  29.90  )
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
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Tue, May 07, 2024 at 10:58:42AM +0200, Miquel Raynal wrote:
> Until recently the "upper layer" was MTD. But following incremental
> reworks to bring spi-nand support and more recently generic ECC support,
> there is now an intermediate "generic NAND" layer that also needs to get
> access to some values. When using "converted" ECC engines, like the
> software ones, these values are already propagated correctly. But
> otherwise when using good old raw NAND controller drivers, we need to
> manually set these values ourselves at the end of the "scan" operation,
> once these values have been negotiated.
> =

> Without this propagation, later (generic) checks like the one warning
> users that the ECC strength is not high enough might simply no longer
> work.
> =

> Fixes: 8c126720fe10 ("mtd: rawnand: Use the ECC framework nand_ecc_is_str=
ong_enough() helper")
> Cc: stable@vger.kernel.org
> Reported-by: Sascha Hauer <s.hauer@pengutronix.de>
> Closes: https://lore.kernel.org/all/Zhe2JtvvN1M4Ompw@pengutronix.de/
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
> =

> Hello Sascha, this is only compile tested, would you mind checking if
> that fixes your setup?

Works as expected:

Tested-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

> Thanks, Miqu=E8l
> =

>  drivers/mtd/nand/raw/nand_base.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand=
_base.c
> index d7dbbd469b89..acd137dd0957 100644
> --- a/drivers/mtd/nand/raw/nand_base.c
> +++ b/drivers/mtd/nand/raw/nand_base.c
> @@ -6301,6 +6301,7 @@ static const struct nand_ops rawnand_ops =3D {
>  static int nand_scan_tail(struct nand_chip *chip)
>  {
>  	struct mtd_info *mtd =3D nand_to_mtd(chip);
> +	struct nand_device *base =3D &chip->base;
>  	struct nand_ecc_ctrl *ecc =3D &chip->ecc;
>  	int ret, i;
>  =

> @@ -6445,9 +6446,13 @@ static int nand_scan_tail(struct nand_chip *chip)
>  	if (!ecc->write_oob_raw)
>  		ecc->write_oob_raw =3D ecc->write_oob;
>  =

> -	/* propagate ecc info to mtd_info */
> +	/* Propagate ECC info to the generic NAND and MTD layers */
>  	mtd->ecc_strength =3D ecc->strength;
> +	if (!base->ecc.ctx.conf.strength)
> +		base->ecc.ctx.conf.strength =3D ecc->strength;
>  	mtd->ecc_step_size =3D ecc->size;
> +	if (!base->ecc.ctx.conf.step_size)
> +		base->ecc.ctx.conf.step_size =3D ecc->size;
>  =

>  	/*
>  	 * Set the number of read / write steps for one page depending on ECC
> @@ -6455,6 +6460,8 @@ static int nand_scan_tail(struct nand_chip *chip)
>  	 */
>  	if (!ecc->steps)
>  		ecc->steps =3D mtd->writesize / ecc->size;
> +	if (!base->ecc.ctx.nsteps)
> +		base->ecc.ctx.nsteps =3D ecc->steps;
>  	if (ecc->steps * ecc->size !=3D mtd->writesize) {
>  		WARN(1, "Invalid ECC parameters\n");
>  		ret =3D -EINVAL;
> -- =

> 2.40.1
> =

> =


-- =

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
