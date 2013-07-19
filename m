Received: from mail-ob0-x235.google.com ([2607:f8b0:4003:c01::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V00Ni-0002gP-65
 for linux-mtd@lists.infradead.org; Fri, 19 Jul 2013 02:25:18 +0000
Received: by mail-ob0-f181.google.com with SMTP id 16so4540704obc.26
 for <linux-mtd@lists.infradead.org>; Thu, 18 Jul 2013 19:24:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+7tXihoZZhpoyvxj58c+Zi-Zy631kK5s-kDoSxPKq=ej0qyvA@mail.gmail.com>
References: <CAHSAbzP0Nc1ahf_ra6yDuMvV998_+EGcUOGDv5ifKaagYf+NOg@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E84D2@DBDE04.ent.ti.com>
 <CAHSAbzMDOWo5oBqUHqMxybuDwUjFbczYwN+85gH+rxZ9z8u2Pw@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E851E@DBDE04.ent.ti.com>
 <593AEF6C47F46446852B067021A273D6D93B49E1@MUCSE039.lantiq.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9E85D0@DBDE04.ent.ti.com>
 <CAHSAbzP5jqHwCm0qhu=DiNzpP0swqWHsQ0=MnF+EKaSN22E5hg@mail.gmail.com>
 <CA+7tXihoZZhpoyvxj58c+Zi-Zy631kK5s-kDoSxPKq=ej0qyvA@mail.gmail.com>
Date: Fri, 19 Jul 2013 10:24:56 +0800
Message-ID: <CAHSAbzNNLbfot_j1rBUsd+1NUJcWeGkCReD+iTMsV-CoprOb=w@mail.gmail.com>
Subject: Re: support DUAL and QUAD[patch v1]
From: yuhang wang <wangyuhang2014@gmail.com>
To: Trent Piepho <tpiepho@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "thomas.langer@lantiq.com" <thomas.langer@lantiq.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, "spi-devel-general@lists.sourceforge.net"
 <spi-devel-general@lists.sourceforge.net>, "Poddar,
 Sourav" <sourav.poddar@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Trent,

2013/7/18 Trent Piepho <tpiepho@gmail.com>:
> On Wed, Jul 17, 2013 at 6:58 PM, yuhang wang <wangyuhang2014@gmail.com> wrote:
>> >> > >
>> >> > > > [Pekon]: Instead of adding new fields you can use existing 'mode'
>> >> > > > field
>> >> to
>> >> > > > pass on the platform specific configurations. And if 'u8 mode'
>> >> > > > does not
>> >> > > > suffice you can increase it to 'u32'.
>
> But what about spidev?
>
>> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
>> index 004b10f..36d2451 100644
>> --- a/drivers/spi/spi.c
>> +++ b/drivers/spi/spi.c
>> @@ -868,6 +868,14 @@ static void of_register_spi_devices(struct
>> spi_master *master)
>>   spi->mode |= SPI_CS_HIGH;
>>   if (of_find_property(nc, "spi-3wire", NULL))
>>   spi->mode |= SPI_3WIRE;
>> + if (of_find_property(nc, "spi-tx-dual", NULL))
>> + spi->mode |= SPI_TX_DUAL;
>> + if (of_find_property(nc, "spi-tx-quad", NULL))
>> + spi->mode |= SPI_TX_QUAD;
>> + if (of_find_property(nc, "spi-rx-dual", NULL))
>> + spi->mode |= SPI_RX_DUAL;
>> + if (of_find_property(nc, "spi-rx-quad", NULL))
>> + spi->mode |= SPI_RX_QUAD;
>>
>>   /* Device speed */
>>   prop = of_get_property(nc, "spi-max-frequency", &len);
>> @@ -1316,6 +1324,12 @@ int spi_setup(struct spi_device *spi)
>>   /* help drivers fail *cleanly* when they need options
>>   * that aren't supported with their current master
>>   */
>> + if (((spi->mode >> 8) & 0x03) == 0x03 ||
>> + ((spi->mode >> 10) & 0x03) == 0x03) {
>> + dev_err(&spi->dev,
>> + "setup: can not select dual and quad at the same time\n");
>> + return -EINVAL;
>> + }
>
> Maybe it would make more sense to have a spi-rx-width and spi-tx-width
> than can be set to 1, 2, 4, etc. bits instead of a bunch of properties
> that are mutually exclusive?  Sooner or later someone is going to want
> 8 bits.
>
>> diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
>> index 38c2b92..e9ba1cf 100644
>> --- a/include/linux/spi/spi.h
>> +++ b/include/linux/spi/spi.h
>> @@ -74,7 +74,7 @@ struct spi_device {
>>   struct spi_master *master;
>>   u32 max_speed_hz;
>>   u8 chip_select;
>> - u8 mode;
>> + u16 mode;
>
> What about this, from include/uapi/linux/spi/spidev.h:
>
> /* Read / Write of SPI mode (SPI_MODE_0..SPI_MODE_3) */
> #define SPI_IOC_RD_MODE                 _IOR(SPI_IOC_MAGIC, 1, __u8)
> #define SPI_IOC_WR_MODE                 _IOW(SPI_IOC_MAGIC, 1, __u8)
>
> Note that you can't just change the type in the ioctl define, as it
> won't be backward compatible.
well, got it.Still need to be considered. Thanks
