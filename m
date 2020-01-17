Return-Path: <SRS0=4m0E=3G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06AA5C33CB1
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 07:11:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC8872073A
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jan 2020 07:11:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iFNn5Put"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC8872073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7KYlKCFSFyBmu8aIgefcwVuSgc8sWc4Dhfpc0CiFNhs=; b=iFNn5PutA1aKdH
	ZRLaToIh8fPa154ImhJCn+g+OD2qFT92xbBgMOvT4rbocsjtbwiIM30Ww1FYaevSy+Siy8NaNQMUT
	aBAw6nvGPpEyuBkKiwOA7h2/AreDBrrkJVtti+Z5MC/ea8KO7eNpvoKf5WMWhmjXBf/B8sflc7VmR
	hZpQlSMAYovrW5NdKhaoNxxUE/tsKm3WjJDS0vnWwElcSm8uZGSfmFARDoHkm7RC8gnY5g/9PRMi6
	dEc0v6XUxkDmYDAutJcwSw/uqJY5tRhk3Pdu6seKfDeT1VdrOvOt3wwWWNITdsCBf0LGQ0/1CdOGF
	KYMBSnVPJ7C9VO0WFh4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1isLmN-0003fm-PJ; Fri, 17 Jan 2020 07:10:51 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1isLmH-0003e6-8g
 for linux-mtd@lists.infradead.org; Fri, 17 Jan 2020 07:10:49 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1isLm1-0003Yx-HD; Fri, 17 Jan 2020 08:10:29 +0100
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1isLly-0000eh-QS; Fri, 17 Jan 2020 08:10:26 +0100
Date: Fri, 17 Jan 2020 08:10:26 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v1] mtd: rawnand: micron: don't error out if internal ECC
 is set
Message-ID: <20200117071026.gydlruw2cxre2r2u@pengutronix.de>
References: <20200110162503.7185-1-zdhays@gmail.com>
 <20200116192221.49986c13@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200116192221.49986c13@xps13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:02:50 up 62 days, 22:21, 55 users,  load average: 0.07, 0.07, 0.02
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_231045_308639_9226E6D3 
X-CRM114-Status: GOOD (  25.41  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 zhays@lexmark.com, zdhays@gmail.com, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Piotr Sroka <piotrs@cadence.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Zak, Miquel,

On 20-01-16 19:22, Miquel Raynal wrote:
> Hi Zak,
> =

> zdhays@gmail.com wrote on Fri, 10 Jan 2020 11:25:01 -0500:
> =

> > From: Zak Hays <zdhays@gmail.com>
> > =

> > Recent changes to the driver require use of on-die correction if
> > the internal ECC enable bit is set. On some Micron parts, this bit
> > is enabled by default and there is no method for disabling it.

Which changes did you mean here?

> > This is a false assumption though as that bit being enabled does not
> > necessarily mean that the on-die ECC *has* to be used. It has been
> > verified with a Micron FAE that other methods of error correction are
> > still valid even if this bit is set.

It would be cool if a micron FAE can provide a document with all the
quirks and how those quirks can be handled.

> > HW ECC offers generally higher performance than on-die so it is
> > preferred in some situations. This also allows multiple NAND parts to
> > be supported on the same PCB as some parts may not support on-die
> > error correction.

By HW ECC you mean the host ecc controller?

> > With that in mind, only throw a warning that the on-die bit is set
> > and allow the init to continue.
> =

> I don't think I can take this patch as-is. We must find a reliable way
> to discriminate Micron parts features. If we cannot (I think we can't
> before of the endless list of bugs they have introduced without
> documenting them), the best way is to build a static table.

+1 for 'find a reliable way to discriminate Micron parts features'

Regards,
  Marco

> > =

> > Signed-off-by: Zak Hays <zdhays@gmail.com>
> > ---
> >  drivers/mtd/nand/raw/nand_micron.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > =

> > diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/=
nand_micron.c
> > index 56654030ec7f..ec40c76443be 100644
> > --- a/drivers/mtd/nand/raw/nand_micron.c
> > +++ b/drivers/mtd/nand/raw/nand_micron.c
> > @@ -455,9 +455,7 @@ static int micron_nand_init(struct nand_chip *chip)
> >  =

> >  	if (ondie =3D=3D MICRON_ON_DIE_MANDATORY &&
> >  	    chip->ecc.mode !=3D NAND_ECC_ON_DIE) {
> > -		pr_err("On-die ECC forcefully enabled, not supported\n");
> > -		ret =3D -EINVAL;
> > -		goto err_free_manuf_data;
> > +		pr_warn("WARNING: On-die ECC forcefully enabled, use caution with ot=
her methods\n");
> >  	}
> >  =

> >  	if (chip->ecc.mode =3D=3D NAND_ECC_ON_DIE) {
> =

> Thanks,
> Miqu=E8l
> =


-- =

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
