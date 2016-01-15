Received: from mail-bn1on0147.outbound.protection.outlook.com
 ([157.56.110.147] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aK1HV-0005dv-So
 for linux-mtd@lists.infradead.org; Fri, 15 Jan 2016 10:06:58 +0000
From: Hou Zhiqiang <B48286@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>, Zhiqiang Hou
 <Zhiqiang.Hou@freescale.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: Add SPI NOR layer PM support
Date: Fri, 15 Jan 2016 10:06:34 +0000
Message-ID: <CY1PR0301MB0780D34755919F92E7E002318BCD0@CY1PR0301MB0780.namprd03.prod.outlook.com>
References: <1451033707-44170-1-git-send-email-Zhiqiang.Hou@freescale.com>,
 <20160106235231.GQ109450@google.com>
In-Reply-To: <20160106235231.GQ109450@google.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Thanks for your comments!

>On Fri, Dec 25, 2015 at 04:55:06PM +0800, Zhiqiang Hou wrote:
>> From: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
>>=20
>> Add the Power Management API in SPI NOR framework.
>> The Power Management system will turn off power supply to SPI flash
>> when system suspending, and then the SPI flash will be in the reset
>> state after system resuming. As a result, the status&configurations
>> of SPI flash driver will mismatch with its current hardware state.
>> So reinitialize SPI flash to make sure it is resumed to the correct
>> state.
>> And the SPI NOR layer just do common configuration depending on the=20
>> records in structure spi_nor.
>>=20
>> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@freescale.com>
>> ---=20
>> V2:=20
>>  - New patch
>>=20
>>  drivers/mtd/spi-nor/spi-nor.c | 44 ++++++++++++++++++++++++++++++++++++=
+++++++
>>  include/linux/mtd/spi-nor.h   |  9 +++++++++
>>  2 files changed, 53 insertions(+)
>>=20
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor=
.c
>> index 4988390..4030d37c 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1365,6 +1365,50 @@ int spi_nor_scan(struct spi_nor *nor, const char =
*name, enum read_mode mode)
>>  }
>>  EXPORT_SYMBOL_GPL(spi_nor_scan);
>> =20
>> +#ifdef CONFIG_PM_SLEEP
>> +static int spi_nor_hw_reinit(struct spi_nor *nor)
>> +{
>> +     const struct flash_info *info =3D NULL;
>> +     struct device *dev =3D nor->dev;
>> +     int ret;
>> +
>> +     info =3D spi_nor_read_id(nor);
>> +     if (JEDEC_MFR(info) =3D=3D SNOR_MFR_ATMEL ||
>> +         JEDEC_MFR(info) =3D=3D SNOR_MFR_INTEL ||
>> +         JEDEC_MFR(info) =3D=3D SNOR_MFR_SST ||
>> +         JEDEC_MFR(info) =3D=3D SNOR_MFR_WINBOND) {
>> +             write_enable(nor);
>> +             write_sr(nor, 0);=20
>> +     }  =20
>> +
>> +     if (nor->flash_read =3D=3D SPI_NOR_QUAD) {
>> +             ret =3D set_quad_mode(nor, info);
>> +             if (ret) {
>> +                     dev_err(dev, "quad mode not supported\n");
>> +                     return ret;
>> +             }
>> +     }
>> +
>> +     if (nor->addr_width =3D=3D 4 && !info->addr_width &&
>> +                     JEDEC_MFR(info) !=3D SNOR_MFR_SPANSION)
>> +             set_4byte(nor, info, 1);
>
>You're duplicating a bunch of code from spi_nor_scan(). Please don't do
>that. Find a good way to share it.
>

This will be arranged in next version.

>> +     return 0;
>> +}
>> +
>> +int spi_nor_suspend(struct spi_nor *nor)
>> +{
>> +     return 0;
>> +}
>> +EXPORT_SYMBOL_GPL(spi_nor_suspend);
>> +
>> +int spi_nor_resume(struct spi_nor *nor)
>> +{
>> +     return spi_nor_hw_reinit(nor);
>> +}
>> +EXPORT_SYMBOL_GPL(spi_nor_resume);
>> +#endif /* CONFIG_PM_SLEEP */
>
>What happens if a driver wants this with !CONFIG_PM_SLEEP? I think it's
>best if you just unconditionally add spi_nor_{suspend,resume}().
>

Ok, will remove the condition.

Thanks,
Zhiqiang=
