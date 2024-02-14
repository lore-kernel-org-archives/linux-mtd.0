Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82461C48BED
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Feb 2024 18:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9oSChoSy5JPlZiLzU6qxke36ydbCeV7+isxxjvK2qCg=; b=UlDimkijWx/2jiJKDjuR4R5082
	bDoW4XugUD+Z8uucn8pz6xErQs3LPkZHZxNelzpFQ3ojz8OwvHQ3DwuQxj3pAUefD5Lf4jtALyJG/
	+S/cOlyBZGEwk1vu+FKsoJVhpfUqVYvCsmoNo33yADSZMULsC/z+q+HbnAkz6zdiScFBK0p3pJL6U
	kR9IOwoYbx2u20VViGUBVvZz0+coDaWmGxEnHqSAMpk804aybr1dkWQP6TEoa7ImrbNJ2GUDwXZME
	8msFuWKmG9A8KimFzpScFIVoQ/sGRl34s1rqqFCiyCnhy3bpC8hoXZ03RBdumxVSp9qz2K3TUmgrw
	AyR4LT+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raK2T-0000000Dwxm-2OvX;
	Wed, 14 Feb 2024 18:31:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raK2J-0000000Dwoy-05xd;
	Wed, 14 Feb 2024 18:31:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A90D5CE2382;
	Wed, 14 Feb 2024 18:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE62C43390;
	Wed, 14 Feb 2024 18:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707935467;
	bh=DqQ+n4sMmsCgeic4jR8u6aoCgKS/praQFMsaqy5xqsc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O3AHXwqSkO5POA0F9lBb4ChwP/ZSNILgVv96DwvQU+n4Vdq084zSQI/LKhzzz/3HE
	 qj7UkFxJxqMPgXNxwiY3O+IL1e7TxuXkVEtWjS4oeo3E3gL2yiqzfok+5jVUr3H+nT
	 V0QQPtPfDLjDdP0W0oyAPz45O2kftqMz6OQSiX4Aw3vxspviPc7OOo6GwN7DclWYqh
	 audeqpj4t38pplAZIyGSaGoWTgthXRngGCWOBsaGEBzT0SdS10fwSfaio0Upkinn7n
	 TsWx267Grb4nlbKbjw0jLxhGP+ofuhinSSmbxxf5gk9Sl3enCdypaoryVWRw08oiuC
	 p4LjRvMwCfr0g==
Date: Wed, 14 Feb 2024 18:31:01 +0000
From: Conor Dooley <conor@kernel.org>
To: ChiaWei Wang <chiawei_wang@aspeedtech.com>
Cc: Manojkiran Eda <manojkiran.eda@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"jk@codeconstruct.com.au" <jk@codeconstruct.com.au>,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
	"zev@bewilderbeest.net" <zev@bewilderbeest.net>
Subject: Re: =?utf-8?B?5Zue6KaG?= =?utf-8?Q?=3A?= [PATCH] Add eSPI device
 driver (flash channel)
Message-ID: <20240214-yoyo-platinum-dcd0e7e16a22@spud>
References: <20240213-espi_driver-v1-1-92741c812843@gmail.com>
 <KL1PR06MB665234A65DB334B3BDF6AFA6914E2@KL1PR06MB6652.apcprd06.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <KL1PR06MB665234A65DB334B3BDF6AFA6914E2@KL1PR06MB6652.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_103111_338550_FB146B6A 
X-CRM114-Status: GOOD (  11.30  )
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
Content-Type: multipart/mixed; boundary="===============0164257499656550866=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0164257499656550866==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DN7xbo+G2YJV9a8X"
Content-Disposition: inline


--DN7xbo+G2YJV9a8X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 11:34:31AM +0000, ChiaWei Wang wrote:
> We appreciate that you are willing to help on the open source contributio=
n.=20
> However, please co-work with Aspeed before submitting drivers of Aspeed H=
W.
> Otherwise, a misleading driver on the community are going to bring tons o=
f customer issues to Aspeed.

It may not apply in this particular case as Aspeed did write the
original driver and it is polite to work with previous authors
when respinning a patchset, but in general there is no need to work
with a hardware vendor before writing drivers for their hardware.

Blocking a driver because that company might receive more support
requests is not the kernel's problem.

Cheers,
Conor.


--DN7xbo+G2YJV9a8X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZc0G5QAKCRB4tDGHoIJi
0jh4AQDULTHpmdpjBuvc/RMvcJk7Fsv+M5FEZdXcxYYbDBlSKAEA7XX/zOdWdqxP
wKZsM8bYsV8j1gJqXlEScsdOOOgxJQU=
=GWXb
-----END PGP SIGNATURE-----

--DN7xbo+G2YJV9a8X--


--===============0164257499656550866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0164257499656550866==--

