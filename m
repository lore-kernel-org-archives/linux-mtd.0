Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33911C169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 12:12:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDAA62086C
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 12:12:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EDeUd77n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="TEUiruac"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDAA62086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2Lt3ohHU1V8QdA8R1g0TcAqpDmF+tiPExNigaohzJ0E=; b=EDeUd77nrMt7d2oJ9wgShDbE7
	sf/DZOFkTJTx7dTj4ND10UKlVgg75pkjOf6HcW/etIPYQgz72+KWbOGbYuZulxLO0StTO0l6cmOnq
	eZg2MlfcWJeiktXCzay+xftBby0HeQOELF79aF33lso2mPhWpZK6qBhOLkDbS1FukYQ/Aw88SRABC
	6So0BXc0SV9Uv6t5KsCQOTKZX0Ghp9qWHXPvg4Cr5P3+1JPA+c6p/0yruqxNhC7qkl4cDXSLDMCrq
	C+P+cC86ANB2JPYg6jmxl6OgfxbO7ByiZEJNHNPG9X8Ozs4q52d2/kcdK+kuUYNTy0R11uHPo6Ghd
	Gx7IdBWRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goSFt-0007rd-96; Tue, 29 Jan 2019 12:12:41 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goSFp-0007rG-B8
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 12:12:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EtI5AvujGGY5/RaznJQSRoZrtFEhMB1fNYQ/ErtBaXM=; b=TEUiruacTseUmmq+bfsaLUYk6
 A4WGkeBRYslJ5YF4tvlvLsfcfCxS0Abeqbnxvl2N1VRxHSPnH9jVlCzqxe55Ig9l5YPwELnLAP/GX
 IfnVX1bYsRZf5EsBYoMtbVpdqF/5s8Q/2fBSptjaE2ESzPh0zzjetpVj7bKy+VAYsuQGk=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1goSFm-0008AE-FV; Tue, 29 Jan 2019 12:12:34 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id EB0751127D50; Tue, 29 Jan 2019 12:12:33 +0000 (GMT)
Date: Tue, 29 Jan 2019 12:12:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH] spi: spi-mem: spi-fsl-qspi: typo fix in author name
Message-ID: <20190129121233.GC10524@sirena.org.uk>
References: <1548755607-27544-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <4759d7a9-71a2-70a7-2704-0ef7fa37b2ca@kontron.de>
 <20190129115937.GB10524@sirena.org.uk>
 <24c8ce00-5a7c-cec0-df5b-fca6e13bccb0@kontron.de>
MIME-Version: 1.0
In-Reply-To: <24c8ce00-5a7c-cec0-df5b-fca6e13bccb0@kontron.de>
X-Cookie: What foods these morsels be!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_041237_531523_7FF1A1EF 
X-CRM114-Status: UNSURE (   6.79  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
Content-Type: multipart/mixed; boundary="===============2338167772557171242=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2338167772557171242==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tqI+Z3u+9OQ7kwn0"
Content-Disposition: inline


--tqI+Z3u+9OQ7kwn0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2019 at 12:08:26PM +0000, Schrempf Frieder wrote:
> On 29.01.19 12:59, Mark Brown wrote:

> > That'd mean a rebase unfortunately.

> Ah, ok no problem. Then please just apply it with:

> Fixes: 84d043185dbe ("spi: Add a driver for the Freescale/NXP QuadSPI=20
> controller")

Yes, that's what I've done already.

--tqI+Z3u+9OQ7kwn0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxQQzEACgkQJNaLcl1U
h9DMcwf+KKr/ECVMpHPmbzMnvYy5tmCK8+f3G7YcVEOCr3+D4MEKm351tKbNM+rm
RsDaghI4Rembs/uE6pYjdOyuGD3yAKcAzM0Pljd4P5/L4Gg3zC4jJoLIP8N2yeaJ
SuwOJ6YxEW7NJdoQIvO1h7vaZ5rhMkV8UZJ9YSWczmygcjUhtFE8aAXpz6g70NTz
DuGIFum5YgZbdAeRF1C8GesdLxvmonmMNiLxtgq1qJv7rxoMzB0UOKbs4Vvh8Ue3
24eM1MjseMTFrWHhUYcSKksUTEiMZ/C+I2pEXpYP8A7hzojKxP3BdiFYRryYIYi6
VBnom7LI2OySeVRHOe6ZvxzTqfRfxw==
=JkNH
-----END PGP SIGNATURE-----

--tqI+Z3u+9OQ7kwn0--


--===============2338167772557171242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2338167772557171242==--

