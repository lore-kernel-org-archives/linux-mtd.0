Return-Path: <SRS0=F8YS=QN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BDC8C169C4
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 16:08:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DC74217F9
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Feb 2019 16:08:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lgTXjq/S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="grIXahZ8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DC74217F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2NPGYm/tgnWnxutMcckq21JYhB+DDbROp08moCbl5f0=; b=lgTXjq/SWAcWurUVlidKJBmf5
	OjQmJ1OWMiagtmVzFCCx9oQ2MTOp23rV0DKaP9SJDSj0tTtGuvmXQIQhDxspmY1qUG8t9rcuDcMe8
	8uY2i2kLndsG8GzUtyJKHi6VokYlDwcYMfo+YmlQyojJEDmlLug9P6duNuxhZCHHvIOAXHeKfilOW
	noL4Qy/5JVX17rkjtWIw3ThfYThHAJ9XQ42GhKmah0bFuVBjsnEDyh38R3upBASJUDf3sOhqYaLEh
	3DJxBwA0v+O8h5iuwSY+iFFXSL39gR5coLRPLuXWycqWZur4z8UU2be2vgm4Px5p3vvuICuV7Gw0J
	F1rBnUtkQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grPki-0007ym-SF; Wed, 06 Feb 2019 16:08:44 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grPkT-0007n9-NL; Wed, 06 Feb 2019 16:08:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WoEo4TreuEOnYRgdmDLp325sBp/GToj/Jo7yOYszqck=; b=grIXahZ8baCm0LQnjSbhy2IVK
 k7H9LsProEhhxCDqCfAWmNq0+WiqdDjaHD5kD24Tk5D2NkIOLCD0deKej51tB0PuJsvKehynu8u9I
 kMy8PoyCLSphhlIhKav9nSMubNEjtewgElsXOIydEx0TUhcP9AIkzwbJS2s52wE7kHO9o=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1grPkL-0006tB-R8; Wed, 06 Feb 2019 16:08:21 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 43FE41127EA3; Wed,  6 Feb 2019 16:08:16 +0000 (GMT)
Date: Wed, 6 Feb 2019 16:08:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v6 01/13] spi: atmel-quadspi: cache MR value to avoid a
 write access
Message-ID: <20190206160816.GD17630@sirena.org.uk>
References: <20190205173254.16388-1-tudor.ambarus@microchip.com>
 <20190205173254.16388-2-tudor.ambarus@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20190205173254.16388-2-tudor.ambarus@microchip.com>
X-Cookie: In space, no one can hear you fart.
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190206_080829_903608_2903AFF7 
X-CRM114-Status: UNSURE (   8.44  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alexandre.belloni@bootlin.com, bbrezillon@kernel.org,
 linux-kernel@vger.kernel.org, Cyrille.Pitchen@microchip.com,
 Nicolas.Ferre@microchip.com, linux-spi@vger.kernel.org,
 Ludovic.Desroches@microchip.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, bugalski.piotr@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4489162608821129090=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4489162608821129090==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="osDK9TLjxFScVI/L"
Content-Disposition: inline


--osDK9TLjxFScVI/L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2019 at 05:33:06PM +0000, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
>=20
> Set the controller by default in Serial Memory Mode (SMM) at probe.
> Cache Mode Register (MR) value to avoid write access when setting
> the controller in serial memory mode at exec_op().
>=20
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
> v6: no change
> v5: collect R-b

You say you've collected a reviewed-by for this but there's no
reviewed-by on the patch?

--osDK9TLjxFScVI/L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlxbBm8ACgkQJNaLcl1U
h9DUSwf/SwsNZqQQTTU5XFciBiMdWRRBaxg3WW4hWjTWIrLVYjcB21QsuvC9Sxds
4yfqRnDD0VNgpxnNN2UhQ+RuDXjwpvZasc3goyrR432ilG/+GdRRNWLMGkxxRC8u
kcEG3E6TSA2WdXRahvhepBK53R7lnnYD8GdZIrOMNKu0c3mJdX3Ksy3aYZ9XD0Rf
k+uTgCHDekLYThyaxeWc52Npo12yh8oOJt4VzA4+olU5ZQ/mqptZM5hDNc0b5VrJ
YXeLvvSkog3krfdK5mpDrcFp0/zg2vAqat8d5TxqR3dR8z3LRyxykfTOH5ZAjdP/
kYJ5nrbTOz0QV1Ato4twWY63x3rKkg==
=Ij/B
-----END PGP SIGNATURE-----

--osDK9TLjxFScVI/L--


--===============4489162608821129090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4489162608821129090==--

