Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1eyaPW-00045N-E3
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2018 09:52:00 +0000
Date: Wed, 21 Mar 2018 10:51:36 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek
 Vasut <marek.vasut@gmail.com>, jocelyncarroue@macronix.com,
 juliensu@mxic.com.tw, Stefan Agner <stefan@agner.ch>,
 linux-mtd@lists.infradead.org, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH v5 00/14] Improve timings handling in the NAND framework
Message-ID: <20180321105136.5a016ac3@bbrezillon>
In-Reply-To: <20180319134731.22605-1-miquel.raynal@bootlin.com>
References: <20180319134731.22605-1-miquel.raynal@bootlin.com>
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

On Mon, 19 Mar 2018 14:47:17 +0100
Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> Hello,
>=20
> This series evolves how GET/SET_FEATURES operations are handled by the
> NAND core by adding two helpers that should be called instead of calling
> directly the ->onfi_get/set_feature() hooks.
>=20
> Then, the parameter page that was always allocated no matter if the NAND
> core could make use of it is dropped. Instead, a much smaller structure
> is embedded in the nand_chip structure and just stores the information
> that will be useful for the core. Future enhancements of the core that
> will need more information will just have to add a new entry in this
> structure and fill it during the detection phase. A bitmap is used to
> know which optional feature is actually supported.
>=20
> This give the possibility in vendor code to overload this bitmap and
> force the addition/removal of supported features in the list, depending
> for instance on the NAND chip currently being used.
>=20
> This new possibility is effectively used for Macronix NAND chip
> MX30LF2G18AC. This chip supports natively the timing mode 5, and its
> parameter page indicates that it supports GET/SET_FEATURES on timing
> modes, while in reality it does not. Removing this feature from the
> supported bitmap makes it usable at high speed instead of unnecessarily
> limiting it to timing mode 0.
>=20

Applied.

Thanks,

Boris

> Thank you,
> Miqu=C3=A8l
>=20
> Changes since v4:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   - As discussed internally: the controller can return -ENOTSUP during a
>     set/get_features() while the this error cas come from a lack of
>     support from the NAND chip itself as well. For most cases these
>     errors can be mixed and an error must be returned. However, when it
>     comes to timings, both errors should be handled differently: if the
>     controller cannot do the operation, an error should be returned and
>     the timings left unchanged. If the NAND chip does not support the
>     operation, as explained all along this series, this is not an actual
>     error and we should continue the operation. This is handled in this
>     version of the series in nand_setup_data_interface(): if the NAND
>     chip does not support the operation, nand_get/set_features() calls
>     are skipped. Otherwise, any error from nand_get/set_features() is an
>     actual error and leads to the error path.
>=20
> Changes since v3:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   - Fixed commit log of patch "check ONFI timings have been acked by the
>     chip"
>   - Squashed patch that renamed the ->seg/get_features() local hooks in
>     the mxc driver into the patch that renames these hooks.
>   - Moved patch introducing the nand_set/get_features() helpers earlier
>     to avoid modifiying twice nand_setup_data_interface().
>   - s/memcpy/strncpy/ around the model name to avoid possible overflows.
>   - Added kernel-doc documentation.
>   - Renamed the "onfi_params" entry in the nand_parameters structure as
>     "onfi".
>=20
> Changes since v2:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   - Squashed the series with another preparation series not yet merged
>     about GPMI timings improvements. Core patches are here now, while a
>     second series with only GPMI-related changes will be sent very soon.
>   - s/support_setting_features/supports_set_get_features/
>   - Used a bitmap for set_features and another for get_features.
>   - Removed repetiting setting the timings mode parameters bit in the
>     supported features bitmap in Micron driver.
>   - Split the commit removing the parameter pages in three (one that
>     adds the new structure, one that get rid of JEDEC parameter page,
>     one that get rid of ONFI parameter page).
>   - Moved the ONFI-specific fields in the nand_parameters structure
>     into an onfi_parameters structure within it. It is statically
>     allocated today, and will move to dynamic allocation in the near
>     future.
>   - Removed the __packed attribute on the nand_parameters structure.
>=20
> Changes since v1:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   - Some changes, a bit unrelated to what we try to achieve here have
>     been moved to the series that prepares this one.
>   - Change the formula in Macronix code that determines if we are
>     dealing with the failing chip.
>=20
>=20
> Miquel Raynal (14):
>   mtd: rawnand: rename default ->onfi_get/set_features() implementations
>   mtd: rawnand: rename SET/GET FEATURES related functions
>   mtd: rawnand: use wrappers to call onfi GET/SET_FEATURES
>   mtd: rawnand: handle differently chip/controller errors about timings
>   mtd: rawnand: mxc: remove useless checks in GET/SET_FEATURES functions
>   mtd: rawnand: move calls to ->select_chip() in
>     nand_setup_data_interface()
>   mtd: rawnand: check ONFI timings have been acked by the chip
>   mtd: rawnand: avoid setting again the timings to mode 0 after a reset
>   mtd: rawnand: prepare the removal of ONFI/JEDEC parameter pages
>   mtd: rawnand: prepare the removal of the ONFI parameter page
>   mtd: rawnand: allow vendors to declare (un)supported features
>   mtd: rawnand: macronix: nack the support of changing timings for one
>     chip
>   mtd: rawnand: get rid of the JEDEC parameter page in nand_chip
>   mtd: rawnand: get rid of the ONFI parameter page in nand_chip
>=20
>  drivers/mtd/nand/raw/bcm47xxnflash/ops_bcm4706.c |   4 +-
>  drivers/mtd/nand/raw/cafe_nand.c                 |   4 +-
>  drivers/mtd/nand/raw/docg4.c                     |   4 +-
>  drivers/mtd/nand/raw/fsl_elbc_nand.c             |   4 +-
>  drivers/mtd/nand/raw/fsl_ifc_nand.c              |   4 +-
>  drivers/mtd/nand/raw/gpmi-nand/gpmi-lib.c        |   8 +-
>  drivers/mtd/nand/raw/hisi504_nand.c              |   4 +-
>  drivers/mtd/nand/raw/mpc5121_nfc.c               |   4 +-
>  drivers/mtd/nand/raw/mxc_nand.c                  |  24 +-
>  drivers/mtd/nand/raw/nand_base.c                 | 286 ++++++++++++++++-=
------
>  drivers/mtd/nand/raw/nand_macronix.c             |  13 ++
>  drivers/mtd/nand/raw/nand_micron.c               |  39 ++--
>  drivers/mtd/nand/raw/nand_timings.c              |  10 +-
>  drivers/mtd/nand/raw/qcom_nandc.c                |   4 +-
>  drivers/mtd/nand/raw/sh_flctl.c                  |   4 +-
>  drivers/staging/mt29f_spinand/mt29f_spinand.c    |   4 +-
>  include/linux/mtd/rawnand.h                      |  96 ++++----
>  17 files changed, 330 insertions(+), 186 deletions(-)
>=20



--=20
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
