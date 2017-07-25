Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1da4yU-0007rg-K9
 for linux-mtd@lists.infradead.org; Tue, 25 Jul 2017 18:54:32 +0000
Date: Tue, 25 Jul 2017 20:54:06 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Alexander Dahl <ada@thorsis.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>
Subject: Re: mtd: nand: atmel: probe of Spansion S34ML02G1 fails
Message-ID: <20170725205406.5a946c08@bbrezillon>
In-Reply-To: <5326598.QgYTQxcFMR@ada>
References: <5326598.QgYTQxcFMR@ada>
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

Hi Alexander,

Le Tue, 25 Jul 2017 11:26:33 +0200,
Alexander Dahl <ada@thorsis.com> a =C3=A9crit :

> Hello,
>=20
> when testing the recent v4.13-rc2 on our at91sam9g20 based platform I=20
> discovered one of the NAND flash chips we use can not be setup correctly=
=20
> anymore. I guess this may be due to the reworked atmel nand driver after=
=20
> v4.9, but it may be another problem.
>=20
> The board layout is similar to the at91sam9g20ek for the NAND flash part=
=20
> and we're using different flash chips. With an hynix HY27UF082G2B=20
> everything works, the console output on boot is like this:
>=20
>   nand: Could not find valid ONFI parameter page; aborting
>   nand: device found, Manufacturer ID: 0xad, Chip ID: 0xda
>   nand: Hynix NAND 256MiB 3,3V 8-bit
>   nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
>=20
> The same board with another pin compatible flash chip, the Spansion=20
> S34ML02G100TF100 however fails. I added some debug print statements to a=
=20
> otherwise clean 4.13-rc2 kernel and get this:
>=20
>   nand: device found, Manufacturer ID: 0x01, Chip ID: 0xda
>   nand: AMD/Spansion S34ML02G1
>   nand: 256 MiB, SLC, erase size: 128 KiB, page size: 2048, OOB size: 64
>   nand: onfi_version: 10, onfi_params.opt_cmd: 0x001B
>   nand: chip->onfi_set_features() failed: -22
>   nand: nand_setup_data_interface() failed: -22
>   atmel-nand-controller 10000000.ebi:nand-controller: nand_scan_ident()=20
> failed: -22
>   atmel-nand-controller: probe of 10000000.ebi:nand-controller failed=20
> with error -22
>=20
> So in the ONFI parameter page of the flash chip the value for "optional=20
> commands supported" in the features block is 0x001B which is exactly=20
> what the datasheet says. This means this flash chip does not support=20
> "Get Features" and "Set Features".
>=20
> Now nand_onfi_set_features() correctly fails, because the nand chip can=20
> not set features. It's called in nand_setup_data_interface() in=20
> nand_base.c which fails itself because of the return value of the failed=
=20
> set features call and so the whole chain of fails starts.

Oh crap! We didn't consider ONFI NANDs which are supporting the SET/GET
FEATURES operations when working on the timing selection logic.

>=20
> The nand chip actually works fine in U-Boot, and with kernels up to=20
> v4.9.35, I didn't test v4.10, v4.11, but IIRC the board booted from nand=
=20
> flash with v4.12.
>=20
> Can anyone help me to fix this?

Can you try with the following fix?=20

Thanks,

Boris

>=20
> Greets
> Alex
>=20
--->8---
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 5fa5ddc94834..fc897f799def 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -1125,7 +1125,9 @@ static int nand_setup_data_interface(struct nand_chip=
 *chip, int chipnr)
         * Ensure the timing mode has been changed on the chip side
         * before changing timings on the controller side.
         */
-       if (chip->onfi_version) {
+       if (chip->onfi_version &&
+           (le16_to_cpu(chip->onfi_params.opt_cmd) &
+            ONFI_OPT_CMD_SET_GET_FEATURES)) {
                u8 tmode_param[ONFI_SUBFEATURE_PARAM_LEN] =3D {
                        chip->onfi_timing_mode_default,
                };
