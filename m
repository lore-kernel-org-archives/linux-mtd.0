Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3207C02193
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Feb 2025 19:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xi9U/mQdGK2EgRfNwvKA4DA6+6y1mM8G6N5bGALzIi8=; b=QkKofp0E+GglG1B6os+qkJHH1Z
	iAkVWVKvBiXlX+aTGNShPXjOgdX2zQCeO2GJYYKNMDD/twMro1KAnDpApzdjsXVlZCwkb0hzUnB8r
	HIiLqVkjNMdR6Ui08fc6eQ71d49BCf1n8K5ZY/7YBztLO41nW5Gl5u0X8Yd7iKPs6nrMksyMZYy1e
	yzH80Bif3zN7QnL2Wj5viCrWga9ignsWOd0W7730/wNziGgorLkGmkU0LWJVcIDrjlvTuenk5XYLU
	IfKZ2ZW/zwFUVa1xudVViMUjGc8scObtNQtGrVamgtrShSh8oItawaruMd3NyuUZxStXZ2XmNvDoF
	esxTMUtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOmk-00000001NvC-2bcp;
	Tue, 04 Feb 2025 19:40:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfOlh-00000001Nqi-0QmN
	for linux-mtd@lists.infradead.org;
	Tue, 04 Feb 2025 19:39:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 913805C6787;
	Tue,  4 Feb 2025 19:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D832C4CEDF;
	Tue,  4 Feb 2025 19:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738697972;
	bh=0Np7nYbz3nCicHvUP3D9GR6lV8vm/nvO3gDD/5+HKCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=boOQs8h2XWSoS4iAGBHxakWjY3BHKlRpj/SftZe4xXKWPqkax0yi4ElxGVONmjVbJ
	 uvvKwXqrVQFsfYggCvccH4hZJc1yRtytfzNRXGaoWlocaURVqAC//H+xt1cy4mj8G5
	 heEazKwosS6DsQz3xQruJcx3FI8Fxt0c6OWlcqWoMs/PR5/hB3dZfm4uP+NM47uyM7
	 gr87ghEwi1Co1rY4pgOaF8Cu9KZcdp+oE6Nz8lo28lXmrryWkiRbpI4RoJ14U9RkC2
	 R6e0LgBorReUoxevnGloDbogTxdvY2HSwa8a6HEXAzq8kymvJ5v4tJFDoyCvndgV7Q
	 tDbbNl2syQCsw==
Date: Tue, 4 Feb 2025 19:39:27 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Michal Simek <michal.simek@amd.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: mtd: arasan,nand-controller: Ensure all
 properties are defined
Message-ID: <20250204-remedial-expansion-56cca89037c1@spud>
References: <20250203213042.12657-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250203213042.12657-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_113933_181248_3BBC762B 
X-CRM114-Status: UNSURE (   7.93  )
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
Content-Type: multipart/mixed; boundary="===============0538826267847658973=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0538826267847658973==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XOwSPoDBnQePLHKv"
Content-Disposition: inline


--XOwSPoDBnQePLHKv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 03, 2025 at 03:30:41PM -0600, Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'unevaluatedProperties: true' allows. Fix this constraint.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--XOwSPoDBnQePLHKv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6Js7wAKCRB4tDGHoIJi
0ofNAQDFmCSDgJmpUf5xFTf8IyUT1tSKqy1zxhN9AYpQTbk9zwD8CB7gM85XGLbc
+0Ypwqd3Eu02o04XFEH+xuwsyWL/Dwc=
=Xye+
-----END PGP SIGNATURE-----

--XOwSPoDBnQePLHKv--


--===============0538826267847658973==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0538826267847658973==--

