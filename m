Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDBCC433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Apr 2022 13:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=md6pMd1UnXv/LwlUQHSbSpZZPyHbbM1GLvak8LcO1y4=; b=OpkyoQvNHNswoPgoYdtwgrX6MA
	Kke8yC6weQQ30DfKbGam1SPMgBAxE7+Nxwrjevg6nPPnZKGJ7FqkjqwSN2X3KLgL3GbiNRV+6PaGb
	fyeT3sEa+SqTWhSYVg0Ek5qSn+KEWQcCe3rnY1777GXrSJ6aPKF+oDiojDvQUUf4YMCPoaoP6r0AX
	YXFxy0Shj2r69DIFYydSKggBL9w7dCzbPywDg7K/MO9lMS45eW0LdOIkgFLlBt7I8NS4DrYxNTZvd
	Wtgp7Jl2qj7cc4c1z4h7I45Avh7nrhiG3rBd+feL7oGKiOcH7c50bJU3SETJVCTaONPOveezwDL3o
	bNqAVxNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngnoC-003o0t-D3; Tue, 19 Apr 2022 13:22:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngmjD-003Nyr-Or
 for linux-mtd@lists.infradead.org; Tue, 19 Apr 2022 12:13:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6E432B81867;
 Tue, 19 Apr 2022 12:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5340CC385A8;
 Tue, 19 Apr 2022 12:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650370385;
 bh=FzB9R4QNdtle8G5es3X6MThPPUPCJpMLRg4hyaJlBQE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DWJGvi/jytrDuGlM5FSavn5RIkiTwr07ACM995obH4t8uuuVivW0CbedGWOuDCKnq
 27FV9Zi3l5J5im79ASlXyvYHMLvMm3lNYXlwezt5s/3h1JpSbi1425kvuwvVaaSUgn
 X7KAxxnT9jLw0PgDiNUvbuCar3P4FbbwGkK3wr2wZ+2rayjy7kzLukUV2816zSZh2r
 /0h9qvl3no4cHgMwXJMLGElcdwLMJM7xLEc2jWf460Xm3HMdKPiwH47W3qMhovJrvq
 NVZxYKY9ytNaDZv2QcwxGuTvnm0qzXD3coO0u2bXeGhdOHFIdBTi7DBNq4hc1OGDXd
 aff6G+DJNy4yw==
Date: Tue, 19 Apr 2022 13:12:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Hongli Li <hongli.li@intel.com>, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] spi: intel: Implement dirmap hooks
Message-ID: <Yl6nS0kSdSGOCYM3@sirena.org.uk>
References: <20220411113158.2037-1-mika.westerberg@linux.intel.com>
 <20220411113158.2037-2-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20220411113158.2037-2-mika.westerberg@linux.intel.com>
X-Cookie: You buttered your bread, now lie in it.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_051308_159295_B350A51F 
X-CRM114-Status: GOOD (  16.01  )
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
Content-Type: multipart/mixed; boundary="===============3875371476959974334=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3875371476959974334==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CJk5db7UBq5CSMUG"
Content-Disposition: inline


--CJk5db7UBq5CSMUG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 02:31:58PM +0300, Mika Westerberg wrote:
> Currently the driver goes over the supported opcodes list each time
> ->exec_op() is called and finds the suitable for the given operation.
> This consumes unnecessary amount of CPU cycles because the operation is
> always the same. For this reason populate dirmap hooks for the driver so
> that we cache the selected operation and then simply call it on each
> read/write.

This breaks an x86 allmodconfig build:

/build/stage/linux/drivers/spi/spi-intel.c: In function =E2=80=98intel_spi_=
dirmap_read=E2=80=99:
/build/stage/linux/drivers/spi/spi-intel.c:808:38: error: passing argument =
2 of =E2=80=98iop->exec_op=E2=80=99 from incompatible pointer type [-Werror=
=3Dincompatible-pointer-types]
  808 |         ret =3D iop->exec_op(ispi, desc->mem, iop, &op);
      |                                  ~~~~^~~~~
      |                                      |
      |                                      struct spi_mem *
