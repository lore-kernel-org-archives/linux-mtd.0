Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32BAEC369A8
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Apr 2025 11:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e3TScui+pLsOE263QfrQ+9iKinVyUoROOi3V/zWFW2Q=; b=NlTYORzuYc4xJGu22wDwJ9M1FT
	ZxbWdN4EayycvS5mxGNhUOq+kvR598npNecYCpllP5HnTMiK1pTnJc14dO0HZDh2Wdxv+o9wr368I
	SFCImc65ED6Rz9/D5kWOpfjDH3ryOhyNwrHQRMcXTkXN3nKVG+1bdXZPtUDFc4QpfEV9c3XwrbfHL
	wo0BjpFmYXKU9qYuiMgehxiaeRKUaEE4gN2/rQ2yVJVBjbJ7l9w7TKHM3PODaF2JiTtF4B/5m8QTP
	9/IWiRyqanIDEBuoAatBxPXFdlxqm+JDGDje+vWOGSzf+byrWaOoBcFy4Rw94J193XJiKaUu0o2tR
	Td2uQdfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2qEC-0000000AKCl-3zzN;
	Thu, 10 Apr 2025 11:37:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pw8-0000000AGGg-126R
	for linux-mtd@lists.infradead.org;
	Thu, 10 Apr 2025 11:19:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1DC5F6843D;
	Thu, 10 Apr 2025 11:19:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5194AC4CEE3;
	Thu, 10 Apr 2025 11:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744283951;
	bh=gAFvWpcAGBkegBSikm87MrNHJtZam8cHZvJScZa1YO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nDJ/YYu1BZTH/wCI43Y6qFG2VpBm778RH4Ahe5Lc/hjvbh1mPHOR+bvIjtIPJjYgJ
	 v76zeBUcAzeaobXpwpPB7F7N0ALkeKNOaFnrhpk6sh66f9Qq5EB3MlOqdwPKagcXVR
	 qESJGDXIsbKlwIZEcvsjR9TJHMy91PyntBiKbuwosnfvlBOiCpyaX6CEbo+QYYZdQo
	 989+V2m7iEwdmFqFModMA/SB7YnDKCkRP0j3+pIwbbXK833s0X/Mj41iX3O1OhOXiw
	 EGkOzcjwYaS1KffEtbBp/kiovBdomvAga1HaEZ7a6AukOUsLLIF4iCovZVhtRDb3i8
	 Ly1tWWkexHEjQ==
Date: Thu, 10 Apr 2025 12:19:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, absahu@codeaurora.org,
	bbrezillon@kernel.org, architt@codeaurora.org,
	quic_srichara@quicinc.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 1/3] mtd: rawnand: qcom: Pass 18 bit offset from NANDc
 base to BAM base
Message-ID: <79349446-2e87-4f3a-9644-9262a4ccb12a@sirena.org.uk>
References: <20250410100019.2872271-1-quic_mdalam@quicinc.com>
 <20250410100019.2872271-2-quic_mdalam@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <20250410100019.2872271-2-quic_mdalam@quicinc.com>
X-Cookie: You will be awarded some great honor.
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
Content-Type: multipart/mixed; boundary="===============5778000422276334817=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5778000422276334817==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BHGlqQ/YgKipM5ku"
Content-Disposition: inline


--BHGlqQ/YgKipM5ku
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 10, 2025 at 03:30:17PM +0530, Md Sadre Alam wrote:
> The BAM command descriptor provides only 18 bits to specify the NAND
> register offset. Additionally, in the BAM command descriptor, the NAND
> register offset is supposed to be specified as "(NANDc base - BAM base)
> + reg_off". Since, the BAM controller expecting the value in the form of
> "NANDc base - BAM base", so that added a new field 'bam_offset' in the NAND
> properties structure and use it while preparing the command descriptor.

Acked-by: Mark Brown <broonie@kernel.org>

--BHGlqQ/YgKipM5ku
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmf3qSgACgkQJNaLcl1U
h9A8LQf/Qdes70/Rw94WVFtMtWkzp5YAtG82yLUA5LOSLIt8DTuvKh/B7Q216lDc
DeHth7xNLhU0NKwpmVt0ESrPHrcLcMYMdq59924cs3EY5/HN4hk7YStIIX3OJxVM
qcLdtHyiWGvQBAKptqbjM997MTKHzNMtPSb0ZZWNXjLe/x/rizeTgOQ7loGdgxFv
bpDvk3Fy4TDZmBQ6ZcolMTFBV+B0S8ZIjv8bDbaN/hbbsuoayf1erKpP0tSW9Wvm
Ag+/0fS0Lp/aD4ZaRPMLNH9e5ZtgFfDWSSAf88NypR3se0QgelmM9Vi45JEdK0ML
fiTlbY3OQXlRIFO/WkjvS4GBx2t2sA==
=JRjg
-----END PGP SIGNATURE-----

--BHGlqQ/YgKipM5ku--


--===============5778000422276334817==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5778000422276334817==--

