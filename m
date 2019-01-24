Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 169B2C282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 18:35:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9038218A6
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 18:35:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hYbAvEnP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="p4+Rp+/v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9038218A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GCDtvMX/DtbYQ8LYtr3m/lRU3vT3ae+IIJ1wMqd+u9U=; b=hYbAvEnPsXH9tUe/i7vogVcU2
	3b3luPYso7cLoMzlBZ4gFy3cY/8nXOToGjYBmOoG2oQQ+vMohwBjWYFd4Y8h+ZeDUR4/ldhUu/ywe
	GpeyeB/hqYAPB8ytuR0caPqGZ698KiT8wmMWs8wlx7Y8Bh/Ime33/hZwKBXZhlAI+B0akEmFBr8jk
	mv+OwT82vKqhZuUvnvnzUtBy2rlG6gUsDI90znzEGO5o991qBDB/+H4fHiodcEmzFsmMPEbqxOJ+s
	ZNHwPu5cAR51xnm1sVuRVPK+wlsIy+QNXgL1zyOGkISkDJigdSUfHcYSKzXpr3LwTegvoH9Vwa1O5
	y7pB49WbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmjqh-00063z-Gg; Thu, 24 Jan 2019 18:35:35 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmjqU-0005uF-T4; Thu, 24 Jan 2019 18:35:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+ZRTLp/uSfeqKdlo/+njX6KdwZIPvc496YNVX1pjU94=; b=p4+Rp+/vodk59Xz6UUzauwlhL
 lIpTg6XkXxVR59+JkNXkKvYVP5WfEUPa1pvWCdOHzkufnFIVckpXMyu2wQ+BB/oTceKjP3wdL3BIX
 NzxSC3R54+JovxntEEsta3tRtlLhcXDmiD0G6+YC03ExssL3TqOHzT88DVz67rQU4tZCc=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1gmjqP-0006ad-3F; Thu, 24 Jan 2019 18:35:17 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 6D94E1121B6F; Thu, 24 Jan 2019 18:35:16 +0000 (GMT)
Date: Thu, 24 Jan 2019 18:35:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Subject: Re: [PATCH v8 1/5] spi: spi-mem: Add driver for NXP FlexSPI controller
Message-ID: <20190124183516.GG5641@sirena.org.uk>
References: <1547553487-9936-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1547553487-9936-2-git-send-email-yogeshnarayan.gaur@nxp.com>
 <VI1PR04MB5726F4A5073E3E4C01E61CEE99980@VI1PR04MB5726.eurprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <VI1PR04MB5726F4A5073E3E4C01E61CEE99980@VI1PR04MB5726.eurprd04.prod.outlook.com>
X-Cookie: Love America -- or give it back.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_103523_106236_491C0FB6 
X-CRM114-Status: UNSURE (   8.77  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "frieder.schrempf@kontron.de" <frieder.schrempf@kontron.de>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============7975305080489648182=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7975305080489648182==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WK3l2KTTmXPVedZ6"
Content-Disposition: inline


--WK3l2KTTmXPVedZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 22, 2019 at 08:54:59AM +0000, Yogesh Narayan Gaur wrote:
> Hello Mark,
>=20
> Can you please apply below patch in SPI tree?
> Patch has been reviewed by Boris and Frieder.

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

--WK3l2KTTmXPVedZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxKBWMACgkQJNaLcl1U
h9DrBgf/REAKB4rWORx9/tToi7RLirNzI0JRdRCU7oYs6F4KmE5JdgPCdHGeRP3x
j2WNkMX3cLo5cQJ+hPqTiTYPzdmC7laIDjvJl+s0IUYZhLjxjpZfMrd57OliNd04
gER50xwNJowG0d71gepBkOwApy+HUpApFMP5GDzc3Lc6hSrVqphlzmlbxCZVhku9
Pb6Vgs8BYo6BhRQaTH2qUbtf6Euw7csOnY2ekiyE9WuWpoC4YTWTVXc6YOwFLu5C
hid26ImHy4QcsomHbqSTEH/gW1Eac8Z5/NFxYdHZv0uOGQRQk7PW09ddLEupbZ10
+vp3rTIIobw+kOiI/GHwRwubz+80NQ==
=bc1i
-----END PGP SIGNATURE-----

--WK3l2KTTmXPVedZ6--


--===============7975305080489648182==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7975305080489648182==--

