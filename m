Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD28FC87FCE
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jul 2025 07:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjsP2vz2mRYo3KdLyDsm2R+KiCdMOGKEcL5dHWVtMVU=; b=ZhP6QevGsP6I5RPfntoEsFZaCc
	UcX6AFmGWPOlEaf0Qg9Puj1XABqjrRV5cDR5piBjTNTe4PHt2Js3tFxx+LN/1DU64kJe1q0csCglM
	Ws2GLaJSH8dufF19In15pSxpKdS0c6AuXicpvlkolFSKLBG+jdtdMtY1rpu5ngp6+Qlv8RupKHIv4
	LYMjMOhEv5bc8FfqMs3s6FCYIC/YxTfAmfRymwt6kDTo5KDdCSzk5hByHKhsR/kNhw1qjQ1WI+GKJ
	2LKO/1mbSKwJVSsGJCQrRW/yd/9ZWhF9i/Di7nxi5keZVk54nPCKdNFuu8nf/+un2+RxnGUevLZiU
	AEl7bG3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugI4r-0000000Dps4-3cHU;
	Mon, 28 Jul 2025 07:15:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugHPz-0000000DljF-0cro
	for linux-mtd@lists.infradead.org;
	Mon, 28 Jul 2025 06:33:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F4037A5488E;
	Mon, 28 Jul 2025 06:33:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280D8C4CEE7;
	Mon, 28 Jul 2025 06:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753684381;
	bh=K4Bmq3xPhvDgkAu6fzp61axct5xS8LWojEAY59LKeG4=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=Z1siwN/AY6Adk9JPdKCM6hHqt5adql2vPlwoTFb1AcdJ1rJDBPyHLC0xE8nQQZZQ1
	 d35kk86QuTWnD/l15jp+wVr9l1a8pfgLto/62ATH81iHCI1PNG8fvnX0EgNEwQJnAG
	 eWBc1WmQFFZUXRiLhunxHabIeQxlrvywV6nYfJaYJ5ebJAXzQVfjMnwWVWizRcvEo0
	 9g2l8fM1ZiydYeglqsB+zDLMuO4c1PbFPgnof3FTn57I0VlEEqZa30YQPF3yR72dpo
	 Olf6BV1j8e0hPHp/QQa9vW3VIQ2qKclyT0D2iKaREDcgB4H9awsHPmNEVJDgDt3jTp
	 Kzl+eXzFVM4iA==
Date: Mon, 28 Jul 2025 08:32:55 +0200
Message-Id: <DBNH88949QTH.3I3MSOA019UJL@kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: Add support for W77Q51NW
Cc: <linux-mtd@lists.infradead.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Marek Vasut" <marek.vasut@mailbox.org>, "Marek Vasut"
 <marek.vasut+renesas@mailbox.org>
X-Mailer: aerc 0.16.0
References: <20250721202257.83936-1-marek.vasut+renesas@mailbox.org>
 <9eabfe619554cbdd493086dcffef8f44@kernel.org>
 <62383ff7-0a14-4f15-818b-f5e5c56332c5@mailbox.org>
 <DBJ86H8MDFNX.2Y6T55E0NH63R@kernel.org>
 <0d0cd3cb-61e5-4ec6-958b-ec48b82429bf@mailbox.org>
In-Reply-To: <0d0cd3cb-61e5-4ec6-958b-ec48b82429bf@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_233303_254730_AFD17D1E 
X-CRM114-Status: GOOD (  12.65  )
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
Content-Type: multipart/mixed; boundary="===============4681343776495478943=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4681343776495478943==
Content-Type: multipart/signed;
 boundary=fd11ad08ce12bebac6607f5852f9e8f7f714528d81476904b87071075ca2;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--fd11ad08ce12bebac6607f5852f9e8f7f714528d81476904b87071075ca2
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

> >> I have limited supply of these devices, so OTP is untested. The flash
> >> does have OTP registers, that's why the .otp entry is there. Why shoul=
d
> >> I remove it if the OTP registers are in the chip ?
> >=20
> > We only add tested features. I'm just the messenger here :o. Anyway,
> > OTP is not really one-time-programmable here, you can write and
> > erase it again as long as you don't lock it, if that was your
> > concern.
>
> So how do I test the OTP without locking it ?

flash_otp_{write,info,dump,erase}, just don't use flash_otp_lock.

-michael

--fd11ad08ce12bebac6607f5852f9e8f7f714528d81476904b87071075ca2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaIcZmBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hQxAF7BpIRkqGDrx1GJOllCbP0wy0qHAg4813O
BSVBM2IYsc7XmtQOoaq0U9HQDzg7Bgs2AYC96Pa5Dd8DCmx/hCkAsMfCYBimSgXd
hxZSGH6ASOrVFnqD11SXHpUw6WHtAsPQMzo=
=va+2
-----END PGP SIGNATURE-----

--fd11ad08ce12bebac6607f5852f9e8f7f714528d81476904b87071075ca2--


--===============4681343776495478943==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4681343776495478943==--

