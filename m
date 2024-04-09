Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93DEFCD1284
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Apr 2024 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Subject:Message-Id:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tENj9hU+s3UN24YYwilav53tAfFDHsW1TGxFSc8dIGY=; b=4WRGArzqCMTGbrObchyQ2lwspg
	e8i7GxJ+ggjMAc6/0Ls6NjIJRr2/X8nCQfzC/yCsPNf+vF/ffNU4oWLqR9lKoDaWWgY+5at6f6whw
	T/twy62JCYb1rPBQpHPzZokOtnGlqMQAmWAVA4eP34zeW+apkIp1XEcElDrVtzDHuVB9gNPko93fM
	YZgPo/YlBA2nsf9aEkuk9+uWldPJXTLz8AHP602423yGNZZpUoEnMB/CYts0V+6Fz4CUce3F1APDh
	5KMvVFrLGsT7iwyCxvPSgNgcemvbGfe2lzbFeeDK6HIA6odEE/VW1DHzqJSoeBo/va4Q8aUglwP5p
	q4JS3dFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBTi-000000027GA-3VkL;
	Tue, 09 Apr 2024 13:25:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBTe-000000027Eu-3tMh
	for linux-mtd@lists.infradead.org;
	Tue, 09 Apr 2024 13:25:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5CA7261713;
	Tue,  9 Apr 2024 13:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A34B6C433F1;
	Tue,  9 Apr 2024 13:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712669130;
	bh=SMwyCpYci164qgV8wk1SPvHC3kuv4ESIgu2QjMn9KCU=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=TcTalmpPjI+A0cmWlCID76PxPO4CADvbJnlFLc2RKKfEX5quYc64MXBesZxqoRbSH
	 vPoOUV8/NgVoImZoNe86OFBKor2afsrZN+IRrQFa55slYWLsXUcSE8FFQWD/YngOjj
	 yW/i76impRHadj6h6kWZS7orquC8mxbQ+b9VrQq6scivlZEg4NENjKTkckTIRUF8RL
	 qoW1oOXyvryxf0yjGHma+Pd77li7l9i6G+LSnn6fJBYYGUgAQdr4a2O1x8prCmxQFY
	 YX+Tx0ItfHQ+clmaTrFRNXLWkw2ZrlPvjTporkp8gvOgSHqfkTEkNFuIT5pnCOfGkP
	 TPGPJRuwJ7Uuw==
Date: Tue, 09 Apr 2024 15:25:26 +0200
Message-Id: <D0FMJAZ3ZR1W.13DMUSVMDMJ7H@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for infineon
 cy15v102qsn
From: "Michael Walle" <mwalle@kernel.org>
To: "Hui Wang" <hui.wang@canonical.com>, <linux-mtd@lists.infradead.org>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240408124328.777375-1-hui.wang@canonical.com>
 <D0ER81J5LHKW.N4T3BI3FRLDB@kernel.org>
 <81551ca3-532d-43c8-859e-c3d9be8d6e9d@canonical.com>
 <D0FGHMY4V864.118ONNO1DWQ7G@kernel.org>
 <a82f7811-e9f4-4d1f-91f4-56b87d35eb9a@canonical.com>
In-Reply-To: <a82f7811-e9f4-4d1f-91f4-56b87d35eb9a@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_062531_065984_42EC9670 
X-CRM114-Status: GOOD (  21.53  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4379033370616265140=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4379033370616265140==
Content-Type: multipart/signed;
 boundary=6e9ceb0562a76cfd7a0b74efac3eef43c7543317b6277f50ccdae34b76ac;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--6e9ceb0562a76cfd7a0b74efac3eef43c7543317b6277f50ccdae34b76ac
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> >>>> It is 2Mbit F-RAM which is logically organized as 256K x 8.
> >>> Please have a look at drivers/misc/at25.c. I'm trying to get rid of
> >>> the NO_ERASE flag. This is more of an EEPROM like device. The at25
> >>> driver already have some kind of FRAM type support.
> >> After reading your comment, I checked the drivers/misc/at25.c, I found
> >> It couldn't work on my hardware. In my case, the F-RAM is under a spi
> >> bus (spi-nxp-fspi.c) which only supports spi_mem transfer mode. So
> >> currently, the mtd/spi-nor is the only choice.
> > Then it will be a great opportunity to make the at25 driver spi-mem
> > ready :)
> OK. :-)
> >>>> Signed-off-by: Hui Wang <hui.wang@canonical.com>
> >>>> ---
> >>>>    drivers/mtd/spi-nor/spansion.c | 6 ++++++
> >>>>    1 file changed, 6 insertions(+)
> >>>>
> >>>> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/sp=
ansion.c
> >>>> index 6cc237c24e07..5dc94926b2cb 100644
> >>>> --- a/drivers/mtd/spi-nor/spansion.c
> >>>> +++ b/drivers/mtd/spi-nor/spansion.c
> >>>> @@ -981,6 +981,12 @@ static const struct flash_info spansion_nor_par=
ts[] =3D {
> >>>>    		.name =3D "s28hs02gt",
> >>>>    		.mfr_flags =3D USE_CLPEF,
> >>>>    		.fixups =3D &s28hx_t_fixups,
> >>>> +	}, {
> >>>> +		.id =3D SNOR_ID(0x48, 0x51, 0x80, 0x06, 0x00, 0x00),
> >>> This doesn't look like a JEDEC id. The datasheet says it is a 11bit
> >>> manufacturer id?
> >>>
> >>> -michael
> >>   From the page 82 of datasheet, the Device ID is 0000000006805148, an=
d
> >> the ID read by spi_nor_read_id() matches it (id[0] is 0x48, id[1] is
> >> 0x51, ...).
> > JEDEC manufacturer IDs are not 11bit wide.
> Have no idea here. I thought it is same as the cy15x104q and the=20
> spansion.c has the support for cy15x104q.

That one was already broken (and I'd like to move that one to the
at25 too); it had the ID bits reversed and this one is even more
broken :(

-michael

--6e9ceb0562a76cfd7a0b74efac3eef43c7543317b6277f50ccdae34b76ac
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZhVBxhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iTCgGApefHNetY9ICe0jamFtK6VtYTx/e2KmZm
S0QXN9O3Jw8E0fOOg6fQob6pOcE6RCIqAYCV0LtbJtmik6KK9Rc3/cMH11ssNhlr
mq30W0mMGGw5T1jUJm2yZAIjJodkhhgF7xY=
=snES
-----END PGP SIGNATURE-----

--6e9ceb0562a76cfd7a0b74efac3eef43c7543317b6277f50ccdae34b76ac--


--===============4379033370616265140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4379033370616265140==--

