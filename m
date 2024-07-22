Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45444C3DA5D
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jul 2024 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hnnyy+EE/cs9kgO2sNjDLfJl8LqmQv0kngNAJsG5SAg=; b=rn6KREQDSilP49DxQqGB2Zei0T
	a4bQSGybe5Av49vT+265Fayi8C8RJheBamw4B9V40nsdHDm8k6A0yYwXZshcJ5dfpB9wPgRgo6RF/
	qbC1UjNWqR7t1Ah/7GY3fFih3jwh3TZ/U5xRCv/QCcCdA9RpuqxN+iThaIKfoEMfSdcI9nLKlDSpH
	6+p/tXp3sXhKwwf+5KN16pR9GQEFkKtJhkYUpV5Py4VP1Jpaik7n7w4jtah7f6pFs8KeUCl+CVg6d
	KM/wuMOY2ymbDq14lsoqKy+Q4pP7eMDUOXDctkjQAMnkrlu4eED60dIf9kFyptkRw+Dbu5flXfbqZ
	oXZ5oJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVpE6-000000091CW-1KdT;
	Mon, 22 Jul 2024 09:21:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVpE3-000000091Bv-1qIu
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jul 2024 09:21:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7A5A60AE1;
	Mon, 22 Jul 2024 09:20:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA4CAC4AF0A;
	Mon, 22 Jul 2024 09:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721640058;
	bh=NzV2bFXlWnEhT/15kfXo/PYSnGs6ztHxH0Dc8E/AehY=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=eVkkRSrU6Uj6LlMNJ8pICXJabjErDsmzGr8K8Fwt6nzo08PwjBVrrzyagVyJiEcbh
	 a/mAKGD10ZOh7H/H0M5grIRERPACajr1348UIFgvUzWDeJFeBI65nkfWgwPJj0ibgl
	 Aun97i8lEHEV7+F120hFiY+SaKCIk6t4gJgRDYZDCDKh+WJBS1ac2MooboyFeI0Gyz
	 SrMYtyEli+NtStw8hFVZCN7YzZ+nCj+9rCq+xvg7t+N08vEzBW7R5PH7HV8nfN22oI
	 zvXM9j7Pq3tmSX2/S8sSo3rNE1MLXwiqN/Fp0Pwj73BRswjc9LBXCOlAxOG5CZae6a
	 dKSASbMlTbmow==
Date: Mon, 22 Jul 2024 11:20:25 +0200
Message-Id: <D2VYGD0191M5.30VXXMSA7N267@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Cheng Ming Lin" <linchengming884@gmail.com>,
 <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: macronix: Add support for serial NOR
 flash
Cc: <leoyu@mxic.com.tw>, <alvinzhou@mxic.com.tw>, "Cheng Ming Lin"
 <chengminglin@mxic.com.tw>
X-Mailer: aerc 0.16.0
References: <20240722084952.608770-1-linchengming884@gmail.com>
In-Reply-To: <20240722084952.608770-1-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_022059_567334_C55B71A0 
X-CRM114-Status: GOOD (  11.44  )
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
Content-Type: multipart/mixed; boundary="===============4643985948874001671=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4643985948874001671==
Content-Type: multipart/signed;
 boundary=8f50d3893aae5a208315e8a73c8d0f14cd575a25f5cdbb72d2432c19fc45;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--8f50d3893aae5a208315e8a73c8d0f14cd575a25f5cdbb72d2432c19fc45
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Jul 22, 2024 at 10:49 AM CEST, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
>
> MX66U1G45G and MX66L2G45G are Macronix serial NOR flash.
>
> These flashes have been tested on Xilinx Zynq-picozed board
> using MXIC SPI controller.

I've asked for a changelog. Now, what you've sent is a v2 (of what
seems to be a split off of a split off). Before sending out another
version, please carefully read:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html

To be clear, please explain why this is a split off of the larger
series, what has changed (or if nothing has changed then state so).
Why did you split it even more (before it were two patches).

Honestly, back when Jaime submitted these patches, I already spent
way too much time to review this stuff just to get it dropped or
handed over to another employee who then comes back very late.
Please align your workflow at Macronix and get an internal review
and some training how to submit patches upstream and don't put that
burden on maintainers.

Thanks,
-michael

--8f50d3893aae5a208315e8a73c8d0f14cd575a25f5cdbb72d2432c19fc45
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZp4kWhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gjJQF+KExmXS2k3+LrXrGSsx/Alxwluts789FY
bUK8tOM+mIXZkCG80G3XpAtFDR8nnXCVAX9bpHVGPgIAGv9ssTh2Dal5t3o/eK+4
ODMYxCOemAmaIrPA3GdgbNU9FNkH96bf04s=
=+BrM
-----END PGP SIGNATURE-----

--8f50d3893aae5a208315e8a73c8d0f14cd575a25f5cdbb72d2432c19fc45--


--===============4643985948874001671==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4643985948874001671==--

