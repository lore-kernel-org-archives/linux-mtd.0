Return-Path: <SRS0=I4i7=4T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B1B8C3F2D1
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 12:22:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 694772173E
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Mar 2020 12:22:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GnQ5PYEq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 694772173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TpMlQid1P6rwajLe6X64JU0h8pGCWy/4TA7wBwid6ms=; b=GnQ5PYEqoj/0w2wDSDonHPBdZ
	a14wq6PeS0G44EhY16twfGUAPkOQWEZ8JlYFduZTiUahKSELY+HTuFBa4SXsr2eYiWZExTOTY+hX0
	DeVAd/YAEg8Fbfpk6SL3PrzxwIuVZHmjID12DUpMFpX0Cj/Qi7GbSYB+fgP32KlV+Ibj2HU64lLHp
	r05KGVmzGL+H43MBAsfS/EJyLvPoHbqkkIZSNGCCi9YPPAU/7VB+0F1/flVQpm54hiwI1sgzP1+Z/
	gYwh6SLFItDFj6aQyc+CRzQ45dJmsSCzoXFyFQzSJGeWKh6DxhXVNTAcfEZrJRvrhUNYU9eG05+Cm
	MwsSgjUyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8k5e-0006pQ-P8; Mon, 02 Mar 2020 12:22:30 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8k5Y-0006oZ-SW
 for linux-mtd@lists.infradead.org; Mon, 02 Mar 2020 12:22:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BAA52F;
 Mon,  2 Mar 2020 04:22:22 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3AB73F534;
 Mon,  2 Mar 2020 04:22:21 -0800 (PST)
Date: Mon, 2 Mar 2020 12:22:20 +0000
From: Mark Brown <broonie@kernel.org>
To: John Garry <john.garry@huawei.com>
Subject: Re: [PATCH RFC 1/3] spi: Allow SPI controller override device buswidth
Message-ID: <20200302122220.GA4166@sirena.org.uk>
References: <1582903131-160033-1-git-send-email-john.garry@huawei.com>
 <1582903131-160033-2-git-send-email-john.garry@huawei.com>
 <52ecb988-d842-c04b-a0e8-93e8850009c4@cogentembedded.com>
 <07bb2213-5543-0ef0-9585-be83026c1199@huawei.com>
MIME-Version: 1.0
In-Reply-To: <07bb2213-5543-0ef0-9585-be83026c1199@huawei.com>
X-Cookie: Whistler's mother is off her rocker.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_042227_888862_A5546BFD 
X-CRM114-Status: UNSURE (   6.94  )
X-CRM114-Notice: Please train this message.
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
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, linuxarm@huawei.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, andriy.shevchenko@linux.intel.com
Content-Type: multipart/mixed; boundary="===============2147521558047107557=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2147521558047107557==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MGYHOYXEY6WxJCY8"
Content-Disposition: inline


--MGYHOYXEY6WxJCY8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 02, 2020 at 09:30:08AM +0000, John Garry wrote:

> Do you want me to do anything about the above superfluous newline?

Whatever you prefer, I don't really care either way.

--MGYHOYXEY6WxJCY8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5c+nUACgkQJNaLcl1U
h9A0cAgAhO/A6BTXUMWdGAfjAzNW8PGJ9Lj4J+5Bx5ztCAo0mIWdqA6Rvvo0jCqj
+rqUFeBsR4ym3KMc/r7piRdyd+G/o1ocRMMsV4A65kZ0LDAfMrvnYriUbRiJ/Esq
czu2tBBtbmHHD+j+LK4vl93h55XPm8L/Jk0Zc6mbwEWm59wNDePbIjxsugiY/bzc
wU0OjmZVIXAi7ydgkXmEzDMgd5hg8uVIVatw5tLqwPtVBJE0WJS8vBtk9yo9GMmh
5A5HJDcTPoxU16RlR/KbVbxr+HYxP2tCBTHe3xpUgGxijuFpIMcvdkGoA9UVAdVU
oBL1j2g7XpgsNnryB6+dxQ2FR52DYQ==
=yrZR
-----END PGP SIGNATURE-----

--MGYHOYXEY6WxJCY8--


--===============2147521558047107557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2147521558047107557==--

