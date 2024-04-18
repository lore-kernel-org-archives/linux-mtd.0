Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1CFFC4345F
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2024 09:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7EigxIUW0ea3l3yFZGSWrYsVpCH2iq8FER2Ja81sNDk=; b=W983T4C/gF7v5CEQhZ72XMe9rw
	jQBONweJCdmcCkLU3odXcwOwBvGNMANEaBid5jxB2RglWYeNqD7382G+Y3Liyt/JukS1kijj7Bcx7
	RKFpTAIROJLbXq0y8E3uq9gspv0eTL0CPkmW4aucH1uMqNQpX2r+glVA2g5wO3AVLJwEPuORBMGGg
	2lfpNW3Dzfxe6t47iGp7irRCPycCYh/OX7Hcq4PQNrmybGTXT5AoMXCApx5AfL2QdwOUeYqaxr2Vj
	/WbX56iiqHeZdAzsRJkwGs7v+doB6biv1/4i2Mh/bbU6WG8p7uchuAhvD0C7yIuIsCJWDRhNVe+HS
	Npg2/mDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOWg-00000001ify-0IL3;
	Thu, 18 Apr 2024 09:57:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOWc-00000001ier-2zU4
	for linux-mtd@lists.infradead.org;
	Thu, 18 Apr 2024 09:57:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A17E4CE17B8;
	Thu, 18 Apr 2024 09:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E80EC113CC;
	Thu, 18 Apr 2024 09:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713434266;
	bh=FnO7O/LAw4UD9EIKQqffhjBWzBF2/WXbWWY5ME5kBNo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=EfTBw90L4vECvMjY6fgUro/CI+kPMmubR9J4aZTL+VlxjrFBHSjNeLq5nAVOEa0ys
	 CtUi6dSbl0AK9PtokwZkqOxh+zO+z/wu0s5olR17H4MUgOXFcb+thnZSUngjFnPeiw
	 P8wEIgmjVLS98FHbCqoGgK8CFB+fkeXNFuFwj4Y7hR7ZmG3RsLiv/IYaq4mNgCDhr/
	 YFjebODwdUd4aaUikgkd0jPHz05PcC1a0O93ikHC0tD5aPjDUJXwCaoi8FTUbjm704
	 T4l/M5LUEX2qPR1N/13nqkxeSqmHu1yxu4HnroeBAYq5JslItN+Muxt5zlh/CI5ikG
	 ueLSdRJG7J42A==
Date: Thu, 18 Apr 2024 11:57:27 +0200
Message-Id: <D0N5QYQMX1X4.831Q9SEANU4S@kernel.org>
Subject: Re: [RFC PATCH v1 6/6] mtd: spi-nor: introduce support for
 displaying deprecation message
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Pratyush Yadav" <pratyush@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240412134405.381832-1-mwalle@kernel.org>
 <20240412134405.381832-7-mwalle@kernel.org> <mafs0jzkw6oq1.fsf@kernel.org>
 <D0MHEH8OOS44.2PPBZ3LFU4QG3@kernel.org> <mafs0bk686l67.fsf@kernel.org>
In-Reply-To: <mafs0bk686l67.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_025751_137221_CAFCEEBE 
X-CRM114-Status: GOOD (  32.10  )
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
Content-Type: multipart/mixed; boundary="===============6409965513138380194=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6409965513138380194==
Content-Type: multipart/signed;
 boundary=d634570c1f6a4a1796182749624c4b5d93dc5a4862d7079e44e41056bc8b;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--d634570c1f6a4a1796182749624c4b5d93dc5a4862d7079e44e41056bc8b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Apr 17, 2024 at 5:52 PM CEST, Pratyush Yadav wrote:
> On Wed, Apr 17 2024, Michael Walle wrote:
> > On Wed Apr 17, 2024 at 4:36 PM CEST, Pratyush Yadav wrote:
> >> On Fri, Apr 12 2024, Michael Walle wrote:
> >>
> >> > SPI-NOR will automatically detect the attached flash device most of =
the
> >> > time. We cannot easily find out if boards are using a given flash.
> >> > Therefore, introduce a (temporary) flag to display a message on boot=
 if
> >>
> >> Why temporary? There will always be a need to deprecate one flash or
> >> another. Might as well keep the flag around.
> >
> > Mh, yes I agree. That also means that this flag will not have any
> > users (most) of the time (hopefully ;) ).
> >
> >> Also, this patch/series does not add any users of the deprecated flag.
> >> If you have some flashes in mind, it would be good to add them to the
> >> patch/series.
> >
> > This is just an RFC to see if whether you Tudor agree with me :) But
> > I was about to add it to the evervision/cypress FRAMs.
> >
> >> I like the idea in general. Do you think we should also print a rough
> >> date for the deprecation as well?
> >
> > Might make sense, any suggestions?
>
> How about a simple string to flash_info?

Ahh, I was rather asking if you already had a time frame in mind.

Besides that, should it be a date or a (future) kernel version?
Roughly about two/three kernel releases?

> /**
>  * struct flash_info - SPI NOR flash_info entry.
>  * @id:   pointer to struct spi_nor_id or NULL, which means "no ID" (most=
ly
>  *        older chips).
>  * @name: (obsolete) the name of the flash. Do not set it for new additio=
ns.
>  * @size:           the size of the flash in bytes.
>  * @deprecation_date: The date after which the support for this flash wil=
l be
>  *                    removed.
>  * [...]
>  */
> struct flash_info {
> 	char *name;
> 	const struct spi_nor_id *id;
> 	char *deprecation_date;
> 	[...]
> }
>
> And then in everspin.c for example,
>
> 	{
> 		.name =3D "mr25h128",
> 		.size =3D SZ_16K,
> 		.sector_size =3D SZ_16K,
> 		.addr_nbytes =3D 2,
> 		.flags =3D SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> 		.deprecation_date =3D "2025-01-01",
> 	}, {
>
> And in spi_nor_get_flash_info() (changed some wording of the message):
>
> 	info =3D jinfo ?: info;
>
> 	if (info->deprecation_date)
> 		pr_warn("Your board or device tree is using a SPI NOR flash (%s) with\n=
"
> 			"deprecated driver support. It can be removed in any kernel\n"
> 			"version after %s. If you feel this shouldn't be the case, please cont=
act\n"
> 			"us at linux-mtd@lists.infradead.org\n", info->name,
> 			info->deprecation_date);
>
> 	return info;
>
> This would also remove the need for SPI_NOR_DEPRECATED. But it would
> make the flash_info 4 or 8 bytes larger.
>
> What do you think?

Looks good.

-michael

--d634570c1f6a4a1796182749624c4b5d93dc5a4862d7079e44e41056bc8b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZiDuhxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gX8QF44ntSYBOpUzOrXjd2P5ZKnbh5928I1t36
JOjjpnwFUrSpmcnSrtzO6TzpDxJSeYABgNW3ep68DS04VArOFpAeXNmTKp9a5w91
TagrJH8qrhzlzkJ+eVJiDIkY8Q2Z0LNYyQ==
=4HSX
-----END PGP SIGNATURE-----

--d634570c1f6a4a1796182749624c4b5d93dc5a4862d7079e44e41056bc8b--


--===============6409965513138380194==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6409965513138380194==--

