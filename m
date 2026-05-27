Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C07ECD4F54
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 09:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXzY3xHLLOUe1aCNfTNBUnROCs9JJ74+NNhprlwa1Uc=; b=qNySmEhtplYJaIiUTQkxHbPa0r
	6i4FGR+jDdl/8obKvScAd6KN/5oMlYuT67Wos7EMJGhiqRF8efTrufTesYf8nhDlDTNxqgCCgBcL1
	kzOWAEMByi1eu2qgVofj5TNDU52ACeTP3HImz7sRyu464FzBK5Oon9ORzCyPOptebxMGpsVhYeIAE
	3NUvFuzU6gsIRpUbkt8x0APiMnXs2vE9zAwuGcv4gg8xU8YLeME7kVgutRvGZNLzI57NhD4m5RoN+
	Ktb3L505q/Jlz00r3O05kX74X0qgaNxei/nsG0aZCFP6Py6CaQdpohcxN/Rm0Ns/EZuCS8IBmZP2z
	q0VRg/GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAnD-00000003fUr-13eX;
	Wed, 27 May 2026 09:43:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSAnC-00000003fUl-0Kbd
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 09:43:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 4F349600B0;
	Wed, 27 May 2026 09:43:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 7CE751F00A3A;
	Wed, 27 May 2026 09:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779874993;
	bh=ekt/wj5Y5HN75WIFRmDws2D5DKYgQaXANefptsbr7dg=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To;
	b=C1T5jKxoBpJseBivI0JMz59tVdkj7e2CcNTZSIIyTqrjt0Iw1pQGqB/U3Ei4d+YRl
	 +MOWFRISrt1j/HYyCzHRAxje/c4vg5MlMJdi+32nYXJWn3Ou+UdC2w7h7fPG2jrVvr
	 bQ48YEpxhHX5vPu5VfxRhoYWXRWWCcpW9salFz5q7S4o8DzI62zRw1OLB4Z2cQCk+P
	 VgSJJU1eL4F3FIkICMCg3hgYuWo9qinpIG3KGB7yeaXFanvsS2Z6aU0K1AS8+NoMAL
	 ssY2p0TRH9oLL0IySbsBgJ7G297NWewb9fv7kYrj1mXkLgnXPzz9UiV+xms1YGsnUB
	 f8yfsVwnAvOfQ==
Mime-Version: 1.0
Date: Wed, 27 May 2026 11:43:08 +0200
Message-Id: <DITD0XS2JNL0.VHZU6IASBYYT@kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <pratyush@kernel.org>, <takahiro.kuwano@infineon.com>,
 <tudor.ambarus@linaro.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Weimin Wu" <wuweimin@huaqin.corp-partner.google.com>
Subject: Re: [PATCH] [v4] mtd: spi-nor: gigadevice: Add support for
 GD25LQ256H
X-Mailer: aerc 0.20.0
References: <20260418084253.792395-1-wuweimin@huaqin.corp-partner.google.com> <20260527032823.771616-1-wuweimin@huaqin.corp-partner.google.com>
In-Reply-To: <20260527032823.771616-1-wuweimin@huaqin.corp-partner.google.com>
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
Content-Type: multipart/mixed; boundary="===============3941116653262125257=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============3941116653262125257==
Content-Type: multipart/signed;
 boundary=cbe80b64a11f6688a5dacb3ddffb19949a012505d463acd180da2832313a;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--cbe80b64a11f6688a5dacb3ddffb19949a012505d463acd180da2832313a
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed May 27, 2026 at 5:28 AM CEST, Weimin Wu wrote:
> Add support for the GigaDevice GD25LQ256H (JEDEC ID c8 60 19),
> a 256Mbit (32MB) SPI NOR flash chip which supports SFDP.
>
> Without this patch, The WP status cannot be obtained using flashrom:
> device:/ # flashrom --wp-status
> ...
> linux_mtd_wp_read_cfg:
> ioctl: Operation not supported on transport endpoint
> Failed to get WP status: failed to read the current WP configuration
>
> and with this patch:
> device:/ # flashrom --wp-status
> ...
> Protection range: start=3D0x00000000 length=3D0x00000000 (none)
> Protection mode: disabled
> SUCCESS
>
> Link: https://download.gigadevice.com/Datasheet/DS-01085-GD25LQ256H-Rev1.=
3.pdf
>
> Signed-off-by: Weimin Wu <wuweimin@huaqin.corp-partner.google.com>

For reference, this won't fly, as the ID is reused among different
flashes, in particular the GD25LQ255E and the GD25LQ256H, which has
different block protection schemes and one needs SPI_NOR_4BIT_BP
and one doesn't.

-michael

--cbe80b64a11f6688a5dacb3ddffb19949a012505d463acd180da2832313a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaha8rBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jtIQF+KbO6p0U9OnepYsXKX6q34Q6/TknsU2RO
txquhobWGyikxBNEmeIlraTRrIPADy4aAYD2GvFcPrN0tN5ivZIL+x3SyabU2hwF
IoHa2sj5ihvrbMJC8wx6K3qXOMyh9saJLmg=
=jFis
-----END PGP SIGNATURE-----

--cbe80b64a11f6688a5dacb3ddffb19949a012505d463acd180da2832313a--


--===============3941116653262125257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3941116653262125257==--

