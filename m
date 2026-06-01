Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F392CD5BD1
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jun 2026 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KiCCU7U+6+qrdmzUSFUe4uqlTAYyP3FQAdJ8HkU/2s=; b=umj6UT8Z2eRmiLqVNdYv6gV2dp
	JzTKeaXwqm0ahayKIc/XIuF8Q0S34VCqZ/5p5d8tcZXFNG7hyJqY2quebzBcTJGQJqhgKAbWezlOg
	X4qXzDA8CLeyXZaJkOjYq+vD8utV4HRiiQRS1cTtvgbYyEaZxJ9NQsu2A13W7UeIL7Kmrexp/L82/
	TNfZGuu4yQWuo9WzfwKljV6r43F5yj7/yKMfd+Eq4mkDtNe6K2nChR8AEtC20N++y9GJBoP5EDvNu
	886QYU0UK0TQbHBCMmRVKmB3UYQCfgnCbDl4aG30Pi7R4cvoF/I6C5xvuITt0tmZuZ3OOiQlLrRvH
	aKOdqiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2CZ-0000000BB65-3EOE;
	Mon, 01 Jun 2026 12:57:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2CW-0000000BB5X-3BWE
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jun 2026 12:57:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 647EF43D5E;
	Mon,  1 Jun 2026 12:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C33B81F00893;
	Mon,  1 Jun 2026 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780318624;
	bh=uOtGdQ10po6PYUzoNOVZJt/AVviEOzR047rRHV6QZ1Q=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=RE6Qtf8SZUxxnhNYYx/0QiTWuTcyboY6tatgNt6BXpBe84PZ8RuPXRihSr2jH+pxt
	 vLhXajVBlbV0MTJk6e+Y4dNRquyg7ehSaMSzdUtv1Pk3lm4X8IFFeiv9Z4UwHPKFWd
	 ZhCjAcU+RGe/f5X6trFXHi17ud6RZNIsRbJ9PhxN4ybIYheoRrtM1Yg4HosefXdXJO
	 RMjej9CgY69a3Wv77S5+vUaL7F7tAF8O6NxIfbpkjJgUO8Je0sUK+gx8iFFgG4XLs4
	 OWYUVjZfX+/qarQ2WejxioQ7p7pdmKw4FN8+bggpl9tNkzP2snuVCxIIliozAPDlKJ
	 do9LO1XDCeSRA==
Mime-Version: 1.0
Date: Mon, 01 Jun 2026 14:57:00 +0200
Message-Id: <DIXQA3JV2N5M.2UHTAAXQEWB86@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for MX25L12833F and
 MX25L12845G
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <alvinzhou@mxic.com.tw>, "Cheng Ming Lin"
 <chengminglin@mxic.com.tw>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260528051751.1648246-1-linchengming884@gmail.com>
 <DIU3OK3ELUD5.CUL6R3KNX0O9@kernel.org>
 <CAAyq3SY86mVwYtQMqhcZHjTxiD93awQZPDzHr8e5-+B9caNgbA@mail.gmail.com>
 <87eciwhtf8.fsf@bootlin.com> <DIU5AHNXBPN2.27JOC8D5COWAM@kernel.org>
 <CAAyq3SYX9UPwhC_Ume_S2yxhQwimRvB=Y6O_+FFqokhNmw7jQg@mail.gmail.com>
In-Reply-To: <CAAyq3SYX9UPwhC_Ume_S2yxhQwimRvB=Y6O_+FFqokhNmw7jQg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_055704_840943_2819CDF8 
X-CRM114-Status: GOOD (  34.46  )
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
Content-Type: multipart/mixed; boundary="===============1666082752401304972=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1666082752401304972==
Content-Type: multipart/signed;
 boundary=ed8d132310e85f4b2eec2d3d97e105344fc922fe0d44ac605c9c141fd8a6;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--ed8d132310e85f4b2eec2d3d97e105344fc922fe0d44ac605c9c141fd8a6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jun 1, 2026 at 2:56 AM CEST, Cheng Ming Lin wrote:
