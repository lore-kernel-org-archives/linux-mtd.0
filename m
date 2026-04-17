Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 422ADF8E4AB
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Apr 2026 06:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MMg/6zFDFPtjzMgDiCFynMrOoJO3um9BpbFZRQQCF64=; b=acy1iSMcY3DqxqcH3SUBepxZ+M
	tnaoH2ZdmaX45lgnXSFy8eB/f7+9Y0vfv9ufkAHt6/3LXmyIN/UtAzkR44Y7PYIDu6RDiGmbiI7eQ
	bmTi+OtZ+9CcGz/loY8FOWuL1fIGFTRFvwMrRSOpryZXi57UfdsvfHTEIyG9kQOsQIjOrbCpP5HSt
	XJ3UrZynRfLbCeIxrvBW4psrOLsMM833G2YCz5fkFplnWWGuAw8pjXl3skUFjX0k+eU0tQdhVcWEf
	ZVjg6z6Qqr9XEEe+f9GX1HjcHpo7D4JudBJ5kYTQl/SMc55u/PUezS6cpd+7E0ttggmmTOYqprftU
	9VmM8ZiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcid-00000003XPh-3ZRe;
	Fri, 17 Apr 2026 06:30:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDcic-00000003XPa-3QPN
	for linux-mtd@lists.infradead.org;
	Fri, 17 Apr 2026 06:30:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 157CD60154;
	Fri, 17 Apr 2026 06:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 692D4C19425;
	Fri, 17 Apr 2026 06:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776407421;
	bh=+0r7NNeXpL0hP5tngJWKGDD9GakIi6WoL5OQJU3+pQE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=eYvx861k4eeQ5tysArQRys7Hl8AKf03LwOYMqCCTMxcFFFEFhdBiPsDkV+50vAwU3
	 0LhXsYw3jEY/DGeb/QdPoTQHsO+t5m1M2Enfmgm8xKv4imRPzcZQbGo9yCdaMIn93F
	 kr317CucmleTjPytAO0dSUy6LbxSi0mnWCLEPoPzl3Kc1wvls4gy/Kdo+gqaPmiM/b
	 RxIltqvGD1TOrFbpzwN9AA1cEsyQmBHAcOszHAat2fv3BDIi5hn6UAhYfEaTkVozWS
	 6xWmNgFU+rJLDLKqhtZ3nh63UlMuuxW2XcDVm99NVgGaxSQzS5d6j7hsd6dF2S+D+I
	 OV2fXJ5wqDEiA==
Mime-Version: 1.0
Date: Fri, 17 Apr 2026 08:30:14 +0200
Message-Id: <DHV7VGCNH2XQ.BL6IUSRH2GD6@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: remove unused NO_OP_CHIP_ERASE flag
Cc: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>
From: "Michael Walle" <mwalle@kernel.org>
To: <Takahiro.Kuwano@infineon.com>, <tkuw584924@gmail.com>,
 <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.20.0
References: <20260416090320.21699-1-Takahiro.Kuwano@infineon.com>
 <DHUIOTOESC19.117TN18W5AV86@kernel.org>
 <97a94aa30860409fabe0ce97dbc92cd8@infineon.com>
In-Reply-To: <97a94aa30860409fabe0ce97dbc92cd8@infineon.com>
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
Content-Type: multipart/mixed; boundary="===============0705539829401722405=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============0705539829401722405==
Content-Type: multipart/signed;
 boundary=ba2b57a0e81daddc259032026e11a63aef4c30ad94817bbe211235dce843;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--ba2b57a0e81daddc259032026e11a63aef4c30ad94817bbe211235dce843
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Apr 17, 2026 at 2:27 AM CEST, Takahiro.Kuwano wrote:
>> Hi,
>>=20
>> On Thu Apr 16, 2026 at 11:03 AM CEST, tkuw584924 wrote:
>> > --- a/drivers/mtd/spi-nor/core.h
>> > +++ b/drivers/mtd/spi-nor/core.h
>> > @@ -124,23 +124,22 @@
>> >  /* Keep these in sync with the list in debugfs.c */
>> >  enum spi_nor_option_flags {
>> >  	SNOR_F_HAS_SR_TB	=3D BIT(0),
>> > -	SNOR_F_NO_OP_CHIP_ERASE	=3D BIT(1),
>>=20
>> Can we just drop this line and leave the rest as is? It's already
>> hard to follow any development in spi-nor due to code churn. I don't
>> think one hole in the flags hurts. The next new flag can then just
>> reuse it.
>>=20
>> -michael
>>=20
> Sounds fine to me. With a placeholder like this?
> /* NEW FLAG HERE : BIT(1) */

You could add a comment above the enum. Something like. "This could
contain holes, if adding a new flag use the first free spot."=20

-michael

--ba2b57a0e81daddc259032026e11a63aef4c30ad94817bbe211235dce843
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaeHTdxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hWvgGAvisuAQNubQ1+9i0EPIeT2TUr4oLogZdv
vT1MKDe9uQmLEn0F0Q0QDmc+MV+D6sOUAYDRH/fRQ/IujWgVnQMhS58qjPIOioZb
dmLmJh+zy35Y1oCVXE+CvHuS38NyN3jUs88=
=coZB
-----END PGP SIGNATURE-----

--ba2b57a0e81daddc259032026e11a63aef4c30ad94817bbe211235dce843--


--===============0705539829401722405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0705539829401722405==--

