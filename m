Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AF1C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jul 2022 18:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEn88oCuAk8EQUK1iMBM4cYnEryFwrE426wfKP2fvL4=; b=nrEsDC2nKLMKQnbmP321flSt0M
	oikyBw4+W7j4wOzRSSm286aTCyfkIpRPnItubqNCq8f7huXHcRYouD+PrLmtOdAijgXd5Z0g4SD6Y
	eR1h2l6vTmNr7jIJd/M12Ot+Y7ts54KjRm7UfU1O1ZZtLT2IcJJOnqM/9DBFdHWHZp8JP/O5giZik
	BVyrYSjQt3/bXR3EFf72B4KPErrB3BvReMZVNNrXXoOfsvsBrNh/atXdXJg3kQnrAWkRLzaqbHaeF
	YiyCslCEvIuR2HUQ9ywYWWob3mNfKKC0v99Uz3wnRMtq53zHTu2QLGPz6oHC9XVV2G3PqKZK/3pGK
	Nn6H9Rbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oExXc-008z5t-Ep; Fri, 22 Jul 2022 18:38:24 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oExXY-008z25-Et
	for linux-mtd@lists.infradead.org; Fri, 22 Jul 2022 18:38:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 33CF7B829C7;
	Fri, 22 Jul 2022 18:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CDDC341C6;
	Fri, 22 Jul 2022 18:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658515097;
	bh=yxyq7a2jEomP2Y5qR7Uos8qn+okY3YhRz9MvehQfMm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CyVXVug3Nt+MsbZ5O8hBnwnxJct6PxB1vaAqG5BncvrWRZQMPrwlx2VIgZcOxuaKG
	 PePaAF34ef570pSN/VMZnMvjubUenVsFmzaQGze3jZxDAmBpdJMg0ui4q2lflJAZGq
	 OiIk4kUkcNiJnXAtNKCe+99LK5qQkwnECayBVNRMIK7SCYQtHzr66wR9koJ0PQJ0kj
	 //0NH17AqRSVDSx/se9np9lyjYAGiSXIh2ws0b0NDZXbQp1mbTqUPfb4Kz6YGYV1rU
	 g2h0PkcPQ8C+UcRT4s2C/TwOd1qjUBJdpri4V1z5EuZ7Zprg3b5y+i6yFrfXwLSU6/
	 IqjMUFA1hO9yg==
Date: Fri, 22 Jul 2022 19:38:09 +0100
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>
Cc: tudor.ambarus@microchip.com, p.yadav@ti.com, michael@walle.cc,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, aidanmacdonald.0x0@gmail.com,
	tmn505@gmail.com, paul@crapouillou.net, dongsheng.qiu@ingenic.com,
	aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
	jinghui.liu@ingenic.com, sernia.zhou@foxmail.com,
	reimu@sudomaker.com
Subject: Re: [PATCH 3/3] SPI: Ingenic: Add SFC support for Ingenic SoCs.
Message-ID: <YtrukeLk9fInqQIL@sirena.org.uk>
References: <1658508510-15400-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
In-Reply-To: <1658508510-15400-4-git-send-email-zhouyanjie@wanyeetech.com>
X-Cookie: Yow!  I want my nose in lights!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_113820_808061_BEADDCC1 
X-CRM114-Status: GOOD (  24.86  )
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
Content-Type: multipart/mixed; boundary="===============8054613337543751112=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8054613337543751112==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u7Z7lZkjhnzZyt/z"
Content-Disposition: inline


--u7Z7lZkjhnzZyt/z
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 23, 2022 at 12:48:30AM +0800, =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou=
 Yanjie) wrote:

This looks mostly good, a few small issues though:

> +++ b/drivers/spi/spi-ingenic-sfc.c
> @@ -0,0 +1,662 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Ingenic SoCs SPI Flash Controller Driver

Please make the entire comment a C++ one so things look more
intentional.

> +static irqreturn_t ingenic_sfc_irq_handler(int irq, void *data)
> +{
> +	struct ingenic_sfc *sfc =3D data;
> +
> +	writel(0x1f, sfc->base + SFC_REG_INTC);
> +
> +	complete(&sfc->completion);
> +
> +	return IRQ_HANDLED;
> +}

This doesn't pay any attention to any status registers in the chip so
won't work if the interrupt is shared and won't notice any error reports
=66rom the device...

> +static int ingenic_sfc_setup(struct spi_device *spi)
> +{
> +	struct ingenic_sfc *sfc =3D spi_controller_get_devdata(spi->master);
> +	unsigned long rate;
> +	int ret, val;
> +
> +	if (!spi->max_speed_hz)
> +		return -EINVAL;
> +
> +	ret =3D clk_set_rate(sfc->clk, spi->max_speed_hz * 2);
> +	if (ret)
> +		return -EINVAL;

The setup() operation should be safe for use on one device while another
device is active.  It's not going to be a problem until there's a
version of the IP with more than one chip select, but that could happen
some time (and someone might decide to make a board using GPIO chip
selects...) but this should really go into the data path.

> +	ret =3D clk_prepare_enable(sfc->clk);
> +	if (ret)
> +		goto err_put_master;

Nothing ever disables this clock.  It might also be nice to enable the
clock only when the controller is in use, that bit is not super
important though.

> +	ret =3D devm_request_irq(&pdev->dev, sfc->irq, ingenic_sfc_irq_handler,=
 0,
> +			dev_name(&pdev->dev), sfc);
> +	if (ret) {
> +		dev_err(&pdev->dev, "Failed to request irq%d, ret =3D %d\n", sfc->irq,=
 ret);
> +		goto err_put_master;
> +	}

It's not safe to use devm here...

> +	ret =3D devm_spi_register_controller(&pdev->dev, ctlr);
> +	if (ret)
> +		goto err_put_master;

=2E..unregistering the controller may free the driver data structure and
the interrupt handler uses it so we could attempt to use freed data in
the window between the controller being unregistered and the interrupt
being freed.

--u7Z7lZkjhnzZyt/z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLa7pAACgkQJNaLcl1U
h9BufAf+ML3z6pqB+9VRx2uVE2vDguPss14L7VVj8Szqp0T4Dmx4QF9s0u6QKqxP
9UUQHAEdO1N6Vh2SSdBGvOPPrChYaAWW3eA/t7ODFbynEkJ1+bq/UPQrVfOln8hs
8hEnsS1N3XHn4CRSfVBGsw4+FxsIG3t+sSXSHEqI8uk9aBJ2GUgWZepEJheNFK4a
NF6bAJnK896B73olJr0deNlCfhsvSiUqaAE5fxsLuWY7Ur1LNBG8JV5WvHGNEJkR
dknDfQL0Y4nWWlffbKz6VReB6dFvFGETgGfIDepjsxvznoXqAMdNYtwixpu5dVuO
hh/q4B5v95rS4/BjakpMCs+Jmw3Psw==
=c0js
-----END PGP SIGNATURE-----

--u7Z7lZkjhnzZyt/z--


--===============8054613337543751112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8054613337543751112==--

