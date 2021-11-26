Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405EDC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 13:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ms0YJrO8PqjGkpJkaRZ4GKZB3TMh06IYohYNbD/nuSo=; b=vf3TJJyu04y+D1QExc4AiYEUi0
	GcADAmmXkjp3q6Ggm+KCiUKsbc7DwOpZkWBw19lpO0VzGYtSNcV++Hyp/r32XWLZMn/3kf1BQ0x1E
	JAVk/egNvpCV60lgBpFnLqhREREJdCLEJbyEIbGDITQMgcZB+4LNfpj7dYOGw9ex3Tf99FPaTx/Pv
	cKnpLBREocjquqghMyEBwTRI8P+4Jc2kX9y70ar3YKLPAhRW4J/E2zsTvZgZmErs5EsfjmhCJxcdx
	N5fkOLf51FdIJnKQs/pF3hFzuTWDaPjwAmDehIiZ0wr3KrDlXZLA/aRgldYN9BEFY5khjd1xhdyje
	TUUwwYcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqbPs-00AcoT-TF; Fri, 26 Nov 2021 13:37:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqbPq-00AcnS-44
 for linux-mtd@lists.infradead.org; Fri, 26 Nov 2021 13:37:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB2A862291;
 Fri, 26 Nov 2021 13:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE3CC93056;
 Fri, 26 Nov 2021 13:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637933844;
 bh=wmRpkJwoC1cyFGYIO+kPPQaZo8nlGwIQSJGcblGlXbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h8h1jObK6rIUOSXx/thIsAk5LFusjEwq+UEptv2AdzEUNC1FE3EQtlKXF+DCB0aH8
 dmY11g0gPUJqFRbKv90SPGyQDhlHsm+FvCYuSroX/U1wXkmQhAalVB4dOEfyV0933W
 aCfx1XAymB9XB8x9tRkKTVf/V6wabXgJvgmIgfCQX84VwEpoU4E6qJcFDwjCCwaomm
 beDcznGrLYqmiJ62RHswrHW6uKWjOEz/Ca+VKZxJRkiDZLQ7QsLtJbjdqYueV08f09
 0dPaaF/I6DJfuTFnn3rO12aIaGsOgih6/n63Smvc8XnanG1vnp9hYas3laRxwdWWFL
 Toct/ksCkBNHw==
Date: Fri, 26 Nov 2021 13:37:18 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 00/20] External ECC engines & Macronix support
Message-ID: <YaDjDhOhpHMdxiqA@sirena.org.uk>
References: <20211126113924.310459-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20211126113924.310459-1-miquel.raynal@bootlin.com>
X-Cookie: You fill a much-needed gap.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_053726_259992_50BBDE83 
X-CRM114-Status: GOOD (  11.83  )
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
Content-Type: multipart/mixed; boundary="===============8868000980503723386=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8868000980503723386==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aWPUUvSEFHncPtMR"
Content-Disposition: inline


--aWPUUvSEFHncPtMR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 26, 2021 at 12:39:04PM +0100, Miquel Raynal wrote:

> As a first example, Macronix ECC engine can be used as an
> external engine (takes the data, proceeds to the calculations, writes
> back the ECC bytes) or as a pipelined engine doing on-the-fly
> calculations (which is very common in the raw NAND world).

The SPI bits of this look fine (most of the smarts are in the MTD
code!), what's the plan for getting this merged?

--aWPUUvSEFHncPtMR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGg4w0ACgkQJNaLcl1U
h9Cn+Af/Voj2W+6G7O2v0NYD8QDbEakNiY0wg5+Y2TRtpK6/td/VfoamnCvD6Eyx
YjS75XB3sAkV/UlEzfZLxaeMu8+6zaW0VCuCweXEv1V/19kMc4dLPgW61Q0Mu8Ma
D3vMoZEzPXvIpk7wGVuCBoZ8L7R1X3jhTX3au0XEdhRgW642bY5ryBS19BIvFwpI
XNdiJiVqJ9STtYQT8kXu49IRPfFfzlsd36f36mT6V3mXoh8b+Y3ofnrM66I7BVMJ
G70LrsAkF64YqU9kuD4ywVOsul5KofTUjaFprS53qUQEJvNF69iWoCYWOCv/uhNU
VEjZgMVgnTLJQ+Olsji6Ymo7ilbUeg==
=O5UE
-----END PGP SIGNATURE-----

--aWPUUvSEFHncPtMR--


--===============8868000980503723386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8868000980503723386==--

