Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 087EFC27C53
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2024 08:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Csf80YMpspxFAnyjgRoaFtNi+lQ0IByB8NojXWMb7c=; b=MxVbfz7r0YnZModgrCEcPBSzqv
	XwHCLZ6eRVx5Ze3J0ZGKX3A2mIHj58GgvEhxuXt7uksl0L8y1ZXLFKG/QvPlItsMBaaq+oIMVMZlx
	aK1ZOTlfqU6nsvHkyONPFq59ScdQnoAT7dM+qsW2EVzvXr0/Qdls6uely2TmG4ZO/atORtLhNU2Eq
	zjWk8MLSmdupwhm7g78ymryYes0JjiHiHWpI28dftf72uHk/O8PHzc+0ZWuytyKmComAKE4kuckdn
	MOWnQWvOuuFnUzCRSaK/7S6rA7w29MwaukNufFylXBAZdFFctp0wY0YCvxTBSICINQM99JVoY91JI
	g/LyFGGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJhS-0000000BnjS-2odZ;
	Wed, 12 Jun 2024 08:51:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHJhP-0000000Bnix-0yym
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jun 2024 08:51:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 668F8CE0EE7;
	Wed, 12 Jun 2024 08:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43719C3277B;
	Wed, 12 Jun 2024 08:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718182275;
	bh=+Fg8MSbfS/ALG6sMa6m9qlE7IiMT7kmW5KU4tZjfNYA=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=rC3zGK44daOQK8iXDa5NuBhpGPHHodvbwhTwOf6MlCmeO6OMPPzjwRohEyGdOdf0J
	 8SbiM4axhgLPZIeFspGO4tRarjuVzkgTiYUINvQZkJQuAGyz2YRuAdj0xk1VSjC65W
	 6hbdM05sKSN410h2RDDoeEpVmxvELtmpBPhsBcLiyA4ajyvif6lHvIWAXJl106/sma
	 FnvOUaFM8gRIdBMLp8kMt6m8syXJUTN0u+6gvYFmwWX+YGX/VWG4ROlrnanyoYsLzt
	 ASmKVw8Rv+xYpIuamXHC5UAgO74nEM8A3z9IJvfDzChQ1/nef5d9F9IDj8Hl2iiYEs
	 xthqA6AYy2qbA==
Date: Wed, 12 Jun 2024 10:51:11 +0200
Message-Id: <D1XWS6SSXALZ.3NKR71449UYAO@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Rasmus Villemoes"
 <rasmus.villemoes@prevas.dk>
From: "Michael Walle" <mwalle@kernel.org>
To: "Esben Haabendal" <esben@geanix.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: core: add flag for doing optional
 SFDP
X-Mailer: aerc 0.16.0
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com> <20240603-macronix-mx25l3205d-fixups-v2-1-ff98da26835c@geanix.com> <a379a411-2c9e-4d9d-aa8f-4c4f3463cc27@linaro.org> <D1SZKLZBDDBA.1Z7ZD4UEOX05F@kernel.org> <48719b0f-1a7f-47f9-948a-c981a0a29b41@linaro.org> <D1T10API5U80.1OKB56YTFGMTN@kernel.org> <874ja6aszh.fsf@geanix.com> <1d683b33-16db-4d81-92cb-d98e35b87cba@linaro.org> <87le3g283a.fsf@geanix.com>
In-Reply-To: <87le3g283a.fsf@geanix.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_015119_660388_B8C772BF 
X-CRM114-Status: GOOD (  20.67  )
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
Content-Type: multipart/mixed; boundary="===============1477691069892380077=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1477691069892380077==
Content-Type: multipart/signed;
 boundary=7b2fcfb2bc19ec479f785f2532bd3fa408f9eb8564abe48cd6d1a113fc26;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--7b2fcfb2bc19ec479f785f2532bd3fa408f9eb8564abe48cd6d1a113fc26
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Jun 7, 2024 at 3:30 PM CEST, Esben Haabendal wrote:
> But other than avoiding the "magic flags decide whether we use SFDP",
> should I be doing anything different?
>
> I assume we should still be calling the default_init() fixup functions,
> both for manufacturer and flash level. Or should we leave this for the
> deprecated case only?
No, they have to be handled.

> If the semantics is basically the same as for the deprecated, why not
> simply change the implementation of the deprecated approach to what we
> need? So having 3 cases:
>
> (1) SFDP only [indicated by size=3D=3D0]
> (2) static config only [indicated by no_sfdp_flags & SPI_NOR_SKIP_SFDP]
> (3) SFDP with fallback to static config [indicated with size!=3D0 and
>     !(no_sfdp_flags & SPI_NOR_SKIP_SFDP]
>
> Any reason that we should not be able to easily convert existing
> depracted flash info specifications to the new SFDP with fallback to
> static config?

IMHO the only difference is that dual/quad read will imply the sfdp
fallback. So maybe the function can really be renamed accordingly
and the "deprecated handling" is just that dual/quad read will set
the sfdp fallback flag.

> Also I am wondering if anyone can remember or otherwise figure out why
> we are doing this memcpy() dance with nor->params in
> spi_nor_sfdp_init_params_deprecated()? Why not simply call
> spi_nor_parse_sfdp() before
> spi_nor_no_sfdp_init_params()/spi_nor_manufacturer_init_params()?

spi_nor_parse_sfdp() will overwrite the parameters set by the former.
So if you'll swap the order, the latter (static) ones will overwrite
the the ones from sfdp.

The correct fix would be to make spi_nor_parse_sfdp() not fiddle
around the parameters if it might fail. The quick fix here might be
to push that memcpy into the parse function. But I haven't looked at
the code right now.

-michael

--7b2fcfb2bc19ec479f785f2532bd3fa408f9eb8564abe48cd6d1a113fc26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZmlhgBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/izxwF8CzrxOziPKhCN2zhrHk76FyksW3UYFiVO
7XgLBISBntTXf0PEtMtlD5Q2kTl8FXQkAX9IgKXy8/gae75SKVnCScyf3sYTFaNW
/3Ilo4uld3AZ/F/6dFbFfTOqU10H5dW3rrE=
=eo34
-----END PGP SIGNATURE-----

--7b2fcfb2bc19ec479f785f2532bd3fa408f9eb8564abe48cd6d1a113fc26--


--===============1477691069892380077==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1477691069892380077==--

