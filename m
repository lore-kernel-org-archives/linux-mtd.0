Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81289C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pcar3X/YixjGXwTDa+4OKriyRp3HvZ7dPpV7nbQrI1A=; b=ICQnEBMa3HGhUo3CkH4iZdm1Fn
	VKfr3nXz11BEsfo06Sqrvxt2KDiae/qVvzPQ0T/+fKj1uRmQqd9a+v2vrprmQbbggmE3lonfNIpri
	H6YpcslQgMhNjWitq3sySRhiOicGRIevoKDG1tkwCT/AUVcT3Lw0eQ3dzcHdplDcByOznW2nY2cwQ
	xDcWB1RGiec42NWWYD5LxQXON526J34O/UptYi/Gfeo0CyeRAPNJ4nPsUWa8IURTF8nIjzzUjBk4I
	AybaUPc+wVfxiAGNoXtkV5+wmOFbcZE/+7d5p4U65bcfAa54zWxy2J6GaaTVkZSOqznU9ynCzVQSK
	Om7zHs4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVo8-00HCHi-4G; Mon, 14 Nov 2022 09:31:12 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVo5-00HCGZ-CX
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:31:10 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ouVny-0006Sz-7y; Mon, 14 Nov 2022 10:31:02 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ouVnv-004D8f-IL; Mon, 14 Nov 2022 10:31:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ouVnv-00GVUS-P7; Mon, 14 Nov 2022 10:30:59 +0100
Date: Mon, 14 Nov 2022 10:30:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Hui Tang <tanghui20@huawei.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	weiyongjun1@huawei.com, yusongping@huawei.com
Subject: Re: [PATCH v2] mtd: lpddr2_nvm: Fix possible null-ptr-deref
Message-ID: <20221114093059.bbmefffkkcmygvye@pengutronix.de>
References: <20221114090240.244172-1-tanghui20@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20221114090240.244172-1-tanghui20@huawei.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_013109_438977_58A14E01 
X-CRM114-Status: GOOD (  11.25  )
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
Content-Type: multipart/mixed; boundary="===============2666012191412290496=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2666012191412290496==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="m7dizcf5p7ztwwln"
Content-Disposition: inline


--m7dizcf5p7ztwwln
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2022 at 05:02:40PM +0800, Hui Tang wrote:
> It will cause null-ptr-deref when resource_size(add_range) invoked,
> if platform_get_resource() returns NULL.
>=20
> Fixes: 96ba9dd65788 ("mtd: lpddr: add driver for LPDDR2-NVM PCM memories")
> Signed-off-by: Hui Tang <tanghui20@huawei.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--m7dizcf5p7ztwwln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNyCtAACgkQwfwUeK3K
7AnL0Qf9GGiXuVY0Pw3AI7AtmvG6E34XsI28qAbN4u+PGF57LIrJKUoFBP1tneJZ
uKFAlm1j1d6BBlXMXknz1K/kBw7ojoYA2N8Tv9A3ja6jQ8RmI8AkgM+NtssvG6K8
l1mJdpjhP/xWiVBSbH6lb9VZDDvVlH7cglE6HHuLIOX4TpXBUSMgEobSwJgHBNpE
EUh23sbP22orwrIW9LWmptVT3JJ/sOsR2qyaGS1skqOaU+jpshNNWw4fVuXfORte
KtySmHYpCDB3JxjQaNYHdhCaU0Wyjf/eR/HlAWfEimj560BP2gDrsDVIyh0cwGS1
MZ8AOvLzDMoAQ05Mf7Frp4JWJ9svKQ==
=MAEr
-----END PGP SIGNATURE-----

--m7dizcf5p7ztwwln--


--===============2666012191412290496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2666012191412290496==--

