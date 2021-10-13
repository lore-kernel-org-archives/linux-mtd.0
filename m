Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DA8C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 15:14:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EC1060F21
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 15:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EC1060F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4iTc/zBF53CDKNS6DEzEaz8+sjSLo/cFERDnQlxjkbo=; b=swRhrPd+HG3RpdbE0esPtikefd
	ueonm2a3/N8+fMEND2V3w6fMYKtcBoCyeiwJnpLppnuPKBRN2X7JXEEfus1A+DVYTBgxz2p+ZWP3S
	6BZhn4kU/CLMNVkuxA34p87XWQfcCweRX9SXiJnMSBv2p3ik9c/nZvSiaKb0hk61ZkkBOv7LGAnf3
	R/jgArWI5ZTJj3jxlLbRZmATDknL6MCSDcf3boPzcDazM+gGvI+EGudzyp42IIqYYSJ+OmmeebGJl
	ewctww3jvm8t4hgWsrqGwj8TtdV+gwLItDeFTvkVy1XP1w0CREiH37PBWMq+ZIFg7pxzRlBoToABh
	6FPJjECw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mafxA-00HJUS-Qc; Wed, 13 Oct 2021 15:14:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mafx7-00HJTj-Rv
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 15:13:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 07E6E6112D;
 Wed, 13 Oct 2021 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634138037;
 bh=jXEjCQ9GP5WHEHcqrHbhspO5YUVhZplNlVhS8sy9Lzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XpS5Xg6Vx+UP1oXKCWFL3THSryz90MTMKxTRARY6xHSmUE2locTh/5upu7UeVy3Kt
 2SjNc2qeMXU9AvE6YzumlP/weWnKQ/fezGz90W3st9Jjm3yqkXJAPUEzCsMMyaJnD1
 Rd2eSHP7K92OJwqUgeEBcetC/nB6X8k1zNHX8CHKbGsAmeiA2qATqqnf5bsO40NI6k
 if2ReofH1yOFzq9SshOP0hE9Swl3uAyZKI9Oyp9MRvEBM52qFZWtv+ZlPLjqXe4nLH
 y/LVggddGF8aU6pkCjjDlo/ojDPF7inLzCEnqrK9W6y23fhKoi1Zho3zJlieZvC6lK
 Q3ywaYyH4dXqg==
Date: Wed, 13 Oct 2021 16:13:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2 13/20] mtd: dataflash: Warn about failure to
 unregister mtd device
Message-ID: <YWb3sjwS2FBsLHzL@sirena.org.uk>
References: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
 <20211012153945.2651412-14-u.kleine-koenig@pengutronix.de>
 <20211013144429.65b294e5@xps13>
 <20211013140835.olo2dxdno6zlom7n@pengutronix.de>
 <20211013163357.41c7471d@xps13>
MIME-Version: 1.0
In-Reply-To: <20211013163357.41c7471d@xps13>
X-Cookie: Where do you think you're going today?
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_081357_941236_4E5E1ABA 
X-CRM114-Status: GOOD (  13.32  )
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
Content-Type: multipart/mixed; boundary="===============0606100581212937540=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0606100581212937540==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9MC6GlOh61zZ2aFG"
Content-Disposition: inline


--9MC6GlOh61zZ2aFG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 04:33:57PM +0200, Miquel Raynal wrote:
> > On Wed, Oct 13, 2021 at 02:44:29PM +0200, Miquel Raynal wrote:

> > My (German) knowledge about the English Grammar claims that independent
> > of how you spell SPI, it must be "an" because when I say it, it's
> > [=C9=9Bspi:a=C9=AA] (unless you call it [spa=C9=AA]?)

> I (personally) pronounce it [spa=C9=AA] with my French background and it
> looks wrong to my eyes to use "an" before SPI because of that, but this
> is biased and possibly wrong as well so please keep it your way, it's
> fine.

I'd say a here too but really don't care too much, I hadn't noticed.

--9MC6GlOh61zZ2aFG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFm97IACgkQJNaLcl1U
h9D3oAf/TK7RMgsjwiupY4yI4pFAx2nOZ49AJm1rXlXuce/vB8g2nUzu/wSjiQ2P
Sk6GO55MacBvHfV2bqAO0eC3R2u5r8lUqNaPxox8XYch1g7fCSr96ctl3IudvQvU
tq6VirXogCT6DOY6/iHdXR0+zZpcoh0pDvhbpDxnk8VpKFl0Z9VgP/OLPnkriGQW
mNolEk2UP/n1ZWQj9NY4jnZQRWSBorT3hrKbINLMG4DkFqUlNqU3rh0o22aB5cpB
cZn3ncZmj7sBrsg4vXIzdacClRgt6Kh2PXbO1AzF0WAePF5AZ0nmSOIBg7KONbHz
zpLVgnpm8xD/bEOHSo3A9WvppUYAKA==
=ngOE
-----END PGP SIGNATURE-----

--9MC6GlOh61zZ2aFG--


--===============0606100581212937540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0606100581212937540==--

