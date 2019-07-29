Return-Path: <SRS0=s9Jc=V2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02721C76186
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 21:54:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBD07216C8
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jul 2019 21:54:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CI16/0Pl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBD07216C8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Il4qdWwCva4JNt2J0YrLLqlVg1pN1DRyYNEV/In/1O0=; b=CI16/0PljWRdgtRkm789kCILK
	T5GFHDTP8hPoM4bGGjg6HT2Ix3z/YGZYxOUPbYhw73JiJVMYwWFJE94wv2NTH6auEZ1+OsX0YlL7D
	5SK0B1fPwtYucIwgPQ+L1o67oU4aAgs3e+iQ3r996QHn3rjD/OiKLevJGJcBaQbdO9rquieMOB2vI
	WaHFU57uO5Os5z90sFClzzR+sekg4+qv6UCjooJ44zOLIW/w/L1LtV210S6+ZaoTT4UF5p1B9PiVE
	XUEO1zCJgpOIQ1Bc+Dufq6W0b9kmzzQJWyrLidQvkxk2rqVmQtlxo0vNkOgrBRa1NM0DZdopmpDRF
	u+3qFMStQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsDb4-0004re-Tf; Mon, 29 Jul 2019 21:54:23 +0000
Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsDb1-0004r1-I6
 for linux-mtd@lists.infradead.org; Mon, 29 Jul 2019 21:54:21 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 45yD3s0q3Cz1rJhT;
 Mon, 29 Jul 2019 23:54:17 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 45yD3r6tHrz1qqkK;
 Mon, 29 Jul 2019 23:54:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 5i7QSaa_qJAy; Mon, 29 Jul 2019 23:54:15 +0200 (CEST)
X-Auth-Info: 40vK9CVzkSMUDpFaAK9f+nSjTswLqT3qx2VwvSS+QHQ=
Received: from jawa (85-222-111-42.dynamic.chello.pl [85.222.111.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 29 Jul 2019 23:54:15 +0200 (CEST)
Date: Mon, 29 Jul 2019 23:54:09 +0200
From: Lukasz Majewski <lukma@denx.de>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [imx][vybrid][qspi] Regression notification - vybrid vf610
 QUADSPI - BK4 board
Message-ID: <20190729235409.222c8880@jawa>
In-Reply-To: <CAOMZO5C4UgetHAW6_JqLGZH96_8TyHSzj10DxFe+XMnZR07ASA@mail.gmail.com>
References: <20190725001114.0ceff19c@jawa>
 <CAOMZO5CsTPaRSe-VmOwnnYrsMMXa3GhurmsWwzaPo948xs10FA@mail.gmail.com>
 <20190729224326.44aa3057@jawa>
 <CAOMZO5C4UgetHAW6_JqLGZH96_8TyHSzj10DxFe+XMnZR07ASA@mail.gmail.com>
Organization: denx.de
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_145419_894444_6E10D5B5 
X-CRM114-Status: GOOD (  13.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-mtd@lists.infradead.org,
 NXP Linux Team <linux-imx@nxp.com>, Suresh Gupta <suresh.gupta@nxp.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: multipart/mixed; boundary="===============4562255988068053696=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4562255988068053696==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/MDVXulJPWIcMdxwYi2hg6.N"; protocol="application/pgp-signature"

--Sig_/MDVXulJPWIcMdxwYi2hg6.N
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Fabio,

> Hi Lukasz,
>=20
> On Mon, Jul 29, 2019 at 5:43 PM Lukasz Majewski <lukma@denx.de> wrote:
>=20
> > Thank you for your reply, Fabio. =20
>=20
> I assume you are using arch/arm/boot/dts/vf610-bk4.dts
>=20
> In this file I see that you only define the DATA0 and DATA1 pins for
> QSPI0_B:
>=20
> VF610_PAD_PTD11__QSPI0_B_DATA1 0x397f
> VF610_PAD_PTD12__QSPI0_B_DATA0 0x397f
>=20
> Don't you also need to define DATA2 and DATA3?
>=20

You got me  :-) [1]

The DATA2 and DATA3 (for QSPI0_B "lane") are used for other purposes -
this is how the PCB was designed.

At best it is possible to have both memories working with double SPI
configuration or single (QSPI0_A with quad SPI [2]).

(And hence it is why I've asked Andrey for sharing his DTS files).

> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


Note:

[1] -
https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/vf610-bk4.=
dts#L235

[2] -
https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/vf610-bk4.=
dts#L491



Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/MDVXulJPWIcMdxwYi2hg6.N
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAl0/awEACgkQAR8vZIA0
zr1vawf/dCZ2s8uAvQeKJ3Lwg29S8SpcyVmmQlwf3XSKgVFiLASoUWv/gkMckrPn
3VJOK28NrkokBwIxi9yCvI5fUITkPYbc/Y+00bqWGVkrPTbgqNEHnERAfO4FS3xj
tA4ZW/cR2o+mN8oMKsElEzmWBznFJv/+oIMr7NfgcxS7oNWtA286brWws0ce9u3S
hMa2aRlYFt+q6llx1mXn2OTOhmaJ9iQSWIKPU5DyFA7jeGATBcnva/KU4YBZHWOS
+ggU7+CsfyMV+7b1MQPb9WLiMPxX1UyxngNPiyAoRvV2a98iDvGh+W6cIGHrVNn/
Z/m6TuVCFosobEMFXIwb9Z1swmLbzQ==
=NZxW
-----END PGP SIGNATURE-----

--Sig_/MDVXulJPWIcMdxwYi2hg6.N--


--===============4562255988068053696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4562255988068053696==--

