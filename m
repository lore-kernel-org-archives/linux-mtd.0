Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B8EC433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Jun 2022 12:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hsj0Yigxk7H1rE/71J24abyY+l+XGiQB14AijzkkqEc=; b=QZJaJlMf8pQxKcngJsGY/k6LTg
	eCK12SEML88ggzfHRYgYbn6ye8Iw3kyNhmy6R0d6nyc2c+eUrckc4XMvMeDOYCV0VjKN8HoqnR9dK
	ro9OjBKOarDkI56U6q2PsaN+5Fz+zDpPUlp487JwmZ/0OX4xgjsSzAr9ZT8qzcW0siTreqk7w5kWe
	0ShItSRrxoB0njhJvo+AC5SEGEzE9KF7oiOVkTjtX7FzupGFkpvwKpW123R2XuTQKI9rjVCIZynmk
	8v1DFb2etE4tNNWPm8ajSiC1/xd+FpPUY5YHwOxa1GSxItaKQl6ILgcpoxFrxRxlxfNAxuKLr5dmp
	k3DcIuyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzH1U-001chc-1g; Thu, 09 Jun 2022 12:12:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGkE-001VXm-R3; Thu, 09 Jun 2022 11:54:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9FF9DB82D30;
	Thu,  9 Jun 2022 11:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAE14C34114;
	Thu,  9 Jun 2022 11:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654775671;
	bh=W1JWHnccUeXeAdpiFbBoUz5WTQ95dDENGZmMGVO/HCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qxvUp7I06JbQcQ1Ts5s+jxq7RgLhlztPitqQElHUmbhCwAWbQXoEveAJnO+fb2JPn
	 KZCr7755OH2Sk8WSRFRBfvlItBmyYUM4as4j38U6BAtI/79y5dx9BXM9gtpPWITv6T
	 VT0nnQ0KpsL98b6uDPT/y3hwhcQBq9a8DUyOdNC18vzxOpfz8ozjE/YYAdzeaspgOM
	 XBLv4lEP5GnSCpAnkoxeCGTZkagXQLcbRs9PQeli3RCV4xHYAlnZ12ukx0fqK5Pwj/
	 1HOt52OjyRureUhAHb135ViPF6n1fOE9PzN6wABgWe70eBcQ71n00TcXxaYyCczjAk
	 oskBBB3AEwoEw==
Date: Thu, 9 Jun 2022 12:54:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, git@xilinx.com, michal.simek@xilinx.com,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, michael@walle.cc,
	linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH 1/2] spi: Add multiple CS support for a single SPI
 device
Message-ID: <YqHfccvhy7e5Bc6m@sirena.org.uk>
References: <20220606112607.20800-1-amit.kumar-mahapatra@xilinx.com>
 <20220606112607.20800-2-amit.kumar-mahapatra@xilinx.com>
MIME-Version: 1.0
In-Reply-To: <20220606112607.20800-2-amit.kumar-mahapatra@xilinx.com>
X-Cookie: Space is limited.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_045435_054294_994811B1 
X-CRM114-Status: GOOD (  19.99  )
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
Content-Type: multipart/mixed; boundary="===============0326771026804028538=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0326771026804028538==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jdtMuzYKequAryYb"
Content-Disposition: inline


--jdtMuzYKequAryYb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 06, 2022 at 04:56:06PM +0530, Amit Kumar Mahapatra wrote:

> ---
>  drivers/spi/spi-zynqmp-gqspi.c | 30 ++++++++++++++++++++++++++----
>  drivers/spi/spi.c              | 10 +++++++---
>  include/linux/spi/spi.h        | 10 +++++++++-
>  3 files changed, 42 insertions(+), 8 deletions(-)

Please split the core and driver support into separate patches, they are
separate things.

> --- a/drivers/spi/spi.c
> +++ b/drivers/spi/spi.c
> @@ -2082,6 +2082,8 @@ static int of_spi_parse_dt(struct spi_controller *c=
tlr, struct spi_device *spi,
>  {
>  	u32 value;
>  	int rc;
> +	u32 cs[SPI_CS_CNT_MAX];
> +	u8 idx;
> =20
>  	/* Mode (clock phase/polarity/etc.) */
>  	if (of_property_read_bool(nc, "spi-cpha"))

This is changing the DT binding but doesn't have any updates to the
binding document.  The binding code also doesn't validate that we don't
have too many chip selects.

> +	/* Bit mask of the chipselect(s) that the driver
> +	 * need to use form the chipselect array.
> +	 */
> +	u8			cs_index_mask : 2;

Why make this a bitfield? =20

I'm also not seeing anything here that checks that the driver supports
multiple chip selects - it seems like something that's going to cause
issues and we should probably have something to handle that situation.

--jdtMuzYKequAryYb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKh33AACgkQJNaLcl1U
h9CsYAf+K7KXAUBJmbfepS1Fpu01afQQATn4uiX25nly77oXZeedKRHFW8DxNljZ
YrOPvrEgZ1RifDvfB2rXf7nqI1vbnPYs7V5fDbXEmY+CHgkkuoQTVmEI68woVgmh
bLGBMoegY4LCy9p+WVKdQNQ+qVjLC+DZvfzdvhCnWfNtvPV0dwyAZfkrtzzwLNdn
r2gtsF0vRwXeWXXWf4SzYdEhwjgGjJDM8ZRI/BIx4Q5Qzi80xTQIhy6lpps/YmTk
BgCy9wXOjDysA5+pPv9JB+V4n75ReIyNCVcYTztEmdGEJZPVswnKgzjUC0Da1h9K
uH3JL+kR4RFtVVb5+a6522VKxKGNdg==
=xJNv
-----END PGP SIGNATURE-----

--jdtMuzYKequAryYb--


--===============0326771026804028538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0326771026804028538==--

