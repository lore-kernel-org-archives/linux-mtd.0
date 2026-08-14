Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23203C5CFDB
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 12:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hNZesF9RI67d43RNpS1S7mt1bkTViCoooW5nqV8M+8s=; b=ZJLczkJTEjpRH4JV3vUd4hxV1M
	idbABfSQA7SDSfZXFClaMLEpkPyifAcCpMwEytJZTvJ9M60lGsyk/wtEudXfLAwIGAKYBLja5zN4n
	DfO+y8g7il4Vb7Q8oOH00cd17oRhYGS28d4ZBn/IvzPqPkl9LqGz5GUmJyvLjV5AXtg9szOeFn6aY
	fF9QBkoOIOw6582xIa3hB8I/Gj7MqCgn67oaqmQUf6PR82iZnwUtSNwZEHrWeRzQtxcxkoyjEjP/E
	aJ6DWkZ/IXctK5fzA6azH1nziNblGKGLN5MkMYfOpB/DdJrp50e8YToVDrySOlUl5pEzKz4G35Nmo
	AeeIzUrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqzP-00000002e3r-3Zn3;
	Fri, 14 Aug 2026 12:26:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqzO-00000002e2i-0zfb;
	Fri, 14 Aug 2026 12:26:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 9B686438E1;
	Fri, 14 Aug 2026 12:26:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id EC01B1F000E9;
	Fri, 14 Aug 2026 12:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786710381;
	bh=oetNebrSGRQc4Dllyrq6sTFIBqE5Ra+p99/CTCHyDLY=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=Fwo9yToL2yXnsfdj3rJh3xAwZudSd4QCinvuvnQ+swvN5DgcWQBrw0c1g9YSIjc78
	 rgEUsvo5ebdEc4MbS/YTeX55/PetfsYqxWUAweuyy4q0uDsA9vMVcyJ75R9nPo2yow
	 IsziJrpDkQzkJq7s4MFSd8jCOxFcMsoEGWCXPrlfHYjhnAvY5nPKNtwnjidSOUXSTx
	 5U1jVXttCaE08H9AUyOzf06Zubv3mwi1U9zXwMmVJsj4jEIexv4O1YTxUZpRHs6im9
	 8QEs7SDHlHGbtM3sv6iiF8Q9DQGltyfXUwAe0kKfEoHMDfjvOth6K4VBKwiD0IzEEd
	 oBAiikKrHqRWA==
Mime-Version: 1.0
Date: Fri, 14 Aug 2026 14:26:17 +0200
Message-Id: <DKONYW7IRL1X.39T3OTS81X2EG@kernel.org>
Subject: Re: [PATCH v3 04/23] mtd: spi-nor: Add support for the new JESD216
 rev F QER field
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-4-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-4-b637cf120d5c@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============6207200716228380059=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============6207200716228380059==
Content-Type: multipart/signed;
 boundary=91c9aee68618a0913a7de9f6287c7d683567572acb24944be1c7d46a2355;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--91c9aee68618a0913a7de9f6287c7d683567572acb24944be1c7d46a2355
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> Revision F of the JEDEC JESD216 standard includes yet another
> supported setting in the QER 3-bit bitfield: 110b.
>
> This setting implies that the QE bit is bit 1 of SR2 (which is an
> already supported case) but this time it makes it very clear that both
> reading and writing to SR2 is supported, but not with the usual
> opcodes. The write operation uses an alternate WRSR2 opcode:
> 0x31 (instead of 0x3E) and both the reads and writes manipulate a single
> register at a time.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--91c9aee68618a0913a7de9f6287c7d683567572acb24944be1c7d46a2355
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan8JahIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gCnwF8CPY3iwBhPpvrL/4ltGBFslvPWFA5y+gT
YTrDOpc9A5NxMg+5e80b7474K05FiJAcAX0VEIaIbdQAc1G70hMh0XXH6ZyWu/qg
l9PVRN5pQlW86mnyXDGSqTxzbFNbYxnErjs=
=7QDn
-----END PGP SIGNATURE-----

--91c9aee68618a0913a7de9f6287c7d683567572acb24944be1c7d46a2355--


--===============6207200716228380059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6207200716228380059==--

