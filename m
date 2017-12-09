Received: from mail-pg0-x244.google.com ([2607:f8b0:400e:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNoOo-0007Ut-3g
 for linux-mtd@lists.infradead.org; Sat, 09 Dec 2017 23:19:16 +0000
Received: by mail-pg0-x244.google.com with SMTP id b18so8751171pgv.10
 for <linux-mtd@lists.infradead.org>; Sat, 09 Dec 2017 15:18:53 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171128143055.1ff22979@xps13>
References: <7df7abb5-e666-c999-e449-75762b551ea5@prevas.dk>
 <20171128140210.34215e19@xps13>
 <dd07aafc-0d23-e00a-4996-cd233f8a9065@prevas.dk>
 <20171128143055.1ff22979@xps13>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 9 Dec 2017 20:18:51 -0300
Message-ID: <CAAEAJfBGG9wMVGnwSBfgr+tpr_E_weVBqTc=EvDGU6JUQveFQg@mail.gmail.com>
Subject: Re: [BUG] pxa3xx: wait time out when scanning for bb
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: =?UTF-8?Q?Sean_Nyekj=C3=A6r?= <sean.nyekjaer@prevas.dk>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Kasper Revsbech (KREV)" <krev@triax.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28 November 2017 at 10:30, Miquel RAYNAL
<miquel.raynal@free-electrons.com> wrote:
> Hi Sean,
>
>
>> > Also, what kernel are you using ?
>> 4.14.0 :-)
>
> Good !
>
>> [    2.288684] pxa3xx-nand f10d0000.flash: This platform can't do DMA
>> on this device
>
> FYI, this is normal, the NAND controller does not have any DMA feature
> on Armada 38x (NFCv2).
>
>> [    2.296924] nand: device found, Manufacturer ID: 0x2c, Chip ID:
>> 0xda [    2.303311] nand: Micron MT29F2G08ABAEAH4
>> [    2.307334] nand: 256 MiB, SLC, erase size: 128 KiB, page size:
>> 2048, OOB size: 64
>> [    2.314939] pxa3xx-nand f10d0000.flash: ECC strength 16, ECC step
>> size 2048
>
> In theory, Marvell NAND flash controller does support 16-bit strength
> per 512 bytes over 2048 bytes pages. However, this controller driver
> (pxa3xx_nand) does not. See [1] for the supported configurations.
>

Why do you say the driver does not support it?

It's automatically selecting this:

        /*
         * Required ECC: 4-bit correction per 512 bytes
         * Select: 16-bit correction per 2048 bytes
         */
        } else if (strength =3D=3D 4 && ecc_stepsize =3D=3D 512 && page_siz=
e =3D=3D 2048) {
                info->ecc_bch =3D 1;
                info->chunk_size =3D 2048;
                info->spare_size =3D 32;
                info->ecc_size =3D 32;
                ecc->mode =3D NAND_ECC_HW;
                ecc->size =3D info->chunk_size;
                ecc->layout =3D &ecc_layout_2KB_bch4bit;
                ecc->strength =3D 16;

Otherwise, you would have seen the "ECC strength ... at page size ...
is not supported"

> The ECC strength shown here is probably the best to use with this type
> of NAND device but I suggest you try with 4b/512B by using these two
> properties like in [2]:
>
>         nand-ecc-strength =3D <4>;
>         nand-ecc-step-size =3D <512>;
>
>
> Thanks,
> Miqu=C3=A8l
>
> [1]
> http://elixir.free-electrons.com/linux/v4.14/source/drivers/mtd/nand/pxa3=
xx_nand.c#L1575
>
> [2]
> http://elixir.free-electrons.com/linux/v4.14/source/arch/arm/boot/dts/arm=
ada-385-db-ap.dts#L172
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
