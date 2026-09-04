Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B937C79F82
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 18:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOQCsGJluVQeWXTccp6hO1m8o3jl91ZT0RgW4q2hUz4=; b=iEAC3NjmifOIm8AemBFGj+4CPg
	hiiuninHzzqmyu6La8C46L7ajMyYW85KjmtWg0wBf9fiAqEokPWQcJTP7LSz2FiQSdtJnieX0Ve/3
	cC6WcLRe9V4+PFUD7USPPuz0rDIYxbZ+zfY3tzBbaqjagmuddHr5yy+8jN5OjohgcRUuA303RDE1B
	JiHhSMm/Rdxp5h6nvJMkYbyi2JTNp1j3z/32ZvV5DsU4u0y1Ut7ZIDfVCzFlb7d7zNpKgKWGn5HpE
	zsfPYiM/QtjPWt2oqLEb6a4dNLdXGMXgHn7ioXbPbqBPeynJcwl6rsW+0dKS5IwcMxKrb0Yf2r/sQ
	ZPOpeUPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Yo5-000000035Vq-3duP;
	Fri, 04 Sep 2026 18:38:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Yo4-000000035VU-0Dvc
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 18:38:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42DFE600C8;
	Fri,  4 Sep 2026 18:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6CBB1F00A3D;
	Fri,  4 Sep 2026 18:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788547111;
	bh=SXyJ6920QF42qa44IDGNS2RwOkKRcWoyi4Fs69ey/6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l9OQ+/Np5chFEKzkkf9owVEKIy1jBhY/SCNIhONzZxq3sLpywfgcl235vLcdkeU7r
	 84nTwWplQ1gVBxYuLbUpbLqJEL1Dyop0VPXFzVOGYV8JLU/atJtmI8Jma/cmfOB8YL
	 B61EphGC5Y5xTCOadDipz2Zm6Rah/RFjGmU39HmYO06UmSCJ0pg/BwGA5877MWou2x
	 f8H9uq9nikzvQfc9ngRSmmSTZZmRL284/xQAzmlSohrNXfkLVbAFfkJ7hyMZ1NRiYV
	 VcSnYyQbwPbicwDE4cj1usl3s7h3Rsi9KU+M6frObJP3bSMt3j6Uyui+gdhQH5QzQC
	 oJXAf76DSZJZg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 4EFC11AC52F1; Fri, 04 Sep 2026 19:38:28 +0100 (BST)
Date: Fri, 4 Sep 2026 19:38:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: md.alam@oss.qualcomm.com, Johan Alvarado <contact@c127.dev>,
	konradybcio@kernel.org, pengpeng@iscas.ac.cn, j4g8y7@gmail.com,
	quic_varada@quicinc.com, quic_srichara@quicinc.com,
	linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: spi-qpic-snand: publish the ECC context to
 snandc->qspi
Message-ID: <apsQJFvhnI-1V8DE@sirena.co.uk>
References: <20260825013848.1056946-1-contact@c127.dev>
 <178854349408.1467647.16557341714581809344.b4-ty@bootlin.com>
 <apsKiRC-bn7oPS2P@sirena.co.uk>
 <874ig4zx4o.fsf@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <874ig4zx4o.fsf@bootlin.com>
X-Cookie: My vaseline is RUNNING...
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
Content-Type: multipart/mixed; boundary="===============0747611462060919976=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0747611462060919976==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mXqNAXms/6jab0lX"
Content-Disposition: inline


--mXqNAXms/6jab0lX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 04, 2026 at 08:31:35PM +0200, Miquel Raynal wrote:
> On 04/09/2026 at 19:14:33 +01, Mark Brown <broonie@kernel.org> wrote:

> >> [1/1] spi: spi-qpic-snand: publish the ECC context to snandc->qspi
> >>       commit: 93bc7c4d2f4198586a6dbd7797c3bbf1ca845761

> > Oh?

> -ETOOMANYKEYWORDS ._.

> Dropped, my bad :)

Ah, OK!

--mXqNAXms/6jab0lX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqbECMACgkQJNaLcl1U
h9D9lAf+IZaw+kwCDRnV/MFBJfEhRpBMSvA1Py8PNv+9liGULZ1JWolFUk4gjThw
hLGJuDu7Pvt9rsK82ONydDPMVHxi3vGJwrgo21NLF400e93nof+s+C2rbvBZC0H1
RIl4Ja3jG5jd9/s50HfXzqA/qQUiDMyRINZz8I3LKcbWzxzMZt05qDU02LvA1vp/
mE9vo7+AcpGTcuFt88ncnawuXxyQJrKQ+xb9jTUovhkSkOjxjbVdCwf+LhkT+Q4E
pjgsYj3ZgSimphapOn4nApeuZv6eHjHKzocc4L2tGmO+vuzSgUbQYjbEVp8EkkTW
P2PZzsX9KKsbHhBAwkoEEltuTgWdxQ==
=OfTx
-----END PGP SIGNATURE-----

--mXqNAXms/6jab0lX--


--===============0747611462060919976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0747611462060919976==--

