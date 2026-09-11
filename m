Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9637DC88E50
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 12:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w3jF/41M9dwIIVAYJdf4/YxYU/dIcmqw41b2ROyhL9I=; b=ecQQhuMAL+z+HrQ1k/0yDWRCV1
	gAPeEr3gXytRoMiXgxFsdnxgmkdQJ9QLFl5yKOX/RPsk+Ah9KaIrTfztHbKY2QUPrmjZF3aU0GhoI
	aNrR9lie6TzOzx8mM//CeGgzd3WX0+wFLvXuVdA5Ar96IedlLQkV786Do1otCupG4y4uivVm+JrEY
	gPB4KJRv+S7oifES4xk9Nri00mFp7smpKRWm8yWkZ4OjSDEQMBgh5MViGFi4xHjYtBukiQaqQei9y
	kNlx8devhkW1A+02HznRlCkGldNQ7ReMA/UTRWXGVzpBU7TvPpmbEvUCznIagrFWvuryq9xvmRJ8V
	ll5MnwqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x501g-0000000GZnL-0gMs;
	Fri, 11 Sep 2026 12:06:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x501e-0000000GZn9-22WL
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 12:06:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id DEB1343F36;
	Fri, 11 Sep 2026 12:06:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 35B3A1F000FF;
	Fri, 11 Sep 2026 12:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789128397;
	bh=rQk8H8XNPNF9GDtCSo4fzrpYj34vcGV2wYZRP68vo0w=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=nXa2ZxrURe2DgvwTpfN+X/GKtfXRFe7Fu7Kk50+CERIlAW9M39fSFdcrvLN/6g5Vd
	 24jHMUJ33/29ECU6QBcIqGeXRR9Mpnvp9jzde7cv2A0RDW0QiwbMZJcUZ0nabhEY3y
	 uQOvcCGZeJM59CuWxxpumxV4JnZwp382riciCV0X1w/3sABUlCzEHNSOnHZSJT/uVt
	 LUu6UL277yV6evM+kf0g+znBCfdmwi67+W27rupNVwsjuzejH2GNlWAkiCnIBqtVNm
	 B1VnuewKaQodbheWwTmLuSonq9yKdyifAgQtqSsdIDyvotasKGqRN8CSC6fakkwxsD
	 MaSrhVTu+eSAg==
Mime-Version: 1.0
Date: Fri, 11 Sep 2026 14:06:33 +0200
Message-Id: <DLCH314FE40X.3R6WPHTKXK5AG@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Steam Lin"
 <STLin2@winbond.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Jon Hunter" <jonathanh@nvidia.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger"
 <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com> <79b104a2-a76d-415b-b98c-6833d8cd298f@nvidia.com>
In-Reply-To: <79b104a2-a76d-415b-b98c-6833d8cd298f@nvidia.com>
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
Content-Type: multipart/mixed; boundary="===============5540411242008567675=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5540411242008567675==
Content-Type: multipart/signed;
 boundary=52aecf1dfe91a47d5b608b4c4d5b3e6c6d85cb35ad279bc6e716a1a45d57;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--52aecf1dfe91a47d5b608b4c4d5b3e6c6d85cb35ad279bc6e716a1a45d57
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Sep 11, 2026 at 12:33 PM CEST, Jon Hunter wrote:
>
> On 11/09/2026 09:55, Miquel Raynal wrote:
>> Some flashes (eg. from Macronix) do set BFPT_DWORD15_QER_SR1_BIT6, which
>> means they do not have an SR2 to read from/write to. The new generic QE
>> helper was supposed to accommodate this situation but in the last versio=
n
>> that got merged, parts of that specific handling has been moved to a
>> more contained location, swp.c (which needed most of the extra code),
>> yet the Macronix case has been forgotten about in that generic QE
>> handling helper. Booting with such flashes will always fail probing.
>>=20
>> Fix the situation by making sure we do not attempt to read SR2 if the QE
>> bit is in SR1.
>>=20
>> Reported-by: Jon Hunter <jonathanh@nvidia.com>
>> Closes: https://lore.kernel.org/linux-mtd/178876719232.3543902.144516250=
37676421254.b4-ty@b4/T/#m5bc4ba6776436f2870ced0eb5789d229037ad840
>> Fixes: 63489002d397 ("mtd: spi-nor: Refactor Read Status/Write Status su=
pport")
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>> ---
>>   drivers/mtd/spi-nor/core.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index e2b6efafdd8d..ac909dfb9657 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -985,7 +985,10 @@ static int spi_nor_generic_quad_enable(struct spi_n=
or *nor)
>>   	if (!qe_mask[0] && !qe_mask[1])
>>   		return 0;
>>  =20
>> -	ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>> +	if (qe_mask[0])
>> +		ret =3D spi_nor_read_sr1(nor, sr);
>> +	else
>> +		ret =3D spi_nor_read_sr1_and_sr2(nor, sr);
>>   	if (ret)
>>   		return ret;
>
> I know that there is still some discussion going on about this
> patch, but FWIW this does fix the issue I was seeing.

Thanks, could you give the new version [1] a quick test and a
Tested-by tag?

-michael

[1] https://lore.kernel.org/r/20260911-perso-fix-spi-nor-qe-mxic-v2-1-70c32=
4e9f30e@bootlin.com/

--52aecf1dfe91a47d5b608b4c4d5b3e6c6d85cb35ad279bc6e716a1a45d57
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaqPuyRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/ge0gF/T98FSz+QIb/WQ95yaiw93I/691kqZ5KV
KswMGkEoxMY7zdQhXA5vDmLpWY4c4t8gAYCArU+ldBxMbP+gp5JuR+iZ+rf6KnCe
Lhg2SkRjC/Xm+CLHS82gLP6sGdhsqNfBuMA=
=b+wG
-----END PGP SIGNATURE-----

--52aecf1dfe91a47d5b608b4c4d5b3e6c6d85cb35ad279bc6e716a1a45d57--


--===============5540411242008567675==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5540411242008567675==--

