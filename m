Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aJHwP-0003I1-13
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2016 09:42:10 +0000
Received: by mail-oi0-x236.google.com with SMTP id k206so90669961oia.1
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jan 2016 01:41:48 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <B256D81BAE5131468A838E5D7A243641D63E9755@penmbx01>
References: <1452609223-14790-1-git-send-email-romain.izard.pro@gmail.com>
 <1452609223-14790-5-git-send-email-romain.izard.pro@gmail.com>
 <B256D81BAE5131468A838E5D7A243641D63E9755@penmbx01>
From: romain izard <romain.izard@mobile-devices.fr>
Date: Wed, 13 Jan 2016 10:41:28 +0100
Message-ID: <CAGkQfmN3Ko0Pbyued0AGMPskqVUWStxO44Nj=k8O-+iWYObXMg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes
To: "Yang, Wenyou" <Wenyou.Yang@atmel.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Ferre,
 Nicolas" <Nicolas.FERRE@atmel.com>
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

2016-01-13 7:06 GMT+01:00 Yang, Wenyou <Wenyou.Yang@atmel.com>:
>
>> -----Original Message-----
>> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf=
 Of
>> Romain Izard
>> Sent: 2016=E5=B9=B41=E6=9C=8812=E6=97=A5 22:34
>> To: linux-mtd@lists.infradead.org; devicetree@vger.kernel.org
>> Cc: Wu, Josh <Josh.wu@atmel.com>; Romain Izard
>> <romain.izard.pro@gmail.com>; Ferre, Nicolas <Nicolas.FERRE@atmel.com>
>> Subject: [RFC PATCH 4/4] ARM: at91/dt: sama5d2: add nand0 and nfc0 nodes
>>
>> Both nodes are required to access NAND Flash memory. Additional settings=
 will
>> be necessary at the board level to use it.
>>
>> Signed-off-by: Romain Izard <romain.izard.pro@gmail.com>
>> ---
>>  arch/arm/boot/dts/sama5d2.dtsi | 38
>> ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 38 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.=
dtsi index
>> aee571448342..80420177ec1a 100644
>> --- a/arch/arm/boot/dts/sama5d2.dtsi
>> +++ b/arch/arm/boot/dts/sama5d2.dtsi
>> @@ -265,6 +265,44 @@
>>                       cache-level =3D <2>;
>>               };
>>
>> +             nand0: nand@80000000 {
>> +                     compatible =3D "atmel,sama5d2-nand";
>> +                     #address-cells =3D <1>;
>> +                     #size-cells =3D <1>;
>> +                     ranges;
>> +                     reg =3D < /* EBI CS3 */
>> +                             0x80000000 0x08000000
>> +                             /* SMC PMECC regs */
>> +                             0xf8014070 0x00000490
>> +                             /* SMC PMECC Error Location regs */
>> +                             0xf8014500 0x00000200
>> +                             /* ROM Galois tables */
>> +                             0x00040000 0x00018000
>
> As there is no PMECC lookup table in ROM exported, remove this line.
>

>From what I see in the SAMA5D2 xplained board on my table, it is not the
case. Reading at addresses 0x40000 and 0x48000 from U-Boot, I see data
that looks identical to the Galois tables in the Atmel example code.

U-Boot> md.w 0x40000
00040000: ffff 0000 0001 03a6 0002 074c 03a7 18c0
00040010: 0003 1c66 074d 01ea 03a8 005d 18c1 0af2
00040020: 0004 0e98 1c67 183e 074e 1181 01eb 0403
00040030: 03a9 119c 005e 000d 18c2 0590 0af3 1877
00040040: 0005 1c1d 0e99 191d 1c68 0d6f 183f 0936
00040050: 074f 13d9 1182 1542 01ec 03b3 0404 1395
00040060: 03aa 1aaa 119d 123e 005f 1be4 000e 0bda
00040070: 18c3 07a9 0591 1d35 0af4 19ae 1878 1527

U-Boot> md.w 0x48000
00048000: ffff 0000 0001 0572 0002 0ae4 0573 015b
00048010: 0003 06cd 0ae5 1ad9 0574 012e 015c 1056
00048020: 0004 15c8 06ce 288d 0ae6 02b6 1ada 06a0
00048030: 0575 2ed2 012f 0c3f 015d 204b 1057 3812
00048040: 0005 3d84 15c9 0289 06cf 347d 288e 25bd
00048050: 0ae7 10d1 02b7 3444 1adb 11b1 06a1 109c
00048060: 0576 1c34 2ed3 1b3a 0130 2dff 0c40 2238
00048070: 015e 0c12 204c 3d67 1058 3f47 3813 0828


This location matches the information in the SAMA5D2 datasheet from
chapter 6, "Memories", but not the contradicting information from chapter
14, "Standard Boot Strategies".

>> +                             >;
>> +                     interrupts =3D <17 IRQ_TYPE_LEVEL_HIGH 6>;
>> +                     atmel,nand-addr-offset =3D <21>;
>> +                     atmel,nand-cmd-offset =3D <22>;
>> +                     atmel,nand-has-dma;
>> +                     atmel,has-pmecc;
>> +                     atmel,pmecc-lookup-table-offset =3D <0x0 0x8000>;
>
> Ditto, remove this line.
>
>> +                     status =3D "disabled";
>> +
>> +                     nfc@90000000 {
>> +                             compatible =3D "atmel,sama5d4-nfc";
>> +                             #address-cells =3D <1>;
>> +                             #size-cells =3D <1>;
>> +                             reg =3D < /* NFC Command Registers */
>> +                                     0xC0000000 0x08000000
>> +                                     /* NFC HSMC regs */
>> +                                     0xf8014000 0x00000070
>> +                                     /* NFC SRAM banks */
>> +                                     0x00100000 0x00100000
>> +                                     >;
>> +                             clocks =3D <&hsmc_clk>;
>> +                             atmel,write-by-sram;
>> +                     };
>> +             };
>> +
>>               sdmmc0: sdio-host@a0000000 {
>>                       compatible =3D "atmel,sama5d2-sdhci";
>>                       reg =3D <0xa0000000 0x300>;
>> --
>> 2.5.0
>>


Best regards
--=20
Romain Izard
