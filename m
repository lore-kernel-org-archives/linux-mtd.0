Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DED2606D824
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 08:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=h1BcFCqP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O3v3idTh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=swE4OWcLp7B3HxeNzYOw4wkA0JwLhbOVmOx8CW9wUZQ=; b=h1BcFCqP88kEk+35IQqhTuRD7R
	U/k8tl/m7AACDKoZXBbu4EcjglHpsbI4ujSkG0n1SuxjHTnM8yyZXTMwdAP2PcgrVFJH0JqftnNoA
	smdUisFRuPqMObmjc5qmX19Iu31zgdKnV82LIId8vtnCI3wBjDuYPt+7xOOSIhn/xDq8HsX3TZTcs
	cgfxldUlLmEuxJHDSny0LobXRgOjQn/Z8QqD41lOzrAZOnUoJ2HMAAZ+mnw7dX+URJ7H4w3hxA4ON
	TaDMLx9AmyFT46lA2O9rvjkBqLw3aXfEBhtc09Xna6R4EGJ3LWp5Z77DpR0WX6aY6dQcsvikrP5cf
	dc0Q9AFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL6K-0000000090B-2srb;
	Mon, 09 Nov 2026 08:51:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQL6J-000000008zY-1cgw
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 08:51:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 9983A60234;
	Mon,  9 Nov 2026 08:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id C845C1F0089F;
	Mon,  9 Nov 2026 08:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794214298;
	bh=9N499Ob7uCXTQeit1tcbXdiS0x8hkEdAz+plrn1iml4=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=O3v3idThEM4V5gHX3fry8tzWZHqk+mjUtvHCqv9QoPe3U7/1BtL/5mbMCmDa2ri5Y
	 lzg9rNfXtlYdh5QF0T5n50CkQ78M0QdRejumr8jZK/46cra00FOPsIo/OdFzOMGMQO
	 MxF+2mgZNDYgLUQ3NeKgZFJ71G/i3Qqr9qgK6AzWReJV75ugbAgUSeoxACaWhu25XR
	 LuDjUKdLBGs93HfkNWJ+OGCTo1/NaatjxsrpxfHl7rlu4InRKei34gFU54YzUI9xmH
	 t/QMUVuJxhwE3xFwmg2qmjuQsch9+QGSSv1RUvPBKrOZc/cISRtk8wjSvD02Hva12H
	 ScvnRz6sarI/Q==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon, 09 Nov 2026 09:51:34 +0100
Message-Id: <DMQJVVTSK5MO.2VQC80RTHL9LN@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: gigadevice: Add support for GigaDevice
 GD25B512
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <stable@vger.kernel.org>, "Adam Calabrigo" <adamc@arista.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Matthew Parker" <mparker@arista.com>, <pratyush@kernel.org>,
 <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
X-Mailer: aerc 0.20.0
References: <20261108022011.898185-1-mparker@arista.com>
In-Reply-To: <20261108022011.898185-1-mparker@arista.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4310521735821749931=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4310521735821749931==
Content-Type: multipart/signed;
 boundary=2959569091a881720d3f0e7e7081a33726b4f4f00782f60b01c059725bad;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--2959569091a881720d3f0e7e7081a33726b4f4f00782f60b01c059725bad
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Matthew,

On Sun Nov 8, 2026 at 3:20 AM CET, Matthew Parker wrote:
> Add support for the GigaDevice GD25B512 512Mbit (64 MiB) SPI NOR flash.
>
> The chip exposes valid JESD216B SFDP tables including 4-byte address
> instruction tables, from which geometry and opcodes are discovered.
> Stateless 4-byte opcodes and status register locking are enabled. Read,
> write, and erase functionality across the full memory array have been
> tested on hardware.
>
> Cc: stable@vger.kernel.org # v6.1+
> Co-developed-by: Adam Calabrigo <adamc@arista.com>

Co-developed-by for just adding an id?

Please note that we have some requirements for new flashes, see [1].
Same for the your other patch.

-michael

[1] https://docs.kernel.org/driver-api/mtd/spi-nor.html

> Signed-off-by: Adam Calabrigo <adamc@arista.com>
> Signed-off-by: Matthew Parker <mparker@arista.com>
> ---
>  drivers/mtd/spi-nor/gigadevice.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigad=
evice.c
> index 6a2e6ebda148..de96cefde516 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -64,6 +64,10 @@ static const struct flash_info gigadevice_nor_parts[] =
=3D {
>  		.id =3D SNOR_ID(0xc8, 0x40, 0x19),
>  		.name =3D "gd25q256",
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
> +	}, {
> +		.id =3D SNOR_ID(0xc8, 0x47, 0x1a),
> +		.flags =3D SPI_NOR_HAS_LOCK,
> +		.fixup_flags =3D SPI_NOR_4B_OPCODES,
>  	}, {
>  		.id =3D SNOR_ID(0xc8, 0x60, 0x16),
>  		.name =3D "gd25lq32",


--2959569091a881720d3f0e7e7081a33726b4f4f00782f60b01c059725bad
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCavGJlhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iKtwF/XafQtXrjmkWVp7htuglmkvXC5qEsgkhq
+aM4igg92sBank0syXm1X1BDBT1ZKGb2AX9DEZp5Vh0mDuxMgyOXr6DsTvfM79Dr
F1FXIheSWeOe0eF8EmH4AP7TEJI787tHRpo=
=ZdXO
-----END PGP SIGNATURE-----

--2959569091a881720d3f0e7e7081a33726b4f4f00782f60b01c059725bad--


--===============4310521735821749931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4310521735821749931==--