> Hi Michael,
>
> Michael Walle <mwalle@kernel.org> =E6=96=BC 2026=E5=B9=B45=E6=9C=8828=E6=
=97=A5=E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:52=E5=AF=AB=E9=81=93=EF=BC=9A
>>
>> Hi,
>>
>> On Thu May 28, 2026 at 9:42 AM CEST, Miquel Raynal wrote:
>> > Hi Cheng Ming,
>> >
>> >>> It looks like you're getting bitten by the ID reuse. You can't just
>> >>> unconditionally add the quad PP because as far as I can see the
>> >>> MX25L12805D [1] is just a standard single bit i/o flash and doesn't
>> >>> support the 4PP.
>> >>
>> >> You are absolutely right. Thanks for catching this.
>> >>
>> >> The MX25L12805D is indeed a much older product (released around 2009)=
.
>> >> Since the initial JESD216 SFDP standard wasn't published until 2011,
>> >> I double-checked with our internal PM and confirmed that the MX25L128=
05D
>> >> does not support SFDP at all.
>> >>
>> >> Since the newer flashes (MX25L12833F and MX25L12845G) do support SFDP=
,
>> >> we could use this as a differentiator to distinguish them from the le=
gacy
>> >> MX25L12805D.
>> >>
>> >> What if we try to read the SFDP signature (RDSFDP) in the fixup hook?
>> >> If a valid SFDP signature is detected, we can safely identify it as t=
he
>> >> newer flash and apply the SNOR_HWCAPS_PP_1_4_4 capability. If there i=
s
>> >> no SFDP signature, we leave it as is for the legacy MX25L12805D.
>> >>
>> >> Do you think this approach is feasible and acceptable? If so, I will
>> >> implement this logic and submit a v2 patch.
>> >
>> > The ->post_sfdp() fixup hook is documented as "not called for SPI NORs
>> > that do not support SFDP". Alternatively, I believe an earlier hook,
>> > like ->post_bfpt() could also work since it does not seem to run on
>> > non SFDP compatible flashes.
>>
>> Moreover:
>>
>>  *    spi_nor_post_sfdp_fixups() is called after the SFDP tables are par=
sed.
>>  *    It is used to tweak various flash parameters when information prov=
ided
>>  *    by the SFDP tables are wrong.
>>
>> And it looks like that is the case for these flashes. Also, please
>> provide a comment on the fixup describing that the flash misses that
>> property. Basically, what you've written in the commit message.
>
> I am currently working on the flash part 0xc22018 and I am planning to
> add its size back to the flash info table. However, I encountered an
> issue regarding the fixup hooks.
>
> Since this specific flash does not support dual, quad, or octal reads,
> the core logic in spi_nor_init_params_deprecated() determines that SFDP
> parsing is not needed. Because the SFDP parsing is skipped, the post_bfpt
> or post_sfdp hooks are never triggered, which prevents us from applying
> the necessary fixups as we expected.
>
> I initially considered asking about the possibility of removing this
> specific check in spi_nor_init_params_deprecated(), which would allow
> all SPI-NOR flashes to go through SFDP parsing by default (unless
> SPI_NOR_SKIP_SFDP is explicitly set).

Oops, I've forgot to add you on CC. Sorry. I've just send a series
to get rid of that legacy handling. Please give it a try on your
flashes.

[1] https://lore.kernel.org/linux-mtd/20260601125438.3481722-1-mwalle@kerne=
l.org/

-michael

> However, I am aware that forcing SFDP parsing globally on all legacy
> 1-1-1 flashes might be risky. Flashes predating the JESD216 standard
> might return garbage data when the SFDP opcode (0x5A) is issued,
> potentially causing regressions if the garbage data accidentally matches
> the SFDP signature.
>
> If dropping this global check is indeed considered too risky for older
> hardware, would it be acceptable to use the late_init hook to handle
> this flash individually? The idea would be to manually check and parse
> the SFDP table exclusively for 0xc22018 within its own fixup, ensuring
> that no other legacy 1-1-1 flashes are affected by this change.
>
> Any thoughts or guidance on whether this late_init approach is the right
> way to go would be greatly appreciated.

--ed8d132310e85f4b2eec2d3d97e105344fc922fe0d44ac605c9c141fd8a6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCah2BnBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/h3eQGA9opRdQ0dC72blLAiAtGF/+VPIGb0j1Y7
5BPFsh3pfCFFJeKsULeBO+14w0gNqf6nAX0fw+QONj2GS599XKdYCyo6NNyTDqUy
M4LmdntTIEIxGzFkzeZh5RXOBJWhXkU+9xs=
=8Rlz
-----END PGP SIGNATURE-----

--ed8d132310e85f4b2eec2d3d97e105344fc922fe0d44ac605c9c141fd8a6--


--===============1666082752401304972==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1666082752401304972==--

