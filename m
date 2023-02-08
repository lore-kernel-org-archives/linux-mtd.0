Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 505D4C05027
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Feb 2023 14:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NUGneOIRljAMkjgJsN1NNaaUMCBV+0QgW3C7fjXn1E=; b=S+ACNJyisctRAVs+cs+tMbikhd
	Yflzd83zCoNPEzyhXPEqAwnRJdg7ZIe3n5RWtTrWXokirwzO4mVb0iUZ1qUt36WO5gzvZFSG3WPWd
	Pwrxes+GSM7SseJB0R//ydR9/0bSL/XX696xHOhIajvRD25WiWZKaq0rFy3uybhs7eLIPUimGXEWt
	Vo5dbkPSq4LwpTY/mmCCKnqScuBSytWPnrQrpotjM9IHg7JG2wQiAYGvl4Q4Up/M6QzOvnwkyNAkW
	H/epqk6iwiBqC1z+AYco3tTgN8XlbmnjOLXE538o4yAroKo0XIO8bCnXF4wV5eNX7IA1rxMIElWAs
	S/PPrq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPlBR-00Fr3F-UE; Wed, 08 Feb 2023 14:12:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPlBM-00Fr1b-RB
	for linux-mtd@lists.infradead.org; Wed, 08 Feb 2023 14:12:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75F1061554;
	Wed,  8 Feb 2023 14:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6EF7C4339C;
	Wed,  8 Feb 2023 14:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675865539;
	bh=CM9X2AuKUJbsYimacCNPKUAK4TpbgQFBIKIrx7h4lJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LVucjxu+REx2vxJaU73V9LeqN0VfNlpVqOVjlgapAR7+Js6CJh2wUlBGjryat06Mx
	 D9i30JRbIJdOspvFUtAoFUTSjc7q9zKrJAeQbeBiwFIiiX8euIEbk0Ty1Tz6V657+T
	 FLA5gRRVsKUOtlkaWGYAvOyX2NIaQlgKRJiFZbCRwtUw7qjRf/eGTg/jPYZv/0q1tt
	 FcUOC2BCeTia4s8YYIZRIs5mKBJvajFbiu7xD8C4mv+0OOcBl6e5vyuvgWOBBh+MUZ
	 xz5q4YEAPB/J4RrPpxV69F8ll/mVwhh9Od/sV4/BiL8f+TOBF8F2/I8j5Fv6bLISdE
	 LVYCGEEzxvGgw==
Date: Wed, 8 Feb 2023 15:12:16 +0100
From: Wolfram Sang <wsa@kernel.org>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christoph Hellwig <hch@lst.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sh@vger.kernel.org
Subject: Re: remove arch/sh
Message-ID: <Y+OtwCqt26UjCwkZ@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christoph Hellwig <hch@lst.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-input@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-fbdev@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sh@vger.kernel.org
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <20230116071306.GA15848@lst.de>
 <40dc1bc1-d9cd-d9be-188e-5167ebae235c@physik.fu-berlin.de>
 <20230203071423.GA24833@lst.de>
 <60ed320c8f5286e8dbbf71be29b760339fd25069.camel@physik.fu-berlin.de>
 <0e26bf17-864e-eb22-0d07-5b91af4fde92@infradead.org>
 <f6317e9073362b13b10df57de23e63945becea32.camel@physik.fu-berlin.de>
 <CAAhV-H57bV855SMr6iBqoQzdak5QSnaRLjQ9oAbOtYZnik5SoQ@mail.gmail.com>
 <91be7f6b52d8ed74798e86270d59bc5cddefe130.camel@physik.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <91be7f6b52d8ed74798e86270d59bc5cddefe130.camel@physik.fu-berlin.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_061220_985858_B769D2D8 
X-CRM114-Status: GOOD (  11.43  )
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
Content-Type: multipart/mixed; boundary="===============6317263629979585942=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6317263629979585942==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H/y3lZ2MEalioY2m"
Content-Disposition: inline


--H/y3lZ2MEalioY2m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Yes, that's the plan. We're collecting the various patches people have se=
nt
> in for arch/sh, review and test them and apply them.
>=20
> My test board is running the latest kernel now, so I can test new patches=
, too.

I am just witnessing this development, but I want to say thanks for your
effort and congrats on your progress. Looks like you do the right things
correctly, cool! Kudos also to Geert and others for their assistance.


--H/y3lZ2MEalioY2m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmPjrbwACgkQFA3kzBSg
KbYHCw//YV/RG0PWJ1txmpgpA0mLX7EfhxqJS6vwNlqziCSd910A+/ZNL7p2Q5Hx
wVdeRoLHd9OcZFYXr0HLH0VCIJUYpr57DCy0AoIKL9q9CWET1hAMZjsIv5Kx2uVa
1obdyCX46XEMqpSBhcsq8Vsq0TMQ4sCLdpVq/wPqBEDGUBGAIhkWX1UMQv2kiS1T
uuYPKgsFmI2kl52owcOU2yZ42SVZNTEWiO2A8/4BXFfhhzKLWVcZQpEV9OInJ30n
iXm6abMFAsFavgI90NZl1H4UKKLOzD5Jgr9Rv6DfYuyeADsKe2oQN1NvioHHVqvm
qWG2b2UnZ7oS+dXxhS7YsQeiiTyZP/mpUprmrCrm0HMsl6iKCgCU8ceuRzy80Obt
7u9CpA+ceRJ05Gfgo18YElk42l4Qhwk4zSWDQdOwtOlk1FpX9TBxOtOVngYEprMM
UDRSSXFIJZTEyUAbqWqsMDuGRVcq3S9XAPYINbzig3H+Iy7an/wpxWBnYrRm+eCz
/eb7eQ/iQYmBd7Zn8XO74E6vvH+pG8f9nqr2sRPpk89ZDPsZEk0wFCHpJQShIYJt
iSeMDaLVGP+e+YlW7qvKavsdPISxlLhNFA1kj66ccHNZVbNQ5xyGhps/8qefpitG
nN9N+KCLmNvyC8QCuMiMRDD9RVq8OSQ3VcL2zT8pj3XuJo2po4s=
=9hIS
-----END PGP SIGNATURE-----

--H/y3lZ2MEalioY2m--


--===============6317263629979585942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6317263629979585942==--

