Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD56C433FF
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 20:43:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69C4520659
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 20:43:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uY1ogZBT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69C4520659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pZOP95GwL6vivCmgnDjdXt/uWPMi1qovTPadcLys2FA=; b=uY1ogZBTOdJZ5F+RKsBU7LS94
	2fY5HqWYwihz3jty1eaRZKHGsXpXSYCTo00aERlkYbpq9hqzktgIQpUDKo5JD+aaJxcL3+S0WOm5h
	xFCZelkLG07GDVInolNwk29R/Lvl6CrD/m4f/ioZLhc8erEUrEK1tU//4zmb51WEDmbANTPMy0Aum
	2oXE7KtpvJIUY115gzzmkvqxwuVaknco7aqXq3fLnb61FeHfaUmg11Bci5OVowJir9Sql8s47v1y4
	PioSV0AbvJ3CGa/MwQSmrHt1mHuWfebzGYyeGFKZ0m9kzY4PxoAjYqc3CUOmwbxXQ/Qq/fI4t/l1j
	+qYLSMOAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsCUg-0001ph-En; Mon, 29 Jul 2019 20:43:42 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsCUc-0001p7-QM
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 20:43:40 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45yBVF6PK6z1rHDP;
 Mon, 29 Jul 2019 22:43:33 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45yBVF5ZKjz1qqkK;
 Mon, 29 Jul 2019 22:43:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id yTU4SBFMmSVD; Mon, 29 Jul 2019 22:43:32 +0200 (CEST)
X-Auth-Info: Kq6+oOLYA+psDJ32onXBud7SW7UDTpd4d61O0287/lY=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 29 Jul 2019 22:43:32 +0200 (CEST)
Date: Mon, 29 Jul 2019 22:43:26 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [imx][vybrid][qspi] Regression notification - vybrid vf610
 QUADSPI - BK4 board
Message-ID: <20190729224326.44aa3057@jawa>
In-Reply-To: <CAOMZO5CsTPaRSe-VmOwnnYrsMMXa3GhurmsWwzaPo948xs10FA@mail.gmail.com>
References: <20190725001114.0ceff19c@jawa>
 <CAOMZO5CsTPaRSe-VmOwnnYrsMMXa3GhurmsWwzaPo948xs10FA@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_134339_167449_59B89C76 
X-CRM114-Status: GOOD (  24.10  )
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
Cc: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, Suresh Gupta <suresh.gupta@nxp.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: multipart/mixed; boundary="===============8640435515972176296=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8640435515972176296==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/s8N9rFZceOKrxeEbz9AGEz2"; protocol="application/pgp-signature"

--Sig_/s8N9rFZceOKrxeEbz9AGEz2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Lukasz,
>=20
> On Wed, Jul 24, 2019 at 7:11 PM Lukasz Majewski <lukma@denx.de> wrote:
> >
> > Dear All,
> >
> > I'd like to report that after moving the fsl-quadspi.c driver
> > from ./drivers/mtd to ./drivers/spi (around 5.1-rc1) [1] the
> > Vybrid's QUADSPI (even with single SPI-NOR memory connected) is not
> > working anymore (the chip ID read is FF FF FF).
> >
> > This wouldn't be a problem per-se, but not all necessary code was
> > moved
> > - especially for vybrid which has issues with some HW bugs [2]:
> > =20
> > --------------->8---------------- =20
> >  * The IC guy suggests we use the "AHB Command Read" which is faster
> >  * then the "IP Command Read". (What's more is that there is a bug
> > in
> >  * the "IP Command Read" in the Vybrid.)
> > ---------------8<----------------
> >
> > I've explicitly asked NXP support for this HW issue [3] - but till
> > now there was no reply.
> >
> > The official linux-imx (from meta-freescale) seems not to support
> > vybrid (vf610) anymore - and the newest available now kernel is
> > 4.19 (with the old fsl-quadspi.c driver available).
> >
> >
> >
> > Hence the question - has anybody noticed this issue and (maybe) is
> > working on it? =20
>=20
> I don't have access to a Vybrid board, but I kindly got the
> confirmation from Andrey on Cc that QSPI is working fine on his Vybrid
> based board running linux-next.
>=20

Thank you for your reply, Fabio.

Andrey , could you share your setup info? How your memories are
connected?

Would it be possible to share your dts files for linux-next?

I did a bit more debugging and the old driver (before conversion) on my
setup breaks when I try to erase/write/read 256+ bytes (with dd's block
size -> bs =3D 1).

Could you check if erase, write and read of

dd if=3D/dev/urandom of=3D/dev/mtd7 bs=3D1 count=3D256=20

works as expected?


Writing larger chunks (with bs=3D64) works as expected.

> Regards,
>=20
> Fabio Estevam




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/s8N9rFZceOKrxeEbz9AGEz2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl0/Wm4ACgkQAR8vZIA0
zr28vwgAvLY8mOG5DG8mhPsBMMBxjuAz3TlNz5oXMnwG0thGEhNwvGMn62hL4zIV
o95hUNMK3VamONFQ2G4zbrX0QlPGqlEylpwfVX52H3+0sv7BLizfQPIypMnZ0jPi
fsO+4vKynCfru5JtC2B47rH7oHtFYF8FkhhaHS9Ps+3TFaAV+nhqcRLmvHeINEW+
wmgSTwYIhdwhASNdCt1CN2j8uL8nCzEA5o6yJPt3011v/x7OPaBflR0GB1uEVB9e
MPuSuMEPHza+j+IJKFJDqbkximVrx59nTrADXcPgtvmACEOJjt7HIYRmxFirB50T
9qINLLQsUqnflv4C5wbr0AxUJXq1OA==
=p8tz
-----END PGP SIGNATURE-----

--Sig_/s8N9rFZceOKrxeEbz9AGEz2--


--===============8640435515972176296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8640435515972176296==--

