Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB47C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 02:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD31920645
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 02:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G0NladTE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="cUEDpZHp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD31920645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6FhRDSkBQxL/CvRCjRZOdQTaI2j5dR5p+49rCjtPsAM=; b=G0NladTEtzZHiI5io9W4Nxh8o
	alAM9j21lvZr08Ty79v/DfGZaL+vGvuNVwmFpSruOTlCWKV0TYVWmufL9V20J3zf25NHR3DVo1bAl
	lZiOLs/DygT4tNnvPNK72aCV+jSs1cO3kCQNT67jrYW6evpFMxhAjMJJsrxjls3vHRdgEhc8E4UjA
	JDBC7uRtb/rOnpYlg2VEbbNIpjVSbLUSD8f6ok/PgvyOhV0L89Nd8tk0Wf7lzDBCYbMKiUTE4FfwW
	Gt0Xys/VuwjvV/FjaGQRYvXwVqKpJSkWr1YX25Wae3kJ8XDOr6LrC25rlrN0vgi3xh4VcWK9Vxzxt
	VtMkHlGHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM1f2-0006Oi-3b; Thu, 02 May 2019 02:41:24 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hM1ez-0006OL-SY
 for linux-mtd@lists.infradead.org; Thu, 02 May 2019 02:41:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ObYVRU0Kf3pIITjmag/DPVZ4iVx1mDoeKshyHfJ4vg=; b=cUEDpZHpMZfUfljvsKyxjzbES
 jWRaGxO3R9a3EdC2DaCtHkS9Vhdxvktq3aB9nQfImncj6KC4FS8w8k+EY4u1TSJ+yKAxodqr/Wbav
 JahLkMP6xJ8NFsNMUrUarbZBLbsRy374CbDweYt3y7gyTLMbbOEa6m0S6GHXl5Ay87bak=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1el-00060N-6I; Thu, 02 May 2019 02:41:07 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 0FB6D441D3C; Thu,  2 May 2019 03:41:04 +0100 (BST)
Date: Thu, 2 May 2019 11:41:04 +0900
From: Mark Brown <broonie@kernel.org>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH v3 3/4] spi: Patch Macronix SPI controller driver
 according to MX25F0A MFD driver
Message-ID: <20190502024103.GT14916@sirena.org.uk>
References: <1555320234-15802-1-git-send-email-masonccyang@mxic.com.tw>
 <1555320234-15802-4-git-send-email-masonccyang@mxic.com.tw>
 <20190419145151.GR2803@sirena.org.uk>
 <OF7742B4A9.445066F6-ON482583EC.0037E377-482583EC.0039125B@mxic.com.tw>
MIME-Version: 1.0
In-Reply-To: <OF7742B4A9.445066F6-ON482583EC.0037E377-482583EC.0039125B@mxic.com.tw>
X-Cookie: -- I have seen the FUN --
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190501_194122_070100_EE971519 
X-CRM114-Status: GOOD (  15.32  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, christophe.kerello@st.com,
 richard@nod.at, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 computersforpeace@gmal.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-spi@vger.kernel.org, marcel.ziswiler@toradex.com, paul.burton@mips.com,
 liang.yang@amlogic.com, geert@linux-m68k.org, stefan@agner.ch,
 miquel.raynal@bootlin.com, linux-mtd@lists.infradead.org, lee.jones@linaro.org,
 dwmw2@infradead.org, marek.vasut@gmail.com, zhengxunli@mxic.com.tw
Content-Type: multipart/mixed; boundary="===============7153973359572960229=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7153973359572960229==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U2mKMzaWgYxzMy3/"
Content-Disposition: inline


--U2mKMzaWgYxzMy3/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2019 at 06:23:21PM +0800, masonccyang@mxic.com.tw wrote:

> > It'd be much better to describe what the above actually means - what
> > changes have been made in the introduction of the MFD driver?  It does
> > feel like there's not as much abstraction as I'd expect between the MFD
> > and the child, there's a lot of peering into the parent and enabling and
> > disabling individual clocks for example rather than either having this
> > hidden behind a function or just having the clocks owned by the child
> > driver.=20

> Do you mean I should remove ps_clk/send_clk/send_dly_clk resource from MF=
D=20

> and patch them to spi-mxic.c ?

> Or any other ?

I think you need to have a clear idea that you can explain as to what
the MFD is and how it's split up.  What's being abstracted, what's not
and why.  Without knowing anything about the device or what the series
is trying to accomplish it's hard to be sure exactly what the best thing
to do is.

> The driver also isn't using the MFD interfaces to pass through
> > the register subblocks for the IP - instead the child driver is peering
> > straight into the MFD structure and looking at a variable in there.

> Patch regmap for mfd, nand and spi ?
> or any other patches is needed ?

This is a memory mapped device so there should be no need to use regmap
unless you want to.  The MFD subsystem has facilities for passing
through memory regions to subdevices.

--U2mKMzaWgYxzMy3/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzKWL8ACgkQJNaLcl1U
h9AjiQf/bW7XYR+RCtB5mk7NUhGOFWv7c4gcOImzc4a6QObhKLrSolCYsj2RWhcl
Gnq+EA50PHXQZqZMl6tLN7skgu1q8gHz79mwbns4pqSQtAC5Uw5PU2MWGMpBkBXl
lx4jDU7D7JmlCkkbWCOb9mi/Rhq4AAbn4yWSd4ZN+3FC2znx8HY9x/12257saaV8
ndBNuyLQdAWw8oz5cIpcLU7w+YaEYcT6qHbTbmfRBdCyIfKTxVOwq403UnLSjKW6
LU90b3lGa1zs5IP2m6rKwRCggfZnkgjvrRl9VQJXPxx3Ggyj7jG1OKBa7ia0Kf/a
QZsQU1oxCxD+GUVGvbJkybiuRYKmxw==
=TLm4
-----END PGP SIGNATURE-----

--U2mKMzaWgYxzMy3/--


--===============7153973359572960229==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7153973359572960229==--

