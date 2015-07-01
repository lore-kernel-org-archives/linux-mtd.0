Received: from mx12-out14.antispamcloud.com ([46.165.232.184])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZAAlp-0005Jk-1j
 for linux-mtd@lists.infradead.org; Wed, 01 Jul 2015 05:41:18 +0000
Message-ID: <55937D58.9090102@topic.nl>
Date: Wed, 1 Jul 2015 07:40:40 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
MIME-Version: 1.0
To: Graham Moore <grmoore@opensource.altera.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <git@xilinx.com>, <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <beanhuo@micron.com>
Subject: Re: [PATCH] mtd: spi-nor: Only set Micron quad-read mode when
 controller in 4-lane TX mode
References: <1435663042-25425-1-git-send-email-mike.looijmans@topic.nl>
 <5592B8FE.3050601@opensource.altera.com>
In-Reply-To: <5592B8FE.3050601@opensource.altera.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=EF=BB=BFOn 30-06-15 17:42, Graham Moore wrote:
> On 06/30/2015 06:17 AM, Mike Looijmans wrote:
>> Micron QUAD mode expects command, address and data on 4 lanes instead of=
 just
>> one for command (extended SPI mode). This requires the controller to be =
in a
>> special mode, so check first if the controller could be in that mode. If=
 a
>> controller does not have the SPI_TX_QUAD mode set, this setting has no c=
hance
>> of being valid at all, so don't try to enable it then, and just keep usi=
ng
>> the extended SPI mode.
>>
>> Tested on a Zynq 7000 with a n25q256a flash chip, this failed to functio=
n
>> because of the introduction of:
>> "driver:mtd:spi-nor: Add quad I/O support for Micron spi nor"
>> This commit sets QUAD mode for most Micron chips without asking the cont=
roller
>> whether it's possible to do so, and without telling the controller that =
a
>> different mode is required, so it couldn't work.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>>   drivers/mtd/spi-nor/spi-nor.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor=
.c
>> index e8f6131..10ba94f 100644
>> --- a/drivers/mtd/spi-nor/spi-nor.c
>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>> @@ -1398,6 +1398,8 @@ static int set_quad_mode(struct spi_nor *nor, stru=
ct
>> flash_info *info)
>>           }
>>           return status;
>>       case CFI_MFR_ST:
>> +        if (!(nor->spi->mode & SPI_TX_QUAD))
>> +            return 0;
>
> This is a great idea, but what codebase are you working from?  My l2-mtd =
tree
> doesn't have a 'spi' member of spi_nor, and this case statement is around=
 line
> 977, not 1398.

I was working from the Xilinx kernel tree, and there's a lot of changes the=
re.=20
The one that added the "struct spi_device* spi" to the nor struct is:
63697f5cf9a6201556947ef0ea29442843e5ba61 mtd: spi-nor: Changes for stacked =
and=20
parallel

>>           status =3D micron_quad_enable(nor);
>>           if (status) {
>>               dev_err(nor->dev, "Micron quad-read not enabled\n");
>>




Kind regards,

Mike Looijmans
System Expert

TOPIC Embedded Products
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: +31 (0) 499 33 69 79
Telefax: +31 (0) 499 33 69 70
E-mail: mike.looijmans@topicproducts.com
Website: www.topicproducts.com

Please consider the environment before printing this e-mail
