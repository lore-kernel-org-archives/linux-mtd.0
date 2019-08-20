Return-Path: <SRS0=j2Kw=WQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A21C3A589
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 11:36:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E956C2082F
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2019 11:36:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lM94bKg1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E956C2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Mtqdoj62zYzRxhJ3PFDtApfY5H2CsgJdfcEKevIZpw=; b=lM94bKg1k0+dvL
	pVRqhNfWk1ex/J6P78vB2Q3/3Jp+tlf38GXOTBVRYA0WMXFtOiaJbf1g/uNR42m/swghtXv0r6KFm
	qIj3FEIk2oCpVdPlOhg7H4Dds24nzrpVO/L+PBd5+YOMMIOOMbZDQ48NqxWUmnd8yUniOWT/GrmTk
	v1/t1Cc6ptLnJ321bENJY1IzJ0xDrtiHMuCHjnR8igBY6oLEFIwMtZXCafpFa10Mwp8Q8xEwd2Zw0
	3duYY6GjND1X+gvI9TvGk+mzUvAbyPhOAb2bWbvsu0ncok6CNnXf1RTvQ8SOBHwEUNfDdY1dzJJhE
	J6CaC5S1fCNYuPunvRMA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i02QY-0006TN-Hc; Tue, 20 Aug 2019 11:35:50 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i02Ps-0005IX-KS
 for linux-mtd@lists.infradead.org; Tue, 20 Aug 2019 11:35:11 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mfe@pengutronix.de>)
 id 1i02Pn-0006zv-DA; Tue, 20 Aug 2019 13:35:03 +0200
Received: from mfe by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <mfe@pengutronix.de>)
 id 1i02Pm-0002gX-6P; Tue, 20 Aug 2019 13:35:02 +0200
Date: Tue, 20 Aug 2019 13:35:02 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Shivamurthy Shastri (sshivamurthy)" <sshivamurthy@micron.com>
Subject: Re: [EXT] Re: [PATCH] mtd: spinand: micron: add support for
 MT29F1G01AAADD
Message-ID: <20190820113502.o7njhgucrdt3tykl@pengutronix.de>
References: <20190814082232.2119-1-m.felsch@pengutronix.de>
 <20190819101718.39b3a5ca@xps13>
 <20190819133042.23jpf3eap2u5teuo@pengutronix.de>
 <20190819163449.6e62e6a5@xps13>
 <20190820063904.xg32xtdt6uf3vl77@pengutronix.de>
 <MN2PR08MB59515F78DFA89350B9A3E6D6B8AB0@MN2PR08MB5951.namprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR08MB59515F78DFA89350B9A3E6D6B8AB0@MN2PR08MB5951.namprd08.prod.outlook.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 13:33:04 up 94 days, 17:51, 56 users,  load average: 0.00, 0.02, 0.00
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_043508_867057_805D4998 
X-CRM114-Status: GOOD (  28.25  )
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
 "richard@nod.at" <richard@nod.at>,
 "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Peter Pan <peterpandong@micron.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Shivamurthy,

On 19-08-20 11:31, Shivamurthy Shastri (sshivamurthy) wrote:
> Hi Marco,
> =

> > =

> > Hi Miquel,
> > =

