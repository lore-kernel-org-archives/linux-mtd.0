Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVlUl-0008F0-SY
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 22:22:34 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Richard Weinberger <richard@nod.at>, "Marek
 Vasut" <marek.vasut@gmail.com>
Subject: Re: [PATCH v3 4/4] mtd: rawnand: micron: support 8/512 on-die ECC
Date: Wed, 20 Jun 2018 22:22:05 +0000
Message-ID: <ee9e30c5c95e49a7b0a3692db7c85338@svr-chch-ex1.atlnz.lc>
References: <20180620050544.31549-1-chris.packham@alliedtelesis.co.nz>
 <20180620050544.31549-5-chris.packham@alliedtelesis.co.nz>
 <20180620100232.0ad18adc@bbrezillon>
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

On 20/06/18 20:02, Boris Brezillon wrote:=0A=
> On Wed, 20 Jun 2018 17:05:44 +1200=0A=
> Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> Micron MT29F1G08ABAFAWP-ITE:F supports an on-die ECC with 8 bits=0A=
>> per 512 bytes. Add support for this combination.=0A=
>>=0A=
>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>> ---=0A=
>> Changes in v2:=0A=
>> - New=0A=
>> Changes in v3:=0A=
>> - Handle reporting of corrected errors that don't require a rewrite, exp=
and=0A=
>>    comment for the ECC status bits.=0A=
>>=0A=
>>   drivers/mtd/nand/raw/nand_micron.c | 34 ++++++++++++++++++++++++------=
=0A=
>>   1 file changed, 27 insertions(+), 7 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/raw/n=
and_micron.c=0A=
>> index 5cec79372181..0c2bde4411d7 100644=0A=
>> --- a/drivers/mtd/nand/raw/nand_micron.c=0A=
>> +++ b/drivers/mtd/nand/raw/nand_micron.c=0A=
>> @@ -18,10 +18,24 @@=0A=
>>   #include <linux/mtd/rawnand.h>=0A=
>>   =0A=
>>   /*=0A=
>> - * Special Micron status bit that indicates when the block has been=0A=
>> - * corrected by on-die ECC and should be rewritten=0A=
>> + * Special Micron status bit 3 indicates that the block has been=0A=
>> + * corrected by on-die ECC and should be rewritten.=0A=
>> + *=0A=
>> + * On chips with 8-bit ECC and additional bit can be used to distinguis=
h=0A=
>> + * cases where a errors were corrected without needing a rewrite=0A=
>> + *=0A=
>> + * Bit 4 Bit 3 Bit 0 Description=0A=
>> + * ----- ----- ----- -----------=0A=
>> + * 0     0     0     No Errors=0A=
>> + * 0     0     1     Multiple uncorrected errors=0A=
>> + * 0     1     0     4 - 6 errors corrected, recommend rewrite=0A=
>> + * 0     0     1     Reserved=0A=
>> + * 1     0     0     1 - 3 errors corrected=0A=
>> + * 1     0     1     Reserved=0A=
>> + * 1     1     0     7 - 8 errors corrected, recommend rewrite=0A=
>>    */=0A=
>>   #define NAND_STATUS_WRITE_RECOMMENDED	BIT(3)=0A=
>> +#define NAND_STATUS_ERRORS_CORRECTED	BIT(4)=0A=
>>   =0A=
>>   struct nand_onfi_vendor_micron {=0A=
>>   	u8 two_plane_read;=0A=
>> @@ -141,7 +155,7 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *mt=
d, struct nand_chip *chip,=0A=
>>   		mtd->ecc_stats.failed++;=0A=
>>   =0A=
>>   	/*=0A=
>> -	 * The internal ECC doesn't tell us the number of bitflips=0A=
>> +	 * The internal 4-bit ECC doesn't tell us the number of bitflips=0A=
>>   	 * that have been corrected, but tells us if it recommends to=0A=
>>   	 * rewrite the block. If it's the case, then we pretend we had=0A=
>>   	 * a number of bitflips equal to the ECC strength, which will=0A=
>> @@ -149,6 +163,12 @@ micron_nand_read_page_on_die_ecc(struct mtd_info *m=
td, struct nand_chip *chip,=0A=
>>   	 */=0A=
>>   	else if (status & NAND_STATUS_WRITE_RECOMMENDED)=0A=
>>   		max_bitflips =3D chip->ecc.strength;=0A=
>> +	/*=0A=
>> +	 * Chips with 8-bit internal ECC do tell us if errors 1 to 3 bit=0A=
>> +	 * errors have been corrected without recommending a rewrite.=0A=
>> +	 */=0A=
>> +	else if (status & NAND_STATUS_ERRORS_CORRECTED)=0A=
>> +		max_bitflips =3D 3;=0A=
> =0A=
> Why not masking bit 3, 4 and 0 and having a switch-case block?=0A=
=0A=
Mainly because the existing code was just checking bit 3 and that =0A=
happened to worked for my use-case.=0A=
=0A=
I'm happy to re-work it as you've suggested can anyone point me at the =0A=
datasheet for a 4/512 on-die chip (or just the part number I can lookup =0A=
on mircon's site).=0A=
=0A=
> =0A=
> Also, you should update ecc_stats.corrected (see the patch I just sent=0A=
> [1]).=0A=
> =0A=
=0A=
Will do. I'll pull in your patch and base v4 on top of that.=0A=
=0A=
>>   =0A=
>>   	ret =3D nand_read_data_op(chip, buf, mtd->writesize, false);=0A=
>>   	if (!ret && oob_required)=0A=
>> @@ -240,9 +260,9 @@ static int micron_supports_on_die_ecc(struct nand_ch=
ip *chip)=0A=
>>   =0A=
>>   	/*=0A=
>>   	 * Some Micron NANDs have an on-die ECC of 4/512, some other=0A=
>> -	 * 8/512. We only support the former.=0A=
>> +	 * 8/512.=0A=
>>   	 */=0A=
>> -	if (chip->ecc_strength_ds !=3D 4)=0A=
>> +	if (chip->ecc_strength_ds !=3D 4 && chip->ecc_strength_ds !=3D 8)=0A=
>>   		return MICRON_ON_DIE_UNSUPPORTED;=0A=
=0A=
I was thinking about removing this. The original code excluded 8/512 due =
=0A=
to lack of access to a chip that implements this, which I now have.=0A=
=0A=
> Given that our on-die-support detection procedure is not reliable, I'd=0A=
> recommend changing the way we do it and instead base this detection=0A=
> logic on the model name (in the ONFI param page) or the READ_ID bytes.=0A=
> =0A=
=0A=
The problem is I don't know an exhaustive list of IDs that this applies =0A=
to. I guess having a list of known IDs and falling back to the current =0A=
detection is probably the best approach unless Micron get back to us =0A=
with some other method of detecting these and determining if it is =0A=
forceably enabled.=0A=
=0A=
>>   =0A=
>>   	return MICRON_ON_DIE_SUPPORTED;=0A=
>> @@ -274,9 +294,9 @@ static int micron_nand_init(struct nand_chip *chip)=
=0A=
>>   			return -EINVAL;=0A=
>>   		}=0A=
>>   =0A=
>> -		chip->ecc.bytes =3D 8;=0A=
>> +		chip->ecc.bytes =3D chip->ecc_strength_ds * 2;=0A=
>>   		chip->ecc.size =3D 512;=0A=
>> -		chip->ecc.strength =3D 4;=0A=
>> +		chip->ecc.strength =3D chip->ecc_strength_ds;=0A=
>>   		chip->ecc.algo =3D NAND_ECC_BCH;=0A=
>>   		chip->ecc.read_page =3D micron_nand_read_page_on_die_ecc;=0A=
>>   		chip->ecc.write_page =3D micron_nand_write_page_on_die_ecc;=0A=
> =0A=
> [1]http://patchwork.ozlabs.org/patch/932006/=0A=
> =0A=
=0A=
