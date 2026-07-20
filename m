Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6769CC44521
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Jul 2026 06:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+X3VKpEnbOgCKCJyErawjBRzH5D/QsBQg35vjmqsbQ=; b=cikEaZWVRHga/YsKby9BPrksw5
	HW22BU6k8CKoqF9nE6AHT3cDp2+m8Nn0rQAa7EgOzrO9yEmN28FBG75tFy+lK6u9cyljTblldZmAI
	KwosR7fSNKZqhFcWkpVrqOaxEFwSFbd7kWNJBlPqmkjCEADvy6U/qtRrBZNCCIbzNA1m9coTsXTbG
	i2kXGl7UCruPzpfRqCgZjolwEeQFFzvdo1+gx1wv8CCW3SQDzq82GsGdms5y72mDmiLxPd3LRoQRA
	Re+g5CYUUJuGMwYd19GFBeQQy3+21AvkEvoCr45HDVcYIefS5OY9ygM8FE9u0zarct8NgKEzNK/iH
	ZshIeDAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhlD-000000060FR-2sxM;
	Mon, 20 Jul 2026 06:45:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlhlA-000000060FK-3D4m
	for linux-mtd@lists.infradead.org;
	Mon, 20 Jul 2026 06:45:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id E3A5460103;
	Mon, 20 Jul 2026 06:45:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 219AA1F000E9;
	Mon, 20 Jul 2026 06:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784529951;
	bh=SAzGnCGWW0mNWHmBg3IxL7whKu98vTww2ORa261VUpI=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=WOfSeeZVRTsQ3ecAQmddLWOHwO0aMPYVw2HiAPvJ1Z8ppSRZlN1L8wtBa+nbYggLq
	 ZcabqI5kFKVSCHJYj4Se/TCudxe7fJLh73ECyt3xMfdHScZ6BXJIdvGuzamgE5jKgs
	 WWJ6Bn4YtS25teYwkIpDvW3k8MF9nXD+J0Zxd9F7Y+jSSnOhSE9WZXDC9ZUymfOMR9
	 1RZTKDD8zUMRqZLK8zDTcI+1EG3f2qyi/Bf/os6VxYnlCz7wZOmb6JBh+KRYlbVvfE
	 lLcvEeekaRiiHBRO8l9P2gzqDeq0G6IgjQVFvkz0HUjVp+/5A0EFXOj5XRNbHxt0yb
	 /0zDk0La0FQ7A==
Mime-Version: 1.0
Date: Mon, 20 Jul 2026 08:45:47 +0200
Message-Id: <DK372KBK7E8X.383DA8L7J4JIX@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: xmc: Add XM25QH128C identification
Cc: <takahiro.kuwano@infineon.com>, <miquel.raynal@bootlin.com>,
 <richard@nod.at>, <vigneshr@ti.com>, <heiko@sntech.de>,
 <linux-mtd@lists.infradead.org>, "Fabio Estevam" <festevam@nabladev.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Fabio Estevam" <festevam@gmail.com>, <pratyush@kernel.org>
X-Mailer: aerc 0.20.0
References: <20260718213827.701787-1-festevam@gmail.com>
In-Reply-To: <20260718213827.701787-1-festevam@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4184236632576530219=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4184236632576530219==
Content-Type: multipart/signed;
 boundary=9db5a05a899c6ec9e1ec3d96d7dd9fcdb9652882a4686a94c19c3adad917;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--9db5a05a899c6ec9e1ec3d96d7dd9fcdb9652882a4686a94c19c3adad917
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sat Jul 18, 2026 at 11:38 PM CEST, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
>
> The XMC XM25QH128C is a 128-Mbit SPI NOR flash with JEDEC ID
> 20 40 18.
>
> Add its identification entry. The device provides valid SFDP data, so
> its parameters continue to be initialized entirely from SFDP.

So why do you need an entry? We don't add .names on new entries.

> The flash is populated on the Firefly ROC-RK3399-PC Plus board.
>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Tested on a Firefly ROC-RK3399-PC Plus using the
> "rockchip,rk3399-spi" controller at 30 MHz.
>
> root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/partnam=
e
> XM25QH128C
> root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/jedec_i=
d
> 204018
> root@rk3399-station-p1:~# cat /sys/bus/spi/devices/spi1.0/spi-nor/manufac=
turer
> xmc
> root@rk3399-station-p1:~# hexdump -Cv /sys/bus/spi/devices/spi1.0/spi-nor=
/sfdp
> 00000000  53 46 44 50 06 01 02 ff  00 06 01 10 30 00 00 ff  |SFDP........=
0...|
> 00000010  20 00 01 04 d0 00 00 ff  84 00 01 02 c0 00 00 ff  | ...........=
....|
> 00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |............=
....|
> 00000030  e5 20 f1 ff ff ff ff 07  44 eb 08 6b 08 3b 42 bb  |. ......D..k=
.;B.|
> 00000040  fe ff ff ff ff ff 00 ff  ff ff 40 eb 0c 20 0f 52  |..........@.=
. .R|
> 00000050  10 d8 00 ff 24 02 06 01  82 a7 03 cd cc a1 06 35  |....$.......=
...5|
> 00000060  7a 75 7a 75 f7 a9 d5 5c  19 f6 4d ff e9 10 c0 80  |zuzu...\..M.=
....|
> 00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |............=
....|
> 00000080  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |............=
....|
> 00000090  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |............=
....|
> 000000a0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |............=
....|
> 000000b0  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |............=
....|
> 000000c0  00 00 f0 ff ff ff ff ff  ff ff ff ff ff ff ff ff  |............=
....|
> 000000d0  00 36 00 23 9f f9 77 64  00 e8 ff ff ff ff ff ff  |.6.#..wd....=
....|
> 000000e0

Thanks!

> root@rk3399-station-p1:~# sha256sum /sys/bus/spi/devices/spi1.0/spi-nor/s=
fdp
> c027b82ebfdf18e455c6366a9d57602b36f2956d4307b770954544918102d9b3  /sys/bu=
s/spi/devices/spi1.0/spi-nor/sfdp

-michael

--9db5a05a899c6ec9e1ec3d96d7dd9fcdb9652882a4686a94c19c3adad917
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCal3EGxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hdQAGApdYr22ZI5I0z5tqaKx3MV0rJU/Bv+ZC1
TZ28BWlo+BESBW10HP+31L4jSv2alLZhAYC4z9QCtiTQ7KAy5uNubfq9GGrmBaMy
S8qxvTxGpzFzCalecD0vFyrQbtguUpHnsf0=
=qk8i
-----END PGP SIGNATURE-----

--9db5a05a899c6ec9e1ec3d96d7dd9fcdb9652882a4686a94c19c3adad917--


--===============4184236632576530219==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4184236632576530219==--

