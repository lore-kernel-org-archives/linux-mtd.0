Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74DFC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 12:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHlOI9ncrSq+afABi7UP4LVOdyNviOs3auGXOTUode4=; b=a19RFnU0/UIXgRiBPmDyZdsTOY
	4yPs7oY7NF/D8C9VY84TKJblomOHwSstkEsxlEnOasq9j6YwdIu2wPFWy5nasdyd7l7lliDpX6tBu
	jXq9OSryiUPiLNHiN8qqfWdXmjB5ycCRRZ2evUwdw1qZAi6RRAt4gwOwawTrjSpvObmX8VbWt3oLT
	YsdgE3JBkB4ZOMFdvlY2hcWvw/1mOlE5u7SYgfIChmSXLcWajJ4PjVD5nOmp+b9eESYK/3f4oAErz
	AKCuC46TkHJxIZ0cqQMsmjQoTfLzGlIX/wWaT0vHFIYqjqBZff2H2VuxOa7zKl0J+sSoogJgT0liA
	3sjLQwRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qytaL-00BQgE-0r;
	Fri, 03 Nov 2023 12:47:37 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qytaI-00BQfc-27
	for linux-mtd@lists.infradead.org;
	Fri, 03 Nov 2023 12:47:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10DA3CE16C1;
	Fri,  3 Nov 2023 12:47:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0C26C433C7;
	Fri,  3 Nov 2023 12:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699015652;
	bh=YO66OvhP/VVHPNNy7Ei4mXR0Rw9gNOGEAcE5AmCI8wY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D3+lSdzOQRk80PA8gPgTD8xYIKG2lrOnNFtRDeVdlBfG63Aers/mg7I4t8mFTPi9Q
	 CW1HnBwAVo9YkCAyWfuj/1gSvy5Xb/zEBmaJzP6A6SIjAvsnT+EbIILp50AteGyo+J
	 x7Kjygt9tYFgMSXS0lLD3fzQ9mHYTi1SNtuZIuUCs2OP3DCiJjG+mPcYG9rpLITvil
	 hg5/Q+j/yEl+kcDXT3r9WGsxD9dr5KHWeMNcgxx16JsodFE5M1EQF3B3sSZLXJXFQv
	 3O40cmAJcRVf+aArbfvdPfkqLBpWosdJOdPeiABcl8HwXMDHfEFAFTA0DRnv0batA5
	 Q2uePOM2ZK9bA==
Date: Fri, 3 Nov 2023 12:47:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	robh+dt@kernel.org, conor+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	quic_srichara@quicinc.com, qpic_varada@quicinc.com
Subject: Re: [RFC PATCH 4/5] spi: qpic: Add support for qpic spi nand driver
Message-ID: <b35b4184-d456-46f3-9268-8f0af2fbb4eb@sirena.org.uk>
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
 <20231031120307.1600689-5-quic_mdalam@quicinc.com>
 <a1270a88-49a9-4bdb-89a9-ce6929f2294d@sirena.org.uk>
 <2b9e943a-198e-7999-b898-e7b2498a9ffa@quicinc.com>
MIME-Version: 1.0
In-Reply-To: <2b9e943a-198e-7999-b898-e7b2498a9ffa@quicinc.com>
X-Cookie: He's dead, Jim.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_054734_872421_EE354F7B 
X-CRM114-Status: GOOD (  15.69  )
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
Content-Type: multipart/mixed; boundary="===============4740708485021015848=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4740708485021015848==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Op0au9/l1MW2X+EM"
Content-Disposition: inline


--Op0au9/l1MW2X+EM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 03, 2023 at 04:50:54PM +0530, Md Sadre Alam wrote:
> On 10/31/2023 7:53 PM, Mark Brown wrote:
> > On Tue, Oct 31, 2023 at 05:33:06PM +0530, Md Sadre Alam wrote:

> > > +	ret = submit_descs(snandc);
> > > +	if (ret)
> > > +		dev_err(snandc->dev, "failure in sbumitting spiinit descriptor\n");
> > > +
> > > +	free_descs(snandc);

> > This seems to be doing a bit more than I would expect an init function
> > to, and it's very surprising to see the descriptors freed immediately
> > after something called a submit (which suggests that the descriptors are
> > still in flight).

> Our controller supports only bam mode , that means for writing/reading even
> single register we have to use bam.
> submit_descs() is synchronous so I/O is complete when it returns.
> Hence freeing the descriptor after it.

That seems like the BAM API is very confusing and error prone.

--Op0au9/l1MW2X+EM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmVE69wACgkQJNaLcl1U
h9Dkugf/VsaUo4k4Z3jLIBAgzXGrzjlRrTxTxJyGu9jDAXZeMeTn2A2E+PgfGf5D
5ZxgLrmrSJLMsRGWIRe8MqKiyThyN2rOC/er/oJE8n4SZ+FicSBXPCdR6TPUKCsf
M5Rl4Vhq+rBRkArWp/Y5luoG9/pDCs5mhGbY1SKkaR06RvftMV7MHgWodxyn7U5G
iexZwY9I3IzkpkB85edqNl0Vh89vvsjPKptH8WZOuc+mF1dRZGc5dkXwgHAScxKr
I5dAQky8hSXYoMsialzHArWpIWjdmuMELn9CKMTLpQvwc7pUWkqIi4GGB1TuYWMB
LiPTinFMPGc2XD8XqtWCHNbTvA9BfQ==
=xTC+
-----END PGP SIGNATURE-----

--Op0au9/l1MW2X+EM--


--===============4740708485021015848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4740708485021015848==--

