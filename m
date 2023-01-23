Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6601C25B50
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Jan 2023 20:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dZVmapt5rMklVeHMAmpVxFJP51SUe0LrKlQbu/DRcTk=; b=lGq5snpaV8u4iKzeM71lGah1Tc
	ekirVrSrSYU0jmvq+2JKKILT3Fnm9x5h56/g5M7n5fTXgIPJ6vD22+bhGE1MStBambX+U3CkHuQVi
	naL33oHOMpEo98d4PlJztPq/qrvmd2HHanISGmSL7mTM/FrQz2iA4Xt42/bhLTFflC54e0VHvvmI9
	vNqedaGh2Im+3Am7j7h5gJyBDEUo7WDmAot2mrSMCjA+RzaVU4k9WrhTBCWNvVgXuk8raVXfnyLoP
	xLsc8Fx6fhifYAP7p1vLNLMe+lOynpEup2Sw9YYM+mfnEhKbL7mhQlGO4sU10ciAEUKqb2ibrfKgG
	eyCjgcCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK30d-001Fne-Au; Mon, 23 Jan 2023 20:01:39 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK30a-001Fm2-0c
	for linux-mtd@lists.infradead.org; Mon, 23 Jan 2023 20:01:37 +0000
Received: by mail-ot1-x32c.google.com with SMTP id x21-20020a056830245500b006865ccca77aso7978566otr.11
        for <linux-mtd@lists.infradead.org>; Mon, 23 Jan 2023 12:01:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/vFJYnjWTF7/HDz4/nqFC2EMBgYqD6KAwwiGoEwbNLo=;
        b=GCv7fsaXcsEEryq1B5BqP3EcsBjo2FV3ccbQ3rtQpojQYjsfgp7EssDVvk8UK5MwQW
         FYfX4cvbKhWQjZ5eUIAev63TcqFAsreTKrzfdDIPl+r88yj9Fno9HvhlZ1xZhwbONo7R
         tHJdCmGTHxQdkShfel2IRP3fSVDHfOiYQVmcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vFJYnjWTF7/HDz4/nqFC2EMBgYqD6KAwwiGoEwbNLo=;
        b=t0XxzZbofW6E7124BPX9TYL5ddkMEdqbuWhyI84Eb3h9s1urXwNW2QXVmJLsewEIy/
         3H4rzYQ+MKtCNHNLAkQH2nrpfBylw9abTRjcnUf5ZYvLuf7KozUFWLpONgM9AjXETScI
         Y8DemZ1prJ556PqTLaLwXPjovGTY5olWT8Mbithr0omjPeO05SPl+XHNHNeAwt/EwEUy
         JAMSfLIEPdIdTGCYZawQ0AF1p+PVTPNtuA17wzKiBqlsHsRAD9cAUt3gKf675NuDoy2y
         in/5Hf7EcS0Rd3KSY4w2S4JSYSTgmpiqhg4OCWAllne2/Tmzn9dBPxXHMkl76k9+odTq
         hNgA==
X-Gm-Message-State: AFqh2kr5PjrSkH49o4zGhCzOOQuasNlE/2d+DSg/BQbewTfjJzdBggPU
	DiixRbVx+S5pT/OHtK0Q17SqMCVukjfk8wmXVYs=
X-Google-Smtp-Source: AMrXdXv1KtVpe5q9LOFqZjcrPXdWnrceoL72fRwoLMtthVkgXnqZBjxukvYS1YZ2D5t4eWeYDo1s+g==
X-Received: by 2002:a05:6830:18e6:b0:67f:e4ff:2996 with SMTP id d6-20020a05683018e600b0067fe4ff2996mr10877848otf.12.1674504093711;
        Mon, 23 Jan 2023 12:01:33 -0800 (PST)
Received: from bill-the-cat (2603-6081-7b00-6400-6451-01cf-0286-1d77.res6.spectrum.com. [2603:6081:7b00:6400:6451:1cf:286:1d77])
        by smtp.gmail.com with ESMTPSA id j10-20020a05620a0a4a00b00706a452c074sm50365qka.104.2023.01.23.12.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:01:33 -0800 (PST)
Date: Mon, 23 Jan 2023 15:01:31 -0500
From: Tom Rini <trini@konsulko.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
	Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Marek Vasut <marex@denx.de>, linux-mtd@lists.infradead.org,
	Patrick Delaunay <patrick.delaunay@foss.st.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>
Subject: Re: [PATCH v1 0/3] fdt: Fix mtparts fixup
Message-ID: <20230123200131.GD631605@bill-the-cat>
References: <20230113184547.487322-1-francesco@dolcini.it>
 <20230113193411.GW3787616@bill-the-cat>
 <20230123110606.56110e40@xps-13>
MIME-Version: 1.0
In-Reply-To: <20230123110606.56110e40@xps-13>
X-Clacks-Overhead: GNU Terry Pratchett
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_120136_089192_F425DA95 
X-CRM114-Status: GOOD (  37.30  )
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
Content-Type: multipart/mixed; boundary="===============7051750284636002020=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7051750284636002020==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+1aBKeCoRrxtQ74y"
Content-Disposition: inline


