Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FA2CC6B38
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 09:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Message-Id:Date:Mime-Version:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2Mi2ZKlxvetE+HYGdtTZm0SIclR8r05r8zHZ3j6JDw=; b=oMyhfybO75zhRHrwJFUBcY89eW
	RUFKCHFrS7zJj7j5lJBtFrbRhEr0j/sM3bCGw/B842TEBySWwdUxhKR1P+1xLWPo6ddjfU75LXZea
	zUhfD7mj57qP5hvF1a4BzSdjass2ebFWSJ8BcO3+oNofDVLLGVI+TZpbo0wA97cZuHyffFhxy8n/W
	e80XAkM9CryK6flBnjLIUB/sqTKRMxF5bNu22Vuk+KOEVcEEl00kKPAzwDj1jxJdcyIMLYxaVk0It
	D1DhpNHgN1gRhr2Tj3E+OBrTGA8/SiVg8+rC4LGF0LnW7c2ac68v+HNmQQF+d0YXb79M4vvEKj3ls
	Q/tWBHDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHW3-0000000HE99-1hIu;
	Thu, 15 Oct 2026 09:12:47 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHW0-0000000HE7y-1A1a;
	Thu, 15 Oct 2026 09:12:45 +0000
Received: from localhost (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AD3E148D;
	Thu, 15 Oct 2026 11:12:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1792055551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0Zj5znr2Nom4HHOQbTJi5RMAPGgKLlClPXVSJoArmYI=;
	b=h4mnp7OYGlPKxKPsqXtOpEz9t3l1xHMXynyVgwvBejzSs1PxHS4dV2PL3DhdFs/sQyatFZ
	pbKPj+jC+Q+bjYxpPbuK8uT/F2U9KA6Mxe/R5ZWlvVZe40PmaT04r+PA91UTvseqlpeaYa
	+OkG2bBVBzGB/nCZNFxDacrX7ZoPRuxuXiFZ13zA+aACh3ChUpxOi8jRX075PupfINHOBn
	bisuEkzn28Uzawb7qSk/yKNDN8lo4r50LF+yj642Q5DJToihOes11gvD5REA5iAtnvGRS0
	00K4T0R0S7Ie6PwrHimZd6OEkbAfbMcpXzFFvp3F3Ui/PzAv4AxoLMN2HmKJPg==
Mime-Version: 1.0
Date: Thu, 15 Oct 2026 11:12:28 +0200
Message-Id: <DM5AO9LBE1OI.19L3SG4BQTNB0@walle.cc>
Subject: Re: [PATCH v8 3/8] nvmem: core: take a reference on dev.of_node in
 nvmem_register()
From: "Michael Walle" <michael@walle.cc>
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>,
 <pratyush@kernel.org>, <mwalle@kernel.org>, <takahiro.kuwano@infineon.com>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <srini@kernel.org>, <nicolas.ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <linux@armlinux.org.uk>, <richardcochran@gmail.com>, <linusw@kernel.org>,
 <arnd@arndb.de>, <aaro.koskinen@iki.fi>, <gregkh@linuxfoundation.org>,
 <mathieu.dubois-briand@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>
X-Mailer: aerc 0.20.0
References: <cover.1790847519.git.manikandan.m@microchip.com>
 <2e21cc4b871da8764e3a12d0ebdcf7cb799149ab.1790847519.git.manikandan.m@microchip.com>
In-Reply-To: <2e21cc4b871da8764e3a12d0ebdcf7cb799149ab.1790847519.git.manikandan.m@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_021244_526181_D12D4993 
X-CRM114-Status: GOOD (  15.68  )
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
Content-Type: multipart/mixed; boundary="===============4076462586918988313=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4076462586918988313==
Content-Type: multipart/signed;
 boundary=1bcab1df772fb139f8336f2aa8b8f79a6917ec2951c5e78cac2480ad5a3f;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--1bcab1df772fb139f8336f2aa8b8f79a6917ec2951c5e78cac2480ad5a3f
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Oct 14, 2026 at 8:40 AM CEST, Manikandan Muralidharan wrote:
> nvmem_register() stores config->of_node (or config->dev->of_node)
> into nvmem->dev.of_node without taking its own reference. Callers
> that get the node via of_get_compatible_child() etc. and drop their
> reference right after registering leave nvmem->dev.of_node backed by
> no reference at all.
>
> Take an of_node_get() when assigning nvmem->dev.of_node and release
> it in nvmem_release(). Existing callers that hold their own get/put
> pair around the registration call need no changes, since get/put on
> a device_node is per-holder and independent of core now also holding
> one.
>
> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>

Nice!

Did you check if any callers are also taking a reference, which
might not be needed anymore now.

Reviewed-by: Michael Walle <mwalle@kernel.org>

-michael

> ---
>  drivers/nvmem/core.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 0556d140170a..98192597b935 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -541,6 +541,7 @@ static void nvmem_release(struct device *dev)
> =20
>  	ida_free(&nvmem_ida, nvmem->id);
>  	gpiod_put(nvmem->wp_gpio);
> +	of_node_put(nvmem->dev.of_node);
>  	kfree(nvmem->ops);
>  	kfree(nvmem);
>  }
> @@ -950,9 +951,9 @@ struct nvmem_device *nvmem_register(const struct nvme=
m_config *config)
>  	nvmem->keepout =3D config->keepout;
>  	nvmem->nkeepout =3D config->nkeepout;
>  	if (config->of_node)
> -		nvmem->dev.of_node =3D config->of_node;
> +		nvmem->dev.of_node =3D of_node_get(config->of_node);
>  	else
> -		nvmem->dev.of_node =3D config->dev->of_node;
> +		nvmem->dev.of_node =3D of_node_get(config->dev->of_node);
> =20
>  	switch (config->id) {
>  	case NVMEM_DEVID_NONE:


--1bcab1df772fb139f8336f2aa8b8f79a6917ec2951c5e78cac2480ad5a3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCatCY/BEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+GofAYD9mcyrw6Fsl+MSjbGeqfOmb4MGExC9nDTZ
ZOEr0wblbvSq2/743J69jXa4cWznv6UBgKoH3UHkbObCLUD2qJ/idZX/Ga9BD2Xc
Qa+nNJFPjUjx0YIViZ9j8C25yOcdXP47fw==
=lByw
-----END PGP SIGNATURE-----

--1bcab1df772fb139f8336f2aa8b8f79a6917ec2951c5e78cac2480ad5a3f--


--===============4076462586918988313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4076462586918988313==--

