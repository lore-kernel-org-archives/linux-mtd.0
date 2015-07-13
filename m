Received: from mail-by2on0141.outbound.protection.outlook.com
 ([207.46.100.141] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZEbUp-0006Nj-Eu
 for linux-mtd@lists.infradead.org; Mon, 13 Jul 2015 11:02:03 +0000
From: Wang Haikun <Haikun.Wang@freescale.com>
To: =?iso-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "David
 Woodhouse" <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: Get mtd_info->name from spi_device as the
 second choice
Date: Mon, 13 Jul 2015 11:01:41 +0000
Message-ID: <BN1PR0301MB0612F140B024C34535CDFDBAF89C0@BN1PR0301MB0612.namprd03.prod.outlook.com>
References: <1436515808-45639-1-git-send-email-haikun.wang@freescale.com>
 <CACna6rwo-jMcCtC4kR2CmV7fWf-b2-OSEce=S33SWRYMM5G2cA@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-2"
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

On 7/12/2015 1:14 AM, Rafa=B3 Mi=B3ecki wrote:=0A=
> On 10 July 2015 at 10:10, Haikun Wang <haikun.wang@freescale.com> wrote:=
=0A=
>> If we can't get "mtd_info->name" form struct flash_platform_data,=0A=
>> get it from "spi_device".=0A=
>>=0A=
>> Signed-off-by: Haikun Wang <haikun.wang@freescale.com>=0A=
>> ---=0A=
>>   drivers/mtd/devices/m25p80.c | 2 ++=0A=
>>   1 file changed, 2 insertions(+)=0A=
>>=0A=
>> diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c=
=0A=
>> index d313f948b..ebac9e5 100644=0A=
>> --- a/drivers/mtd/devices/m25p80.c=0A=
>> +++ b/drivers/mtd/devices/m25p80.c=0A=
>> @@ -215,6 +215,8 @@ static int m25p_probe(struct spi_device *spi)=0A=
>>=0A=
>>          if (data && data->name)=0A=
>>                  flash->mtd.name =3D data->name;=0A=
>> +       else=0A=
>> +               flash->mtd.name =3D dev_name(&spi->dev);=0A=
>=0A=
> I'm curious. Is this for changing kernel messages to include some nice=0A=
> name? Can you give us an example of before vs. after?=0A=
>=0A=
Function "spi_nor_scan" already has this checking:=0A=
if (!mtd->name)=0A=
	mtd->name =3D dev_name(dev);=0A=
commit id: 32f1b7c8352fd33d41bcec3cfb054ccdcfd40a42=0A=
This patch is duplicate.=0A=
=0A=