--+1aBKeCoRrxtQ74y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 23, 2023 at 11:06:06AM +0100, Miquel Raynal wrote:
> Hi Tom,
>=20
> trini@konsulko.com wrote on Fri, 13 Jan 2023 14:34:11 -0500:
>=20
> > On Fri, Jan 13, 2023 at 07:45:44PM +0100, Francesco Dolcini wrote:
> >=20
> > > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > >=20
> > > Recently we had a boot regression on colibri-imx7 because of a cleanu=
p change
> > > on Linux imx7.dtsi setting nand controller node #size-cells from 1 to=
 0.
> > >=20
> > > Because of that Linux partition parser was no longer able to properly
> > > parse the OF partitions leading to a boot failure, the above change w=
as
> > > reverted in the meantime as an immediate workaround, but some improve=
ment
> > > is required on both Linux and U-Boot.
> > >=20
> > > This change improve the U-Boot part of it, #size-cell is set to 1 when
> > > it has an invalid value. This has the limitation to work only with de=
vices
> > > smaller than 4GiB. In general the suggestion from the Linux MTD maint=
ainer would
> > > be to just deprecate using this U-Boot function and pass the MTD part=
itions
> > > from the command line, unless they are statically defined in the DTS =
file
> > > in the first place.
> > >=20
> > > This series therefore convert colibri-imx6ull and colibri-imx7 to pas=
s the
> > > partition list from the command line instead of fixing up the DT.
> > >=20
> > > Link: https://lore.kernel.org/all/20221202071900.1143950-1-francesco@=
dolcini.it/
> > > Link: https://lore.kernel.org/all/Y4dgBTGNWpM6SQXI@francesco-nb.int.t=
oradex.com/ =20
> >=20
> > My higher level question / concern here is, is using one of the dts
> > partition schemes still valid / preferred, or should everyone now have
> > reverted to passing via the kernel command line?  If device tree still,
> > is mtd/partitions/fixed-partitions.yaml the one to follow or something
> > else?
>=20
> I don't think we can "prefer" one mode over the other between cmdline
> and DTS. Both should work pretty well. Of course on the cmdline you can
> only define fixed partitions and many devices require more advanced
> parsers, which are only available through DTS, but for simple
> partitions, it works totally okay.

When both are present, which one is used?

> The only thing that I would like to avoid is the need to write code in
> the bootloaders to tweak the FDT in order to add partitions. That is
> clearly not needed, error prone, and do not follow evolution of the
> "standard", as we just discovered.

I'm not sure about this. Looking around in U-Boot today, I see two types
of cases. One of which, the colibri case, can clearly be not done and
either passed on the command line, or put in to the device tree as
there's nothing run-time related being tweaked here. That's a fine path
to take on those platforms and Francesco's patches should be updated to
remove the unused C code too from the board code.

But the other cases are doing something dynamic and run-time related.
There's the omap3 igep00x0 family (which yes, legacy) that is doing NAND
or oneNAND and adjusting things at run time.  I don't know how much
anyone has interest in those platforms at this point, nor exactly who to
contact (for Linux or U-Boot). There's also the stm32mp1 family doing
something that's very not obvious at first glance, so I've cc'd the
maintainers there.

--=20
Tom

--+1aBKeCoRrxtQ74y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEEGjx/cOCPqxcHgJu/FHw5/5Y0tywFAmPO55QACgkQFHw5/5Y0
tywlVwv6AqZisaSzvQbWbcCigTNfWIrJr8UK8llgM0WQyWwJD7bZFEkHjGnZPaLR
5FLmPEUg/GidQv8RML7na1sn8ID1a4XcL3xMyHyvcvjAJgUAs8xoh51baNAfdZBB
prhQT8CrAQDryXdqsYnedmeQO3YA0ChWzBWigPO+5AIy0su45qlf7vWPJPlld3No
6QiOWyltXsYLaHt9buZMF8o+W9TLSTFSCQ1wzBiEpTZHSRd7fi7o2w54g2hNw6wU
Blpb2X/7EXlim8qw44pkRU8m/EZNI8CvfB9u3fWACNdDIu605StbAIvh4/BBfCHh
xXU1Xt3iQFmLm2adzTnyOgDsN3LE0oXFT0mDVRPOSjx9Pc8DkRgs5bpLVcKFIEUy
WTH5idJ9JFQChbcuJMj9+NNKLRxZQ3OBO+UTqwEoG9pCDDyt3P0BFTwF93L24258
ySu8+ESKzENLV6fqnVHDmUgNzRFr6QyZea8tIEWzxL7axtA7vGHab4qCb+mr+n6D
69a7Pq6n
=CK7E
-----END PGP SIGNATURE-----

--+1aBKeCoRrxtQ74y--


--===============7051750284636002020==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7051750284636002020==--

