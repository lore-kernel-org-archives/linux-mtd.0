Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DE9E7E0BB
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Feb 2026 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqwybM/slmQWrYhsdiO0UyQuG2V8l+e0Q1/Q9rN3BEQ=; b=Toig+l0nONOGT4pSC+GvPKIX8L
	YnvTGiK0YL0tLLleC2TFm3SNNVWM30o/KUuG1n225Nlai1sw8LW/nOLBZ8kudPUcQEUhXzDOm60TU
	84fqjCoMG+vC6juHtKWVKB9djhELVO80KQID1tAvx3lARUt6mRHy/4M0tSLUa60zay9wQC79kpW7j
	oeD1lPn2MX5QHoxvzMUmcWe+dseigyPZTzniguK7UcThDvzYChzCipi7zkjU7LZ069IO2WOV9Z5vQ
	byPdmxT73ZbXDitXuAV1ecf3X7htsTNmGIJuJYVM43qAfKn3gW3Uh87rbr/0+pERSy8ikARrwUMGC
	DT4EfMJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpO8g-0000000FDV5-0BDh;
	Mon, 09 Feb 2026 10:05:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpO8c-0000000FDTs-0o7U
	for linux-mtd@lists.infradead.org;
	Mon, 09 Feb 2026 10:05:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 88FB0441E9;
	Mon,  9 Feb 2026 10:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14559C116C6;
	Mon,  9 Feb 2026 10:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770631501;
	bh=HWKJIQNONMVQSZ4SSnN2RacPR7HLBIc33yAACZJdKz0=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=f1fn5+pj4ITHRHHkNblo7H2WXpzkCo+/DzDlxL7FmJtxlsv6yqOKShGFCPbomxUEv
	 4BXxWvLJfM16FPKdItEfenlgWxuzWZb2fm6oqeUTepDzJGKt2mpnwf/T5SwwgVKls7
	 c8FCtV5qxr7mSS+jn36NGGRVRyVMsptDQBqiLBvhqTgo2t2o8rWnh3olVawVy5lRhO
	 9gWERGs8+x4+C7Kwx+j+moooorCRMJTJQrGq1ghoVgeTRLP+ES6ZAA+bRo8/t0Q6lL
	 Sm5FF+CrIvVo2FgGtBPID7SNlr+7/d2KhpX0vS2C573ph4gbkCep8HIXGfqYFFYUCF
	 4hRuMTd/5dedA==
Mime-Version: 1.0
Date: Mon, 09 Feb 2026 11:04:57 +0100
Message-Id: <DGACHCLD50YM.14CAK78PEJ6O3@kernel.org>
Subject: Re: [PATCH v3] mtd: spi-nor: micron-st: add SNOR_CMD_PP_8_8_8_DTR
 sfdp fixup for mt35xu512aba
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <han.xu@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Haibo Chen" <haibo.chen@nxp.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20251223-nor-v3-1-09e26797a8b5@nxp.com>
In-Reply-To: <20251223-nor-v3-1-09e26797a8b5@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_020502_250018_53ED2E0A 
X-CRM114-Status: GOOD (  11.12  )
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
Content-Type: multipart/mixed; boundary="===============4091841237960840289=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4091841237960840289==
Content-Type: multipart/signed;
 boundary=96026a0e31e1c8ea8b7c7b82368b053a9042163358dd4836ab796c2f20bd;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--96026a0e31e1c8ea8b7c7b82368b053a9042163358dd4836ab796c2f20bd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Dec 23, 2025 at 4:01 AM CET, Haibo Chen wrote:
> Find two batches mt35xu512aba has different SFDP but with same
> jedec ID. The batch which use the new version of SFDP contain
> all the necessary information to support OCT DTR mode. The batch
> with old version do not contain the OCT DTR command information,
> but in fact it did support OCT DTR mode.
>
> Current mt35xu512aba_post_sfdp_fixup() add some setting including
> SNOR_CMD_READ_8_8_8_DTR, but still lack SNOR_CMD_PP_8_8_8_DTR. Meet
> issue on the batch mt35xu512aba with old SFDP version. Because no
> SNOR_CMD_PP_8_8_8_DTR, micron_st_nor_octal_dtr_en() will not be
> called, then use SNOR_CMD_READ_8_8_8_DTR will meet issue.
>
> Fixes: 44dd635cd632 ("mtd: spi-nor: micron-st: use SFDP of mt35xu512aba")
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--96026a0e31e1c8ea8b7c7b82368b053a9042163358dd4836ab796c2f20bd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaYmxSRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iCewF/VSY38d3rTvpLro4TmcOw0yK8cmKoLAm4
bJ2MOYpPmdS5hWjK5OJnXqCT9ur7qtLgAXsHJpY3Ck9DzjtgsRtJRnXY74pnT7JO
9YYdBz9Da8f/M8trY6b36LNnS90qyaPGMik=
=GaJr
-----END PGP SIGNATURE-----

--96026a0e31e1c8ea8b7c7b82368b053a9042163358dd4836ab796c2f20bd--


--===============4091841237960840289==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4091841237960840289==--

