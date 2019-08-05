Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC436C0650F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 11:14:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8C2420856
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 11:14:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AvaHe/pw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="pcOsj5AW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8C2420856
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GLLpt8CfbPn7QIoojqUOfztPcpZy4eWDXkyqQS3pg0E=; b=AvaHe/pwbcctHsZ7SeZWBwiRy
	e6aQFC2AdPmI80pvFdd0KryDE3Y3kczSYuL+LuQ3U3QG1vfZ7U/cwziboPWRNcNVOKgAtfmoSeecc
	ZlYRHkFrsSbcg7sZh0vuXGZDAEyq50CUy9PrVF5bE0RHOkN4Q40WduMNhAaam70Z5cEk/x9bAZGqB
	wPJE0P/CHHNOGSj+pU4wU13PLC+jJZFWZtvgiwuU3GvE6AU6YRDz6MUNxaIP4ZwzFWlXf2GrhyFMu
	KQIkbUT7DE6v1va4xgcCd1DgGAgvDT5JclaNdLWg9Xvl6EyEIb1rcaWB8HyL2U12oSsK9xAlShMMk
	WP8nZct6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huaw9-00067V-5P; Mon, 05 Aug 2019 11:13:57 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huavj-0005kd-SZ; Mon, 05 Aug 2019 11:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kBsgsu4Ndv8rRw1FTwpq5BKmxMVjhwpJeW5EeXRVM3A=; b=pcOsj5AWB6sEO0kE8tvGGzvqx
 ixnbmE6ZOBb1461RtXgy7n8AG/pp79FK1VucIJcVgh9U63R1ob7LcdY6Mf7uLp8Svot5wbi8ZUv4b
 X6DwZIqgMuyC5fZPpUUtN4Fb4lULwL5+Dmv5n7MtHj1d4yKTURaRs/dgnORjLl6S1yOiE=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1huavh-0008Il-Rm; Mon, 05 Aug 2019 11:13:29 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 1AB4E2742D06; Mon,  5 Aug 2019 12:13:29 +0100 (BST)
Date: Mon, 5 Aug 2019 12:13:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Ashish Kumar <ashish.kumar@nxp.com>
Subject: Re: [EXT] Re: [Patch v3 1/2] dt-bindings: spi: spi-fsl-qspi: Add
 ls2080a compatibility string to bindings
Message-ID: <20190805111329.GD6432@sirena.org.uk>
References: <1560942714-13330-1-git-send-email-Ashish.Kumar@nxp.com>
 <1560942714-13330-2-git-send-email-Ashish.Kumar@nxp.com>
 <20190709200837.GA7806@bogus>
 <CA+EcR23hhD2=abMtNGDoW1LtXSE4qfjTy1uzU7sgrbi7W=KSbw@mail.gmail.com>
 <VI1PR04MB4015C2C9407598EFEEB4CB2D95DA0@VI1PR04MB4015.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB4015C2C9407598EFEEB4CB2D95DA0@VI1PR04MB4015.eurprd04.prod.outlook.com>
X-Cookie: Place stamp here.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_041332_055356_A62CD823 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Han Xu <xhnjupt@gmail.com>, "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 Kuldeep Singh <kuldeep.singh@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Rob Herring <robh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============4607935971843551013=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4607935971843551013==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C+ts3FVlLX8+P6JN"
Content-Disposition: inline


--C+ts3FVlLX8+P6JN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 05, 2019 at 09:08:17AM +0000, Ashish Kumar wrote:

> Could you please send this patch[1] from your spi tree, It applies seamle=
ssly on
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git/
>=20
> [1]: http://patchwork.ozlabs.org/patch/1118636/

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--C+ts3FVlLX8+P6JN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl1ID1gACgkQJNaLcl1U
h9D2Ngf+KKyQedsjiuTDPHlHvu5s5J2BBDWGyiQg/7+PD+zbaKL4xYA0aDebAeXG
gJYTSdGwnGGLG9WhT5rIlccywcv+tpTn44T6d20GGq/qmfw4y2gX2MTBRtFTlQ+n
FguPs6tjIakMcv2tuVdhBk7IOXE5wJntz+SJaZWOZR1V74IQeofM5K9vtoCXDc5C
3KIADcid54JrTqCvuEwwaTpD2r+fKv7SW4j89OBFZaCvXeu24YNZEEQ/+erK+pUh
k3uykZHERvHIwXJNIBJgat0qe9XVtxHT62XGcZ9D/BafYGIzRHO22h3e7yHfT6a9
wuJ7iMVWU6Fypf3RROY6Ddv5EGpj4Q==
=VG4g
-----END PGP SIGNATURE-----

--C+ts3FVlLX8+P6JN--


--===============4607935971843551013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4607935971843551013==--

