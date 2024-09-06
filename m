Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA1CCE7B09
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 13:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBn9PiZHBz+uxp+ulevvg3lOxpi65Py938WQiSahyzM=; b=ilRgr37DyG43gN3k8xcA3J9qzV
	tVcnbtl0VjHWNLEW3nByv3Q/8hjnLN3vOA6MTgwWiVJIULNzkVoYQ1bmU3cy/yGmBHhZqi1PVtGWZ
	Ypn+8SlBwOkQGEsDD361qzxme+9O6lQKJ5nhTbxio7ODbV7bw2QTpaGASFLPx06K48wtT9tOz4pYO
	oeC/1GynzG8YTCTmuF++rGgbjsqrYJyw8hKl1xXENFAUMz/u8kcO00z0GExI3I8cUpwdrPWcKSOEs
	EaQpUlu+8LdepPja0NJBrQicRb3hkwGdnYGWIaF7gRX1yuGmI3ql6+XpndS5kdHeuHqNN9vEJMgSd
	A3vyzuaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smYeF-0000000CHjx-4AMB;
	Fri, 06 Sep 2024 13:05:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smYdJ-0000000CHbv-2zy8
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 13:04:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 55DD6A4413E;
	Fri,  6 Sep 2024 13:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5D2C4CEC4;
	Fri,  6 Sep 2024 13:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725627852;
	bh=9q4r7GeARBztYMgW8YPZfHeh6+/n4pzhNMC+IF/+JEo=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=sfnufMnQmwIyiJjXHA6C6TseABlGj7kNjp7UUdmJ+NtWoWnfgbujYLkaYEWBJdYiw
	 HnIz6C/EP4+od55NGgBXDryAzHVDRbgT8EjX1jSMSsqNsQ925atJwkt7cV/g11mEYg
	 Kw6Su5nH0HO3z96ixcovaW+0yottnPYjkjCUVQekoIrB0/oWb6oXgdEs3lj43dc7SV
	 eebV7QlVG5JPP+Q0KBx5JXVZNqKrrEDiWzVrgBmJVjQGTUPDR5Zxbv5K8FyVBQAdD5
	 OEAb0ZEKcV2TWQ/8LxO8Jkl2m716T+L4zIHlZahQy2g770wp/RukunEl3PhwdpE9sz
	 Pl4AXjODiU+kQ==
Date: Fri, 06 Sep 2024 15:04:08 +0200
Message-Id: <D3Z80PI18VZB.1ZLQ2TMR10UTG@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: spansion: Add support for S28HS256T
Cc: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <Bacem.Daassi@infineon.com>, "Takahiro Kuwano"
 <Takahiro.Kuwano@infineon.com>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Jon Hunter" <jonathanh@nvidia.com>, <tkuw584924@gmail.com>,
 <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20240830030841.24500-1-Takahiro.Kuwano@infineon.com>
 <D3T1W2VQFGNG.14DUML0OSKRH@kernel.org>
 <66c8ebb0-1324-4ad9-9926-8d4eb7e1e63a@nvidia.com>
In-Reply-To: <66c8ebb0-1324-4ad9-9926-8d4eb7e1e63a@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_060413_838391_EAA03CD9 
X-CRM114-Status: GOOD (  11.16  )
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
Content-Type: multipart/mixed; boundary="===============9210004799642170119=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============9210004799642170119==
Content-Type: multipart/signed;
 boundary=331a913f571b4788e835536ac7fa1552f0fc5985d86a5841d6abe4e3b870;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--331a913f571b4788e835536ac7fa1552f0fc5985d86a5841d6abe4e3b870
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Jon,

> Bisect is pointing to this commit and adding the 'name' field does fix
> it. So it would appear the SPI NOR code still wants the name field.

Thanks for the report, could you try the following patch.

-michael

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index d8e551fd2e2a..101ee5b0ddeb 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3281,7 +3281,8 @@ static const struct flash_info *spi_nor_match_name(st=
ruct spi_nor *nor,

 	for (i =3D 0; i < ARRAY_SIZE(manufacturers); i++) {
 		for (j =3D 0; j < manufacturers[i]->nparts; j++) {
-			if (!strcmp(name, manufacturers[i]->parts[j].name)) {
+			if (manufacturers[i]->parts[j].name &&
+			    !strcmp(name, manufacturers[i]->parts[j].name)) {
 				nor->manufacturer =3D manufacturers[i];
 				return &manufacturers[i]->parts[j];
 			}

--331a913f571b4788e835536ac7fa1552f0fc5985d86a5841d6abe4e3b870
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZtr9yBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jXkQGAqF7F8s01+pkiOdiqaN7nlQHqtu47ZSEa
sDN/9IOwqOTvqSI4hTtBu05bH2ddwpRAAYD68YTxF/O8b5CGnzL/DjHwsuK+XpHY
RQ/gMcD4gUNHzkicu89J6PoAm2m/FYWR7Jc=
=hPT9
-----END PGP SIGNATURE-----

--331a913f571b4788e835536ac7fa1552f0fc5985d86a5841d6abe4e3b870--


--===============9210004799642170119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9210004799642170119==--

