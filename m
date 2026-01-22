Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88778D6CFA3
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jan 2026 18:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RwNz/v+Oe8s+6qNXKintzA7kC0GHZxKXa4BOHUDyswk=; b=pqIElAxV4HMaR837MSfvH9us83
	HqVO34dkFuGOJswI6htVwbe4QzW0FsyMxwqXHWg8e3jbKD9ntk5J0JrSjrG9Rkg4KCZHkvLFV1cGh
	wC1YymMdEXLf8HLQMq1cTqCODwt8flmmBYrJPRKzOOqxDpgj/xH+6WqcC2HEuGm8KC2E79Ls75MQM
	3XjLwGywkAngA1we/ScK/H8MosbufA57+bJS2JDx9242OnMdkS9OL8nMk7vs1/y2JjFN0W7348FBz
	govhWa4KRnqszcyZSwRO5zsfr/iNUm2nA2LqufJEDsbuVaDW9zwLSKnzkbJcZ19QqGQSYmL9CdwWa
	Ea8MYkRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizcf-00000007eQE-3CKf;
	Thu, 22 Jan 2026 18:41:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vizcd-00000007eP8-0oUR
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jan 2026 18:41:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 94C5244408;
	Thu, 22 Jan 2026 18:41:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A22C116C6;
	Thu, 22 Jan 2026 18:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769107293;
	bh=fy9bVDkRFNM90P08kAqq9YB+nPDe+gAFEszJMJGA9qY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKWHi0NlLOZ2YcebAthzQtiU7tkZbTKIgE1+rsmuxvt8dKutYnhMr8FAigxc3A0kH
	 Xm53zKGgYzSQPfW8TccPHBnUr2PkETJzPZ8KHMzEYOIHy09+NGLcxWI5PGEN2gXiNE
	 d+IdvK4bxOuUjG4k5WSXAh4N9h9gaTrSTZtLNaddFpbcmmt1gel4MjMLPvDSX763Uo
	 0kGq+8YlVv15YRwYHRcEYLP2IG9Bm+02/US5drti6uW3ytnWd6e7JQL9YRsZL78KHt
	 tYFUB6KEzgkvhPibL55nMzC/Zd6BoXuxCK+BBPIH6vNllIeVzygMgmmKFVmOEPONDb
	 VI9ypX2sOwEjw==
Date: Thu, 22 Jan 2026 18:41:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Akhila YS <akhilayalmati@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: st,spear600-smi: convert to DT schema
Message-ID: <20260122-tidbit-simplify-000698476986@spud>
References: <20260122-spear-v1-1-fd44bc79695b@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260122-spear-v1-1-fd44bc79695b@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_104135_259498_3FD3B354 
X-CRM114-Status: UNSURE (   8.24  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6435037994464940964=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6435037994464940964==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NaIco8W6Nw8mDdn9"
Content-Disposition: inline


--NaIco8W6Nw8mDdn9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 04:23:04PM +0000, Akhila YS wrote:
> Convert STMicroelectronics SPEAr600 Serial Memory Interface (SMI)
> Controller binding to YAML format.
>=20
> Signed-off-by: Akhila YS <akhilayalmati@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--NaIco8W6Nw8mDdn9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXJvWQAKCRB4tDGHoIJi
0suAAQCTkaLmsTPQcyTO4pTuIklQEDHf71fEHmdcGdb5EMde5wD/W4fuNRYAIGOA
rnObI5gO0dPpd1Iv+p+n3y8g5xt7PgM=
=0Mnz
-----END PGP SIGNATURE-----

--NaIco8W6Nw8mDdn9--


--===============6435037994464940964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6435037994464940964==--

