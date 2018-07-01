Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fZgne-0002Dz-Mj
 for linux-mtd@lists.infradead.org; Sun, 01 Jul 2018 18:10:27 +0000
Date: Sun, 1 Jul 2018 20:09:59 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Abhishek Sahu <absahu@codeaurora.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Andy Gross <andy.gross@linaro.org>, Archit
 Taneja <architt@codeaurora.org>
Subject: Re: [PATCH v4 00/15] Update for QCOM NAND driver
Message-ID: <20180701200959.2edb3306@xps13>
In-Reply-To: <1529479662-4026-1-git-send-email-absahu@codeaurora.org>
References: <1529479662-4026-1-git-send-email-absahu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Abhishek,

Abhishek Sahu <absahu@codeaurora.org> wrote on Wed, 20 Jun 2018
12:57:27 +0530:

> * v4:
>=20
> 1. Added patch to make other ECC configurations function static.
> 2. Clubbed the DT update patches.
> 3. Removed the bad block related patch. Discussion is going on
>    related with for proper solution so planning to submit separate
>    patch series for all bad block related changes.
> 4. Made the single codeword raw read function and used the same
>    for raw page read.
> 5. Changes in erased codeword detection to raw read function.
>=20
> * v3:
>=20
> 1. Addressed all review comments in v2.
> 2. Added patch for removing redundant nand-ecc-step-size DT property.
> 3. Renamed ECC configuration setup function with minor code changes.
> 4. Modified comments and commit message for few patches.
>=20
> * v2:
>=20
> 1. Addressed all review comments in v1.
> 1. Make the generic helper function for NAND ECC parameters setup
>    and used this helper function for QCOM and Denali nand driver
>    for ECC setup.
> 2. Modified commit message for some of the patches and added more
>    comments.
> 3. Added new patch for fixing =E2=80=98return 0=E2=80=99 for raw read.
> 4. Removed the read last codeword part for nand oob write.
> 5. Reorganized bad block check function and removed the
>    read_last_cw function completely.
>=20
> * v1:
>=20
> This patch series mainly deals with error handling and erased page
> bitflip detection for QCOM NAND driver.
>=20
> 1. The error handling was missing for some of the cases so fixed
>    the same.
>=20
> 2. Add the support for taking ECC strength from ONFI parameter.
>    The earlier QCOM boards were coming with 4-bit ECC chip but
>    now the same boards are coming with 8-bit ECC chip since the
>    earlier 4-bit parts are obsolete from some vendors.
>=20
> 3. We got few issues related with NAND erased page bitflips. The
>    QCOM NAND controller can=E2=80=99t detect the bitflip in completely er=
ased
>    page so added the support to detect the same. It implemented the
>    logic mentioned in patch [1] which didn=E2=80=99t go in mainline and l=
ater
>    the generic functions were provided [2] to count the number of
>    bitflips and make all 0xff. This patch series did some optimization
>    logic to prevent the unnecessary full page raw read and data copy
>    from QCOM NAND controller to DMA.
>=20
> 4. Following are the testing done for these patches in QCOM IPQ8074
>    HK01 (4-bit and 8-bit ECC chip) and IPQ806x AP148 boards.
>     a. Run all mtd test and check if it passes
>     b. Introduce custom bitflips in erased page and check if it
>        returns no error/EUCLEAN/EBADMSG depending upon number of
>        bitflips and position.
>     c. Introduce failure condition for operational failure and
>        check if it detects the same.
>=20
> [1]: https://patchwork.ozlabs.org/patch/328994/
> [2]: https://patchwork.ozlabs.org/patch/509970/
>=20
> Abhishek Sahu (15):
>   mtd: rawnand: helper function for setting up ECC configuration
>   mtd: rawnand: denali: use helper function for ecc setup
>   dt-bindings: qcom_nandc: update for ECC strength and step size
>   mtd: rawnand: qcom: remove dt property nand-ecc-step-size
>   mtd: rawnand: qcom: use the ecc strength from device parameter
>   mtd: rawnand: qcom: wait for desc completion in all BAM channels
>   mtd: rawnand: qcom: erased page detection for uncorrectable errors
>     only
>   mtd: rawnand: qcom: fix null pointer access for erased page detection
>   mtd: rawnand: qcom: parse read errors for read oob also
>   mtd: rawnand: qcom: modify write_oob to remove read codeword part
>   mtd: rawnand: qcom: fix return value for raw page read
>   mtd: rawnand: qcom: check for operation errors in case of raw read
>   mtd: rawnand: qcom: code reorganization for raw read
>   mtd: rawnand: qcom: erased page bitflips detection
>   mtd: rawnand: provide only single helper function for ECC conf
>=20
>  .../devicetree/bindings/mtd/qcom_nandc.txt         |   7 +-
>  drivers/mtd/nand/raw/denali.c                      |  30 +-
>  drivers/mtd/nand/raw/nand_base.c                   |  72 ++-
>  drivers/mtd/nand/raw/qcom_nandc.c                  | 491 ++++++++++++++-=
------
>  include/linux/mtd/rawnand.h                        |  10 +-
>  5 files changed, 380 insertions(+), 230 deletions(-)
>=20

Thank you very much for the series and the changes you have done.

Applied all patches but "erased page bitflips detection" because I'm
waiting for one small modification on this one.

Thanks,
Miqu=C3=A8l
