Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVkOm-0004M1-Su
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 21:12:20 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>, "Marek
 Vasut" <marek.vasut@gmail.com>
Subject: Re: [PATCH v3 3/4] mtd: rawnand: micron: add fixup for ONFI revision
Date: Wed, 20 Jun 2018 21:12:02 +0000
Message-ID: <5e3b8f2f896f44aaab97086dceb2a69b@svr-chch-ex1.atlnz.lc>
References: <20180620050544.31549-1-chris.packham@alliedtelesis.co.nz>
 <20180620050544.31549-4-chris.packham@alliedtelesis.co.nz>
 <20180620095410.664091d8@bbrezillon>
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

On 20/06/18 19:54, Boris Brezillon wrote:=0A=
> On Wed, 20 Jun 2018 17:05:43 +1200=0A=
> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> Some Micron NAND chips (MT29F1G08ABAFAWP-ITE:F) report 00 00 for the=0A=
>> revision number field of the ONFI parameter page. Rather than rejecting=
=0A=
>> these outright assume ONFI version 1.0 if the revision number is 00 00.=
=0A=
>>=0A=
>> Reviewed-by: Boris Brezillon <boris.brezillon@bootlin.com>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>> This is now qualified on vendor =3D=3D MICRON. I haven't qualified this=
=0A=
>> based on specific chips the ABAFA (id=3Dd1) and ABBFA (id=3Da1) variants=
 are=0A=
>> documented to have this behaviour.=0A=
>>=0A=
>> Changes in v2:=0A=
>> - use fixup_onfi_param_page=0A=
>> Changes in v3:=0A=
>> - add code comment next to workaround=0A=
>>=0A=
>>   drivers/mtd/nand/raw/nand_micron.c | 13 +++++++++++++=0A=
>>   1 file changed, 13 insertions(+)=0A=
>>=0A=
>> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/n=
and_micron.c=0A=
>> index 5ec4c90a637d..5cec79372181 100644=0A=
>> --- a/drivers/mtd/nand/raw/nand_micron.c=0A=
>> +++ b/drivers/mtd/nand/raw/nand_micron.c=0A=
>> @@ -289,6 +289,19 @@ static int micron_nand_init(struct nand_chip *chip)=
=0A=
>>   	return 0;=0A=
>>   }=0A=
>>   =0A=
>> +static void micron_fixup_onfi_param_page(struct nand_chip *chip,=0A=
>> +					 struct nand_onfi_params *p)=0A=
>> +{=0A=
>> +	/*=0A=
>> +	 * MT29F1G08ABAFAWP-ITE:F and possibly others report 00 00 for the=0A=
>> +	 * revision number field of the ONFI parameter page. Assume ONFI=0A=
>> +	 * version 1.0 if the revision number is 00 00.=0A=
>> +	 */=0A=
>> +	if (le16_to_cpu(p->revision) =3D=3D 0)=0A=
>> +		p->revision =3D cpu_to_le16(1 << 1);=0A=
> =0A=
> Would be better to have macros defining all version numbers in rawnand.h=
=0A=
> =0A=
> #define ONFI_VERSION_1_0		BIT(1)=0A=
> #define ONFI_VERSION_2_0		BIT(2)=0A=
> #define ONFI_VERSION_2_1		BIT(3)=0A=
> #define ONFI_VERSION_2_2		BIT(4)=0A=
> #define ONFI_VERSION_2_3		BIT(5)=0A=
> #define ONFI_VERSION_3_0		BIT(6)=0A=
> #define ONFI_VERSION_3_1		BIT(7)=0A=
> #define ONFI_VERSION_3_2		BIT(8)=0A=
> #define ONFI_VERSION_4_0		BIT(9)=0A=
> =0A=
=0A=
Make sense. Do you want me to do so in a v4 or send a new patch and =0A=
clean up the other uses?=0A=
=0A=
>> +}=0A=
>> +=0A=
>>   const struct nand_manufacturer_ops micron_nand_manuf_ops =3D {=0A=
>>   	.init =3D micron_nand_init,=0A=
>> +	.fixup_onfi_param_page =3D micron_fixup_onfi_param_page,=0A=
>>   };=0A=
> =0A=
> =0A=
=0A=
