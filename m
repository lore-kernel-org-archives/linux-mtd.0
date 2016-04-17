MIME-Version: 1.0
In-Reply-To: <20160417190537.0b484bdd@bbrezillon>
References: <1460750052-16285-1-git-send-email-zajec5@gmail.com>
 <1460750052-16285-13-git-send-email-zajec5@gmail.com>
 <20160417190537.0b484bdd@bbrezillon>
Date: Sun, 17 Apr 2016 19:10:11 +0200
Message-ID: <CACna6rzjXrjrx1Wq3cngYmKgSFAME7ZYNoPBpbyO3VWnHgMBAg@mail.gmail.com>
Subject: Re: [PATCH 12/12] mtd: mtd: drop NAND_ECC_SOFT_BCH enum value
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

On 17 April 2016 at 19:05, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Fri, 15 Apr 2016 21:54:12 +0200
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
>
>> This value should not be part of nand_ecc_modes_t as it specifies
>> algorithm not a mode. We successfully managed to introduce new "algo"
>> field which is respected now.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>> ---
>>  drivers/mtd/nand/fsmc_nand.c   | 3 +--
>>  drivers/mtd/nand/jz4780_nand.c | 1 -
>>  drivers/mtd/nand/nand_base.c   | 2 --
>>  drivers/mtd/nand/nandsim.c     | 2 +-
>>  drivers/mtd/nand/sunxi_nand.c  | 2 --
>>  include/linux/mtd/nand.h       | 1 -
>>  6 files changed, 2 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
>> index 0f8c63f..d4f454a 100644
>> --- a/drivers/mtd/nand/fsmc_nand.c
>> +++ b/drivers/mtd/nand/fsmc_nand.c
>> @@ -959,7 +959,6 @@ static int __init fsmc_nand_probe(struct platform_de=
vice *pdev)
>>                       break;
>>
>>               case NAND_ECC_SOFT:
>> -             case NAND_ECC_SOFT_BCH:
>>                       if (nand->ecc.algo =3D=3D NAND_ECC_BCH) {
>>                               dev_info(&pdev->dev, "Using 4-bit SW BCH E=
CC scheme\n");
>>                               break;
>> @@ -974,7 +973,7 @@ static int __init fsmc_nand_probe(struct platform_de=
vice *pdev)
>>                * Don't set layout for BCH4 SW ECC. This will be
>>                * generated later in nand_bch_init() later.
>>                */
>> -             if (nand->ecc.mode !=3D NAND_ECC_SOFT_BCH) {
>> +             if (nand->ecc.mode =3D=3D NAND_ECC_HW) {
>
> This test is wrong, it should be
>
>                 if (nand->ecc.mode !=3D NAND_ECC_SOFT ||
>                     nand->ecc.algo !=3D NAND_ECC_BCH)
>
> or
>                 if (!(nand->ecc.mode =3D=3D NAND_ECC_SOFT &&
>                       nand->ecc.algo =3D=3D NAND_ECC_BCH)

This driver supports only 2 modes (see switch above).
