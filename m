Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BB1C4708A
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Nov 2022 14:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=u0CAhbYssqOoqnxJpwy11yGGE81c1U/H1e9fEqBq7HY=; b=mmP
	4xJPE7ds2cWjyZ2Zd/vKUqrX63oco5Q/H8/IZlc2N3p2XKrPdLvM5tK2qIPuyawky60uERrotUP8/
	Z3JAWcunmktbnigd6PmCo4hb91GCv+05n1rj6gYPd+OwqjAHDVHEx/1K7WkBghkOSVz5JgVtNnvhg
	LSbuNNvDLLWzTOBGjEGxPRngWQMlxMQ1x9IdlQ6DOrOVD9KuDhaKVsUgq0HBj9WyviK/T7ja5NdML
	RN4vvMj9juIX980jay9CoOlLhsdxy5abRm0ys6TZIiaOpXr5WyGW15L+ZGr7Erl19evZ5wBEAIXn0
	aEhIPPku7ddsJH4yfkAY8zZcJPt1dhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01te-009PVB-I0; Tue, 29 Nov 2022 14:47:42 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01sl-009Oo0-95
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2022 14:46:51 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C7CA3240014;
	Tue, 29 Nov 2022 14:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669733202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=REo+AjSaADRhkyIjLXZGRa/mLUafG/ep2J68XHPnCms=;
	b=AyYTovvKW137+GZbK4Bj0zl8Ui4xL2TJqOsXkK7l7dBCB1VoW1bqJpC+3eWn0U8ekXH6G1
	lMHdtu6acK+4dr5FNZjx51rj2uzyQv4WIV94XwO0nO8Sy607QMH7Jhcp5iouEIAtGl23My
	A85Y6LRSp1mkasPY8Ak8DC6DYvS9y053EQPyR0an+6AjWrbdmx15V/SDO+hKO8vyAvuHlH
	OgU39ceON69vQtnhI72uupkKD0TBUcaVLjNdVxLJypJGezhKMS6VufxjzsUZF93pCAXQBO
	apryCkZWidxWLppx5aQ6Oe972cxdakoC6ewjH5uqO82+vnqohBIYUAXmvv0rrQ==
Date: Tue, 29 Nov 2022 15:46:31 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <pratyush@kernel.org>
Subject: [GIT PULL] mtd: nand: Changes for 6.2
Message-ID: <20221129154631.1e1a09bf@xps-13>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_064647_796762_02C9718D 
X-CRM114-Status: GOOD (  10.89  )
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
Content-Type: multipart/mixed; boundary="===============1638666441660456220=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1638666441660456220==
Content-Type: multipart/signed; boundary="Sig_/pQA8w8TNQjYwDQrZ9SCLVW.";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/pQA8w8TNQjYwDQrZ9SCLVW.
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git tags/nand/for=
-6.2

for you to fetch changes up to 6408cc05a50aaf88074a5a31d065e5af87a456f5:

  mtd: rawnand: Drop obsolete dependencies on COMPILE_TEST (2022-11-25 10:0=
5:33 +0100)

Please mind the conflict which will need to be managed in the merge
commit, as raised by Stephen:
https://lore.kernel.org/linux-next/20221118114546.3ac3521e@canb.auug.org.au/

Thanks,
Miqu=C3=A8l

----------------------------------------------------------------
Raw NAND core changes:
* Drop obsolete dependencies on COMPILE_TEST
* MAINTAINERS: rectify entry for MESON NAND controller bindings
* Drop EXPORT_SYMBOL_GPL for nanddev_erase()

Raw NAND driver changes:
* marvell: Enable NFC/DEVBUS arbiter
* gpmi: Use pm_runtime_resume_and_get instead of pm_runtime_get_sync
* mpc5121: Replace NO_IRQ by 0
* lpc32xx_{slc,mlc}:
  - Switch to using pm_ptr()
  - Switch to using gpiod API
* lpc32xx_mlc: Switch to using pm_ptr()
* cadence: Support 64-bit slave dma interface
* rockchip: Describe rk3128-nfc in the bindings
* brcmnand: Update interrupts description in the bindings

