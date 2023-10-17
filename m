Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77E2CDB474
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Oct 2023 13:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9x2qwygxicb4et+IL5w65V1xXmNHsOBJnXEQZ3uBME=; b=VA3+USA4AXosCLe3zClzDxP98g
	Ft9CTzOjS1DxSIoaD+q174ZhjuZsTsnmvifszC1QRXHEEl2ScjGdO1PC+Y0HlqJK0SwHMbJAJEnDE
	YjnlI4+KIfIznTMJFeW+Qyr4Rxvls4/YKKaQXSblaYpnxYlSTa66s/Nzkm2bfMWAMMas/9FiuXpq6
	FXa/PVXhpchixvWUliNzAwryLcRGYggCvkCQaf8u1UgHf6T9Yr6wP2/2yZXpnPTTF2KnvNfb6rnUm
	QaZFwZFuB6+wShTwTtJj2ZJ9WTD9/NdPkJr+czq0A9vZFP5EzEhtfSneMdbIgPnfFyRaq6thn0tMZ
	eka54zgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsk0X-00CPeb-2t;
	Tue, 17 Oct 2023 13:21:13 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsk0U-00CPa4-1i
	for linux-mtd@lists.infradead.org;
	Tue, 17 Oct 2023 13:21:13 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsk09-0004qF-0I; Tue, 17 Oct 2023 15:20:49 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsk06-002KaW-2x; Tue, 17 Oct 2023 15:20:46 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsk05-000I6d-Pc; Tue, 17 Oct 2023 15:20:45 +0200
Date: Tue, 17 Oct 2023 15:20:45 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kbuild@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
Message-ID: <20231017132045.afswdgcv4axjf6jj@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
 <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
 <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
 <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
 <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
 <4c27130c-e924-4f24-b833-794e0acac858@app.fastmail.com>
 <20231016102134.q6k2jb5ewu3flg6j@pengutronix.de>
 <CAK7LNARSxEZeKGoFAdGp1uhQVBrdGByDD4cJNMc_HCkmTiFF+g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK7LNARSxEZeKGoFAdGp1uhQVBrdGByDD4cJNMc_HCkmTiFF+g@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_062110_575255_B43519A2 
X-CRM114-Status: GOOD (  28.61  )
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
Content-Type: multipart/mixed; boundary="===============6745175146907001639=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6745175146907001639==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5a3zknif6psykw4d"
Content-Disposition: inline


--5a3zknif6psykw4d
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Oct 17, 2023 at 07:20:19PM +0900, Masahiro Yamada wrote:
> On Mon, Oct 16, 2023 at 7:21=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Mon, Oct 16, 2023 at 11:25:44AM +0200, Arnd Bergmann wrote:
> > > Based on a few days of randconfig build testing, the patch
> > > below addresses the remaining warnings I get for arm, arm64 and
> > > x86 on linux-next. This is a shorter list than the ones that
> > > I found in theory, possibly because some of the other ones
> > > are only used in built-in code, or because they are never used
> > > on these three architectures.
> > >
> > > Have you already sent patches for (some of) these?
> > >
> > >       Arnd
> > >
> > >  drivers/char/hw_random/mxc-rnga.c                                 | =
2 +-
> > >  drivers/gpu/drm/bridge/ti-tpd12s015.c                             | =
4 ++--
> > >  drivers/hwmon/smsc47m1.c                                          | =
2 +-
> > >  drivers/hwtracing/coresight/coresight-etm4x-core.c                | =
8 ++++----
> > >  drivers/media/i2c/et8ek8/et8ek8_driver.c                          | =
4 ++--
> > >  drivers/memory/emif.c                                             | =
2 +-
> > >  drivers/mmc/host/davinci_mmc.c                                    | =
2 +-
> > >  drivers/mtd/nand/raw/txx9ndfmc.c                                  | =
2 +-
> >
> > The txx9ndfmc driver was fixed as part of this series, but Miqu=C3=A8l =
didn't
> > take the patch, I guess because he wants it to be converted to
> > module_platform_driver().
>=20
>=20
> So, there are two ways for fixing, and it is
> up to subsystem maintainers?

Yes, either you use module_platform_driver_probe() and benefit from
=2Eprobe in __init and .remove in __exit. Or you use
module_platform_driver() and benefit from more flexible bind/unbind
support (probing devices that appear only after boot, hotplugging,
binding/unbinding via sysfs)

> A question is, is module_platform_driver_probe()
> still worth supporting?

If you ask me, module_platform_driver_probe is a thing from the past and
hardly relevant any more.

The effect of converting drivers/mtd/nand/raw/txx9ndfmc.c (on ARCH=3Darm
allmodconfig) is:

add/remove: 0/0 grow/shrink: 1/2 up/down: 12/-16 (-4)
Function                                     old     new   delta
txx9ndfmc_remove                             228     240     +12
txx9ndfmc_driver_init                         48      40      -8
init_module                                   48      40      -8
Total: Before=3D5496, After=3D5492, chg -0.07%

I didn't try to understand why the remove callback got bigger.

The section sizes were changed as follows:

	.text:			0xe94 -> 0xf84	( +0xf0)
	.ARM.exidx:		 0x58 ->  0x60  (  +0x8)
	.init.text:		0x444 -> 0x43c  (  -0x8)
	.exit.text		 0xfc ->  0x18  ( -0xe4)
	.ARM.exidx.exit.text:	0x10 ->    0x8  (  -0x8)

So we're talking about less than 250 bytes that cannot be discarded any
more with a builtin-driver after boot.

Still I'd expect some resistance if we deprecate it and work on removing
it.

OTOH:

$ git grep -l module_platform_driver_probe next/master | wc -l
74

with 19 in drivers/rtc (I added Alexandre to Cc:), 4 in drivers/mtd, 6
in drivers/usb and otherwise here and there a driver. That doesn't look
insurmountable.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5a3zknif6psykw4d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUuiiwACgkQj4D7WH0S
/k7m2wf/XqebaGzRxA3UoGglhWWDMaTNlgamMZcDDAarWCm/7tIyhBCYsKwo+1bX
RXa5dXvOasXlKFSCbDik17TewQ4CNE5tl/qdpW5uGsb+FXuSFBkFRLdMSVTjxpDr
p/zxnTQluCDFMoPrRyBowjpHhZupldeI7o43pNCWcuhTN84jfrEjLqjC6Rm11hv+
I4Z9/omcPbvZjJ8odOv9Y4WNI4yahshJ7kNFWVtQHD65ZWEkpT/R+YqKccviIsT/
IBLHNsrvxZA1xEgMEwdpZKLiwduM9wn1vxPatLIW/Y+KqqU/qJubcRG+MihUDOJW
Yt2xGRmVgg2SHpO/Gq680vvilkQ9QA==
=u+Fk
-----END PGP SIGNATURE-----

--5a3zknif6psykw4d--


--===============6745175146907001639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6745175146907001639==--

