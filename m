Received: from mail-bl2on0132.outbound.protection.outlook.com ([65.55.169.132]
 helo=na01-bl2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCJ8J-0004ZP-OG
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 03:01:20 +0000
From: Wang Haikun <Haikun.Wang@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Xu Han
 <han.xu@freescale.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Subject: Re: [PATCH 1/5 v1] mtd: spi-nor: fsl-quadspi: Add a variable in
 'fsl_qspi_devtype_data' to enable platform specail feature
Date: Tue, 7 Jul 2015 03:00:56 +0000
Message-ID: <BN1PR0301MB0612D8A804467338664BD8C6F8920@BN1PR0301MB0612.namprd03.prod.outlook.com>
References: <1435656518-14022-1-git-send-email-haikun.wang@freescale.com>
 <20150706223233.GD18370@brian-ubuntu>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
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

On 7/7/2015 6:32 AM, Brian Norris wrote:=0A=
> Hi Haikun,=0A=
>=0A=
> On Tue, Jun 30, 2015 at 05:28:34PM +0800, Haikun Wang wrote:=0A=
>> Add a variable in struct fsl_qspi_devtype_data.=0A=
>> Add big endian registers flag.=0A=
>> Enable big endian registers flag for LS1021A.=0A=
>>=0A=
>> Signed-off-by: Haikun Wang <haikun.wang@freescale.com>=0A=
>> ---=0A=
>>   drivers/mtd/spi-nor/fsl-quadspi.c | 7 ++++++-=0A=
>>   1 file changed, 6 insertions(+), 1 deletion(-)=0A=
>>=0A=
>> diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl=
-quadspi.c=0A=
>> index 6cd14e4..40c7953 100644=0A=
>> --- a/drivers/mtd/spi-nor/fsl-quadspi.c=0A=
>> +++ b/drivers/mtd/spi-nor/fsl-quadspi.c=0A=
>> @@ -191,6 +191,9 @@=0A=
>>   #define SEQID_EN4B		10=0A=
>>   #define SEQID_BRWR		11=0A=
>>=0A=
>> +/* Controller needs swap endian when access registers */=0A=
>> +#define QUADSPI_QUIRK_REGMAP_BE    (1 << 5)=0A=
>> +=0A=
>>   enum fsl_qspi_devtype {=0A=
>>   	FSL_QUADSPI_VYBRID,=0A=
>>   	FSL_QUADSPI_IMX6SX,=0A=
>> @@ -202,6 +205,7 @@ struct fsl_qspi_devtype_data {=0A=
>>   	int rxfifo;=0A=
>>   	int txfifo;=0A=
>>   	int ahb_buf_size;=0A=
>> +	int driver_data;=0A=
>>   };=0A=
>>=0A=
>>   static struct fsl_qspi_devtype_data vybrid_data =3D {=0A=
>> @@ -222,7 +226,8 @@ static struct fsl_qspi_devtype_data ls1_data =3D {=
=0A=
>>   	.devtype =3D FSL_QUADSPI_LS1,=0A=
>>   	.rxfifo =3D 128,=0A=
>>   	.txfifo =3D 64,=0A=
>> -	.ahb_buf_size =3D 1024=0A=
>> +	.ahb_buf_size =3D 1024,=0A=
>> +	.driver_data =3D QUADSPI_QUIRK_REGMAP_BE=0A=
>>   };=0A=
>>=0A=
>>   #define FSL_QSPI_MAX_CHIP	4=0A=
>=0A=
> This patch series appears to be based on an unreviewed, unapplied series=
=0A=
> you sent a few weeks ago. But you didn't note the dependency. In the=0A=
> future, please make note of such dependencies (e.g., by providing a=0A=
> cover letter which explains this), to help reviewers like myself. If we=
=0A=
> can't apply your patches, we can't really review them.=0A=
OK, I will re-submit them include the previous one.=0A=
>=0A=
> Thanks,=0A=
> Brian=0A=
>=0A=
=0A=
