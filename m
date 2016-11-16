Received: from ip2.televic.com ([81.82.194.222] helo=exchange.televic.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6uil-0004ek-IF
 for linux-mtd@lists.infradead.org; Wed, 16 Nov 2016 07:33:28 +0000
From: Cappelle Wouter <W.Cappelle@TELEVIC.com>
To: Marek Vasut <marek.vasut@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
CC: Fabio Estevam <fabio.estevam@nxp.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH] nand gpmi fix erased block bitflip counting
Date: Wed, 16 Nov 2016 07:33:02 +0000
Message-ID: <8c685cf6a6994056ab9db940649bccfd@SRV-MAIL02.TELEVIC.com>
References: <1478694920-6453-1-git-send-email-w.cappelle@televic.com>
 <1478694920-6453-2-git-send-email-w.cappelle@televic.com>
 <8aa7c7cb-5093-3bee-2807-f2734b7c7b06@gmail.com>
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

On 15-11-16 21:54, Marek Vasut wrote:=0A=
> On 11/09/2016 01:35 PM, w.cappelle@televic.com wrote:=0A=
>> From: Wouter Cappelle <w.cappelle@televic.com>=0A=
> Please add commit message explaining the purpose of the patch.=0A=
> CCing some more interested people.=0A=
Sorry, first patch, and don't know what went wrong or how to fix.=0A=
=0A=
There should have been some introduction being added to the commit:=0A=
=0A=
Some time ago, a patch was added to detect bitflips in erased pages =0A=
(http://lists.infradead.org/pipermail/linux-mtd/2014-January/051467.html).=
=0A=
After running some test on my board (i.MX6UL), I detected some unexpected =
=0A=
behavior with it, especially with the counting of the # of bitflips in the=
=0A=
erased chunks. I have the impressions that with some pattern, the gpmi bloc=
k=0A=
did try to correct the data on an empty page. Therefore the gpmi block chan=
ged=0A=
the data leading to introducing extra bitflips and failing the criteria to =
=0A=
decide if the (sub)page is erased.=0A=
=0A=
I'm using BCH8 on a 2k nand page and created a testpage with 6 bitflips at =
following locations:=0A=
0x02D:FB=0A=
0x057:FE=0A=
0xA5:FB=0A=
0x16A:FB=0A=
0x18A:DF=0A=
0x4EE:FE=0A=
=0A=
When reading the page through the driver, the page is uncorrectable (as =0A=
expected), then it will verify if the page is erased (gpmi_erased_check).=
=0A=
There i can see that the first count of the first subpage, is returning me=
=0A=
it detected 7 bitflips (should be 5 in that subpage). The second count of =
=0A=
bitflips on the full raw page returns me the correct amount of bitflips =0A=
(being 6 for the complete page).=0A=
=0A=
I Don't really see the need of the first subpage check, except of speed =0A=
improvement. But as it is failing due to the gpmi block trying to repair th=
e =0A=
page and alternating the wrong bits, I would propose to either increase the=
=0A=
threshold of the first check with the max number of repairable bitflips the=
 =0A=
gpmi block is set to, or just skip the first check since on empty pages it =
will=0A=
however not make a difference in speed. For real uncorrectable pages, this =
will=0A=
not have a huge speed penalty due to the unlikely event that this will happ=
en.=0A=
=0A=
I propose following patch to be be applied to detect the correct number of =
=0A=
bitflips based on the raw nand read data.=0A=
=0A=
>=0A=
>> ---=0A=
>>  drivers/mtd/nand/gpmi-nand/gpmi-nand.c | 14 +++++++-------=0A=
>>  1 file changed, 7 insertions(+), 7 deletions(-)=0A=
>>=0A=
>> diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/g=
pmi-nand/gpmi-nand.c=0A=
>> index 8339d4f..6ae118c 100644=0A=
>> --- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c=0A=
>> +++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c=0A=
>> @@ -1217,6 +1217,7 @@ static bool gpmi_erased_check(struct gpmi_nand_dat=
a *this,=0A=
>>  	int base =3D geo->ecc_chunkn_size * chunk;=0A=
>>  	unsigned int flip_bits =3D 0, flip_bits_noecc =3D 0;=0A=
>>  	uint64_t *buf =3D (uint64_t *)this->data_buffer_dma;=0A=
>> +	unsigned char *chunkbuf =3D(unsigned char*) this->data_buffer_dma;=0A=
>>  	unsigned int threshold;=0A=
>>  	int i;=0A=
>>  =0A=
>> @@ -1224,13 +1225,6 @@ static bool gpmi_erased_check(struct gpmi_nand_da=
ta *this,=0A=
>>  	if (threshold > geo->ecc_strength)=0A=
>>  		threshold =3D geo->ecc_strength;=0A=
>>  =0A=
>> -	/* Count bitflips */=0A=
>> -	for (i =3D 0; i < geo->ecc_chunkn_size; i++) {=0A=
>> -		flip_bits +=3D hweight8(~data[base + i]);=0A=
>> -		if (flip_bits > threshold)=0A=
>> -			return false;=0A=
>> -	}=0A=
>> -=0A=
>>  	/*=0A=
>>  	 * Read out the whole page with ECC disabled, and check it again,=0A=
>>  	 * This is more strict then just read out a chunk, and it makes=0A=
>> @@ -1246,6 +1240,12 @@ static bool gpmi_erased_check(struct gpmi_nand_da=
ta *this,=0A=
>>  			return false;=0A=
>>  	}=0A=
>>  =0A=
>> +	/* Count bitflips in the current chunk for correct stats reporting */=
=0A=
>> +	for (i =3D 0; i < geo->ecc_chunkn_size; i++) {=0A=
>> +		flip_bits +=3D hweight8(~chunkbuf[base + i]);=0A=
>> +	}=0A=
>> +=0A=
>> +=0A=
>>  	/* Tell the upper layer the bitflips we corrected. */=0A=
>>  	mtd->ecc_stats.corrected +=3D flip_bits;=0A=
>>  	*max_bitflips =3D max_t(unsigned int, *max_bitflips, flip_bits);=0A=
>>=0A=
>=0A=
=0A=
