Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98884CA0EDC
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Aug 2025 13:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MzIp7PINfh7znSXIrfwcQ8Sy4MV2sVg6wG4LevCLJi8=; b=LXtW78sREqghTlBINiCP+WWXII
	gvxAvfVuyvopBbeNBgWo1xzu4fOyjAsH8Jp7K43q9i/cmzxxj6hnW/fGiPjWwAG8xugnL0eNq7FKZ
	S2sj7YjZ2unRO5IKNIOyXQEc1AawloIwD86cKCfDXw3VtktFTts+HXXCbv5ZDL5ktyyAenh3kXs8n
	DSSxerNZqAqSwTnN8LJzRbPxsGVowuhmZjfCLGIizpliuiVm73eOu3YMpAt56VxrPb5ZlHbTY7U7f
	c8juWXjoeGs+9JcAHc1gb4oD48AJ1pk/kFQ77nlZN29g1iyKdd2swp7imay6ZFb+Bf02mjbwICs7G
	z7JqUuwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umY2K-0000000H3Xz-2rZr;
	Thu, 14 Aug 2025 13:30:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXAK-0000000GrJ2-2Y2K
	for linux-mtd@lists.infradead.org;
	Thu, 14 Aug 2025 12:34:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D8F2601D8;
	Thu, 14 Aug 2025 12:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3BAC4CEED;
	Thu, 14 Aug 2025 12:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755174883;
	bh=0VrAhuKLaVyb61WaZNhMiNNuBwVKngCyRJ/V5YN1iC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lejqI9kt2PAkvbRwc5AaugS5uDQA2HkPjMWYuMxXxEtFScLJzoUrTAQiqwJuBngFF
	 lLVzwCltFh5qjf9/KX4a0w+Sd+CXsOL3dY2pq8juPi2E6gQCSO/IITqhxc4bDcm+lH
	 8QgRcYEOPQh+19yrMj/gVX86hJADE2bn2LEjQyWQ6nat4FwWDtgEC+ImWeOeg0RIOv
	 xTMKM0VOPQ/0ZiGH9lMcnz8b3Pkkhx77rG4nglx2PjjBfXqhZlyDrPZM0Jf/jg0+TB
	 OJVeXwcsSpUAbZV42yDHMIFVThhRELGqvDhNvndpfzRPfYp23OfRcFlHVyDeB0ZrXs
	 Nt2ds8u/ocxAA==
Date: Thu, 14 Aug 2025 13:34:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	tudor.ambarus@linaro.org, pratyush@kernel.org, mwalle@kernel.org,
	p-mantena@ti.com, linux-spi@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	a-dutta@ti.com, u-kumar1@ti.com, praneeth@ti.com
Subject: Re: [RFC PATCH 01/10] spi: spi-mem: Introduce support for tuning
 controller
Message-ID: <2f051eae-61c7-4bff-9f85-cf37b02a7ea3@sirena.org.uk>
References: <20250811193219.731851-1-s-k6@ti.com>
 <20250811193219.731851-2-s-k6@ti.com>
 <6c35baad-a332-4b0a-96ca-1cdb3840ad94@sirena.org.uk>
 <20487e7f-33dd-4b65-b1a8-5bb8a06ef859@ti.com>
MIME-Version: 1.0
In-Reply-To: <20487e7f-33dd-4b65-b1a8-5bb8a06ef859@ti.com>
X-Cookie: This sentence no verb.
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
Content-Type: multipart/mixed; boundary="===============6257136539421136290=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6257136539421136290==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hsVsvyCGymldcnqG"
Content-Disposition: inline


--hsVsvyCGymldcnqG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 14, 2025 at 05:04:33PM +0530, Santhosh Kumar K wrote:
> On 14/08/25 01:56, Mark Brown wrote:

> > Should we have something that blocks these tuning required modes without
> > the appropriate tuning, and/or allows discovery of which modes require
> > this tuning?  This all feels very landmineish - client drivers just have
> > to know when tuning is required.

> The flash's maximum operating frequency determines whether PHY tuning is
> required, as we need tuning in case of Cadence controller for frequencies
> over 50 MHz.

That's entirely specific to the Candence controller from the sounds of
it, that makes it hard to write a client driver if you need to know
exactly what the controller you're dealing with is and what it's
requirements are.

> And we do check for this condition - see Patch 07/10,
> cqspi_phy_op_eligible_sdr(), which currently verifies the flash frequency
> against 166 MHz. This logic can be improved by implementing both min and max
> frequency checks, will update in the following version.

I can't actually tell how that verifies if the tuning has been done
appropriately TBH, at least not without more effort than I'd care to
(and the tuning only gets added in patch 10?).

--hsVsvyCGymldcnqG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmid190ACgkQJNaLcl1U
h9BuIAf9HOg6LtPbsCspgF6wLQokIeC1xc/j87GykKnreWyld/ZIRyHTDhWa+kJl
KxWpWUNF/Nu1JT9nAnx03BTvx7fTOt+WKScIJg1kZFnWRHoULMQ0tEoYxEGMPUVG
TnXuBDDrb+AfwJdR5w112Z0ixw8yTVk8cNFnAEfCAUoxkpxXnesWYjoTV3GhztRQ
LTWxBj+EWthPRgIz0SnZFC0o54u+iJ9n5hkb7YiAVJ2A+O/XvcYogdXmulGWlvLl
g5Ec19gMjIo0LwIc6h9MDc/fFNnUDkSHSvd2t9g6DhjCMf+/Y+phV3v3AHYRlKhC
GYTzuHHYpdWrQbl/1JO/bw31IFhtcA==
=1D0X
-----END PGP SIGNATURE-----

--hsVsvyCGymldcnqG--


--===============6257136539421136290==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6257136539421136290==--

