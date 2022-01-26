Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354D0C63684
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 17:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MeGIKFIKTMUYY9z4HMPBgAayiTfmrqkvOo3MlWGlG8w=; b=Al/tvFEVW1eTw0dOAkjFEJIHT+
	tbzHxE/96z4PnVXISARC3XLBZqvI5UQ3wBf0xk0+wVYBQD8UMx2WWeS0ex0LY7PDGCGLTbzGB8UTa
	4kN0K0alxgN/8kXqddwxZCk606zjYCE6J6jBJMQIDgIQDO+r5+h999WStcgx2Luyv2Ob9wdAgHLnR
	Nc7H52BRwLGghTObu6AGo1Sz8WIS78584WJBZquCMGrgKm/ApEBi5SFMu9MGb/ljVL7r0fRqKQldJ
	OZ7Gn6JDeLFN0XqTv6RHO71xQ9r58W1hfUxD0eO9aL7FE0ECVko+siq3Y321C1gYEby8D7j5rMfaQ
	r1hzBGbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nClxS-00Cx4T-2r; Wed, 26 Jan 2022 17:19:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nClGl-00Cfx9-3W
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 16:35:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B2812B81EE5;
 Wed, 26 Jan 2022 16:35:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB325C340E3;
 Wed, 26 Jan 2022 16:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643214936;
 bh=qdNhUTKmv7dhy+Vliq2xt78RN2xNkzXGQMBAMNKuq48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mMIi8lcbC1GD6C36tGzn/uQ8yxBQa4JnxX6qFg4eq88tfVCYYCt0kksafXyCMKBtz
 e0pjoHlMUdXRRt1FKouuQJMmUN4tnoA10iBkwW4zvndRZO4lWi1XWTzLu+nvDRibIG
 O9S8kmlVuPS+RWSagH3JZSFD3BDBQW6J38yCjJW9fMcYScLVtt7sC9eqe5/X8w2Tyw
 9A5w5DuFR69DsvKS1C1o7THwCotDmMtgGA2ShJQ2SAr1DzcorK+xC8KWLOV3Avr7u0
 gbaFj346JCa+bGUGoUTTxaiGyXgls6Q35fFb+Ceyu4QssW1UDTfrASMuX6uiGkJQa3
 Z1frQtW/vbblg==
Date: Wed, 26 Jan 2022 16:35:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: Re: [PATCH v9 01/13] spi: spi-mem: Introduce a capability structure
Message-ID: <YfF4UhhVFu749ZYK@sirena.org.uk>
References: <20220104083631.40776-2-miquel.raynal@bootlin.com>
 <20220126105333.883267-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20220126105333.883267-1-miquel.raynal@bootlin.com>
X-Cookie: Use only in a well-ventilated area.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_083539_335062_EF87E18C 
X-CRM114-Status: GOOD (  11.51  )
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
Content-Type: multipart/mixed; boundary="===============5934374694376695567=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5934374694376695567==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b+o4Gqc76syJes4g"
Content-Disposition: inline


--b+o4Gqc76syJes4g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 26, 2022 at 11:53:33AM +0100, Miquel Raynal wrote:

> Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-mem-ecc.

I was hoping to review this stuff?  I think I was expecting it to be
rebased after the merge window...

--b+o4Gqc76syJes4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHxeFEACgkQJNaLcl1U
h9DTgwf/by9jYrSchPqQd6Xm/Z49F9oWPnphXXukxjYLre0sloaW4eEm8kcEMiU5
+0imedDQtB4ywKl4ZXsQaswco8bThrUUD3oTPleY7muQs8/i4uWSMB1S5bzcoCAH
gAuesxzlHcM5xvogHAT83OmsVHD2X9FdIx41diYTkoLrB5Fz2YFJRmLIvmBLXpjJ
kimxdGxWzkg1o/sKwVNbIJ86buAZ8EIWfJORt/1G0CdJwShCIy0hb4ske652LYq9
9OeTFLj4NfDs3EW9IWaUBbXW81vjwxQPhnOpnY8bBxgyn58Y54RR5TwOwLkCyn0s
WGgO+1pj/euv3RQ6IQhxXa576gzf0Q==
=Wwro
-----END PGP SIGNATURE-----

--b+o4Gqc76syJes4g--


--===============5934374694376695567==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5934374694376695567==--