SPI-NAND driver changes:
* winbond:
  - Add Winbond W25N02KV flash support
  - Fix flash identification

----------------------------------------------------------------
Christophe Leroy (1):
      mtd: rawnand: mpc5121: Replace NO_IRQ by 0

Dario Binacchi (1):
      mtd: nand: drop EXPORT_SYMBOL_GPL for nanddev_erase()

Dmitry Torokhov (2):
      mtd: rawnand: lpc32xx_mlc: switch to using gpiod API
      mtd: rawnand: lpc32xx_slc: switch to using gpiod API

Geert Uytterhoeven (2):
      mtd: rawnand: lpc32xx_mlc: Switch to using pm_ptr()
      mtd: rawnand: lpc32xx_slc: Switch to using pm_ptr()

Hamish Martin (1):
      mtd: rawnand: marvell: Enable NFC/DEVBUS arbiter

Jean Delvare (1):
      mtd: rawnand: Drop obsolete dependencies on COMPILE_TEST

Johan Jonker (1):
      dt-bindings: mtd: rockchip: add rockchip,rk3128-nfc

Lukas Bulwahn (1):
      MAINTAINERS: rectify entry for MESON NAND controller bindings

Mikhail Kshevetskiy (2):
      mtd: spinand: winbond: fix flash identification
      mtd: spinand: winbond: add Winbond W25N02KV flash support

Rafa=C5=82 Mi=C5=82ecki (1):
      dt-bindings: mtd: brcm,brcmnand: update interrupts description

Valentin Korenblit (1):
      mtd: rawnand: cadence: support 64-bit slave dma interface

Zhang Qilong (1):
      mtd: rawnand: gpmi: using pm_runtime_resume_and_get instead of pm_run=
time_get_sync

 Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml        | 16 ++++--
 .../devicetree/bindings/mtd/rockchip,nand-controller.yaml       |  4 +-
 MAINTAINERS                                                     |  2 +-
 drivers/mtd/nand/core.c                                         |  3 +-
 drivers/mtd/nand/raw/Kconfig                                    |  6 +--
 drivers/mtd/nand/raw/cadence-nand-controller.c                  | 70 +++++=
+++++++++++++++-----
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c                      | 12 ++---
 drivers/mtd/nand/raw/lpc32xx_mlc.c                              | 46 +++++=
+++---------
 drivers/mtd/nand/raw/lpc32xx_slc.c                              | 43 +++++=
++---------
 drivers/mtd/nand/raw/marvell_nand.c                             |  4 +-
 drivers/mtd/nand/raw/mpc5121_nfc.c                              |  2 +-
 drivers/mtd/nand/spi/winbond.c                                  | 79 +++++=
+++++++++++++++++++++++-
 include/linux/mtd/nand.h                                        |  1 -
 13 files changed, 203 insertions(+), 85 deletions(-)


--Sig_/pQA8w8TNQjYwDQrZ9SCLVW.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEE9HuaYnbmDhq/XIDIJWrqGEe9VoQFAmOGG0cACgkQJWrqGEe9
VoTNJQf+ItsHYwLhxc7mqJAiRlOZ9QaCMFHLyxZde1D6gp+dYqWvMkKuk1gztWIy
/98NejeNfd8yjki7x8HjYIfwjeQeD/bDqn4wwoJ3vRdOZI5CUYFXw9JOZq2GBINW
Oe3+Nq3L4ALDIH4akFsr+/q5oeAAL6ViyCDFfLVM0aLAvR87B8P8fJhmMi9tirHY
3xiFvlmpaWaa2Z0KA+AD4E/eq0oC8rMdy+AawSLKaWqQfdTMlcmiAHUBBvQ4pXKu
isbLCrgO7wF55QHj5FFeWr6gV87BkI10otIKB1WeDLAM0i1RU4lYeFMy+lQRCs1T
RzNlQJDVA66AYPJAaUoEZoVnA0uSiQ==
=RQwL
-----END PGP SIGNATURE-----

--Sig_/pQA8w8TNQjYwDQrZ9SCLVW.--


--===============1638666441660456220==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1638666441660456220==--

