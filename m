Return-Path: <SRS0=sdQx=42=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA470C18E5A
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 12:10:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFA9021D7E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Mar 2020 12:10:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PGfZne+K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFA9021D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yJVmOHxmpydioFIWysuZcDe4zUkP8jsDq0mwv193Ax8=; b=PGfZne+K7d4+t8XRlRldT8Js4
	flNPt8vQs8iAdJiXgXVDysJ9ns39wCDAwwOM+hDZtkTyCIkRtNvwL0AJV6mx77DFCWSldvC9vm/xI
	tOZQr5iRCfbHtZa+atxdCc2P3anbC8GhpK+R833XhdEve2Bf8Qj4GU/ZKjjR3zf0IKNtoQvISm0pq
	ok9HnuPAnoeySf5vvGZrPqU2rak66HVRTWAUX8Ei5cjuFM5z0BqnrWlWLqBzI1y18drfdx99azTtY
	NcnXzz2vUj2JIaNT6x2r5H/ztYbrTVXatIJn0CXqowwNvCA0dxbX6uHqKH8KihvZJHD9xDP0tjcYa
	AYv2/CPIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBHEy-0006Rd-VB; Mon, 09 Mar 2020 12:10:36 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBHEo-0006Im-La; Mon, 09 Mar 2020 12:10:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 116B530E;
 Mon,  9 Mar 2020 05:10:22 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 888603F6CF;
 Mon,  9 Mar 2020 05:10:21 -0700 (PDT)
Date: Mon, 9 Mar 2020 12:10:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH v3 4/4] mtd: spi-nor: remove mtk-quadspi driver
Message-ID: <20200309121020.GD4101@sirena.org.uk>
References: <20200306085052.28258-1-gch981213@gmail.com>
 <20200306085052.28258-5-gch981213@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200306085052.28258-5-gch981213@gmail.com>
X-Cookie: Above all things, reverence yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_051026_751653_D3FBD6FC 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============6742797479158432571=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6742797479158432571==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mSxgbZZZvrAyzONB"
Content-Disposition: inline


--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 06, 2020 at 04:50:52PM +0800, Chuanhong Guo wrote:
> This driver is superseded by the new spi-mtk-nor driver.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Is this move OK from a MTD point of view - should I apply this when the
rest goes in?  The patch was in prior versions too and is obviously
straightforward.

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5mMisACgkQJNaLcl1U
h9AW8wf/ZiBUrxNc95s6m0g5fMy2/cs3/LsPrWZSb3N2E1e27ymrx83CSPad45sg
mGRE8ZNrAjJejZVzFdgOiQZQtKXKFVjY6HjAAatKDSNqcX+8k/VR6yCE/xQB36h/
V+fLMlrzLx1nNEF3umZAmtdkQIQN8OuSTUbLAgAVe3bZVXWMQAZfcJrCy/FuidfY
ZjU3+caJ3jC8rwDB6+1xVujEe3+eCz63rkOHoSGzqXBYI0OpQfOLd9M8fu77WW4U
6RV5Z5lUl26EOpzOO2+FJKEdguXeXDguoAjKlqcc+CzhGBVdnRetzqf+LEujpAOd
xU3eqFZzEBmUHpNr4i2GACoDY/MBSw==
=H8Zm
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--


--===============6742797479158432571==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6742797479158432571==--

