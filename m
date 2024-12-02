Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26DAD78339
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Dec 2024 16:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOTV7Hn1RlG8mXPmGdqUTcymuaM5aq2JE0cnVRLvB1A=; b=GXQcG+UOiynmEDqzfhgHaMLnKq
	9N+/Rtb7tYz1gxUKTMqGufeWDdJTefJ9jC2TqWlV0AkdWGZ66IdASkq13rIIYRw1v94nr1wq/NdjP
	H8pGtOpkk0/eOc6N0Da8KAvsRPWikR+exby0q0a0qvGlGZ84XnYrjpwKY8qQOTHhq+ClK5PJa3+R1
	q5HeMPpSwVxgupG80/4F08Eo91rGYfyEJhxC9OcV33v9/YRkPCeb05Phd/2Y6BtFXhdHZ/GlWqxqR
	LfN1iAsAB9Ev7iadUtc1FUKKDTcj/ODaupSVPZXKLO1Bpy1edH6ZD3AEtw4DUlottyo7B+tgYfywe
	55KbFWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9ga-00000006vwM-3cfj;
	Mon, 02 Dec 2024 16:54:12 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI9fq-00000006vpm-0u6N
	for linux-mtd@lists.infradead.org;
	Mon, 02 Dec 2024 16:53:27 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tI9fk-00087b-1U; Mon, 02 Dec 2024 17:53:20 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tI9fi-001KRE-1C;
	Mon, 02 Dec 2024 17:53:19 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id BECBD383973;
	Mon, 02 Dec 2024 16:53:18 +0000 (UTC)
Date: Mon, 2 Dec 2024 17:53:18 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Schocher <hs@denx.de>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, kernel@pengutronix.de, 
	David Jander <david@protonic.nl>
Subject: Re: [PATCH 2/3] dt-bindings: mtd: mchp48l640 add mb85rs128ty
 compatible
Message-ID: <20241202-stereotyped-otter-of-agility-44b71b-mkl@pengutronix.de>
References: <20241202-mb85rs128ty-v1-0-a660b6490dc8@pengutronix.de>
 <20241202-mb85rs128ty-v1-2-a660b6490dc8@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20241202-mb85rs128ty-v1-2-a660b6490dc8@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_085326_251884_35491679 
X-CRM114-Status: GOOD (  16.06  )
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
Content-Type: multipart/mixed; boundary="===============7603163523826600819=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7603163523826600819==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s577esmvwab2woq7"
Content-Disposition: inline


--s577esmvwab2woq7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] dt-bindings: mtd: mchp48l640 add mb85rs128ty
 compatible
MIME-Version: 1.0

On 02.12.2024 17:35:21, Jonas Rebmann wrote:
> Add a compatible string to support Fujitsu MB85RS128TY.
>=20
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.y=
aml b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
> index 0ff32bd00bf6aee279fa78c624d8d47c6162f7f1..973f06b665dbbcb9ea1090418=
eb18fbe2285acef 100644
> --- a/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
> +++ b/Documentation/devicetree/bindings/mtd/microchip,mchp48l640.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      items:
       ^^^^^
I think you need to change to "oneOf"

>        - const: microchip,48l640
> +      - const: fujitsu,mb85rs128ty
> =20
>    reg:
>      maxItems: 1

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--s577esmvwab2woq7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdN5fsACgkQKDiiPnot
vG8UNAf/Q0okczdUcs5kfrn7qodwy1gJZ1E3wkuMmNmcw4x/WrjD4EfQqkFY2YvK
z9Xme7Hvl6o4Cwg6jyQj3RB6S4CsLwhAPCtJ0XWFbg6Tg9x6KExvGAT1gSqXQ9ax
Rud4h6YlzmevP5mISgYL3oZg2L1G0TuO4DPp+Qr78hvgN6oOxmCPE64xQa8/yQWj
HBRfgrYw5xlJ+TIbTKCx4gGS7tIDi8k2uie/GzuN8GG0YCrYfoTeVMmQJuRlNxhY
Nu4CnQTe36vAvvSvv8bWlboHa4VTI+1w+B5qIG4E9etiG4wPU1IVdI7xH/btNYn/
B+Me2jGYLRWkmSvHpwKT9ilEpwXhAw==
=jMo0
-----END PGP SIGNATURE-----

--s577esmvwab2woq7--


--===============7603163523826600819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7603163523826600819==--

