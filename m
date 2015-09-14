Received: from mail-wi0-f174.google.com ([209.85.212.174])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbYem-0002MP-E5
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2015 18:39:13 +0000
Received: by wicge5 with SMTP id ge5so154789235wic.0
 for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2015 11:38:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150909142439.GA2371@laptop>
References: <1441703453-2838-1-git-send-email-alex.smith@imgtec.com>
 <1441703453-2838-4-git-send-email-alex.smith@imgtec.com>
 <20150909142439.GA2371@laptop>
Date: Mon, 14 Sep 2015 15:38:48 -0300
Message-ID: <CAAEAJfDDGe23X==ODV+pwpobcLZreQtaJuMdkzaZsRS9TNFKPQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/4] mtd: nand: jz4780: driver for NAND devices on
 JZ4780 SoCs
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Alex Smith <alex.smith@imgtec.com>,
 Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alex Smith <alex@alex-smith.me.uk>, David Woodhouse <dwmw2@infradead.org>
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

Brian,

On 9 September 2015 at 11:24, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> On 08 Sep 10:10 AM, Alex Smith wrote:
>> Add a driver for NAND devices connected to the NEMC on JZ4780 SoCs, as
>> well as the hardware BCH controller. DMA is not currently implemented.
>>
>> While older 47xx SoCs also have a BCH controller, they are incompatible
>> with the one in the 4780 due to differing register/bit positions, which
>> would make implementing a common driver for them quite messy.
>>
>> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
>> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> Cc: linux-mtd@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> ---
>> v4 -> v5:
>>  - Bump RB_DELAY up to be sufficient for the driver to work without a
>>    busy GPIO available.
>>  - Use readl_poll_timeout instead of custom polling loop.
>>  - Remove useless printks.
>>  - Change a BUG_ON to WARN_ON.
>>  - Remove use of of_translate_address(), use standard platform resource
>>    APIs.
>>  - Add DRV_NAME define to avoid duplication of the same string.
>>
>> v3 -> v4:
>>  - Rebase to 4.2-rc4
>>  - Change ECC_HW_OOB_FIRST to ECC_HW, reading OOB first is not necessary=
.
>>  - Fix argument to get_device() in jz4780_bch_get()
>>
>> v2 -> v3:
>>  - Rebase to 4.0-rc6
>>  - Reflect binding changes
>>  - get/put_device in bch get/release
>>  - Removed empty .remove() callback
>>  - Removed .owner
>>  - Set mtd->dev.parent
>>
>> v1 -> v2:
>>  - Fixed module license macro
>>  - Rebase to 4.0-rc3
>> ---
>>  drivers/mtd/nand/Kconfig       |   7 +
>>  drivers/mtd/nand/Makefile      |   1 +
>>  drivers/mtd/nand/jz4780_bch.c  | 348 ++++++++++++++++++++++++++++++++++=
+++
>>  drivers/mtd/nand/jz4780_bch.h  |  42 +++++
>>  drivers/mtd/nand/jz4780_nand.c | 378 ++++++++++++++++++++++++++++++++++=
+++++++
>>  5 files changed, 776 insertions(+)
>>  create mode 100644 drivers/mtd/nand/jz4780_bch.c
>>  create mode 100644 drivers/mtd/nand/jz4780_bch.h
>>  create mode 100644 drivers/mtd/nand/jz4780_nand.c
>>
> [..]
>> +
>> +static int jz4780_nand_init_chips(struct jz4780_nand *nand,
>> +                               struct platform_device *pdev)
>> +{
>> +     struct device *dev =3D &pdev->dev;
>> +     struct jz4780_nand_chip *chip;
>> +     const __be32 *prop;
>> +     struct resource *res;
>> +     int i =3D 0;
>> +
>> +     /*
>> +      * Iterate over each bank assigned to this device and request reso=
urces.
>> +      * The bank numbers may not be consecutive, but nand_scan_ident()
>> +      * expects chip numbers to be, so fill out a consecutive array of =
chips
>> +      * which map chip number to actual bank number.
>> +      */
>> +     while ((prop =3D of_get_address(dev->of_node, i, NULL, NULL))) {
>> +             chip =3D &nand->chips[i];
>> +             chip->bank =3D of_read_number(prop, 1);
>> +
>> +             jz4780_nemc_set_type(nand->dev, chip->bank,
>> +                                  JZ4780_NEMC_BANK_NAND);
>> +
>> +             res =3D platform_get_resource(pdev, IORESOURCE_MEM, i);
>> +             chip->base =3D devm_ioremap_resource(dev, res);
>> +             if (IS_ERR(chip->base)) {
>> +                     dev_err(dev, "failed to map bank %u: %ld\n",
>> +                             chip->bank, PTR_ERR(chip->base));
>
> You don't need to print anything on devm_ioremap_resource errors.
>
> The rest looks good:
>
> Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Whatever the outcome of the discussion on patch 1/4
"mtd: nand: increase ready wait timeout and report timeouts"
is, the jz4780-specific patches should remain unaffected to it.

In fact, I believe patch 1/4 shouldn't even be on the same series.
So, maybe you can consider taking the rest (or not) independently
of that patch?
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
