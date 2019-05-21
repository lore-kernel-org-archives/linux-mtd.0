Return-Path: <SRS0=joji=TV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1DBBC072B5
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 21:05:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95E13217F9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 May 2019 21:05:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HaKWSgR6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="IAmIMI5P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95E13217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yqHxjyRFA0n2RxMn+QBN69BGWaL/IAXkfYhuozeQDp0=; b=HaKWSgR6H/BHem4G9RCYP5+oP
	SthiFxqYJ/BWSkkY68UvUHqENhRigPfsCslmqUzvrEodNDwVS80XLwkA3mUfPd6FaiB0NMqEL2drU
	uLDN0bvEVoxPGoZ8/RFVvWO8/8SgoIxpTEZNco2klkUQmC0ujMJxmg3f3d80FZiFJK40fsSAc7cPK
	zAG5x6z4sTcSZe6TSuprYxW1TifRDqgx9x+r+e7TRC0NjrmOLs/n3GrYx+lzTBja6Ov6o7PTVm1nm
	4QOgbZ8gBRLb+l2y6OtrrVjE+kUK+E0O5AWzu+XEOkOre+gYnabx5Oj2Hu/K9kYoSYqaqSQSYPXWk
	DJ82RmBdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hTBwl-0002U6-Kl; Tue, 21 May 2019 21:05:19 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hTBwJ-0000kR-Gp; Tue, 21 May 2019 21:04:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d9M7yQ5yVOSEMt8T+B3jEX8ZpiakoXvD5uTaMsNBD5U=; b=IAmIMI5PjJ4StIZLqS2qHjJE3
 +BDscThjnoxlmE0lqyuyituvDJBsLSMqnf3n3vX3KTrNDOsSuKPYB0IJw1ZIcQNY7pZayaKKUmm5X
 kn4Ex7wD8OeJTV8bwAqN4WCx3Gg6vCCrJ5F9PoD74EC9oC11Rq48uXTuiC2NPrren6R9E=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hTBwH-0002Et-Sl; Tue, 21 May 2019 21:04:49 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 6C9341126D13; Tue, 21 May 2019 22:04:49 +0100 (BST)
Date: Tue, 21 May 2019 22:04:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuldeep Singh <kuldeep.singh@nxp.com>
Subject: Re: [PATCH] dt-bindings: spi: spi-fsl-qspi: Add ls2080a
 compatibility string
Message-ID: <20190521210449.GB1580@sirena.org.uk>
References: <20190516104046.23830-1-kuldeep.singh@nxp.com>
 <20190516104046.23830-2-kuldeep.singh@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20190516104046.23830-2-kuldeep.singh@nxp.com>
X-Cookie: Klatu barada nikto.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_140452_398512_5D6EF7DF 
X-CRM114-Status: UNSURE (   5.44  )
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
Content-Type: multipart/mixed; boundary="===============8113733585695308293=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============8113733585695308293==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gj572EiMnwbLXET9"
Content-Disposition: inline


--gj572EiMnwbLXET9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2019 at 10:39:45AM +0000, Kuldeep Singh wrote:
> There are 2 version of QSPI-IP, according to which it can be big endian
> or little endian. There are some other minor changes as well.
> The big endian version uses driver compatible fsl,ls1021a-qspi and little
> endian version uses fsl,ls10280a-qspi

This doesn't apply against current code, please check and resend.

--gj572EiMnwbLXET9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzkZ/AACgkQJNaLcl1U
h9Dcggf/a5SCEOq1f8Uztg6sAxsCy+2TMZDAfoiuy9SH76QY+e6nHxdy+DrXkwPC
RGL2sLSSC9pbd1BqabLJn4+ivFrbs3FN6pG06RXTw8s9bm/jPC80df67eNaLt6Fq
Omyq0iYTAw3KMz3TyhdzmBeCS5T44EG+39ofRW5O2xms+mkXNPB7D5a8UjTj9OXr
vLoM4lx0yWLiMZ1KMZ0pc4/A9O3JXpamPmUn6+sYlVkW9680sM5ve1nzC3x9my0v
f4rFFjcJe/cFZ5PxkRMSeDeyJQTHRk3tWGnMBl81zKY0r+5x2Qfe/xg7tFHBNr7S
z6yi+WirwaH7QY8lCWCfWu9EFdwBSg==
=Titl
-----END PGP SIGNATURE-----

--gj572EiMnwbLXET9--


--===============8113733585695308293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8113733585695308293==--

