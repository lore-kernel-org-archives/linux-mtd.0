Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A01A2C88E50
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 13:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYW4Q1mSJM6VANWkf6GoY8EVLtb5Im0/NWgtzUA07O8=; b=rp0KeXlRhg1YpkTopkq+IDd4m8
	2wiPY2D5fO+5/8kUqQ7FEx3+eFZQrKJ4+aS/WTPrrkB1l32DBMxznWslYX0AfIfZTmMnvEyOvpKmg
	KKjeo7sM7V427XlvT6c6lXbhk23CT21CG2gDflwLL3PkAPmm2GKN+ZbLokqqy0WmMHV2xCd9vYvUX
	/+rQ1Fn4cPd656Ye9l4O6sXkZ+lvg5oh+f3jm4HhEQgzJMwevQ1dvOr290OGOgr1D/oIfiRcZT5J6
	5Qc0gvNWu14Z+Fy6URCAH0dUDk1z0nTU5LIsQDDMB3+poGJjjTa7oWjRj//jcaWgWv9G8xUsNA3/H
	0IpDnCvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5199-0000000Gj8N-1l3X;
	Fri, 11 Sep 2026 13:18:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5198-0000000Gj8E-23Nt
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 13:18:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 95CC66020C;
	Fri, 11 Sep 2026 13:18:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C00871F000FF;
	Fri, 11 Sep 2026 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789132705;
	bh=c2YxdGYQdAbBw/pBKfb1UnHuGGtzKtVFqsJvIXT1fJc=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=E6eFZVZeSo8ddd8exUojW5PjEvEbRIVFkZACRu8A37xpu6NoN2F0WlLZH/mZ7FZ77
	 RrcC02E2mOi6S/OwMfIgTPlgV9ioZu0+a9Q7TIqWCveLB+NKrT8kp7lU9Lf65YOQrX
	 xvsCWMfWW4/AmjlCVeHVBekoPHMX/PgcEMByfmkiUe6i0AVwzJNNrnzarrpfHysDMt
	 sXOSQE8Ev95Aq5qLhb9q6qaf4JlFTD27mfYg12Bsui2O+mNo/xSMFFBgNB+y96MQaW
	 G5KpUrFCRJ6cX0V6/fFPBeo7ZFrcxTMMgQFYQ2vjEfj8v9fD3/eLzh4LqKStysMK/r
	 3Mji00gIFj9/g==
Mime-Version: 1.0
Date: Fri, 11 Sep 2026 15:18:21 +0200
Message-Id: <DLCIM0AHZ1B0.3ECV7Z6MDHQXH@kernel.org>
Subject: Re: [PATCH v2] mtd: spi-nor: Fix quad-enable for flashes with QER
 bit in SR1
Cc: "Vignesh Raghavendra" <vigneshr@ti.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, <sashiko-reviews@lists.linux.dev>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-kernel@vger.kernel.org>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, "Jon Hunter" <jonathanh@nvidia.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, <sashiko-bot@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c324e9f30e@bootlin.com> <20260911105245.408171F00893@smtp.kernel.org> <877bksq7mo.fsf@bootlin.com>
In-Reply-To: <877bksq7mo.fsf@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============9165237138682839690=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============9165237138682839690==
Content-Type: multipart/signed;
 boundary=05ca4617a609102e41e2f8a19ed24f6da5ffee14ab6152b3011ff73f21bf;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--05ca4617a609102e41e2f8a19ed24f6da5ffee14ab6152b3011ff73f21bf
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 2:45 PM CEST, Miquel Raynal wrote:
> Hello Michael,
>
> On 11/09/2026 at 10:52:44 GMT, sashiko-bot@kernel.org wrote:
>
>> Thank you for your contribution! Sashiko AI review found 1 potential iss=
ue(s) to consider:
>> - [High] spi_nor_read_sr1_and_sr2() leaves sr[1] uninitialized when
>> read_sr2 is unsupported, leading to uninitialized stack memory use in
>> callers and spurious -EIO errors.
>
> The annoyingly right Sashiko robot is correct :-)

I actually had the same feedback, but then discarded it, because of
your comment in the function doc.

Here's what I wrote:

  But now we are lying to the user of spi_nor_read_sr1_and_sr2()
  because we might actually not read sr2 at all and just return 0 -
  or even worse any garbage the sr[1] was initialized with. And the
  user cannot even know if sr2 was actually read or not.

But can this actually happen somewhere? Except for the WIP bit,
otp.c and swp.c I don't see where we actually check for a bit in
the SRs. Everything else is for RMW and that shouldn't be writing
garbage as the expectation is that there is no flash with !read_sr2
&& write_sr2.=20
I agree, that it might be uninitialized, but if that uninitialized
value is actually used somewhere, we'd have a bigger problem, as
that new value is now just made up by us.

> The best way I see to make sure this does not appear, is to just add
> this fallback to make sure when we read both registers we just get zero
> instead of random data in the buffer. Again, the idea is to make sure
> callers do not need to be "QER aware".
>
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -867,6 +867,8 @@ int spi_nor_read_sr1_and_sr2(struct spi_nor *nor, u8 =
*sr)
> =20
>         if (nor->params->opcodes.read_sr2)
>                 ret =3D spi_nor_read_sr2(nor, &sr[1]);
> +       else
> +               sr[1] =3D 0;

Almost back to the original one :) At this point, I'm fine with
either.

-michael

>         return ret;
>  }
>
> What do you think?
>
> Thanks,
> Miqu=C3=A8l


--05ca4617a609102e41e2f8a19ed24f6da5ffee14ab6152b3011ff73f21bf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqP/nRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gQ8wGA0tpUeHcnKU4YeLCb1EmyzVZpcBRBhWeQ
K5CF9p10m/03QoGTMMg/E1Ev4fYYqo+fAYDk86SvmnfpEadncfsV1cnLrS8ldq1n
TAz0HqmAtw55gUyxNSDPwsbYMHZW/h508hY=
=qKRq
-----END PGP SIGNATURE-----

--05ca4617a609102e41e2f8a19ed24f6da5ffee14ab6152b3011ff73f21bf--


--===============9165237138682839690==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9165237138682839690==--

