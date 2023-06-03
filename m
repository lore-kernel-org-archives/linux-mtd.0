Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD5BAC7EE24
	for <linux-mtd@archiver.kernel.org>; Sat,  3 Jun 2023 10:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5jeLIz9Z6lBX+KixEqA9ntch2Cry5ywSpoSomBzE68=; b=UasVLKlX6umT7ffSVBQjlWDBxm
	W9XVv+sZKI5O7eJD6KFjgB0Gwcp3yCrETpFlbBeOzDm2WadtcFYlL1k5wvVZaViQ+O75S9V7O7HyQ
	0rzyeiJXtHwy167RZBUFlgQb9ufyXsOKx+Le3YNgLN/PduGzkvKxntDkHx+1El6n0RHO/+1DoYONq
	U4ffpkFQ/N3JAyOyWdNvJ2qqVCfOfU4tTGqIxaxFppO6Dc/UrRvL8OP+UMmPF3MTD3manF36dI2pv
	tyGLr/Jj0UUIg+FCbecTKxWMn9LBU8VXnsecYcGSTLTfLchitfkSajcgtSMadlmq6vRLz73zf1yJN
	Eem5IjMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ODi-009FVS-2A;
	Sat, 03 Jun 2023 10:10:50 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5ODd-009FUL-0q
	for linux-mtd@lists.infradead.org;
	Sat, 03 Jun 2023 10:10:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0582661277;
	Sat,  3 Jun 2023 10:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053BBC433D2;
	Sat,  3 Jun 2023 10:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685787033;
	bh=iithJnx/7MSraXSjIugO6eQUP4lR2W2gUPWdCMZjZCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mnO+RvTrP3rBinV0b2EiLlFhWQaLC9b6hI+X8wzUdMdPTSnXjP0WWrLZvq6jXWj9u
	 D/tmvtLrYOZRxR9B7BJqwW06fR5RUr1gNVCcLUs64bW3nwPs8aVy0lUKuatAOPYwWb
	 5K3mXWZ72on5K2Yv/3tLSywgnuxiUsrVn57n3/pxourTDJ0R9VqB51viU5iQQB1z6B
	 gLAn4r7nPP672cTsjyAFdGBwTc6u3l/BLU5BxRZeBO6ukHBoK0yIwo9Q++OqIdSZtF
	 VCBWbyzC9Eu58aMdQ6ykgYvo73/C9tycamuIkX6jLdMDKHAbIezRvfFmYzmSN0Ko7K
	 2jyw9VHIBa9ng==
Date: Sat, 3 Jun 2023 11:10:28 +0100
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pratyush Yadav <ptyadav@amazon.de>, Dhruva Gole <d-gole@ti.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] dt-bindings: mtd: partitions: Include TP-Link
 SafeLoader in allowed list
Message-ID: <20230603-flyover-amperage-83a3d3bc7d85@spud>
References: <20230602215629.2568-1-zajec5@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230602215629.2568-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_031045_356778_9EC205F7 
X-CRM114-Status: GOOD (  14.34  )
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
Content-Type: multipart/mixed; boundary="===============8735867714636775881=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8735867714636775881==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LVKWzCCf69Kpk2Ti"
Content-Disposition: inline


--LVKWzCCf69Kpk2Ti
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2023 at 11:56:29PM +0200, Rafa=C5=82 Mi=C5=82ecki wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> It's supposed to be there and it's needed for proper validation of DTS
> files.
>=20
> This fixes following errors for Northstar based TP-Link routers:

>         bcm47081-tplink-archer-c5-v2.dtb: flash@0: partitions:compatible:=
 'oneOf' conditional failed, one must be fixed:
>                 ['tplink,safeloader-partitions'] is too short
>                 'fixed-partitions' was expected
>                 'sercomm,sc-partitions' was expected
>         'arm,arm-firmware-suite' was expected
>         'brcm,bcm4908-partitions' was expected
>         'brcm,bcm947xx-cfe-partitions' was expected
>         'linksys,ns-partitions' was expected
>         'qcom,smem-part' was expected
>         'redboot-fis' was expected

Something like this would have been sufficient, dumping the whole error
into the commit message bloats it for no real gain, but I was asking for
you to say what the issue was, not asking for a resubmission (yet anyway).

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--LVKWzCCf69Kpk2Ti
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHsRlAAKCRB4tDGHoIJi
0vhLAP0XvUo/Qaukfkh0NYWY1wQa4gxDl47frZzEtnYBbBEEOwEA3tI6rIcMZOtV
acxwk9hpf+82Ajz+8QkOjqUsUmPpAg0=
=W5Ig
-----END PGP SIGNATURE-----

--LVKWzCCf69Kpk2Ti--


--===============8735867714636775881==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8735867714636775881==--

