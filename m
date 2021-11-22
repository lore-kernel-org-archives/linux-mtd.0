Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF7D8C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Nov 2021 23:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UtC5NOdjx9Dh4jtZ7h9zTKMo5ilfDmvyWRlHIxHYWAY=; b=SYW+PzMVz4/WIh8YiiCGkkBVPZ
	dltQp/D70gEgdIpcEcqB2CReysrKJgfmzpZaummEAf8ln4H9pRtjU3yaxj5qKZN5cD0x32tEpbr49
	CWouMJK/HtUjb/AfVXchEogVJ+YrJQME/1f/d661LvEOXPitsVpH9OKRDitQtyvJihL8TsVzVnz37
	9vCxd2P8VyDXTSzBwT5NxtlOmfLKxdL61MDujAvyO4DekcDv2ETulV4h/eyWuvKxEdsHGR+lrG07w
	KsOyxBdx1ascbL1JmZZsmxgLvPiE+KkI7bWI1NhrOl7vOtH49NywtuoZe/IOSbfCW0I/aekhji7ld
	DB+InqAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpISG-000KjJ-DJ; Mon, 22 Nov 2021 23:10:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpIJe-000Hkw-HV; Mon, 22 Nov 2021 23:01:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5DBA960FED;
 Mon, 22 Nov 2021 23:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637622097;
 bh=5HPGeejKcq0/skHJyiqCEkuW5nT9h90VXdWH7CYPbFE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nEdiJ23lulIvuZIRcBfsS+qhZQdy45DABTeQ/9eMEUl1h55xvksxls/uuZO4VBeI8
 VaCo7TKNLJwRLa3QYvdv6RNwEp2FVuh3jDzzlTQaQEP63m8H/MG3PA9JAEloDYolQp
 c9/rmjY39HvZyawWUPIV3NjC+iYFEvh7eF6njpejVduCoCGuYmDwm0WoROg8MZpuON
 SIl6D9XkBqQ40owCHtFzbFPFXQsgb6+Hp4V/BoNJJJnMHVdW/zgOyJBpirCAwPOfIz
 HcfB+kkGUqemGZoka/SinHrWStHXFAUQPzrIQFgTm1oadehKRNNCm1qA6BWKPpcaq0
 1TgibwoU5fvdw==
Date: Mon, 22 Nov 2021 23:01:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andy Gross <agross@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hyun Kwon <hyun.kwon@xilinx.com>, Jaroslav Kysela <perex@perex.cz>,
 Jon Hunter <jonathanh@nvidia.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Scott Branden <sbranden@broadcom.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 alsa-devel@alsa-project.org, bcm-kernel-feedback-list@broadcom.com,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/11] dmaengine: kill off dma_slave_config->slave_id
Message-ID: <YZwhSPkhAqZy3bqY@sirena.org.uk>
References: <20211122222203.4103644-1-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>
X-Cookie: Lake Erie died for your sins.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_150138_643115_AFB10427 
X-CRM114-Status: GOOD (  10.45  )
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
Content-Type: multipart/mixed; boundary="===============8070258551069784889=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8070258551069784889==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="71Si6a9AhnlReqww"
Content-Disposition: inline


--71Si6a9AhnlReqww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 22, 2021 at 11:21:52PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> I recently came across some new uses of the 'slave_id' field that
> I had (almost) removed a few years ago. There are no legitimate
> uses of this field in the kernel, only a few stale references and
> two drivers that abuse the field as a side-channel between the
> dmaengine driver and its client.

Acked-by: Mark Brown <broonie@kernel.org>

--71Si6a9AhnlReqww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmGcIUcACgkQJNaLcl1U
h9B/hgf6AiPwJAMMKcdb/6uCfAJACPZtqMFn2hE6HQgrw8mlTsR3sGqhQj3c3NWF
vkLYtSZ20L2tPvS1uyAxjIRzIm91rqriu6pNurmupB6D+347UfSMpYhtbEKXvbBw
1UF5ftPw1t5IGduAX6HKBfaN1Iab53577DJb/uJwR3Mb/WBh9aFpuyRwuZgjBOwE
MvpTaAK2GHY4loDjJChSAK+zlCQMFbc4I2mZuahtf4wvBts/eZn7bAqAruzPMnTL
e3crlktLeH7C0DMKJpmrxvTvS0CDsEUUOJ+tM7aNmtsdyYTAZEG35vzJgVly61jc
7e5I5GHB1Jxsid3oM7WeznOhbimQEw==
=AKUT
-----END PGP SIGNATURE-----

--71Si6a9AhnlReqww--


--===============8070258551069784889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8070258551069784889==--