/build/stage/linux/drivers/spi/spi-intel.c:808:38: note: expected =E2=80=98=
const struct intel_spi_mem_op *=E2=80=99 but argument is of type =E2=80=98s=
truct spi_mem *=E2=80=99
/build/stage/linux/drivers/spi/spi-intel.c:808:45: error: passing argument =
3 of =E2=80=98iop->exec_op=E2=80=99 from incompatible pointer type [-Werror=
=3Dincompatible-pointer-types]
  808 |         ret =3D iop->exec_op(ispi, desc->mem, iop, &op);
      |                                             ^~~
      |                                             |
      |                                             const struct intel_spi_=
mem_op *
/build/stage/linux/drivers/spi/spi-intel.c:808:45: note: expected =E2=80=98=
const struct spi_mem_op *=E2=80=99 but argument is of type =E2=80=98const s=
truct intel_spi_mem_op *=E2=80=99
/build/stage/linux/drivers/spi/spi-intel.c:808:15: error: too many argument=
s to function =E2=80=98iop->exec_op=E2=80=99
  808 |         ret =3D iop->exec_op(ispi, desc->mem, iop, &op);
      |               ^~~
/build/stage/linux/drivers/spi/spi-intel.c: In function =E2=80=98intel_spi_=
dirmap_write=E2=80=99:
/build/stage/linux/drivers/spi/spi-intel.c:824:38: error: passing argument =
2 of =E2=80=98iop->exec_op=E2=80=99 from incompatible pointer type [-Werror=
=3Dincompatible-pointer-types]
  824 |         ret =3D iop->exec_op(ispi, desc->mem, iop, &op);
      |                                  ~~~~^~~~~
      |                                      |
      |                                      struct spi_mem *
/build/stage/linux/drivers/spi/spi-intel.c:824:38: note: expected =E2=80=98=
const struct intel_spi_mem_op *=E2=80=99 but argument is of type =E2=80=98s=
truct spi_mem *=E2=80=99
/build/stage/linux/drivers/spi/spi-intel.c:824:45: error: passing argument =
3 of =E2=80=98iop->exec_op=E2=80=99 from incompatible pointer type [-Werror=
=3Dincompatible-pointer-types]
  824 |         ret =3D iop->exec_op(ispi, desc->mem, iop, &op);
      |                                             ^~~
      |                                             |
      |                                             const struct intel_spi_=
mem_op *
/build/stage/linux/drivers/spi/spi-intel.c:824:45: note: expected =E2=80=98=
const struct spi_mem_op *=E2=80=99 but argument is of type =E2=80=98const s=
truct intel_spi_mem_op *=E2=80=99
/build/stage/linux/drivers/spi/spi-intel.c:824:15: error: too many argument=
s to function =E2=80=98iop->exec_op=E2=80=99
  824 |         ret =3D iop->exec_op(ispi, desc->mem, iop, &op);
      |               ^~~
cc1: all warnings being treated as errors

--CJk5db7UBq5CSMUG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJep0sACgkQJNaLcl1U
h9CXGwf/Z1pNpFk1a+5idHEjLLL6oaCXehYuZoV/e6gpbbu1B6lTVA4JPe6ueaMJ
9FUxFE2D2gKbRauWSpbEOrPpiRuuwAENeeoO/AemFcWmQsS4O9uowL3OZ0bYqzt+
KKOK5CmPbqbd6qbaqvG0we82qBzYQAH99LtExpivHqAFHYxY4/aXLxHF98p56qVA
DOZ+Sl+cxVC+ez8YkLRtmREMOIwba60swMU6IM/Z/fYW7EvHyzdskOpClz45BsSx
rVf9w7eht7B3FIXUTIN90VMz+e0jz60+KbaQGKVkZ/jkvexfOvicQQSOZpEvW5Cy
fhgNatLNzmF0ms/KCmmRy7i8GjgKyQ==
=rXOb
-----END PGP SIGNATURE-----

--CJk5db7UBq5CSMUG--


--===============3875371476959974334==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3875371476959974334==--

