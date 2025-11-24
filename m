Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3176CFA466
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 08:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sv51dZu9dPkFU2s7FVDTno7ryJVlqM5wDdGYp2JbK1g=; b=xr4h4NTa5er656i8KsEbMWGprs
	4RWROkFJy2aqdk/8iB67BqqNonD8HTIj/tZ2GXvR9cbshfoUb9fE2QoXaxxHevwgvzN81aUTOhZgI
	AKl/WpCfG1WplVEaIvDfCON3asFqKK+Ze3+uVNpC3dnYVQjufoLPxxjU64pS1wwmrUjECXOgPAryR
	7nTKJz0hvdS4eKnvWtikxJsjGhPLD5fguicMNdlTX6XrXQj5JR3rtXAycEcl7Bx2ROA7ubIK1UAxv
	Y5gL73qjjpRU8CF4LcO+SZOAYSAFoyw3EWHebWz9AeY9FLtZE2f0IIL3xgqNV3wykJuuYatBP6m3N
	SsOPacfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSHO-0000000BIfq-25eq;
	Mon, 24 Nov 2025 08:50:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNSHN-0000000BIfk-34UE
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 08:50:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1E92601A5;
	Mon, 24 Nov 2025 08:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F03C4CEF1;
	Mon, 24 Nov 2025 08:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763974236;
	bh=nZ5XJHT6b6jo0JMJAgi257X1GZmJ6tQvUT4N0yyiC+U=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=MKa5CCwKcUOYlf1AXmhUo6IAFW8+DslNPhxHjgQigf7qstRZQUel9phhR5xYzTrnc
	 U4pkH552xZRNV5bSp8rx1ajHFy9xe13jzE3ymR57M9n7gSiEG9lLV9VzUcyViJU1K5
	 mRZjeDsTqP+XNzeeAZwFcrgB7OX0e3H0OBGXVXChotDd711AkZSuBJ5jqK4iH7HfRG
	 ZWep8RSaF13+WLZWq+rYj76HkeLEb/J0n4qyKO9zKc4RqkJC19y8ckfo/Y0EyIwodM
	 XmKdSDUsNyWDdcIAhChHWWoE87D+ECzg77SQqkWFW0vRkKDM2wl940pjtICBa3Hjmb
	 3fIGhIFbNMUNw==
Mime-Version: 1.0
Date: Mon, 24 Nov 2025 09:50:27 +0100
Message-Id: <DEGSOCUMG4WZ.3IYU22B83Z2AI@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix w25q01jv flags
Cc: "Marc Olberding" <molberding@nvidia.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20251121-w25q01jv_fixup-v1-1-3d175050db73@nvidia.com>
 <87jyzfzwpw.fsf@bootlin.com> <DEGRVEN1ZNUY.OCJLFWDG8XD4@kernel.org>
 <87bjkrzvk7.fsf@bootlin.com>
In-Reply-To: <87bjkrzvk7.fsf@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============2697870718789083739=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2697870718789083739==
Content-Type: multipart/signed;
 boundary=936d147121f3cbc70ca7a52323f099e93918d9f04cfc98dca8630d4a857f;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--936d147121f3cbc70ca7a52323f099e93918d9f04cfc98dca8630d4a857f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Nov 24, 2025 at 9:25 AM CET, Miquel Raynal wrote:
> Hi,
>
> On 24/11/2025 at 09:12:38 +01, "Michael Walle" <mwalle@kernel.org> wrote:
>
>> Hi,
>>
>>>> +		.no_sfdp_flags =3D SECT_4K,
>>>
>>> This one is the right fix and should stand alone in its own patch (firs=
t
>>> in the series if you add support for the block protection).
>>
>> Only if that flash really doesn't have SFDP. But since the entry
>> didn't have a size property the flash *must* have SFDP in the first
>> place.  Otherwise it won't even be probed. Please provide a dump of
>> the SFDP tables, see [1].
>
> SFDP data is in lore

At least yours :) And if I decode that correctly by hand, it has the
4k erase size bit set as well as the correct opcode 20h or 21h for
4byte addressing.

> , but not the params which are missing (?) Marc, can
> you compare with your data?
> https://lore.kernel.org/all/20250110-winbond-6-12-rc1-nor-volatile-bit-v3=
-1-735363f8cc7d@bootlin.com/
>
>> Also please provide the contents of
>> /sys/kernel/debug/spi-nor/spiN.N/params.
>>
>> -michael
>
> My understanding (which may clearly be erroneous) is that most of these
> flashes support 4K blocks but somehow don't advertise it in their SFDP
> data, so every time we describe a chip we must remember to tick that
> flag.

Which flag? SECT_4K? I don't think that will be used at all, does
it? It's only used in spi_nor_no_sfdp_init_params() which in turn is
only called in spi_nor_init_params_deprecated() (or if SKIP_SFDP is
set).=20

> I guess all^Wmost chips have 4k blocks compatibility support, but in
> general we prefer to use bigger blocks (the ones advertised in the SFDP
> data). Michael, am I being mislead by the decades of history that went
> through the spi-nor core? :)

You mean CONFIG_MTD_SPI_NOR_USE_4K_SECTORS? But that has nothing to
to with the flashdb/sfdp parsing.

-michael

>
>> [1] https://docs.kernel.org/driver-api/mtd/spi-nor.html#minimum-testing-=
requirements
>>
>>>
>>>>  		.fixups =3D &winbond_nor_multi_die_fixups,
>>>>  	}, {
>>>>  		.id =3D SNOR_ID(0xef, 0x50, 0x12),
>>>
>>> Thanks,
>>> Miqu=C3=A8l


--936d147121f3cbc70ca7a52323f099e93918d9f04cfc98dca8630d4a857f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaSQcUxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iT8QF+LY0WWwF1vuL3tDvq9wEHkNHwFMeuYn89
irBj2dPTSbq/h1QLcTLWRx46g8jFB/jSAXoCN/ljYV8oI98R8bamIhSvjOUlSIsL
QaZLtiQgcr7CsE9hZc00JkdDGxfWoc+beWc=
=PtPP
-----END PGP SIGNATURE-----

--936d147121f3cbc70ca7a52323f099e93918d9f04cfc98dca8630d4a857f--


--===============2697870718789083739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2697870718789083739==--

