Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C143CF9C6F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Sep 2024 16:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4M4tdSCriBX3lI5JmOHXd2jGVrGFkDQ29CHqUIAdkI=; b=XORDpqVASCzRKmHmBFenT7JVJO
	NGUUj81FuFpxvW/Ia/VIgjuCBLjAMoILBaU5oHDrNR07L579BX2HPwoarhgq1PKCFnMmiiy+NmBYq
	lNauE48AKBmnRpGz8tEjbmuJ48c70a6d0US7whlEUjrwaNyFfbY1ECNT5a93j+wdH4X2jXuwC/aBr
	tX6ZMDVFhx3rlRdok0NkePpv9Lu9Cec2MG0gi+IwjVM/yJDJ5WSk1d/aeb47O597/hgqJRSMMHJsD
	bmZk7+hGyRb8Jft7aUNPyj16WgCgXgEVEYRXCTOfOwCpjzgU4HH3Ed6j6zJQaU+16oQ67FuJrfzUN
	ZN1iZHng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sslmW-000000000Zh-1p55;
	Mon, 23 Sep 2024 16:19:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sslmT-000000000Yz-2dBD
	for linux-mtd@lists.infradead.org;
	Mon, 23 Sep 2024 16:19:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 857895C58D7;
	Mon, 23 Sep 2024 16:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81F9AC4CEC4;
	Mon, 23 Sep 2024 16:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727108360;
	bh=L+HrpQOt/sp64V+/b1XLHvuUE4MhTMOvK2G33tvFkgQ=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=ibjpnFLqSxjsJEfMV8/u0ampncfU0/VrFCP41L/7DNMy2V0cRhN0TlZEcK1nK9MF2
	 ROM3BOT3dVht5+0VXDDELDl5Xq9Q6q+qv9UYbwNZLV9hk+A/lIp3Yp5jnhoy7HXR3y
	 9pvNor7I4t/1wPXJerCOFK4zBC6F0xUxgdrtlG0PUvK5D5734TdvwdLvKVSJXE2RKE
	 /m1CbkzWwugm8zmH+9wlBZ4upmvv59moz6WfwO/eHJQuwMHFYEAokArzrgaXHS3Eo2
	 wAimx41GvvI4SAPN3A/7UGhhteJst5BSQ6k8k5d3R7HbN6xAAu0rgYrFC6y/nS5lYI
	 v7WJZVg7Nnf9w==
Date: Mon, 23 Sep 2024 18:19:15 +0200
Message-Id: <D4DSTDA3HE2B.20ACE70SQAL7A@kernel.org>
Subject: Re: [PATCH v5 1/5] mtd: spi-nor: core: add manufacturer flags
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Erez Geva"
 <erezgeva@nwtime.org>, <linux-mtd@lists.infradead.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, <linux-kernel@vger.kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <devicetree@vger.kernel.org>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Esben Haabendal" <esben@geanix.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Erez" <erezgeva2@gmail.com>
X-Mailer: aerc 0.16.0
References: <20240920181231.20542-1-erezgeva@nwtime.org>
 <20240920181231.20542-2-erezgeva@nwtime.org>
 <4e0cf43c-4843-451c-ac6f-86775dbccb2b@linaro.org>
 <CANeKEMOmhAPM1j1_ihzcC2wL6jKsWXPCGfZs+euS8mRvtqgE5A@mail.gmail.com>
 <D4DLQGLJSKPB.3OOW4RU9Q3K5O@kernel.org>
 <CANeKEMPSoUu7GW5bL8nuyC5xCKG7Tt0=SvWTL_CcX5oebqN_YA@mail.gmail.com>
In-Reply-To: <CANeKEMPSoUu7GW5bL8nuyC5xCKG7Tt0=SvWTL_CcX5oebqN_YA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_091921_732801_17950A5E 
X-CRM114-Status: GOOD (  12.45  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2163395328598351939=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============2163395328598351939==
Content-Type: multipart/signed;
 boundary=4435393838c56d35a9520abeca3bdfccaaf3b3c8ee281df4639bc47aa985;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--4435393838c56d35a9520abeca3bdfccaaf3b3c8ee281df4639bc47aa985
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > > I would gladly remove the obsolete mx25l12805d.
> > Why? I don't see any need for that.
> Maybe because we do not want compatibility table?

I don't get this? Anyway, we do not remove support for older
flashes for no reason.

> No, reading the SFDP is great.
> Except for OTP parameters/configuration.
> As there is not way to find OTP parameters using JEDEC ID/SFDP
> So as I understand there are only 2 ways to set the OTP parameters:
> * Use a compatibility.
> * Use dynamic OTP configuration, through DT, sysfs,

* Use the in-kernel database to look up the parameters as it is done
  with any other flash device. If the id is reused, look for
  differences in the SFDP to figure out the correct flash device,
  then add some .fixups to manually add the OTP flags and
  parameters.

-michael

--4435393838c56d35a9520abeca3bdfccaaf3b3c8ee281df4639bc47aa985
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZvGVBBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gUEQF/VOQpFkq0WrVXag0EPbAEIxTgFyKdouQs
QrlWS9ikmx+/jabf2o19//lXIc66quhYAX9FYSiGNxXObzE3jBp5TU7NFXWyMxfV
Btc6eXuS1c4Pa2RxPYz0IyLkJVdBDcdhrnM=
=XAMQ
-----END PGP SIGNATURE-----

--4435393838c56d35a9520abeca3bdfccaaf3b3c8ee281df4639bc47aa985--


--===============2163395328598351939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2163395328598351939==--