> > On 19-08-19 16:34, Miquel Raynal wrote:
> > > Hi Marco,
> > >
> > > Marco Felsch <m.felsch@pengutronix.de> wrote on Mon, 19 Aug 2019
> > > 15:30:42 +0200:
> > >
> > > > Hi Miquel,
> > > >
> > > > On 19-08-19 10:17, Miquel Raynal wrote:
> > > > > Hi Marco,
> > > > >
> > > > > Marco Felsch <m.felsch@pengutronix.de> wrote on Wed, 14 Aug 2019
> > > > > 10:22:32 +0200:
> > > > >
> > > > > > The MT29F1G01AAADD is a single die, SLC based SPI NAND. It has a
> > > > > > capacity of 1Gb and supports 4-bit ECC. The datasheet can be fo=
und
> > [1].
> > > > > >
> > > > > > Unfortunatly the linked device is marked as EoL, but I will exp=
ect that
> > > > > > the MT29F1G01AAADDH4-ITX behaves the same way.
> > > > > >
> > > > > > [1]
> > https://nam01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdata
> > sheet.octopart.com%2F&amp;data=3D02%7C01%7Csshivamurthy%40micron.co
> > m%7C420c4296ddc9420ba7da08d7253924ce%7Cf38a5ecd28134862b11bac1d5
> > 63c806f%7C0%7C1%7C637018799689823280&amp;sdata=3DwZHbyU68pOT%2Bs
> > 3lrcuEk2FqG0DDggzLVpKpMDcYink0%3D&amp;reserved=3D0 \
> > > > > >       MT29F1G01AAADDH4-IT:D-Micron-datasheet-11572380.pdf
> > > > > >
> > > > > > Cc: Peter Pan <peterpandong@micron.com>
> > > > > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > > > > > ---
> > > > > >  drivers/mtd/nand/spi/micron.c | 68
> > +++++++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 68 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/mtd/nand/spi/micron.c
> > b/drivers/mtd/nand/spi/micron.c
> > > > > > index 7d7b1f7fcf71..9d63450afc69 100644
> > > > > > --- a/drivers/mtd/nand/spi/micron.c
> > > > > > +++ b/drivers/mtd/nand/spi/micron.c
> > > > > > @@ -34,6 +34,18 @@ static
> > SPINAND_OP_VARIANTS(update_cache_variants,
> > > > > >  		SPINAND_PROG_LOAD_X4(false, 0, NULL, 0),
> > > > > >  		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> > > > > >
> > > > > > +static
> > SPINAND_OP_VARIANTS(read_cache_variants_mt29f1g01aaadd,
> > > > > > +		SPINAND_PAGE_READ_FROM_CACHE_X4_OP(0, 1,
> > NULL, 0),
> > > > > > +		SPINAND_PAGE_READ_FROM_CACHE_X2_OP(0, 1,
> > NULL, 0),
> > > > > > +		SPINAND_PAGE_READ_FROM_CACHE_OP(true, 0, 1,
> > NULL, 0),
> > > > > > +		SPINAND_PAGE_READ_FROM_CACHE_OP(false, 0,
> > 1, NULL, 0));
> > > > > > +
> > > > > > +static
> > SPINAND_OP_VARIANTS(write_cache_variants_mt29f1g01aaadd,
> > > > > > +		SPINAND_PROG_LOAD(true, 0, NULL, 0));
> > > > > > +
> > > > > > +static
> > SPINAND_OP_VARIANTS(update_cache_variants_mt29f1g01aaadd,
> > > > > > +		SPINAND_PROG_LOAD(false, 0, NULL, 0));
> > > > > > +
> > > > > >  static int mt29f2g01abagd_ooblayout_ecc(struct mtd_info *mtd, =
int
> > section,
> > > > > >  					struct mtd_oob_region
> > *region)
> > > > > >  {
> > > > > > @@ -90,6 +102,52 @@ static int
> > mt29f2g01abagd_ecc_get_status(struct spinand_device *spinand,
> > > > > >  	return -EINVAL;
> > > > > >  }
> > > > > >
> > > > > > +static int mt29f1g01aaadd_ooblayout_ecc(struct mtd_info *mtd, =
int
> > section,
> > > > > > +					struct mtd_oob_region
> > *region)
> > > > > > +{
> > > > > > +	if (section > 3)
> > > > > > +		return -ERANGE;
> > > > > > +
> > > > > > +	region->offset =3D (section * 0x10) + 8;
> > > > >
> > > > > Any reason to use hex here?         ^
> > > > >
> > > > > If not I would prefer decimal numbers.
> > > >
> > > > Since the datasheet describe it in hex to.
> > > >
> > > > Can you have a look on [1] table 11? May we do something like:
> > > >
> > > > 	region->offset =3D (section * 0x10) + 0x8;
> > > >
> > > > [1]
> > https://nam01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fdata
> > sheet.octopart.com%2FMT29F1G01AAADDH4-IT%3AD-Micron-datasheet-
> > 11572380.pdf&amp;data=3D02%7C01%7Csshivamurthy%40micron.com%7C420c
> > 4296ddc9420ba7da08d7253924ce%7Cf38a5ecd28134862b11bac1d563c806f%7
> > C0%7C1%7C637018799689823280&amp;sdata=3DXaTab%2BxmXRmz7jxwINT2B
> > BqAV0aRlyR1EGDz%2BktS%2BQs%3D&amp;reserved=3D0
> > > >
> > > > >
> > > > > Otherwise looks fine.
> > > >
> > > > Anyway I can change the above code to use only decimal values if you
> > > > like it more.
> > >
> > > I think it is better to reserve hexadecimal values to register
> > > operations. Please translate into decimal.
> > =

> > Okay. Just one last question. What is the common way to go to specify
> > the free area? By this I mean that the NAND has two areas to store the
> > user metadata calling it 'user metadata I' and 'user metadata II'. 'user
> > metadata II' isn't ecc protected so I skip them. But the current
> > supported chip does not skip the user metadata area which isn't
> > protected [1] table 10.
> > =

> > [1] https://www.micron.com/~/media/documents/products/data-
> > sheet/nand-flash/70-series/m79a_2gb_3v_nand_spi.pdf
> > =

> =

> I have written patch to make helpers to be more generic.
> They work for Micron's M78A, M79A and M70A series SPI NANDs.

Sounds good =3D) But my question is still open.

Regards,
  Marco

> =

> Regards,
> Shiva
> =

> > Regards,
> >   Marco
> > =

> > >
> > > Thanks,
> > > Miqu=E8l
> > >
> > >
> > =

> > --
> > Pengutronix e.K.                           |                           =
  |
> > Industrial Linux Solutions                 |
> > https://nam01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fwww
> > .pengutronix.de%2F&amp;data=3D02%7C01%7Csshivamurthy%40micron.com%
> > 7C420c4296ddc9420ba7da08d7253924ce%7Cf38a5ecd28134862b11bac1d563c
> > 806f%7C0%7C1%7C637018799689823280&amp;sdata=3Dk%2BwLO84bN9Dt02%
> > 2FJ%2BLLboEx8t29T8my7oKrchrV6bMw%3D&amp;reserved=3D0  |
> > Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
> > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |
> > =

> > ______________________________________________________
> > Linux MTD discussion mailing list
> > https://nam01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flist=
s.i
> > nfradead.org%2Fmailman%2Flistinfo%2Flinux-
> > mtd%2F&amp;data=3D02%7C01%7Csshivamurthy%40micron.com%7C420c4296
> > ddc9420ba7da08d7253924ce%7Cf38a5ecd28134862b11bac1d563c806f%7C0%
> > 7C1%7C637018799689823280&amp;sdata=3D03Qz9zc098PqOiGOIALy1PkgVNGB
> > NYqDPuctarAddGg%3D&amp;reserved=3D0
> =


-- =

Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
