Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20DBC54ED1
	for <linux-mtd@archiver.kernel.org>; Tue, 27 May 2025 11:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VMUUZGAzl1fQ3yYRMrrhxBeJLR8ihtVDxs2okrSYMyU=; b=NBvj3hWPFsovJAovH9PODbQFFn
	R9XwzMptX7uImgSVwInhsrP53iuy40A68EGxmdnNPHBozyALBC004zeS/5i3/yaKpUgq9ANpke09u
	warfXytLcKtvOXE3BSqeHNuvAffaJlUp6f2cHldt7c3H+n4zdw+PEd3JhOivHnxx44fYw0w+5+31R
	q3PBFOWmnUpPY/ckcNFT2PHZS7Ro693IhlzE109+RyZBxceJpNQ/dubf0NTdvYYgHyABjlQbcobKH
	U2ONxZI2lAcebRvOv5NTO8QGfwBQWhNAqtLxIaRlmiGiwHaoE3ZgpSCcsBi3MTGQPUItKX9YfzZtx
	r6SX5TCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsUR-0000000AZe6-0KyF;
	Tue, 27 May 2025 11:29:03 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJsUO-0000000AZdc-1avZ
	for linux-mtd@lists.infradead.org;
	Tue, 27 May 2025 11:29:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A1B94A4F623;
	Tue, 27 May 2025 11:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F45DC4CEE9;
	Tue, 27 May 2025 11:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748345339;
	bh=rwmtje4bUGVaeN3ojBIVgWdhDOnFTHhqrxRv1ndILaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPajK+iPkSs8jQ8PgcxIFb4hWFdGUIlwgBs1j7xi6Wal/fN2pkyF0gdAIsJTffCsY
	 hQZJNIoxyHINaXcEjcDwfh1qWAXIF90fNTxmOhpzuCNN/h57mom+JW+5GbGDdAlxv9
	 Rxh7f3na5kL/fONhlgZGhY8NT6qNqeywVwLYCfNq4siJd+XeTtviLkZ/AmlXl5rt/6
	 HxKBJzBsLcPgK6Kj6O0i/hKLQukbjvzwz7zBiKwczLV/k+3EpEK0cCvJXe+9/C3xqr
	 Lh340o1TxoG8j/7+X5gFhW2SqJZhIEGuTz72PYffJbb17p+aNAfk9GQYnNU+XiyF2X
	 gQMM97Oh8IURA==
Date: Tue, 27 May 2025 12:28:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] spi: spi-qpic-snand: reallocate BAM transactions
Message-ID: <cc53dca0-74d1-42d2-936a-adc383bd571a@sirena.org.uk>
References: <20250525-qpic-snand-avoid-mem-corruption-v1-0-5fe528def7fb@gmail.com>
 <20250525-qpic-snand-avoid-mem-corruption-v1-1-5fe528def7fb@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250525-qpic-snand-avoid-mem-corruption-v1-1-5fe528def7fb@gmail.com>
X-Cookie: New customers only.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_042900_480286_6EBC29FE 
X-CRM114-Status: UNSURE (   9.90  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4468361426761677428=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4468361426761677428==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4heDsfrle+qDlMWp"
Content-Disposition: inline


--4heDsfrle+qDlMWp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 25, 2025 at 07:05:35PM +0200, Gabor Juhos wrote:

>   # reboot
>   [  877.178844] Unable to handle kernel read from unreadable memory at virtual address 0000000000000078
>   [  877.178913] Mem abort info:
>   [  877.186767]   ESR = 0x0000000096000005
>   [  877.189508]   EC = 0x25: DABT (current EL), IL = 32 bits
>   [  877.193312]   SET = 0, FnV = 0
>   [  877.198780]   EA = 0, S1PTW = 0

Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--4heDsfrle+qDlMWp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmg1ofUACgkQJNaLcl1U
h9C4Bgf7BYX7fYSmMG+RLdZPEv1vQHP0zWlVNMcyOFXq5XSd+PWAdXwVdtd2t1rX
o4vrmXu8LUTwVjNQyjQHdNmAzWpJSgPgd1v+DVMJaRQ/7nlHOCgwEq3ZWbCXkPqK
EB2nLdapopuCG4ODGz6/rcFjfSuF/Opscmzks/wMtxHM6EEDED2ZydP1oTGQSYFw
l5X/eR1mki1uM2EcgflX8qu7bsSBF9wVDmvpfpiTREq3Hl0rYI/NbPwkJCnb1FKF
Pxj2qIxAflmoDS3KatQlAye8ylo/Y5Wm6L4EsxG0E27+i3X/9kbMFt+FV+0B0r1d
VQpUiRr0Z0wguo3kPj1VDtfnTXGTgA==
=smaR
-----END PGP SIGNATURE-----

--4heDsfrle+qDlMWp--


--===============4468361426761677428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4468361426761677428==--

