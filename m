Received: from s159.web-hosting.com ([68.65.121.203])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZS7Uf-0001pS-EG
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 17:49:46 +0000
Received: from mail-la0-f42.google.com ([209.85.215.42]:35992)
 by server159.web-hosting.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.85) (envelope-from <jteki@openedev.com>) id 1ZS7UF-002IM9-Ct
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 13:49:22 -0400
Received: by lagz9 with SMTP id z9so7774835lag.3
 for <linux-mtd@lists.infradead.org>; Wed, 19 Aug 2015 10:49:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CY1PR0301MB07803A969EC23D39E0FC9F7A8B670@CY1PR0301MB0780.namprd03.prod.outlook.com>
References: <1439978205-6092-1-git-send-email-jteki@openedev.com>
 <1439978205-6092-3-git-send-email-jteki@openedev.com>
 <CY1PR0301MB07803A969EC23D39E0FC9F7A8B670@CY1PR0301MB0780.namprd03.prod.outlook.com>
Date: Wed, 19 Aug 2015 23:19:17 +0530
Message-ID: <CAD6G_RSVwXjyXRfqXYtusE1n+BZ=3H8AXJiU3idsyMymAQXGLQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: spi-nor: sf: Add clear flag status register
 support
From: Jagan Teki <jteki@openedev.com>
To: Hou Zhiqiang <B48286@freescale.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Hu Vincent <Mingkai.Hu@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

Hi Zhiqiang,

On 19 August 2015 at 17:42, Hou Zhiqiang <B48286@freescale.com> wrote:
> Hi Jagan,
>
>> -----Original Message-----
>> From: Jagan Teki [mailto:jteki@openedev.com]
>> Sent: 2015=E5=B9=B48=E6=9C=8819=E6=97=A5 17:57
>> To: linux-mtd@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org; Jagan Teki; Hou Zhiqiang-B48286; Hu
>> Mingkai-B21284; David Woodhouse; Brian Norris
>> Subject: [PATCH 3/3] mtd: spi-nor: sf: Add clear flag status register
>> support
>>
>> The clear flag status register operation was required by Micron SPI-NOR
>> chips, which support FSR. And if an error bit of FSR have been set like
>> protection, voltage, erase, and program, it must be cleared by the clear
>> FSR operation.
>>
>> Signed-off-by: Jagan Teki <jteki@openedev.com>
>> Cc: Hou Zhiqiang <B48286@freescale.com>
>> Cc: Mingkai.Hu <Mingkai.Hu@freescale.com>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: Brian Norris <computersforpeace@gmail.com>
>> ---
>>  drivers/mtd/spi-nor/spi-nor.c | 35 +++++++++++++++++++++++++++++++----
>>  include/linux/mtd/spi-nor.h   |  9 +++++++++
>>  2 files changed, 40 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-
>> nor.c index f954d03..c5c472d5 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -100,6 +100,28 @@ static int read_fsr(struct spi_nor *nor)  }
>>
>>  /*
>> + * Read the clear flag status register.
>> + * The clear flag status register operation was required by Micron
>> + * SPI-NOR chips, which support FSR. And if an error bit of FSR
>> + * have been set like protection, voltage, erase, and program,
>> + * it must be cleared by the clear FSR operation.
>> + * Returns zero for FSR bits cleared and negative if error occurred.
>> + */
>> +static int read_cfsr(struct spi_nor *nor) {
>> +     int ret;
>> +     u8 val;
>> +
>> +     ret =3D nor->read_reg(nor, SPINOR_OP_RDCFSR, &val, 1);
>
> There should be a write_reg instead of read_reg.
> There isn=E2=80=99t a register named CFSR, and the command SPINOR_OP_RDCF=
SR
> is used to clear the FSR, another words reset FSR to default value.

Yes, SPINOR_OP_RDCFSR is clear flag status register, for clearing errors bi=
ts
on fsr we need to read cfsr once.

>
>> +     if (ret < 0) {
>> +             pr_err("error %d reading CFSR\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     return val;
>> +}
>> +
>> +/*
>>   * Read configuration register, returning its value in the
>>   * location. Return the configuration register value.
>>   * Returns negative if error occured.
>> @@ -209,10 +231,15 @@ static inline int spi_nor_sr_ready(struct spi_nor
>> *nor)  static inline int spi_nor_fsr_ready(struct spi_nor *nor)  {
>>       int fsr =3D read_fsr(nor);
>> -     if (fsr < 0)
>> -             return fsr;
>> -     else
>> -             return fsr & FSR_READY;
>> +     if (fsr & FSR_ERR_MASK) {
>> +             pr_err("flag status(0x%x) error occured\n", fsr);
>> +             int cfsr =3D read_cfsr(nor);
>> +             if (cfsr < 0)
>> +                     return cfsr;
>> +             return -1;
>> +     }
>> +
>> +     return fsr & FSR_READY;
>>  }
>>
>>  static int spi_nor_ready(struct spi_nor *nor) diff --git
>> a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h index
>> c5a58c4..36c1681 100644
>> --- a/include/linux/mtd/spi-nor.h
>> +++ b/include/linux/mtd/spi-nor.h
>> @@ -35,6 +35,7 @@
>>  #define SPINOR_OP_RDID               0x9f    /* Read JEDEC ID */
>>  #define SPINOR_OP_RDCR               0x35    /* Read configuration regi=
ster */
>>  #define SPINOR_OP_RDFSR              0x70    /* Read flag status regist=
er */
>> +#define SPINOR_OP_RDCFSR     0x50    /* Read clear flag status register=
 */
>>
>>  /* 4-byte address opcodes - used on Spansion and some Macronix flashes.
>> */
>>  #define SPINOR_OP_READ4              0x13    /* Read data bytes (low
>> frequency) */
>> @@ -74,6 +75,14 @@
>>  /* Enhanced Volatile Configuration Register bits */
>>  #define EVCR_QUAD_EN_MICRON    0x80    /* Micron Quad I/O */
>>
>> +/* Flag Status Register Error bits */
>> +#define FSR_ERR_PROT         0x2     /* Protection */
>> +#define FSR_ERR_VOLT         0x8     /* Voltage on Vpp */
>> +#define FSR_ERR_PROG         0x10    /* Program operation */
>> +#define FSR_ERR_ERASE                0x20    /* Erase operation */
>> +#define FSR_ERR_MASK         (FSR_ERR_PROT | FSR_ERR_VOLT | \
>> +                             FSR_ERR_PROG | FSR_ERR_ERASE)
>> +
>>  /* Flag Status Register bits */
>>  #define FSR_READY            0x80

thanks!
--=20
Jagan | openedev.
