Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D3DC43334
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Jul 2022 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHECU5lWM1fVRCxrd5eZ9EmXznTMQog0HzMiyrptaMk=; b=QCcr2buaTfbJoN3kH5rlkzrxbv
	nHgh5WCdQGEYY3hWZh4zoU0tTsLd4kuqg/FhNfJzfbC35ccZ9qzP6+12YE+R+lFCcVHrZ52/53qDt
	58DrH2t7jRPWS3E2G70kURIaZ0B5XyXlctNYWyYJXx2wGDsBAmen1n4Vi9C/oYATKmxp+wg2MOmoa
	9cZrXu1WRa0zGxqOBRqN0vDfVcvO4v8Eh+au/SF/Xb5YKzgMdzQ+CpmBlUxpDznU+scrXmWP1cNPa
	4xHOAQrAQDLI4TJbhur9jOHZvdgnfD5WNjEC3DO8qNUFEOEmbl7UxLCUrREtVr4r/dhYZhxYqrRYB
	nc5FkD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCNnf-008cuv-Lv; Fri, 15 Jul 2022 16:04:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCNn2-008cTi-Be; Fri, 15 Jul 2022 16:03:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A5B6FB82D32;
	Fri, 15 Jul 2022 16:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66131C34115;
	Fri, 15 Jul 2022 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657901017;
	bh=jrlFeUIlmq6USCDUyOFysJvOq822JHFZZ7Z40MxY9qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dadoHH8CNpbJL21+f44Epd5J674JaHKpzitYi5Yt6EmFV684hfkDRo+FU0AUmtQqS
	 z1+Hz1CQ6Pw7Y+OIeVoXKvDwcNmTI/60tTPCQ8DFUG/j8lkQnjDvcE94j18yHU/By2
	 Phhwo4EiJ/3/rQz9AuknKwC9JQR0+oZh5Yls6JEYUch/QOKB1zjBpeTlsPpc3MAnEK
	 WQ1wuH8tWlBKZemmAsiWSaQW3jCKJAkMbHD6WfEpsc7lryOKiga4QG0/3uAqnFeGgF
	 pKQuDymcNVqLw8AZQNAgogELOmcLaCvQoV/n3JomfnruEUbYSGz9jwTWulu9U4d4yp
	 ETqG4+zPC0Crw==
Date: Fri, 15 Jul 2022 17:03:31 +0100
From: Mark Brown <broonie@kernel.org>
To: "Mahapatra, Amit Kumar" <amit.kumar-mahapatra@amd.com>
Cc: Michal Simek <michal.simek@xilinx.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"p.yadav@ti.com" <p.yadav@ti.com>,
	"miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
	"richard@nod.at" <richard@nod.at>,
	"vigneshr@ti.com" <vigneshr@ti.com>,
	"git@xilinx.com" <git@xilinx.com>,
	"linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"michael@walle.cc" <michael@walle.cc>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [RFC PATCH 1/2] spi: Add multiple CS support for a single SPI
 device
Message-ID: <YtGP0+7TPGdcPTEM@sirena.org.uk>
References: <20220606112607.20800-1-amit.kumar-mahapatra@xilinx.com>
 <20220606112607.20800-2-amit.kumar-mahapatra@xilinx.com>
 <YqHfccvhy7e5Bc6m@sirena.org.uk>
 <40110ff8-5c19-bc54-759b-a51a919788eb@xilinx.com>
 <Ysw5MpvjKM5LKvWd@sirena.org.uk>
 <DM6PR12MB2809BA6D4F94EA59E76E6576DC8B9@DM6PR12MB2809.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM6PR12MB2809BA6D4F94EA59E76E6576DC8B9@DM6PR12MB2809.namprd12.prod.outlook.com>
X-Cookie: You dialed 5483.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_090340_736007_E47EA359 
X-CRM114-Status: GOOD (  18.30  )
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
Content-Type: multipart/mixed; boundary="===============3106050919524161457=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3106050919524161457==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DxORmGk94Y1lYeUm"
Content-Disposition: inline


--DxORmGk94Y1lYeUm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2022 at 03:36:23PM +0000, Mahapatra, Amit Kumar wrote:

> Thank you for the clarification.
> As per my understanding we would not be needing a new DT=20
> property for expressing multi chip select support in the driver.
> We can use "num-cs" property of the spi controller for=20
> broadcasting multi chip select support of the driver.
> If "num-cs" value is greater than 1 then the driver can support=20
> multiple chip selects.

That's true in some sense but not in the sense of being actually able to
use more than one chip select for a single device.  If the controller
hardware manages the chip selects it may not be physically possible for
it to control more than one chip select.

While it's not an issue for the bindings even hardware that can
physically do it is going to need a driver update (in the core for GPIO
stuff) to do so.

--DxORmGk94Y1lYeUm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmLRj9IACgkQJNaLcl1U
h9ASdQf/ca/l2sFbQii/WohGkZhhQqY8tP78zj73reO3O08IgMatkP91Qg1cm/g4
C9lTmIC/jAtn3id4aXNkli7H7ZJhq8dOfzd+O5T32FIULoAvLJUnyw6roTsncRul
RUooo3/llgKSEX9sZ3w/nfOoyBg49Sj/n6hkxuvIIj33Cys2E8y5JzXiVbEyFCkh
Q9amQxSAa4p+jyDj4zQ1MtY4J58LsepXJkU+E1F/8HuJHieKxChblZKC4LCGwZ2k
UWVdCUxSTg25IpkLJLrjbJBRuwuwJl9ZGTeDj78Sf9OM/x1vbkgKPwk5RVGioKMV
vWkEa2d0/0ioERCpoUjzCYH27X8bxg==
=AYb4
-----END PGP SIGNATURE-----

--DxORmGk94Y1lYeUm--


--===============3106050919524161457==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3106050919524161457==--

