Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AD1EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jul 2023 18:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5QvQv5OynV0fCjrynlDxvxOUKiUSYN2F+ujs6CFGFoo=; b=COEuqXW2SmcWtYJc4NtJyTl+Dg
	PuupoBH4L/p3PBSfSr4GtK4IvbljhF27OfdkaWEHVG69t443ok5qJ6qahihc4VAQquaqdd5wFwH5T
	J82u+qE8/zKuJTlQSrse/jWQAdd+RA8n9d32gonrRVqYcoowThBeDK+iHx0lVbXw4XmP6wC4uNlSy
	8rlMpwuBO5wOIGLMPAuWkBXxqjh0yRmDPlEPpQiroiwuNIxRkWezde8biN6d7QM7bmXCyYVU3PXtg
	FKj0LAK3rgDWu2qsi8k5QSxIfc+lowoVrZ1hLrPINnELUOuMkExLJuEqNko2KiRnLesTRL+7W6kj9
	OAw95m8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeKs-000roC-1E;
	Wed, 12 Jul 2023 18:13:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeKq-000rnc-1c
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jul 2023 18:13:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBC47618B4;
	Wed, 12 Jul 2023 18:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA5DC433C7;
	Wed, 12 Jul 2023 18:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689185587;
	bh=ZucLRM+SG2KQmz14xWev1E70FP9NzsdW6kTgNIsDmhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qiR8nSHat+j4uOTJf17/0KZKwcyLRakuRIEiR189smYHBIcJJbZE8k1ihRfVvGiR8
	 /56CSxSunwZMx+db7a15WuJvd9oQdyC4f+prO/ms69yV8NTATC8uHEpCQwNu4Jr6Fq
	 YrOBrmtvrImYUvtRKsBup5SoZYD438a5j0nuqbs66SQmDBxDo0g17R5nkT0luyM9+P
	 qEvXH1Zy9N9MgOLr/prmZgJUqIiQS07RfuZJRdkazN0pFIoZUxlrIaY1PHHNC+zBc8
	 z2gOeD/VIJn5mAuvxH36424gExw4T3CPUmqljXaihrPok3o3HAW00FzhLdCciNOHv2
	 L5f8Sa3xkmNUA==
Date: Wed, 12 Jul 2023 19:13:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, richard@nod.at,
	vigneshr@ti.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	gregory.clement@bootlin.com, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mtd: Add AC5 specific binding
Message-ID: <20230712-headway-unlikable-436a4533d540@spud>
References: <20230703035044.2063303-1-chris.packham@alliedtelesis.co.nz>
 <20230703035044.2063303-2-chris.packham@alliedtelesis.co.nz>
 <20230712143220.06a3d6eb@xps-13>
MIME-Version: 1.0
In-Reply-To: <20230712143220.06a3d6eb@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_111308_576494_AC0B302B 
X-CRM114-Status: GOOD (  13.47  )
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
Content-Type: multipart/mixed; boundary="===============2849465896322249191=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2849465896322249191==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T+DewEGyjGC/f8R2"
Content-Disposition: inline


--T+DewEGyjGC/f8R2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 02:32:20PM +0200, Miquel Raynal wrote:
> Hi Chris,
>=20
> chris.packham@alliedtelesis.co.nz wrote on Mon,  3 Jul 2023 15:50:42
> +1200:
>=20
> > Add binding for AC5 SoC. This SoC only supports NAND SDR timings up to
> > mode 3 so a specific compatible value is needed.
> >=20
> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > Acked-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> I need DT-binding maintainer's ack to take this patch, but this commit
> did not receive feedback (positive of negative) from them and is no
> longer in their patchwork. Can you please resend the series?

You have one ;)

https://docs.kernel.org/process/maintainers.html?highlight=3Dconor+dooley#o=
pen-firmware-and-flattened-device-tree-bindings

--T+DewEGyjGC/f8R2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK7tLgAKCRB4tDGHoIJi
0hd0AP0RMbK0KMZS2UGNZaLDxhCWJH42WBPjqgWodDqNASY76wEAxKiJLDakIcvm
6S92pmECkSIqdlzJ1TEfOJYjkVFcAQI=
=eKhw
-----END PGP SIGNATURE-----

--T+DewEGyjGC/f8R2--


--===============2849465896322249191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2849465896322249191==--

