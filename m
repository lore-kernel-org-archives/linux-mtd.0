Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66096C54EBD
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Jan 2023 19:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oZCPoKSmw1nrkHHjfjw0TGGFXL8fD0GLV9XhQIAoSps=; b=OAU5LcWirkfFA/7n+Erx4sd0sQ
	FqQ2wW1EMEGb0fCBrNSEJHH1T+6lSNxDrXuxPxHg91S5RHjNLn+NYJ5d9pC+OTkL0mpqgwD330C0K
	8aYLV1fjbF3Cw3CX3u83aLIHZ1X9MIj24O/2xY6+9fnIeC8xtrndkKtx8cI8O/VVyMX2AfWJIjb+T
	6Ex/Q2xVrWxiP5vkpNWr2zqktu19+WkApfTb24vsNAudW7gR56xDJPkgdJ0H0Uh0YsuM5pJY3bhPE
	dwjj7QPimfOdtPmscVEYq0azSEYuGL5HsP0llrzbNw6XVA2k2V6OhIVk1jgoWS2gacQNv2ITkSN3r
	0yXHvWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPol-004F4l-5H; Fri, 13 Jan 2023 19:34:23 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGPoh-004F3s-SP
	for linux-mtd@lists.infradead.org; Fri, 13 Jan 2023 19:34:21 +0000
Received: by mail-qt1-x82e.google.com with SMTP id g9so5260233qtu.2
        for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2023 11:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LME7dFBoVKWzOV1o89cnMvL5T8FQ/ou+66O2dzYfR04=;
        b=C+cdEvkE1EjYt/u/YtrUektRTWKRLQUw77i53V7AZIUtvyJiDIPLfWFc1ztGWurrke
         IcfGhyyNR6AkuS5R54EHhHmoJIXtwxw77jptsqIczwViEUILpeEBP54u66Lc8bDgNdI0
         4Zlg1xMjNUM8yRIy+/mKjByuTl2PhCwSU8jVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LME7dFBoVKWzOV1o89cnMvL5T8FQ/ou+66O2dzYfR04=;
        b=J7biLdxnv719yek0mYqez+WbfYEt9xcBGuArMOA5roQpSz+i3j1dpTHQ/UYlB04DyY
         QhWw3e8QzRsYVZneknidrCZ34LMjhZH2GouetxK/OiO/w79yFAi7B55G600vpzaugHwC
         yxkROQS8nnksZB/CxiwKvGrjBzJYxlvLpTd3A6qYf2HaDOS1UNsMvHdxg0Pt3IGKCNUW
         W56unkJDDrj0g17ZuEZDenrAFdtkx4fpzuDo/Rq5Jo7XbJBFF1Z3lPKX7e7klQROft8Q
         oMsQrQxO/JmlmW+rNEwLizT/CEsxAhzZ+dtrxzufIfpfC28T9YrTX4tV7IM1X8C8ZRFV
         oNcw==
X-Gm-Message-State: AFqh2kpX89nEtfe+dmeXSarYLyVW7SkkhP7xxH3Fw+6cF6CuN48mfUbn
	RpIvkikWwLrLI6rUcpfm1/AkLw==
X-Google-Smtp-Source: AMrXdXstHRll1qN5mvWUmSV7S+WjKbKRL+AM5PDtn3/lo/7+0qdHHXHQ4rREd58ESrtnBvMdG9r91A==
X-Received: by 2002:ac8:6f07:0:b0:3ab:c8c6:51c2 with SMTP id bs7-20020ac86f07000000b003abc8c651c2mr56625741qtb.62.1673638453561;
        Fri, 13 Jan 2023 11:34:13 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-a538-813d-bada-d144.res6.spectrum.com. [2603:6081:7b00:6400:a538:813d:bada:d144])
        by smtp.gmail.com with ESMTPSA id cq12-20020a05622a424c00b00397e97baa96sm11062066qtb.0.2023.01.13.11.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 11:34:13 -0800 (PST)
Date: Fri, 13 Jan 2023 14:34:11 -0500
From: Tom Rini <trini@konsulko.com>
To: Francesco Dolcini <francesco@dolcini.it>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 0/3] fdt: Fix mtparts fixup
Message-ID: <20230113193411.GW3787616@bill-the-cat>
References: <20230113184547.487322-1-francesco@dolcini.it>
MIME-Version: 1.0
In-Reply-To: <20230113184547.487322-1-francesco@dolcini.it>
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_113419_946042_BCD08F38 
X-CRM114-Status: GOOD (  19.67  )
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
Content-Type: multipart/mixed; boundary="===============8638848310983654695=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8638848310983654695==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1+BOKhzaS22CDnKa"
Content-Disposition: inline


--1+BOKhzaS22CDnKa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 13, 2023 at 07:45:44PM +0100, Francesco Dolcini wrote:

> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>=20
> Recently we had a boot regression on colibri-imx7 because of a cleanup ch=
ange
> on Linux imx7.dtsi setting nand controller node #size-cells from 1 to 0.
>=20
> Because of that Linux partition parser was no longer able to properly
> parse the OF partitions leading to a boot failure, the above change was
> reverted in the meantime as an immediate workaround, but some improvement
> is required on both Linux and U-Boot.
>=20
> This change improve the U-Boot part of it, #size-cell is set to 1 when
> it has an invalid value. This has the limitation to work only with devices
> smaller than 4GiB. In general the suggestion from the Linux MTD maintaine=
r would
> be to just deprecate using this U-Boot function and pass the MTD partitio=
ns
> from the command line, unless they are statically defined in the DTS file
> in the first place.
>=20
> This series therefore convert colibri-imx6ull and colibri-imx7 to pass the
> partition list from the command line instead of fixing up the DT.
>=20
> Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@dolc=
ini.it/
> Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.torad=
ex.com/

My higher level question / concern here is, is using one of the dts
partition schemes still valid / preferred, or should everyone now have
reverted to passing via the kernel command line?  If device tree still,
is mtd/partitions/fixed-partitions.yaml the one to follow or something
else?

--=20
Tom

--1+BOKhzaS22CDnKa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPBsjAACgkQFHw5/5Y0
tyyelgv/SpM7fKhXk5p36lmuFPK6FR+TG+ORIjzhgme/lo4+lYi+DU/EVAE3g7Fg
juzDVnaWiqyd8fYujyV3SW+yNAtU3KpvqaLRy5o9ldDJkWiWAlKCWexafUQZPksV
wulXcllSVHCYsgsdG4n76tE8V/jlC7668aQ/IGZY/1JAlIJdCk6j6hfLa71uL4R1
rtQ+n11KEBkmj5Gm0e62O1RPo4tBhapWdQYDigiIYF5X+K113KeeQxb7GWPppoSi
IbRMvjJPbHnU3AvDuAaQPMSFvAZRQCpNexB7ZOF2rGjlnkIRA6PyfCEr/egIwrpF
7MJHKXODHIht908WtvTmjAvGfd8tt1g3n2jgRMfy+Q/yrePx1WiJ6Hhyy1bPqbeC
eeqFGnQ9gdhJHpE2NSiX34scK19OQP1UTl03NbTcts37KNq6yDLf/gt2uz2ymnrx
csSdWPfiXa7X7maasdG/pFryaPqH+pMPZyQ7MuZAl3d+3yI8VKN4pyMJ3JeB/dW1
IRsZHa2t
=GdY7
-----END PGP SIGNATURE-----

--1+BOKhzaS22CDnKa--


--===============8638848310983654695==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8638848310983654695==--

