Return-Path: <SRS0=SfKP=QC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B82FEC433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 13:04:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7927661BF9
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Nov 2021 13:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7927661BF9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sG85UgBJG/W3ytPn+mqNvfPNNTso/jxVmd/2RtqtTi0=; b=rI3olFIX7YtDEKx4WdLGH7op1n
	oyUjD2zl+E1h4Vd4cUeLS/3hU9+jzQBLEb3FgzwKZEUR1W8joqcKGf/HwTGrqayegZV9jz7nZ/gxQ
	DsFAzNQk3RQ3PbYV4gPiZnKheV2KRbwMyr9itDNlVIteL2AwVKkt+M3aDae1d4VGdOW7q+IDuKeWi
	hDeuzdAHO4KE5JRil1WX0CABUWFLHHEmHeMA4lNU4wz1iAkENcTgTMz9rlyMTlHTdlisSJYfQ6gdm
	Q9zJ00R1uhgBmo+SehAjkxDJL7tPiGDGro6OPmeeAlN6abtj4eiVrc5pbQUKtUh4x2TiajfcmNwoF
	GC8xpy4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmbeb-00FZpb-LK; Mon, 15 Nov 2021 13:04:09 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmbeX-00FZkK-M0
 for linux-mtd@lists.infradead.org; Mon, 15 Nov 2021 13:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=OLQihzRKyh2y1tQZCycpI3W9roJE
 NIrd1K7JiBrcKzw=; b=e3Bu02K7i7uyvNYMDoFHa46HUAPsXRIPSBTVuOHM4mR/
 vrYNlMettOwqW611Y6BjqKTTJzT2FGszgkpJme9B3HYLTrfcCET06f9hgR/7WSXY
 8l/kPvJQrXup+4Myb+hu4+4gmiBxQ4m2sErKCtDDPnUsCwNHfRw+js+cxSlSvus=
Received: (qmail 2337764 invoked from network); 15 Nov 2021 14:03:50 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 15 Nov 2021 14:03:50 +0100
X-UD-Smtp-Session: l3s3148p1@2jancNPQvrYgAwDPXwfBADNdh3YJLcIx
Date: Mon, 15 Nov 2021 14:03:50 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2 7/7] memory: renesas-rpc-if: Add support for RZ/G2L
Message-ID: <YZJatk2Xs6bYdCyB@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Mark Brown <broonie@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
References: <20211025205631.21151-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211025205631.21151-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
In-Reply-To: <20211025205631.21151-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_050406_032656_F6D634E6 
X-CRM114-Status: GOOD (  13.82  )
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
Content-Type: multipart/mixed; boundary="===============0288445489181130848=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0288445489181130848==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ih87i6XTGwSWpEQ3"
Content-Disposition: inline


--ih87i6XTGwSWpEQ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 25, 2021 at 09:56:31PM +0100, Lad Prabhakar wrote:
> SPI Multi I/O Bus Controller on RZ/G2L SoC is almost identical to
> the RPC-IF interface found on R-Car Gen3 SoC's.
>=20
> This patch adds a new compatible string for the RZ/G2L family so
> that the timing values on RZ/G2L can be adjusted.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

After some internal investigations we found out that we have to live
with these magic numbers. We shouldn't mix documentation there. So, this
patch is fine as is. The minor nit I will fix incrementally because I
will work on this file soon as well.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--ih87i6XTGwSWpEQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmGSWrUACgkQFA3kzBSg
KbZACQ//QW6h49hTvyDnW3FXxCnOu8Fjy4Du93vzYyiffKiu1rT1kWz/eCxEDYIe
nAjwuUERonPPxtlnfyH7b1ZvC4wAde8dskw01huc7sJT/gNFHNp5t20B9Aj1R/eP
yMNoG5cEtDcYNUvjTQkfLZ9XQvH8m7KWVQUOcVx9IgCnCL9QGzOe6lGVADhTf5gX
orNojeAF09rUS/VkjzEbvcsx/8l4zKHQYmYWEIb9Q3nPvrv3UtT0DZeK7S9r1LMi
NsCrQCTKQQ4F31Vl3VQQMF+WhO3hGHXpzQKWK6MjccNGA/HgccptkYmgx7MECgrX
+k5deLVADSt18C+1ExdaODcD056JYw39cqOZL3Ig1K+9YVeWDFXXIcfFGoSUwFNR
eCn6Z+ps5LWaVqRIUkLHjo6X80IXoK3Z8GX2R518BLxc+tLRZbC0LObGPmIr3T+l
U0AE2NjVxscEFB/CFHRx4JR0W1ywyD6ZwbIoZVo2Mf5kdvjzJGajGRrGQLbPzLkO
9K8as9oOsjHwDhMKTJ4a8/9qTzWgsmzz5x9hZB+30g8JJm9l18+s0EKHFwmt0kR/
Ly0L8nVSI3C4NSTf+i02jsxC5wXoUXUZzAJc57XdME5SQEGxEbDJNbNvhstKsyZh
je4ZKZtMQKci6ngq+QhKF/eODcypttoHlG886SPcmoH5W+U6cKA=
=JiqE
-----END PGP SIGNATURE-----

--ih87i6XTGwSWpEQ3--


--===============0288445489181130848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0288445489181130848==--

