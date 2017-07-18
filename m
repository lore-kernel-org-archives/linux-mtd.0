Received: from mail-qt0-x22a.google.com ([2607:f8b0:400d:c0d::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dXOSA-0001Hr-7l
 for linux-mtd@lists.infradead.org; Tue, 18 Jul 2017 09:06:05 +0000
Received: by mail-qt0-x22a.google.com with SMTP id 32so10759845qtv.1
 for <linux-mtd@lists.infradead.org>; Tue, 18 Jul 2017 02:05:39 -0700 (PDT)
MIME-Version: 1.0
Sender: romain.izard@mobile-devices.fr
In-Reply-To: <20170717202008.6c798789@bbrezillon>
References: <CAMiSF3CtVY7G=ugt-bpsOOMqLcFrmx7hDstUag2_6H-KrN4yBg@mail.gmail.com>
 <20170717194809.4a080e0c@bbrezillon> <20170717202008.6c798789@bbrezillon>
From: Romain Izard <romain.izard.pro@gmail.com>
Date: Tue, 18 Jul 2017 11:05:18 +0200
Message-ID: <CAGkQfmMp2rTxhUv=JVa78BqFBGBEiUicb1vN7bqbXLKWL8pOsw@mail.gmail.com>
Subject: Re: Uncorrectable bitflips with Linux 4.12 on SAMA5D2
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Yang Wenyou <Wenyou.Yang@atmel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@free-electrons.com>
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

Hi Boris,

2017-07-17 20:20 GMT+02:00 Boris Brezillon <boris.brezillon@free-electrons.=
com>:
> Le Mon, 17 Jul 2017 19:48:09 +0200,
> Boris Brezillon <boris.brezillon@free-electrons.com> a =C3=A9crit :
>
>> +Ludovic, Nicolas and Alexandre
>>
>> Hi Romain,
>>
>> Le Mon, 17 Jul 2017 18:11:26 +0200,
>> Romain Izard <romain.izard.pro@gmail.com> a =C3=A9crit :
>>
>> > Hello,
>> >
>> > On a custom board based on Microchip's SAMA5D2 SoC, I am encountering
>> > ECC problems with the NAND Flash controller. The board is currently
>> > working with Linux v4.9.x, but it does not with Linux 4.12.
>> >
>> > Some pages on the NAND Flash memory chip of the device have bitflips.
>> > With Linux 4.9.x, the bitflips are fixed by the PMECC code, but with
>> > Linux 4.12, the errors are reported as uncorrectable.
>> >
>> > From my end, I updated the board's device tree to include the
>> > sama5d2.dtsi as it exists in Linux 4.12, but the rest of the file is
>> > the same as for Linux 4.9. From my understanding, it should be
>> > sufficient as the legacy DTB binding for the NAND controller is
>> > supported.
>>
>> I know Ludovic add some problems with the NAND controller on sama5d2,
>> but it was with the new bindings (see the fixes here [1]).
>>
>> Your problem seems a bit different since you're using the backward
>> compat code.
>
> Can you try with the following patch applied?
>
> --->8---
> From cb95a16cdd497137872c44d5dd4e251ec73c79c1 Mon Sep 17 00:00:00 2001
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> Date: Mon, 17 Jul 2017 20:09:59 +0200
> Subject: [PATCH] mtd: nand: atmel: Fix DT backward compatibility in pmecc=
.c
>
> PMECC caps extraction from old DT bindings is broken, thus leading to
> erroneous EL registers offset, which in turn make HW ECC unusable on
> sama5d2 when old bindings are in use.
>
> Passing the NAND dev node instead of the NFC node to of_match_node()
> solves the problem.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Cc: <stable@vger.kernel.org>
> ---
>  drivers/mtd/nand/atmel/pmecc.c | 21 ++++++---------------
>  1 file changed, 6 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/mtd/nand/atmel/pmecc.c b/drivers/mtd/nand/atmel/pmec=
c.c
> index 55a8ee5306ea..8c210a5776bc 100644
> --- a/drivers/mtd/nand/atmel/pmecc.c
> +++ b/drivers/mtd/nand/atmel/pmecc.c
> @@ -945,6 +945,7 @@ struct atmel_pmecc *devm_atmel_pmecc_get(struct devic=
e *userdev)
>                  */
>                 struct platform_device *pdev =3D to_platform_device(userd=
ev);
>                 const struct atmel_pmecc_caps *caps;
> +               const struct of_device_id *match;
>
>                 /* No PMECC engine available. */
>                 if (!of_property_read_bool(userdev->of_node,
> @@ -953,21 +954,11 @@ struct atmel_pmecc *devm_atmel_pmecc_get(struct dev=
ice *userdev)
>
>                 caps =3D &at91sam9g45_caps;
>
> -               /*
> -                * Try to find the NFC subnode and extract the associated=
 caps
> -                * from there.
> -                */
> -               np =3D of_find_compatible_node(userdev->of_node, NULL,
> -                                            "atmel,sama5d3-nfc");
> -               if (np) {
> -                       const struct of_device_id *match;
> -
> -                       match =3D of_match_node(atmel_pmecc_legacy_match,=
 np);
> -                       if (match && match->data)
> -                               caps =3D match->data;
> -
> -                       of_node_put(np);
> -               }
> +               /* Find the caps associated to the NAND dev node. */
> +               match =3D of_match_node(atmel_pmecc_legacy_match,
> +                                     userdev->of_node);
> +               if (match && match->data)
> +                       caps =3D match->data;
>
>                 pmecc =3D atmel_pmecc_create(pdev, caps, 1, 2);
>         }


The proposed patch fixes my issue. Thank you for your quick response!

You can add my:
Tested-by: Romain Izard <romain.izard.pro@gmail.com>

Best regards,
--=20
Romain Izard
