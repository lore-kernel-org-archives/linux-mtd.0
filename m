Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8278AC54EED
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Jan 2023 17:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmVF+/y6vMtWm1nboQ04nPIet+Rh/uCvb9u6iNP5HCo=; b=yB8amJL1QFZmukA9hZ5j61OeZ7
	WeVdoT8UdPiQWfzUBGmlP0BmnJeMzbdqZckmqIQJlLG/gEaKhg3YBdOzzV2XHLnPQPHyTNhr+QtUG
	WEeSc47tZbnZQ/SNT/t7n+tvDem6AeW5GMlMTtkTtflZv5L8bOF9tCCVRR2rENKEXEeluPov6kAI6
	29V9y8CiefqzWj1l6FU+8m6mKhkdZEXu/pwVGpz4cCOuBwW7eZhMLV/UOJI5YQTFHfeQ6E3qDR9Es
	n5CxG93z6xN77br2MaqqV6j8+YzAjeQ5fDzWAcssnGSwi05X4UgKY3alfOa4qrepiBiue5AnwUv5s
	C49Oi94g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYB1-004fEG-UA; Mon, 30 Jan 2023 17:42:44 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMY7G-004dRH-0d; Mon, 30 Jan 2023 17:38:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 53B2BB8125E;
	Mon, 30 Jan 2023 16:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B38D2C433D2;
	Mon, 30 Jan 2023 16:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675095543;
	bh=njr6W+Xwj/RIjnPwkPZx0WPEFYVoTi3RI/NZkQ71He0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S4pV9f9QVf9hjJO00A1v6XCQxfx3XVceL2Og+/lnnm0Nb1idnuUlwNImdtKyDjoQy
	 xPO3+WYVshtAzycehccoXY3U8yGDgleBYbqnLB9VMNOZLtUMbQUs140UaDu12+HkzT
	 /eXZf8rra8k7G3b519MGLAU0Yb948BS3vzGE9Gw0VAqkbe9Eo/YXpniDWCWxQoTKhV
	 Kdb1xyoVTjQ9Upq3kUTM0L6L7kHF4zY1V8nh073JfkVyxYBDhytNnjKzszIYD/Mkgw
	 ympSumFq1JWmAyCTaA/i1M5yk1hdP+Gi3LLP/kKMtQmrjQYUdWzuuDUv6F6reHOb8/
	 2ni4oaiuI7cGQ==
Date: Mon, 30 Jan 2023 16:18:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chuanhong Guo <gch981213@gmail.com>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, benliang.zhao@mediatek.com,
	bin.zhang@mediatek.com
Subject: Re: [RESEND PATCH v5 00/10] Add MediaTek MT7986 SPI NAND and ECC
 support
Message-ID: <Y9ft8BIzESLQ0TTh@sirena.org.uk>
References: <20230130030656.12127-1-xiangsheng.hou@mediatek.com>
 <20230130171145.2c844d34@xps-13>
MIME-Version: 1.0
In-Reply-To: <20230130171145.2c844d34@xps-13>
X-Cookie: Some restrictions may apply.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_093850_286095_53A63AF2 
X-CRM114-Status: GOOD (  16.69  )
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
Content-Type: multipart/mixed; boundary="===============5430506699909335835=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5430506699909335835==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CMu4i+MTxKFAnMnD"
Content-Disposition: inline


--CMu4i+MTxKFAnMnD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 30, 2023 at 05:11:45PM +0100, Miquel Raynal wrote:
> xiangsheng.hou@mediatek.com wrote on Mon, 30 Jan 2023 11:06:46 +0800:

> > This patch series add MediaTek MT7986 SPI NAND and ECC controller
> > support, split ECC engine with rawnand controller in bindings and
> > change to YAML schema.

> I would like to pick-up patches 3, 7 and 10 and apply them in the mtd
> tree as they look completely orthogonal with all the other (spi/DT)
> changes, am I right?

> Mark, is it okay for you?

That's fine, assuming there's no dependency issues.  Xiangsheng, it's
generally best to avoid mixing patches for multiple subsystems into a
single series when it's not needed since it makes merging things more
complex.

--CMu4i+MTxKFAnMnD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmPX7e8ACgkQJNaLcl1U
h9CP4Qf+Pd13QIe/NKJYmT5Ku/sdC2wKEgISZktdgp6nkJnezPBcHDPZMRAovciN
tEkeKbKAngXsLPelmzMjY5z14PseLyy1afFboVV8Vz43LUE144H9WRx917uqatkP
/QCJ0/l9/izHntwO0zWOPNIomAyoITzsO8Sk79DmtqEMjSx7GNMrr3xX1RaxHDam
O2J/ho0Qt84u81akb1jCSR6yWcLO0AJ4gJ5FYby9GU/qIGpdSGYGppQ2uAVJUSsa
Hn4knoLT4QarM9J+obdb1FQz6GHRB8hTRaqMrAy1reHcP6XEJgkaQkxP+cFc2RRS
5o+l86XRsBjIv5jTxDO/VSl7U3kV/w==
=fnzJ
-----END PGP SIGNATURE-----

--CMu4i+MTxKFAnMnD--


--===============5430506699909335835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5430506699909335835==--

