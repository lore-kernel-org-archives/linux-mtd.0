Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EA6C433FE
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Nov 2022 15:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YDjt5Z6IpgJhI+yyA83Fg/qlgMyB3UctDmhTeCj/Z7g=; b=CS/eZxRKr4mOcDmEu1LlFaQ4JZ
	81dtn13I1qPrNTBfC0Kn79UvupINp6s4TkJKw4o8mvW6sTYTvesGuoHXe+TibIibWtf3d3AMuAvgm
	lgVeD3bgqHrqvBB1TNOdI7TGjbk6IGdQiNrYwzH5xf10lApv19zT7KPUHDA+tll833kSjUzJZDQK+
	6ts7WqLZaVvezLkAZuYSDQNo/5m20YxOgebwQR+zZz4yOmahzAwEdO5kCqgw8Csao4ILP7jc2prEH
	22bByhwAxVDoEZJuOry3MdZ6QhAg/dil6sn7L6wgkBVrcAg09MtuM/zbB9RVZ5uzyBrtF3ug4f9du
	Xubhqt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow3Kf-004w0P-4D; Fri, 18 Nov 2022 15:31:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow3KJ-004vn9-QF; Fri, 18 Nov 2022 15:30:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 450DDB8244A;
	Fri, 18 Nov 2022 15:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DF1EC433D6;
	Fri, 18 Nov 2022 15:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668785445;
	bh=LfiiqbQVgBizYCizUCNHg2IaL0Mi+yMeJ7xdaR4buUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ElI+i2r3kma/IUDyxlSnThJkl8QTnLeIACfF3w8dM+Px8545hceggGH/r/6fvER2O
	 PqopVu3Q96iNH1klO2wNODhFGrNZsZ9YyZyOAJlg9fokdPVB0Jd8QzZsojTOflQs8F
	 HKURLqFqS/sK3foKVBQTj5IoslV3U1yvZKoXVB03w87lqeA5m4Ch5qiQhrxCsAnfGa
	 5zo06a2+QMoERl2xcfa3cN5XW1YANTTTyfVbbsLccT3+xh4t/BzNURCThgzj3t9BbI
	 kVKaKEfE5sU3Lr2gDyLfoFqfAxrsokTjKQqJ7qETTrTjFT340BSgmuEg4jrHLyqk6D
	 G3t2KN3upPGhA==
Date: Fri, 18 Nov 2022 15:30:41 +0000
From: Mark Brown <broonie@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: tudor.ambarus@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@microchip.com, devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	nicolas.ferre@microchip.com, robh+dt@kernel.org
Subject: Re: [PATCH 1/8] spi: dt-bindings: Introduce spi-cs-setup-ns property
Message-ID: <Y3elIdM3Xz1H4kKk@sirena.org.uk>
References: <20221117105249.115649-2-tudor.ambarus@microchip.com>
 <20221118141458.954646-1-michael@walle.cc>
MIME-Version: 1.0
In-Reply-To: <20221118141458.954646-1-michael@walle.cc>
X-Cookie: Ego sum ens omnipotens.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_073048_037533_D9E49C89 
X-CRM114-Status: GOOD (  14.89  )
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
Content-Type: multipart/mixed; boundary="===============6255172964322572059=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6255172964322572059==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kDV9Vhdp/jBbKORP"
Content-Disposition: inline


--kDV9Vhdp/jBbKORP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 18, 2022 at 03:14:58PM +0100, Michael Walle wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>

> > +  spi-cs-setup-ns:
> > +    description:
> > +      Delay in nanosecods to be introduced by the controller after CS is
> > +      asserted.

> Does this need a type as the spi-cs-setup-ns is apparently just 16bit? At
> least the driver uses it that way.

> But IMHO this should just be a normal uint32 value to be consistent with
> all the other properties. Also the max value with 16bit will be 'just'
> 65us.

Making it 32 bit does seem safer.  I've applied the series
already, mainly for the reintroduction of spi_set_cs_timing()
since there was another driver that needed it, but we can still
fix things up until the merge window.

--kDV9Vhdp/jBbKORP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmN3pSEACgkQJNaLcl1U
h9AP/wf+OU7ftgSU8x32UiIvVxfKAhXCTN6YUUpN5wJ5rcR6Y/u5C9U4Hz5OvhXt
iFa2V0T2jjqbu23NzY1vE+1JHj9RDdajNIL6EmY+L/mWhg2zJ9ps6NzDFLKWTP8O
jq8nKUKOtaaQEqjkf1JEohloqNWFiCeS+ClNGIKEE7mXIijbl40YWZ5+b6pu6Dyh
RgAFSFvIvZWg4PcHaEipU9uHlkakTTnCFLdyx9IZYsVb/QxmaVtWHdvutod55qyK
I8ma7ORrkz7xrlS77LyXeNira/4qBuln0QeOf1VRh2pNxOq7MFaiW8TMnSB2pbvp
iPKEIzUny8D0A1zg1QWzhxfru8Jvcg==
=PlCP
-----END PGP SIGNATURE-----

--kDV9Vhdp/jBbKORP--


--===============6255172964322572059==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6255172964322572059==--

