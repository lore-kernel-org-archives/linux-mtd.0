Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1C7C021AA
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Feb 2025 14:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jIlSFuhj0rUOACnxPDbul554xJYT/YfKsN6u+cCChIg=; b=PS5fkD9ckgiMjvwnwRuEqLpIrK
	RhpuWtE1gjz5+sDHOWA/BqLb1Mm03Hnk/s5jwaqXTtitj2057N5/p8w/9iA3DiNaTuiktnVeBaW7w
	O3adxlSKrlCFHEFt3YMwUqktW7yDJGJBwe+naZSUWIsse0CUbRGRN/zIfEdThuGsSbmWm4S4pQZ83
	+835NrxnPo4pgehnzs/4TasyZL0WLLaHhPepMJ99iFYcX8KaPsHbduhUQekoMte78eIu9ihBOnoWM
	Jsx1aPMD4iI/BjktCfSIEMhr/KSCVWq0yBbbNT4ubaAGVyGhZwH6zqubeG5V1hFJEZTUTW3bf2FtQ
	86D0X3Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkP4R-00000008f68-0nEY;
	Tue, 18 Feb 2025 14:59:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkP05-00000008dyY-0xNA
	for linux-mtd@lists.infradead.org;
	Tue, 18 Feb 2025 14:55:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06F715C5F51;
	Tue, 18 Feb 2025 14:54:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE7CC4CEE2;
	Tue, 18 Feb 2025 14:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739890504;
	bh=vhd1qtpo1JdzpatIl3cLegasb4zvWEmr+5D4nvmUfsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kxZopk+MmDffn+I+qcaMFBBKtmDMxSu5jiCHbVgP2o0gEMQ8lBFDEatsOKaeKK8i5
	 MwHKorHaYBLgQ6TQ+A82YzaEhYoYcSxBUBaIdpT+0KzLBbXu9LKI5BPC4RQwN5NqlA
	 MxCiCmzfiQEVfKXxl7krYfU6Nc5j/RPPaim/vbxVB8EkzjxtkZobed+vKfJxjP45Vx
	 8L+UYhveZHIA90yeFmnlx5M+mGVrLMGRgJfXNpFFvGbKCW/ISK/B2B0p4jE5XWNmZk
	 o+fWujqNzPxQCitaXCFcYCcc7mivMuqbE9aYnW/42IxGYgOIvSBAkOjj60SWfsuAyF
	 TyOxBKAd0gdVg==
Date: Tue, 18 Feb 2025 14:54:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, andersson@kernel.org,
	konradybcio@kernel.org, richard@nod.at, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	Tudor Ambarus <Tudor.Ambarus@linaro.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Michael Walle <michael@walle.cc>,
	Pratyush Yadav <pratyush@kernel.org>, quic_srichara@quicinc.com,
	quic_varada@quicinc.com
Subject: Re: [GIT PULL] mtd: topic branch for spi with Qcom changes
Message-ID: <Z7SfQ4lu2fponEiX@finisterre.sirena.org.uk>
References: <87jzbp9hnt.fsf@bootlin.com>
 <87bjwkoxwh.fsf@bootlin.com>
 <96bdefb1-4607-4a4a-8bed-b4d9b5971171@sirena.org.uk>
 <80746729-2b32-9a13-93f5-8d5c222ce4d8@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <80746729-2b32-9a13-93f5-8d5c222ce4d8@quicinc.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_065505_382044_F0DDDDC5 
X-CRM114-Status: GOOD (  14.81  )
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
Content-Type: multipart/mixed; boundary="===============0901230255751046938=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0901230255751046938==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KvxwJgM+dWb73Ypq"
Content-Disposition: inline


--KvxwJgM+dWb73Ypq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 17, 2025 at 11:25:24AM +0530, Md Sadre Alam wrote:
> On 1/6/2025 9:06 PM, Mark Brown wrote:

> > Thanks for the heads up - I didn't pull it yet so as you suggest I can
> > just leave it and pick things up from mainline.

> The QPIC raw nand patches are available in the linux-next. could you plea=
se
> pick the QPIC SPI NAND patches [1]
> [1]
> https://lore.kernel.org/all/20241120091507.1404368-7-quic_mdalam@quicinc.=
com/

That looks like it was posted back in November, I'd have expected
anything for this release to have been posted after the merge window...

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--KvxwJgM+dWb73Ypq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme0n0AACgkQJNaLcl1U
h9C7CAf9GhX9iaL8H1BWXp96KRzkYlHWeeIWT7O52PE08NkbOC8mnuDlYL5yyG45
wbBly4US/3NeyEf7EtuOS/lXTPfcC1+6w7fEcIGk30BiEfQTsvKNjtR4+vUBAdXB
8qbv/RCZt77TJbd933SHZF3Lf8PWBCSxv34/DOA9vAsI7X68OKEu+UN4AwK3C3jP
PRobiMSnnvgZ1MGRHzTXk4KASUthkdbZJp6TEbQhq6rVL9P5M1XCMF+OR8NgCmva
TR2A42a1jT+kyCR0GCchbqf+dqjvKpGSsD85h4hp77vjJpwJ5r35PdO4XGNwoYRh
5cF/iganN6NcwFjn2l6Qtn70IX53kA==
=nmaR
-----END PGP SIGNATURE-----

--KvxwJgM+dWb73Ypq--


--===============0901230255751046938==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0901230255751046938==--

