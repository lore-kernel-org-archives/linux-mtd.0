Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CB4C072B5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 21:04:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DDDF217F9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 21:04:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HDnY4YsK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="FMU+Vxyn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DDDF217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RVLUT9HNjHuBIXvagl2MSQJ1Pdm4C6vEKcIjiFYtDyQ=; b=HDnY4YsKaVIHoiOjO3OJqjJ1J
	JTNH6gjE63q2vK2XfruohwE/YybvAjXymBtru09eHoTfT2Ars59Z4iqGqlNW6rQHeUL1m3mMomCe3
	jVjD+uqWgi89DMsPiUQfAF8w9VOxXN6/+Wg+M5w047NmwM6N8pql0je+LSfew0FsyPi5iJ/qZHdg1
	M9QUmyLtyqE1ifbeOv/IMuICm7M5IyOFMbsFFxewLHov/YyUpxl2NhzJn8Ub/b7BWGGzV0UDc/6V+
	lOONwDvJ3O+vd4hu7/ZLH62BctziWksxBPg3pC8GwdqrHVrORncwLFmwZ274ZNQY/1sZ6IxhL5EdY
	49KlTkCuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTBwG-0000gE-0I; Tue, 21 May 2019 21:04:48 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTBw8-0000a0-8A; Tue, 21 May 2019 21:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lf74MmlnwlqtCdDja2iANRseC3EzphEbvnFJ2OJtzSw=; b=FMU+Vxyn1gwlgIJAIeG/efv6e
 dNzYZ6Nd4YBOJfKY/6Fr3gOQlWMmuLUS12PmHYTh47j0SVall3ZA03RP40A/I3JOB5kG3vjACr49p
 huaNhz3iRq2rhRehBsP0wKhVDDc5I9lBk8fTBKxcioMVw+ydrFNP6xXVaEBbxD/hZYyOQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTBw5-0002Ek-6C; Tue, 21 May 2019 21:04:37 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id A17D91126D13; Tue, 21 May 2019 22:04:36 +0100 (BST)
Date: Tue, 21 May 2019 22:04:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuldeep Singh <kuldeep.singh@nxp.com>
Subject: Re: [PATCH] dt-bindings: spi: spi-fsl-qspi: Add bindings of ls1088a
 and ls1012a
Message-ID: <20190521210436.GA1580@sirena.org.uk>
References: <20190516104046.23830-1-kuldeep.singh@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20190516104046.23830-1-kuldeep.singh@nxp.com>
X-Cookie: Klatu barada nikto.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_140440_458151_0E476CEF 
X-CRM114-Status: UNSURE (   6.00  )
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
Content-Type: multipart/mixed; boundary="===============1639020026393184082=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1639020026393184082==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qDbXVdCdHGoSgWSk"
Content-Disposition: inline


--qDbXVdCdHGoSgWSk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2019 at 10:39:44AM +0000, Kuldeep Singh wrote:
> Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> ---

This doesn't apply against current code, please check and resend.

--qDbXVdCdHGoSgWSk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzkZ+MACgkQJNaLcl1U
h9ConQf8DxUshxU2LvQL9Rur0EMgkGTiclmopbPNfSEPKCIyykDv0DB5Po34Lt91
b2n4r4A2ohe4Huy8/tNniwrXPDqam8fuxSqE9HxYnFIiWkBcvR+fWYXxvHb/hASS
ZMISJFt7Y2HCyqad0X6zB4Q5V8zvu/iukNCuMY3X4x/9fQVdUvbcpDEeDxFdAt3I
ZQsQZ4CkP6JkRwlXNADuGgvWvnnH5XZSBonz/AuUSQuul59EnaxfB9NHTort0bu1
6dI7IVOkGaf3gbxuPxOcSME/f0yUGQw9H180Ulf8w/r5O0MYer6F6exCQbHkWne/
HVm6I+571Rqbr/Ob8J9BBVGT57TLAA==
=be/b
-----END PGP SIGNATURE-----

--qDbXVdCdHGoSgWSk--


--===============1639020026393184082==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1639020026393184082==--

