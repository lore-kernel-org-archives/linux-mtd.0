Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3F2EB64D9
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Jun 2023 19:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nevpYC3W6/NAvacA5gtomPvHS3+kXOYI85Azj+OAcVw=; b=XmoQvdZdhxNbTspoViXZgWKqGl
	f41xqoGHeR9rV90dMmxAXrAJ6tbqDc7tUJHwM74U/Dcfxa+r88Zeub9hu2qzON0RTQcJS/WpUhIMq
	xSUT4AnSJZmjGFvIlNoIgdcTAZzLov8Vv9gQCmZgwelvUkqbdmiRcXaM8HviA7hoOuku72NSUNUDJ
	08JeVWtYjWPoKtsk1Xp4d7vQnBsV+3GZaMTqizPUSOdbm4vTRff8fGXIKfA1nHK6NmWj0xjSEAYFz
	Rs20axRe3MxFqQXHBsb+Sxg47m3F3jByPkIghEmpDhNmIvljVZzXmn+sdBqDTQab5cLSA2a5rIcXr
	B1ytZzxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9sP9-00FqrZ-11;
	Thu, 15 Jun 2023 19:13:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9sP6-00Fqql-14
	for linux-mtd@lists.infradead.org;
	Thu, 15 Jun 2023 19:13:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54B736200D;
	Thu, 15 Jun 2023 19:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97082C433C0;
	Thu, 15 Jun 2023 19:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686856386;
	bh=bPY0hq3FTUjUrTnaMbnQu9NxRr6DfEwHr0iFePqWsk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oJ8PW6eF8QHjmGWOvHtcXHk8RrraM4DJqoyxkXRQBGOqMPxjBSMrzsMiVmqnTvLC0
	 kaMSMQw5kqbrXaShP6qRk+5clbVB53UAJN/Mbcyv/pFFxJe8usimE/+WA/NOirnYIP
	 93Z04NYoL2c5HBcMKVngPS6dbHUSxEkQ926yJq3gNI/jDJCohW5Fi5jjde+MMH29N/
	 nVluf6QJbCnL3iA8LCKT4RS5Wk7bsGjkcuRlBZDZXKMs0EKUzGhQfR0gSnpgCqkEin
	 uPliW2HQAKNp6tq32cc9wzeSh6Y4BRK91S4mvjtTnuRxFnQJjn7XMCHW3qV/nLX1Cr
	 MpIIemRNouzaQ==
Date: Thu, 15 Jun 2023 20:13:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Cc: tudor.ambarus@linaro.org, pratyush@kernel.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, git@amd.com, michael@walle.cc,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, amitrkcian2002@gmail.com
Subject: Re: [PATCH 1/2] dt-bindings: mtd: jedec, spi-nor: Add DT property to
 avoid setting SRWD bit in status register
Message-ID: <20230615-bright-divided-2eb72872d7cc@spud>
References: <20230615111649.36344-1-amit.kumar-mahapatra@amd.com>
 <20230615111649.36344-2-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
In-Reply-To: <20230615111649.36344-2-amit.kumar-mahapatra@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_121308_470289_72EE5473 
X-CRM114-Status: GOOD (  25.05  )
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
Content-Type: multipart/mixed; boundary="===============5227210003253057153=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5227210003253057153==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XOs+VD/Ifi0NGstF"
Content-Disposition: inline


--XOs+VD/Ifi0NGstF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 15, 2023 at 04:46:48PM +0530, Amit Kumar Mahapatra wrote:
> If the WP signal of the flash device is not connected and the software se=
ts
> the status register write disable (SRWD) bit in the status register then
> thestatus register permanently becomes read-only. To avoid this added a n=
ew
> boolean DT property "broken-wp". If WP signal is not connected, then this
> property should be set in the DT to avoid setting the SRWD during status
> register write operation.
>=20
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
> ---
>  .../devicetree/bindings/mtd/jedec,spi-nor.yaml      | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/D=
ocumentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 89959e5c47ba..a509d34f14b2 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -70,6 +70,19 @@ properties:
>        be used on such systems, to denote the absence of a reliable reset
>        mechanism.
> =20
> +  broken-wp:
> +    type: boolean
> +    description:
> +      The SRWD bit in status register, combined with the WP signal provi=
des

Should the first use of SRWD be spelt out as you did in your commit
message?

> +      The SRWD bit in status register, combined with the WP signal provi=
des
                                                                     ^
nit: missing a comma here I think.

> +      hardware data protection for the device. When the SRWD bit is set =
to 1,
> +      and the WP signal is driven LOW, the status register nonvolatile b=
its
> +      become read-only and the WRITE STATUS REGISTER operation will not =
execute.
> +      The only way to exit this hardware-protected mode is to drive WP H=
IGH. But
> +      if the WP signal of the flash device is not connected then status =
register
> +      permanently becomes read-only as the SRWD bit cannot be reset. Thi=
s boolean
> +      flag can be used on such systems in which WP signal is not connect=
ed, to

nit: s/such//

Otherwise, seems reasonable to me & the detail in the description is
nice.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> +      avoid setting the SRWD bit while writing the status register.
> +
>    reset-gpios:
>      description:
>        A GPIO line connected to the RESET (active low) signal of the devi=
ce.
> --=20
> 2.17.1
>=20

--XOs+VD/Ifi0NGstF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZItivQAKCRB4tDGHoIJi
0n3lAQDYCPE7FzUWoRk/2NeBDx/xfJkho/o/GFZjMUnnb/0G/AEAqAmz6+IzA8ln
bZ1D4QinLJJeMfUue9pnCokWv3csTQM=
=O9sd
-----END PGP SIGNATURE-----

--XOs+VD/Ifi0NGstF--


--===============5227210003253057153==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5227210003253057153==--

