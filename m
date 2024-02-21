Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82499C48BC3
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Feb 2024 11:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b72RJOYhmZGqPO4s+3n4FzewpWFY8izovcEc4sQ513U=; b=NC00NX0VOhdtRncmJvvB+p6uWe
	fPMNm7+HrzjUv6xzrLUo63tREOPtDXCqBJpYd5prAbJVKfXVRGJQfsGdtFv8JGKrxqA1AJF7PagFV
	qIPhD3O5UV0+S881WDprpeJOi59HcmaQtxaS+x65uaGAKMpuSg9MO2b4hrWxVUyxwdsXemOY5dLCv
	YlHgzXQEvMikIabP7Rjcd7BuRn9HT0TysvbA7UrNgD5CeSGVCYnVyuyBiEpkFLlFL19rMiIgSwq52
	1D/8eT0BB3wJdZmyhHIdnseUw2QoFAGv5odv6OYp50EmY/K+dP83i3d+oVB8sgZxHCb61Pn2jY/1G
	3CetT8Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcl9W-00000000lep-3aaJ;
	Wed, 21 Feb 2024 11:52:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcl9T-00000000leO-0tKN
	for linux-mtd@lists.infradead.org;
	Wed, 21 Feb 2024 11:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5B986139D;
	Wed, 21 Feb 2024 11:52:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2660C433C7;
	Wed, 21 Feb 2024 11:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708516358;
	bh=lZLENxtHLbI6QbQIsmJDLuLCaCc5Gu/ruskB21Fbjd4=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=JahR6DaOk3I/CcusIGmx+XzxI0zXtyxmcIprdjvc2Su2RQEF0iJ38GgOpZO+/fllm
	 ZlUuKfJYvaAWKqs6fuMTPGBm6V0CN3JYis4ZvmNj8+9j6nBxSak9RoIfM7oh1Dchn+
	 zzYjv8P82bkaHQPmRH9Oj1RgSKtZ8pj3jLGYhi/iosspHIczcmhcFk2+vvcoQd1kRm
	 lBuR3myQY5ir/Pj+5N89EIkh43E1kkaFR5ixa8aT5UyYiCLiz3MNfSzO4Wvp5sz0aR
	 Y2aBmqsHCU8U7zOoFLDTrlV5Qj1yysP6yMQYyjCLck2fjyUfWYn7EoMh5fiAAUFe4y
	 7rI7jd9Z+20tQ==
Date: Wed, 21 Feb 2024 12:52:25 +0100
Message-Id: <CZAQHXT016DW.GDDY3ZAKS4CJ@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Pratyush Yadav" <pratyush@kernel.org>
Subject: Re: [PATCH v7] dt-bindings: mtd: spi-nor: add optional interrupts
 property
Cc: "Josua Mayer" <josua@solid-run.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-mtd@lists.infradead.org>, "Takahiro Kuwano"
 <tkuw584924@gmail.com>, "Takahiro Kuwano" <Takahiro.Kuwano@infineon.com>,
 "Yazan Shhady" <yazan.shhady@solid-run.com>, "Rob Herring"
 <robh@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20240219-mtd-flash-interrupt-binding-v7-1-206e30a656fa@solid-run.com> <CZAM553H2H56.2TDN36QEL90XX@kernel.org> <a0144c5b-4095-4a0c-84b6-93dfe9631a6b@solid-run.com> <CZANBUQ2RJ3N.DO07Z9VFJCBZ@kernel.org> <mafs0v86i6qk6.fsf@kernel.org>
In-Reply-To: <mafs0v86i6qk6.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_035239_362594_9F1C768F 
X-CRM114-Status: GOOD (  17.93  )
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
Content-Type: multipart/mixed; boundary="===============8685593498432560222=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8685593498432560222==
Content-Type: multipart/signed;
 boundary=c688cecef0f4ae5165c98d85f84090b76ef48c63c8e86034169e62c2a33d;
 micalg=pgp-sha256; protocol="application/pgp-signature"

--c688cecef0f4ae5165c98d85f84090b76ef48c63c8e86034169e62c2a33d
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Feb 21, 2024 at 11:48 AM CET, Pratyush Yadav wrote:
> On Wed, Feb 21 2024, Michael Walle wrote:
>
> > [+ Takahiro]
> >
> > Hi,
> >
> > On Wed Feb 21, 2024 at 10:13 AM CET, Josua Mayer wrote:
> >> Hi,
> >>
> >> Am 21.02.24 um 09:27 schrieb Michael Walle:
> >> > Hi,
> >> >
> >> > On Mon Feb 19, 2024 at 3:41 PM CET, Josua Mayer wrote:
> >> >> Some spi flash memories have an interrupt signal which can be used =
for
> >> >> signalling on-chip events such as busy status or ecc errors to the =
host.
> >> > Do you have an example? Maybe one with a public datasheet?
> >>
> >> My example is Infineon S28HS512T, however datasheet download requires=
=20
> >> user account.
> >>
> >> S26HS512T has interrupt line, too, and datasheet is downloadable witho=
ut=20
> >> registration:
> >> https://www.infineon.com/cms/en/product/memories/nor-flash/semper-nor-=
flash-family/semper-nor-flash/#!documents
> >
> > Thanks, as far as I can see, both are hyperbus flashes. I'm asking
> > because I'm not aware of any SPI NOR flash with an interrupt line.=20
>
> I found this datasheet [0] for S28H flash family from Infineon on
> Google. These are SPI NOR flashes. In pinout you can see there is an
> INT# signal. The signal description says: "System Interrupt (INT#). When
> LOW, the device is indicating that an internal event has occurred."
> Further in section 4.1.1.5 "INT# Output" it says:
>
>     HL-T/HS-T supports INT# output pin to indicate to the host system
>     that an event has occurred within the flash device. The user can
>     configure the INT# output pin to transition to the active (LOW)
>     state when:
>
>     - 2-bit ECC error is detected
>     - 1-bit ECC error is detected
>     - Transitioning from the Busy to the Ready state
>
> [0] https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HS512T_S28HS01GT_=
S28HL256T_S28HL512T_S28HL01GT_256-Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_H=
S-T_(1.8-V)_HL-T_(3.0-V)_Semper_Flash_with_Octal_Interface-DataSheet-v03_00=
-EN.pdf?fileId=3D8ac78c8c7d0d8da4017d0ee6bca96f97&da=3Dt


Okay then,
Acked-by: Michael Walle <mwalle@kernel.org>

-michael

--c688cecef0f4ae5165c98d85f84090b76ef48c63c8e86034169e62c2a33d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIgEABYIADAWIQQCnWSOYTtih6UXaxvNyh2jtWxG+wUCZdXj+RIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQzcodo7VsRvvNcAEApra9rSm1MfAkhRbVfkHLU/6D/SWddatA
gXpTpAKirOoBALjzfbDua3ec+2dO1vFKuvOuC4AdReQxdnr3bRXO4SYB
=rxHh
-----END PGP SIGNATURE-----

--c688cecef0f4ae5165c98d85f84090b76ef48c63c8e86034169e62c2a33d--


--===============8685593498432560222==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8685593498432560222==--

