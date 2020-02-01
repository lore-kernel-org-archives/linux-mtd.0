Return-Path: <SRS0=Y29Q=3W=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DATE_IN_PAST_24_48,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E718EC3524A
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Feb 2020 12:01:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCC1920643
	for <linux-mtd@archiver.kernel.org>; Sun,  2 Feb 2020 12:01:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aSpIAWK3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="OfVWWu0J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCC1920643
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NjprqtfI1TWq1JrTQKHt4dCP6dabwZIr/PVngpUyl4o=; b=aSpIAWK3Tn9cpuP0JTFqsPWxt
	CQ2WOJE+cE1cUpuV2d95LA63FJR1g23bhVGFInn7W2pX9aHk6F9Tu8MwII27qwYRzgVn+kMQJfW1U
	htr4gLauE9wuQ31i6lE24wSKQyIgEGHcPvvam/bIYf1y9eLs8Ic/0bhPBwrBcf6oc7sC/hi1po+7J
	Mmxpp67m0CH40sWv3LLx4IFlkafX601MY2Ogx1k0OaP6nSCXDf+bR9lGM7AaHFlVayLecdeZk7u3q
	CL41arEA00/euKh5/3v1/mOn5SSjqe7lgaQzG3WKhDB7SEo5yahsIhNw7riDvq7Hek7NfnPjbrrqS
	gAokjTgig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyDvi-0006Wi-HK; Sun, 02 Feb 2020 12:00:46 +0000
Received: from heliosphere.sirena.org.uk ([172.104.155.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyDvf-0006Vw-1r
 for linux-mtd@lists.infradead.org; Sun, 02 Feb 2020 12:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h7E2UaKOVX1aD/zQdXr3brFbm+K+Dp4X6pCQvTffYRk=; b=OfVWWu0JCHbYAyfezgu1tH+VP
 xnqyb0yrlt9o5GwiUYRZObeQlGr4HN0MI+HmlZupvtTnAYJd1YVDWXosXbexKO+LeY48Xgik2/mGi
 3SbPaPtnQ3MPhs5Scu6FapchiQk260HBaBZrJ9GulAt3Cyvf8aMXnkcdPAsztDgl6bAGc=;
Received: from [151.216.144.116] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iyDvT-0006po-EI; Sun, 02 Feb 2020 12:00:31 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 6E272D01A54; Sat,  1 Feb 2020 11:32:50 +0000 (GMT)
Date: Sat, 1 Feb 2020 11:32:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 2/3] spi: Add HiSilicon v3xx SPI NOR flash controller
 driver
Message-ID: <20200201113250.GT3897@sirena.org.uk>
References: <20200113114256.GH3897@sirena.org.uk>
 <6dd45da9-9ccf-45f7-ed12-8f1406a0a56b@huawei.com>
 <20200113140627.GJ3897@sirena.org.uk>
 <CAHp75VfepiiVFLLmCwdBS0Z6tmR+XKBaOLg1qPPuz1McLjS=4Q@mail.gmail.com>
 <20200113142754.GL3897@sirena.org.uk>
 <20200113143403.GQ32742@smile.fi.intel.com>
 <0252a76d-7e2b-2c70-8b1b-0d041d972098@huawei.com>
 <CAHp75Ve=ZwJe2XV8Y1UN6sMe1ZHOBwUtRUD=aGqhR4Gc7BNUcg@mail.gmail.com>
 <136bd652-dcb9-3efa-a92f-2263cbf840ad@huawei.com>
 <CAHp75Vd=TY0tPfSHMSLTh1Pgg-E7MCP5Gym1yjpLgH0Tx-2xSg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHp75Vd=TY0tPfSHMSLTh1Pgg-E7MCP5Gym1yjpLgH0Tx-2xSg@mail.gmail.com>
X-Cookie: Programming is an unnatural act.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200202_040043_118988_AC2F2B7D 
X-CRM114-Status: GOOD (  15.42  )
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
Cc: Jiancheng Xue <xuejiancheng@hisilicon.com>, chenxiang66@hisilicon.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 John Garry <john.garry@huawei.com>, Linuxarm <linuxarm@huawei.com>,
 linux-spi <linux-spi@vger.kernel.org>, Marek Vasut <marek.vasut@gmail.com>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 tudor.ambarus@microchip.com, liusimin4@huawei.com,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 wanghuiqiang <wanghuiqiang@huawei.com>, fengsheng5@huawei.com
Content-Type: multipart/mixed; boundary="===============9053315819532250303=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============9053315819532250303==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fDWuavwabVZ6mXOJ"
Content-Disposition: inline


--fDWuavwabVZ6mXOJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 31, 2020 at 05:46:39PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 31, 2020 at 2:03 PM John Garry <john.garry@huawei.com> wrote:
> > On 31/01/2020 11:39, Andy Shevchenko wrote:

> > > DataBitLength is the size, in bits, of the smallest transfer unit for
> > > this connection. _LEN is automatically
> > > created to refer to this portion of the resource descriptor.

> > > Is it what you are looking for? (As far as I know most of the
> > > firmwares simple abuse this field among others)

> > I didn't think so - I thought that there was a distinction between width
> > and length in SPI terms.

> My interpretation of this field is a data width of the slave.
> Basically what we have as transfer->size inside SPI in the Linux
> kernel.

This discussion is about the number of data lines, SPI_TX_QUAD
and friends.

>      1 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x08,
>     36 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x10,
>     35 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x18,
>     35 SpiSerialBusV2(0x0000,PolarityLow,FourWireMode,0x20,
>      1 SpiSerialBusV2(0x0000,PolarityLow,ThreeWireMode,0x10,
>      8 SpiSerialBusV2(0x0001,PolarityLow,FourWireMode,0x08,
>      1 SpiSerialBusV2(0x0001,PolarityLow,FourWireMode,0x10,

> So, it seems I stand corrected, the field is in right use, although
> cases like 0x10 and 0x20 should be carefully checked.

Those look like they're mainly controlling SPI_3WIRE so it does
look like a reasonable fit, yes.

--fDWuavwabVZ6mXOJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl41YeEACgkQJNaLcl1U
h9C+bQf9H0e8FvkTjz4ZUrRo0CSS5uWHyG8Ip87aiypFpHhI6CUAyHdGFwyLCrr9
EE93J+iOOuXq/xO7PMU5mD5LQ5MJlOUeOEeUHvldsQg6snP76Cf4U0U3RIifoBe8
tNMlneq9czEifmRnptwx0MFaW03kpgeX68wYT3p5HuWtjyOfrVOwk3jiz9PSR5BJ
oPwOWzvyBKskSYYXGDtuHMtFqM9SjobrbHHK6rWlmr5xAqOUXAyRBTX22PYI5hi9
r45kq+3FL3V0ayJZi5jZT5+VZsXCsUC41cwacJpl0aIUp7YRm+Xv1SV644y82AyW
B8pYHbZNJ2tpXjEJOH38LZ94cRYOJg==
=OiRO
-----END PGP SIGNATURE-----

--fDWuavwabVZ6mXOJ--


--===============9053315819532250303==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============9053315819532250303==--

