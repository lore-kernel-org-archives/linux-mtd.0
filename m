Return-Path: <SRS0=SE3z=SV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32CECC282DA
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 14:52:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E51A6222D3
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Apr 2019 14:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W/esSgdX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="DgaVWyKz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E51A6222D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iqJ5MNIMmeoE1ZQpCLBlme0Q+6YcipRkw+HryYfKlxU=; b=W/esSgdXh7Bl+aoxLYAFbhVFU
	U/b95CbXsJDrCrs4DEGyuVg1xL85dbs3o4VWNd1zX8WUfwsJDi/P7qRSmjlPMPLYk5K1zUX1NDxUR
	liT5AC6+tpwvqDtM/CjQ0NNR3br1DhHb3yj+7oHlTWoVtCAuHL3vkWjKe0RmGDn89IBTv0zmaWoTb
	wuPZBdQo1EHwyejSRGbwyRBbv4Ey4UZlpqnAGdOONl5YiblZ7Kx47ibPIFWBJln97QJbr3S1fjhCi
	XfahHvOGJ6MzYH1BaYrIPE4f5zLL7ncuz2sCqwOWJQ+GgH8uiS6mSc9z6INj6zxGhjAE23hkNi2vx
	OlNxgbjjg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHUsE-0005Dx-9p; Fri, 19 Apr 2019 14:52:18 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHUsB-0005De-1b
 for linux-mtd@lists.infradead.org; Fri, 19 Apr 2019 14:52:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L02lidpU1CWJs+5WvBdKuXF1cJhohg86bxgiBZZR0xU=; b=DgaVWyKzfGLpL8WTjq6xjbRJg
 cXPNBN2oTgNzZvV1P49C16H285liahkHS0bGwxqAUgPW5VJsod3iigt/9PARyVtMHI7pXeHjICcCC
 gWgyEuHIsjjR84JuKvRBjoWP6KWE2GF3FhtxyLathZ9ZCRmRlQtunkSnEdSJWTIP9RCvo=;
Received: from 188.29.164.213.threembb.co.uk ([188.29.164.213]
 helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hHUrp-0008BF-Bc; Fri, 19 Apr 2019 14:51:53 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 62107441D3B; Fri, 19 Apr 2019 15:51:51 +0100 (BST)
Date: Fri, 19 Apr 2019 15:51:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Mason Yang <masonccyang@mxic.com.tw>
Subject: Re: [PATCH v3 3/4] spi: Patch Macronix SPI controller driver
 according to MX25F0A MFD driver
Message-ID: <20190419145151.GR2803@sirena.org.uk>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>
 <1555320234-15802-4-git-send-email-masonccyang@mxic.com.tw>
MIME-Version: 1.0
In-Reply-To: <1555320234-15802-4-git-send-email-masonccyang@mxic.com.tw>
X-Cookie: Shah, shah!  Ayatollah you so!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190419_075215_254227_A1416007 
X-CRM114-Status: UNSURE (   8.63  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, juliensu@mxic.com.tw,
 christophe.kerello@st.com, richard@nod.at, bbrezillon@kernel.org,
 marcel.ziswiler@toradex.com, dwmw2@infradead.org, miquel.raynal@bootlin.com,
 linux-kernel@vger.kernel.org, stefan@agner.ch, linux-spi@vger.kernel.org,
 marek.vasut@gmail.com, paul.burton@mips.com, robh+dt@kernel.org,
 geert@linux-m68k.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmal.com, liang.yang@amlogic.com, lee.jones@linaro.org,
 zhengxunli@mxic.com.tw
Content-Type: multipart/mixed; boundary="===============5567328658075726434=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5567328658075726434==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IUSVF+LtaR4kWxuH"
Content-Disposition: inline


--IUSVF+LtaR4kWxuH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 15, 2019 at 05:23:53PM +0800, Mason Yang wrote:
> Patch Macronix MX25F0A SPI controller driver according to it's MFD driver.

It'd be much better to describe what the above actually means - what
changes have been made in the introduction of the MFD driver?  It does
feel like there's not as much abstraction as I'd expect between the MFD
and the child, there's a lot of peering into the parent and enabling and
disabling individual clocks for example rather than either having this
hidden behind a function or just having the clocks owned by the child
driver.  The driver also isn't using the MFD interfaces to pass through
the register subblocks for the IP - instead the child driver is peering
straight into the MFD structure and looking at a variable in there.

--IUSVF+LtaR4kWxuH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAly54IYACgkQJNaLcl1U
h9D0PQf/erY3gZlhAvdcG9BNLPO9WNE8OrfW8W1e5MFQI3MEhJC9fi3BynwsbKtq
oYO7n4IlWTIXmNDQdlZTdlGU2ybIAMGbUmRh0sP2UB5dh2nNnCTfzdOKdszWov18
JFDl2+5xeyM5ensdZqRVNaXOP/j3eavC/1AOgDTlVummvycoxPH7AeDEg/+UTHrb
blDrIxdutZnG+hGdmdoDBZdMsP/eWTS2FJ1t3bnU2AVnftWS/35E5NXpJG4o+gz+
kb+NmEWgrDFoCOk03rq02pudfkdQawONL85giQwm5Apz4OcKeGRV7tIUjfVr0DxT
9Rw+gkXFeqGyyD3rS25VYKnDsuXRCg==
=WftF
-----END PGP SIGNATURE-----

--IUSVF+LtaR4kWxuH--


--===============5567328658075726434==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5567328658075726434==--

