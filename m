Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22BFBC48BC3
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Feb 2024 16:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xI9mIWykKWcxHSADZjoZSRxqJj/6a+NLU1HCryVYPaU=; b=OwkBSNd8mzcizgfrumricyH0PN
	eeboUwXCDBTwx4jYHd0YXXnYLbjd9dgh6w0G72gFUSTEspfYmNV5s+P/rHd4QKDP2kQ3POPxvAUxp
	NXfPFfRs9wUvy561BNFMJWATxlhVJI5x2uGsuucG+YAyV6cm1cHY0eONuntFSXPm9FOUGNYd9IRgo
	yvtDKDNHf1pPd3dpGLggaqoLgFw4pNmwt679nT6tfZk1p4g6MnK6kbd3kYKABQAbNqEmNU0Hqx8q+
	rIva0Lwj70NKGEpQfnapf8KnK3L4CmDN15HqB1bWyjRGHVh7qLHJ5T366/S+Q/akw2caeoVIoE5E1
	OyQXsjGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcSc0-0000000FMVd-06Ia;
	Tue, 20 Feb 2024 16:04:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcSby-0000000FMUS-019O
	for linux-mtd@lists.infradead.org;
	Tue, 20 Feb 2024 16:04:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2CD21CE19F8;
	Tue, 20 Feb 2024 16:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628B4C4166A;
	Tue, 20 Feb 2024 16:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708445087;
	bh=J1fK6jslfQkZJzg2jPwQHSC+4w+Ux+DicAEu9djZk9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dzit3AHYBMTM6EIcb3NGyAl04AmdWlCHyErY2wZxASbuJz5+G7g5emqHdd/RtULNB
	 IS12FBFzONThiujilhranlioF0I31opt503RIvWlbjanS2xIR3pt5BZ0JLp0EfV0OZ
	 g6rJOt04kvLmtjC3jC3CMOnmiktLrM2JrZgtEelfFg6J981McJzPAqwgRxI8BK+R8/
	 Sjj6i3+w12GI/5p1PJKSdeYYwvQhdtLma6+fYhXmCsBkHcDppUTGYKYwqKU8274CTx
	 QbvCMA/UMTEL/6XbOtUsFJOIlPiUAi2j7BZHLWALRdLLsTrEGWguzI2eZknQ/nt1/f
	 bpzmFfHNJDRPQ==
Date: Tue, 20 Feb 2024 16:04:40 +0000
From: Mark Brown <broonie@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: andersson@kernel.org, konrad.dybcio@linaro.org, robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	quic_srichara@quicinc.com, quic_varada@quicinc.com
Subject: Re: [PATCH 3/5] spi: spi-qpic: Add qpic spi nand driver support
Message-ID: <8422fb6a-edd4-4911-89b7-2974c197981b@sirena.org.uk>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
 <20240215134856.1313239-4-quic_mdalam@quicinc.com>
 <21dde665-54b4-48e4-b963-1008ac890df3@sirena.org.uk>
 <4a0e51cf-d29a-5843-9c61-1d31a9721a3d@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <4a0e51cf-d29a-5843-9c61-1d31a9721a3d@quicinc.com>
X-Cookie: E = MC ** 2 +- 3db
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_080450_286715_ED0A8C10 
X-CRM114-Status: GOOD (  15.21  )
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
Content-Type: multipart/mixed; boundary="===============8205664074090519762=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8205664074090519762==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kjXP74qJYK0BefO/"
Content-Disposition: inline


--kjXP74qJYK0BefO/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 20, 2024 at 05:24:43PM +0530, Md Sadre Alam wrote:
> On 2/15/2024 7:44 PM, Mark Brown wrote:
> > On Thu, Feb 15, 2024 at 07:18:54PM +0530, Md Sadre Alam wrote:

> > > +	if (op->cmd.opcode == SPINAND_READID) {
> > > +		snandc->buf_count = 4;
> > > +		read_reg_dma(snandc, NAND_READ_ID, 1, NAND_BAM_NEXT_SGL);
> > > +
> > > +		ret = submit_descs(snandc);
> > > +		if (ret)
> > > +			dev_err(snandc->dev, "failure in submitting descriptor for readid\n");
> > > +
> > > +		nandc_read_buffer_sync(snandc, true);
> > > +		memcpy(op->data.buf.in, snandc->reg_read_buf, snandc->buf_count);

> > These memcpy()s don't seem great, why aren't we just reading directly
> > into the output buffer?

>   This reg_read_buf is being used in common API so that it will be used by both
>   serial nand as well raw nand, so I can't directly use the output buffer since
>   internally CW mechanism I have to maintain in common API.

We have control over all the source code in the kernel so if there's
problems with the internal interfaces we can improve them.

--kjXP74qJYK0BefO/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXUzZcACgkQJNaLcl1U
h9Ae6wf+Oq59OwYseL/VBULc5zFT+JBaAz+wC7NoE0Cl+JBwS9ar0CwNuWUQD6Ra
9Thdvn0Xmqk4vySveo4DKrtjIjai/iU87ZwjrMnDE5jVf+/m+n+h0YCfMSeA1qlY
WjqgbYKTJRpm9YfJitc6FuNjUnnww2cljwtvT1V6gLbHFmPtG+70m/RKRin6FJlL
JtVaTkjbHlUrwWANzGfylsAIeyz6q9BDDhN+q+7GkkLV/vUtuZiCeVHszJ8EwjUf
HpLkY1r/MGbpENGuqo9iiFOlSGHLhyrB83CGZ8e+hB0EiONvKPZqu+mB3wdnRLiF
oxAaV4xJrFzQNVDCHiDQXmHOhFCXhA==
=tp1U
-----END PGP SIGNATURE-----

--kjXP74qJYK0BefO/--


--===============8205664074090519762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8205664074090519762==--

