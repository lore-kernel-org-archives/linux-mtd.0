Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15622C282C8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 12:26:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA83C2171F
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Jan 2019 12:26:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hIXObapO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="Hu6+nl8U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA83C2171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MwJM+If2mKGjyJ6sidxsdVg/0UqSfKuwtCdrVcDv0XQ=; b=hIXObapO5uOMyuDdD8b4jXaqD
	PgIlwjkA+gMP9FnCISPlHKAtOevdJW+ijOfolILWk1qHK3wM/kqsg0kFR80HGk4RTayIAbcHT2d8b
	vxVsrbUtjxrbzraJMkjxt7I4Q5gekI+wRHvBYVXjunNl7CPTqKjUtGkUP9mNUZwlV7NoDEsgRaDYv
	68g007eeWZupKqeqwJpap+9AMPITjg9edohvLjWv0wpF9dzhQuxGXFzNjXQ0CTt0SixTgcv2Iwwwa
	OTxy5DpCgaaMH5fiPKG5ZjHOihAfcjl/3jBYUIQfpEGEpIDBEilDwiTQNFk1zyafoDRWH+0vQSLV9
	tIEAHbzJA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go604-00042M-Bn; Mon, 28 Jan 2019 12:26:52 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go5zq-0003rq-Nt; Mon, 28 Jan 2019 12:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cEneVQDt5owcuCiSpjo8HwrddzUQYEnP2+VEv83KNZI=; b=Hu6+nl8U6+gMmN/x3f7vHD9cV
 fRfbVg3aUMkaeRB/0WA9/NCaHMp/MMndIPmUIoUNyrtcVBD13cZLwBIAiu2y3riaOkBkACL7nU6eM
 +yV7u3cAMvzDxsslSfsWZJkAtwrh68+uCX7OXwcm5l9JHxySK2gHFVh/2cKRfxHpmU6WY=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1go5zk-0002RE-7J; Mon, 28 Jan 2019 12:26:32 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id AA6F51127D29; Mon, 28 Jan 2019 12:26:31 +0000 (GMT)
Date: Mon, 28 Jan 2019 12:26:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>
Subject: Re: [PATCH v7 4/5] spi: nxp-fspi: add octal mode flag bit for octal
 support
Message-ID: <20190128122631.GD11699@sirena.org.uk>
References: <1547546584-5254-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <1547546584-5254-5-git-send-email-yogeshnarayan.gaur@nxp.com>
MIME-Version: 1.0
In-Reply-To: <1547546584-5254-5-git-send-email-yogeshnarayan.gaur@nxp.com>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_042638_918411_32DC5EFB 
X-CRM114-Status: UNSURE (   9.05  )
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "vigneshr@ti.com" <vigneshr@ti.com>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "frieder.schrempf@exceet.de" <frieder.schrempf@exceet.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============4705099973307585994=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4705099973307585994==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8w3uRX/HFJGApMzv"
Content-Disposition: inline


--8w3uRX/HFJGApMzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 15, 2019 at 10:05:29AM +0000, Yogesh Narayan Gaur wrote:

> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index e23ad9ef028e..adc3c0e14f38 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
> @@ -952,8 +952,8 @@ static int nxp_fspi_probe(struct platform_device *pdev)

This does not apply against current code, the above file is not present
upstream.  Please do not submit patches to out of tree code upstream.

--8w3uRX/HFJGApMzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxO9PYACgkQJNaLcl1U
h9Bc7wf+PzfVYK47sKb7gYCwrFPhskxTV0PfgznGOSHdzhtJmhuLjfDzsgLC+PH5
T25AIY5kF5IKbod3WbKT8atM1uQCDHDae81MTD0m6da0uNCpqPsGBquyU+WPiwJA
SOEpzPRyV0GSI/TQW5fKWnWVUxLVKdMEzTBZnvu9I7EvOpv+eiS0udKenqsE8iVp
U0EgQng2D51VRhvVOmRY4bmvtby54bzZXjt/4TYsdvNux2ar00OzH8FOJ2XTKnOO
JdDZlmY/K0NSgjE5T1JYHT4CDn8LLL1wJQ4g04CN/WAKdbGU1GgSMcnxK8OD0C2i
t3E/tHBlG4R/WC4KdDO76rZk6mCTTg==
=DbNg
-----END PGP SIGNATURE-----

--8w3uRX/HFJGApMzv--


--===============4705099973307585994==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4705099973307585994==--

