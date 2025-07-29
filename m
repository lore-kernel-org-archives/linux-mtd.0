Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BCBC83F26
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jul 2025 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ohbNPYbotxGfs1nWBgCLCRGmL2X1864q9nSDdQTQoR0=; b=dtU0vYldlB+GGoXuAC1oQ1VVXi
	vd3qT5jkgbclzoLBXnbRU5FQhx9d6/FaMs/+Z4fyrWOb7AQskZf35BhJ717ros1TvHQ9iZZ1t23tf
	eoGiThEmJt4x3y7iHCby4tpY/1Dr/Jdd6dBJj64k5l8DiCuWb17u0YrwWIuEBXsQPF9cyyihjFmiR
	9W3wEYcQOW254EZSQvn1ikMZwWIIYr8FBk9ldS3A5+hVoZ5E92ytz2wFHdbFsj4s+5xU8kGDmEsZX
	+p+awp10wN92v5Re7FZK7qoiMXWePpkSzF8dfa/nhSmfLPDQFrtzTxlfEgoNJIWANOrLfPDUqXfYg
	JwEGWOgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugg3K-0000000GITy-3hsl;
	Tue, 29 Jul 2025 08:51:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugg0U-0000000GI5f-1S2d
	for linux-mtd@lists.infradead.org;
	Tue, 29 Jul 2025 08:48:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A6D7A5C57D4;
	Tue, 29 Jul 2025 08:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 018BAC4CEF5;
	Tue, 29 Jul 2025 08:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753778899;
	bh=v/kpOVMVL0VbZRPfgljdXv2bn6Gc6hW9fXhN63RQtSM=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=d5soMQEduk1cxpl222qHqtta+r7E8SYfc1QU9usEcnPhZv35AaX5pimLRT/GG6PIp
	 9EPwXZpv2KqcCiA5fzMv7IvXkQqm9TweGZfhoW5M6HTczBg6Z4cfvnicSePwgrCIN9
	 JwshVQemLNK+vm6arLlSrXhdK4iP3gYVb7NFMTQeutIDaBTvBm5+KsO+OPzl/XExVU
	 x7pU5wzI4+FGTfP37itq8zTKCIUNSsZvMhh1tGKdyJ7abgy/FwU2dh/SuKGCD+wOyy
	 Dx0Z0Oy5sabvs3pbZGO27Etqsb90h0lVRxaxeoFqHhdM1PeJRSsUI/BmiIPilc1GPW
	 Eu5TizYdJuURA==
Date: Tue, 29 Jul 2025 10:48:15 +0200
Message-Id: <DBOEQE01XFID.21SA81RTH4OOX@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Marek Vasut" <marek.vasut@mailbox.org>
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: Add support for W77Q51NW
Cc: <linux-mtd@lists.infradead.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.16.0
References: <20250721202257.83936-1-marek.vasut+renesas@mailbox.org>
 <9eabfe619554cbdd493086dcffef8f44@kernel.org>
 <62383ff7-0a14-4f15-818b-f5e5c56332c5@mailbox.org>
 <DBJ86H8MDFNX.2Y6T55E0NH63R@kernel.org>
 <0d0cd3cb-61e5-4ec6-958b-ec48b82429bf@mailbox.org>
 <DBNH88949QTH.3I3MSOA019UJL@kernel.org>
 <d592e97a-fad2-4269-b854-d3e82d985035@mailbox.org>
In-Reply-To: <d592e97a-fad2-4269-b854-d3e82d985035@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_014822_447412_7791709B 
X-CRM114-Status: GOOD (  17.27  )
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
Content-Type: multipart/mixed; boundary="===============7798790408003765687=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7798790408003765687==
Content-Type: multipart/signed;
 boundary=20717ec1f244d1b8495b8ac4321eba2428d3341753c744a573ed0c316169;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--20717ec1f244d1b8495b8ac4321eba2428d3341753c744a573ed0c316169
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Jul 29, 2025 at 5:51 AM CEST, Marek Vasut wrote:
> On 7/28/25 8:32 AM, Michael Walle wrote:
> >>>> I have limited supply of these devices, so OTP is untested. The flas=
h
> >>>> does have OTP registers, that's why the .otp entry is there. Why sho=
uld
> >>>> I remove it if the OTP registers are in the chip ?
> >>>
> >>> We only add tested features. I'm just the messenger here :o. Anyway,
> >>> OTP is not really one-time-programmable here, you can write and
> >>> erase it again as long as you don't lock it, if that was your
> >>> concern.
> >>
> >> So how do I test the OTP without locking it ?
> >=20
> > flash_otp_{write,info,dump,erase}, just don't use flash_otp_lock.
>
> Thanks. flash_otp_dump -u /dev/mtd0 returns zeroes, so I suspect the OTP=
=20
> is not working. The chip does work even without this entry and the=20
> content /sys/kernel/debug/spi-nor/spi0.0/capabilities and=20
> /sys/kernel/debug/spi-nor/spi0.0/params did not change, so I think the=20
> best way forward is to drop this patch, until I can figure out the OTP=20
> on this chip ?

Probably. Good to know that the flash is working for you.

-michael

--20717ec1f244d1b8495b8ac4321eba2428d3341753c744a573ed0c316169
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaIiKzxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jb/QGAhc+gsKxCknmtQPaaJ/FTrerEZic21gys
8Tbc7+kOt1qxnZgCX56A6Nxab3UmzitDAYDN4qFM0IG70A1EM4VIcSz+wKAf0Kgd
AfAUJKmvZPgzv5xKMIaK572Gb6FYTnlPYn8=
=0Gkt
-----END PGP SIGNATURE-----

--20717ec1f244d1b8495b8ac4321eba2428d3341753c744a573ed0c316169--


--===============7798790408003765687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7798790408003765687==--

