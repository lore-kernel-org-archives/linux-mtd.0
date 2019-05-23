Return-Path: <SRS0=uaub=TX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC26C282DD
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 13:48:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C19620B1F
	for <linux-mtd@archiver.kernel.org>; Thu, 23 May 2019 13:48:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qecs6LUb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="KQ6R6tGN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C19620B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8FadpllmV55+4XkiTesYu/nVCLjEC25nVbNIXIRefek=; b=Qecs6LUbczxSTYIhj0VzlMZZb
	VaaTRPD0XjGIO7349nGHFF0nxsyEVQi61SlzhX/oXzCN9PcyHTBMhdoRmxcsuUhfi8p9dXmU57VLm
	gw6Vx+QF84Hz8H9U0k0uwi65Z9esmwCmAx0kb8YfaeDJzNTx2YWHZ67Wviek2mQ0sva7guSZVEr8F
	8ZWgjJKU2AkJYNVBcp+6VY0AgN3M6YSa7si+snVuiloaOF2TZCGKksSl3KUUfl8Ec4ei4DljQtTg9
	HjCqQEbdnlJsO87m/QnVpmQoQA3N8QwKMniCY/06y/bX2QhFMIrP4UtcdS8vi1ERwUXC96JpCtU0d
	A5aVX1eYg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTo5U-0008SD-62; Thu, 23 May 2019 13:48:52 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTo5B-0008GT-Hd; Thu, 23 May 2019 13:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X6yLgBlALTmm8f+P1P/St4oPtsvR1/9CNsOiFiXV8xg=; b=KQ6R6tGNyApe5h8pwVsVlYGGZ
 NOR2ifx6p/cw3HqGvkJUeYMNLd0l4wHKzmL+jm/XlTB6BAXT0PfMNpDMBsX1f1ZRJv/8zwR+8Q6U2
 Y7ugrn80U037qfUn8jDKCssIerp3fWltxBuFlYgmscfhxJwQqOezW9qjZf8sDmVLHpmPg=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTo59-0000Do-Ab; Thu, 23 May 2019 13:48:31 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 36A361126D24; Thu, 23 May 2019 14:48:27 +0100 (BST)
Date: Thu, 23 May 2019 14:48:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuldeep Singh <kuldeep.singh@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: spi: spi-fsl-qspi: Add bindings of
 ls1088a and ls1012a
Message-ID: <20190523134827.GH17245@sirena.org.uk>
References: <20190522070133.24953-1-kuldeep.singh@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20190522070133.24953-1-kuldeep.singh@nxp.com>
X-Cookie: I brake for chezlogs!
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190523_064833_725445_526CBE03 
X-CRM114-Status: UNSURE (   7.27  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ashish Kumar <ashish.kumar@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: multipart/mixed; boundary="===============4491330211341030319=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4491330211341030319==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9sSKoi6Rw660DLir"
Content-Disposition: inline


--9sSKoi6Rw660DLir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 22, 2019 at 07:00:32AM +0000, Kuldeep Singh wrote:
> Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> ---
> Update v2:
> 	Convert to patch series and rebasing done on top of tree

These still don't apply against current code (for-5.3 or for-next of
git://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git).  Please
check and resend.

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

--9sSKoi6Rw660DLir
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzmpKoACgkQJNaLcl1U
h9AeXgf+K/fyUAneVeSKJB2PlpJY0/l0sSrrEho/KS2x1MPK84BO5He4Q7R56mZ4
qPJSsRMJwhj62P5Zj8SoxbLdWKGYqs8AAwzvVztBMhOKmj3vbYeIK/2/ArKc1xLQ
GVYEcU8HpbFCQcxhsjpUQKDpBurkZUJ2+soa7IufJM2CF9+xXopqZt6bTcbIR8/P
bGg17RQIpq6Oukz30eyRDUVoTzTyCxEFK/M34nb/+O5wK0K2cKN6NWxGxoZNFNAx
jcFXRP/k3i9aZPISHZe3nCzIyPDoq7Z1Ez5o1Xd9rSy2VajZOdaDAPxlxbEbkYIx
eiSXwFFZvSye+r7wPu1w5NDriw7MYg==
=isZA
-----END PGP SIGNATURE-----

--9sSKoi6Rw660DLir--


--===============4491330211341030319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4491330211341030319==--

