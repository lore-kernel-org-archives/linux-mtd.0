Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5999DE7C6E8
	for <linux-mtd@archiver.kernel.org>; Sat, 31 Jan 2026 20:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7N4x00WabAhzbpmSnEGSvY0DpJfSjp5shw/eD3lJ22I=; b=Bj4Kk95C+msWQRAHBxASipiNcP
	GoW3i4JBn3is6+w+zJvORXuJ5xcedgKsxCCKbhuH076kVxwGAaqZ3UxGFvXjrEEBSR3o9VIGgqzD0
	fExG91CPxpqpnLEOaRDh7Q41kqH6FkLkJ51UZmatcw5gIH7qHp+QELHFImQL3eL/4WiATRV+8/CF+
	TpV7wSZjuLm1UNMqdZgCHqyW8ndWNSr1TPdvvKVSyG+VemFRZEnjeolk7FhSwAMfOp+inMCZzi1l8
	J1caZOk9fS2ZMo/oMEaYoc09Q/aywQWRzW6qtpE8zGf//sdYRrqMUBQYu/ubFFfekMvD75qnV5Ype
	peYyBl5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHYY-00000002yij-27WM;
	Sat, 31 Jan 2026 20:26:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHYW-00000002yiZ-0kyq
	for linux-mtd@lists.infradead.org;
	Sat, 31 Jan 2026 20:26:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9129960200;
	Sat, 31 Jan 2026 20:26:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7411CC4CEF1;
	Sat, 31 Jan 2026 20:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769891214;
	bh=finr/t0IWVErbqezcZg2K/mk2l1/0gJ1JtoOL5FLY9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hhaaQWW/Fc8RUzZY2NYOIVNeDuq6S/Gbxr25Udm1XDdfixkW/xAhac/mSMtvNVcsI
	 wfqkVF8C8+vvVg9uRJEKCoZm3n9xGOQ7PEmuWzKt7j7UZcqlNMNO3kv0RL9VRIesAu
	 9Ny/UD/eSh1zV+yGmi4jtT6dpX/pDjJEXJjNnL/lLCKMuhpcWTwE6J/7Rw8+zHgW42
	 qhtpX8v7YFGNPOl44cKcUFGviG1m6lmKPguoHtWjrhfGvPGfNdjRU2PmFlpdsMWsQ2
	 3hbWo3berkkyW03HctonP2wW4z6PPhxz0okCKu9n09S34TsZircKAKHH2yXPWG/NZ0
	 3MCa55bhg8krw==
Date: Sat, 31 Jan 2026 20:26:50 +0000
From: Conor Dooley <conor@kernel.org>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khairul Anuar Romli <khairul.anuar.romli@altera.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd: cdns,hp-nfc: Add dma-coherent property
Message-ID: <20260131-pasty-dicing-4ed7799aa546@spud>
References: <20260131172611.28807-1-dinguyen@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260131172611.28807-1-dinguyen@kernel.org>
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
Content-Type: multipart/mixed; boundary="===============5275337995761515128=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5275337995761515128==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RRuFemgFGMlzCbXk"
Content-Disposition: inline


--RRuFemgFGMlzCbXk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 31, 2026 at 11:26:11AM -0600, Dinh Nguyen wrote:
> From: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
>=20
> The Cadence HP NAND Flash Controller on supports DMA transactions through
> a coherent interconnect. In previous generations SoC (Stratix10 and Agile=
x)
> the interconnect was non-coherent, hence there is no need for dma-coherent
> property to be presence. In Agilex 5, the architecture has changed. It
> introduced a coherent interconnect that supports cache-coherent DMA.
>=20
> Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@altera.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Why does this v1 have an ack?

> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
>  Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml b/Doc=
umentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
> index 73dc69cee4d8..367257a227b1 100644
> --- a/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
> +++ b/Documentation/devicetree/bindings/mtd/cdns,hp-nfc.yaml
> @@ -40,6 +40,8 @@ properties:
>    dmas:
>      maxItems: 1
> =20
> +  dma-coherent: true
> +
>    iommus:
>      maxItems: 1
> =20
> --=20
> 2.42.0.411.g813d9a9188
>=20
>=20

--RRuFemgFGMlzCbXk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaX5ligAKCRB4tDGHoIJi
0uqrAQDJqiDs2z9/vn0uTVoXXdfFJff7Y8B3koUjb48EyO0ErgEAvIy+w4bmoc85
T5+l9F4uA02AbVjF3Jj1hFON6oAokwU=
=e7EK
-----END PGP SIGNATURE-----

--RRuFemgFGMlzCbXk--


--===============5275337995761515128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5275337995761515128==--

