Received: from mail-qa0-f52.google.com ([209.85.216.52])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUWQI-0006eQ-C9
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 07:46:39 +0000
Received: by mail-qa0-f52.google.com with SMTP id m5so582354qaj.25
 for <linux-mtd@lists.infradead.org>; Thu, 18 Sep 2014 00:46:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140918055948.GD7362@norris-Latitude-E6410>
References: <1410447730-16087-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410447730-16087-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <20140918055948.GD7362@norris-Latitude-E6410>
Date: Thu, 18 Sep 2014 08:46:15 +0100
Message-ID: <CAAEAJfDsht+-LU+ASX2fcsj2j=VKhkFzbhubMbrT5PMcOvQC8A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] nand: omap2: Add support for flash-based bad block
 table
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Tony Lindgren <tony@atomide.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 18 September 2014 06:59, Brian Norris <computersforpeace@gmail.com> wrot=
e:
> On Thu, Sep 11, 2014 at 12:02:08PM -0300, Ezequiel Garcia wrote:
>> This commit adds a new platform-data boolean property that enables use
>> of a flash-based bad block table. This can also be enabled by setting
>> the 'nand-on-flash-bbt' devicetree property.
>>
>> If the flash BBT is not enabled, the driver falls back to use OOB
>> bad block markers only, as before. If the flash BBT is enabled the
>> kernel will keep track of bad blocks using a BBT, in addition to
>> the OOB markers.
>>
>> As explained by Brian Norris the reasons for using a BBT are:
>>
>> ""
>> The primary reason would be that NAND datasheets specify it these days.
>> A better argument is that nobody guarantees that you can write a
>> bad block marker to a worn out block; you may just get program failures.
>>
>> This has been acknowledged by several developers over the last several
>> years.
>>
>> Additionally, you get a boot-time performance improvement if you only
>> have to read a few pages, instead of a page or two from every block on
>> the flash.
>> ""
>>
>> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
>
> Pushed this one to l2-mtd.git. Thanks!
>
> But I do have one question below, and I have comments for patch 2.
>
>> ---
>>  arch/arm/mach-omap2/gpmc.c                   | 2 ++
>>  drivers/mtd/nand/omap2.c                     | 6 +++++-
>>  include/linux/platform_data/mtd-nand-omap2.h | 1 +
>>  3 files changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
>> index 2f97228..b55a225 100644
>> --- a/arch/arm/mach-omap2/gpmc.c
>> +++ b/arch/arm/mach-omap2/gpmc.c
>> @@ -1440,6 +1440,8 @@ static int gpmc_probe_nand_child(struct platform_d=
evice *pdev,
>>                               break;
>>                       }
>>
>> +     gpmc_nand_data->flash_bbt =3D of_get_nand_on_flash_bbt(child);
>> +
>>       val =3D of_get_nand_bus_width(child);
>>       if (val =3D=3D 16)
>>               gpmc_nand_data->devsize =3D NAND_BUSWIDTH_16;
>> diff --git a/drivers/mtd/nand/omap2.c b/drivers/mtd/nand/omap2.c
>> index 5967b38..e1a9b31 100644
>> --- a/drivers/mtd/nand/omap2.c
>> +++ b/drivers/mtd/nand/omap2.c
>> @@ -1663,7 +1663,6 @@ static int omap_nand_probe(struct platform_device =
*pdev)
>>       mtd->owner              =3D THIS_MODULE;
>>       nand_chip               =3D &info->nand;
>>       nand_chip->ecc.priv     =3D NULL;
>> -     nand_chip->options      |=3D NAND_SKIP_BBTSCAN;
>>
>>       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>       nand_chip->IO_ADDR_R =3D devm_ioremap_resource(&pdev->dev, res);
>> @@ -1692,6 +1691,11 @@ static int omap_nand_probe(struct platform_device=
 *pdev)
>>               nand_chip->chip_delay =3D 50;
>>       }
>>
>> +     if (pdata->flash_bbt)
>> +             nand_chip->bbt_options |=3D NAND_BBT_USE_FLASH | NAND_BBT_=
NO_OOB;
>> +     else
>> +             nand_chip->options |=3D NAND_SKIP_BBTSCAN;
>
> Can you remind me: why do you use SKIP_BBTSCAN? Doesn't that mean you're
> skipping all boot-time scanning for bad blocks, and resorting to
> on-demand scanning (chip->block_bad()) every time you need to check for
> bad blocks?
>

Honestly, I have *no* idea, I just retained the previous flag, so to
keep the exact same behavior.

Roger, any ideas? If I have to guess, I'd say this is an attempt to
save some boot time.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
