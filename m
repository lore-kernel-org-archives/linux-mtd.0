Return-Path: <SRS0=oh1H=QF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E433EC169C4
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 11:59:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA9EB20880
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Jan 2019 11:59:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e4IK9xbD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="MbWwyPu4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA9EB20880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DE3y/rJXulNghaAMcwWGA38vYngs71/9PA6APO15ivE=; b=e4IK9xbDen+9tf9hCqsLWQ2TS
	xnc6UCgOzyFE87Ds9upw5ri7a8n21O+ApT9NAm5dfAp2JX6HL32z8PV0JXAlvAhtYJipOWeBBISPJ
	niSjE0WYr8fpYLcG9f6vWIgBoQXc37viI/684R3QypU9yz28v7O2vt9ES1UcSerggP2QlEiPQjQgk
	Id3oOsYzGjPtbfyrj5qUVGVKCypjTjt+FEaoKzkEx00gojXIf2hGGXLZ+LrXQOk5cAaCKAimc/dV2
	WkcDCp57V2drHiaUshjXC54WxIO8d410twiSPkeN/L6ZX7YKPdkozj5854/0JL25Lt6YcI8YdxoUE
	01htWvIJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goS3N-0001nA-MB; Tue, 29 Jan 2019 11:59:45 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goS3K-0001mk-RM
 for linux-mtd@lists.infradead.org; Tue, 29 Jan 2019 11:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ElyGQAVQB3llq3o14ck1rXqO3qRMm4+yyY1x6g4al/o=; b=MbWwyPu4qdc5j4+DY2Ay4z90d
 eYR+FFQESnYmAzzwgFhX7WG/gYZudgAzuTcBSM1Jr40HYh+MpxqpNIIvx5l3jvRheMmhFHruXiQKx
 Jfv6jkrwuvm8Ssiw1Mvm0mk/UM9wrgCHPSCzNOk7n37f/G0LHU0fhMfz5YIwbJpYT/b4c=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1goS3G-00089D-5z; Tue, 29 Jan 2019 11:59:38 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 8416F1127D50; Tue, 29 Jan 2019 11:59:37 +0000 (GMT)
Date: Tue, 29 Jan 2019 11:59:37 +0000
From: Mark Brown <broonie@kernel.org>
To: Schrempf Frieder <frieder.schrempf@kontron.de>
Subject: Re: [PATCH] spi: spi-mem: spi-fsl-qspi: typo fix in author name
Message-ID: <20190129115937.GB10524@sirena.org.uk>
References: <1548755607-27544-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <4759d7a9-71a2-70a7-2704-0ef7fa37b2ca@kontron.de>
MIME-Version: 1.0
In-Reply-To: <4759d7a9-71a2-70a7-2704-0ef7fa37b2ca@kontron.de>
X-Cookie: What foods these morsels be!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190129_035943_037340_598A9DB5 
X-CRM114-Status: UNSURE (   7.13  )
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
Content-Type: multipart/mixed; boundary="===============7857569732549732786=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7857569732549732786==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 29, 2019 at 11:46:02AM +0000, Schrempf Frieder wrote:

> Mark, could you please squash this with the original commit=20
> (84d043185dbe spi: Add a driver for the Freescale/NXP QuadSPI=20
> controller) in spi-next?

That'd mean a rebase unfortunately.

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxQQCgACgkQJNaLcl1U
h9Ahpgf/d5nMFKIOED+AvHFHbgVHTt8wQ9e9RcpoKOkEbSlBSjdJH7kuZVW0gKOd
Gm+urOumNSL4xldCJ+e+hMTwVfJMsurV7iwFfzPGA+kz5g+qxynpsPZazgOkFE4w
qCk3bZkotlhPVQYy+UJDWWtL/nmiNtLiYON4JFT9/aug9nXm6fizNpECWjWWUI5T
67ja0gUcYBRFJYsKjYqFcF7hJ0VBUJoOCBlvTId6JDWZNd4eSicvLFojPfzmaDcR
KGbiOeDHMPhDn2As5ruEYobbTj7kd7QboJRO2Ak/Q7XvpGRLadPOYuqgio40SJlR
NK4XcnnmaZYfVsP1XxeRkwW4OJv0nA==
=E/1U
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--


--===============7857569732549732786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7857569732549732786==--

