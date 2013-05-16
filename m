Received: from mail-db9lp0251.outbound.messaging.microsoft.com
 ([213.199.154.251] helo=db9outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uco2x-0005fX-OF
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 02:36:01 +0000
Message-ID: <51944680.7010608@freescale.com>
Date: Thu, 16 May 2013 10:37:52 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: [PATCH v5 06/11] mtd: get the ECC info from the Extended Parameter
 Page
References: <1368607232-2210-1-git-send-email-b32955@freescale.com>
 <1368607232-2210-7-git-send-email-b32955@freescale.com>
 <5193BE8F.6010807@gmail.com>
In-Reply-To: <5193BE8F.6010807@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B405=E6=9C=8816=E6=97=A5 00:57, Vikram Narayanan =E5=
=86=99=E9=81=93:
> On 5/15/2013 2:10 PM, Huang Shijie wrote:
>> Since the ONFI 2.1, the onfi spec adds the Extended Parameter Page
>> to store the ECC info.
>>
>> The onfi spec tells us that if the nand chip's recommended ECC codewor=
d
>> size is not 512 bytes, then the @ecc_bits is 0xff. The host _SHOULD_=20
>> then
>
> Section 3.4.2 also says,
> "If a value of 0 is reported then this ECC Information Block is=20
> invalid and should not be used".
>
> Is this taken care anywhere?
I did not take care of this case. :(

>
>> read the Extended ECC information that is part of the extended paramet=
er
>> page to retrieve the ECC requirements for this device.
>>
>> This patch implement the reading of the Extended Parameter Page, and=20
>> parses
>> the sections for ECC type, and get the ECC info from the ECC section.
>>
>> Tested this patch with Micron MT29F64G08CBABAWP.
>>
>> Acked-by: Pekon Gupta <pekon@ti.com>
>> Signed-off-by: Huang Shijie <b32955@freescale.com>
>> ---
>> drivers/mtd/nand/nand_base.c | 77=20
>> ++++++++++++++++++++++++++++++++++++++++++
>> 1 files changed, 77 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base=
.c
>> index 15630ef..e98ea69 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -2835,6 +2835,68 @@ static u16 onfi_crc16(u16 crc, u8 const *p,=20
>> size_t len)
>> return crc;
>> }
>>
>> +/* Parse the Extended Parameter Page. */
>> +static int nand_flash_detect_ext_param_page(struct mtd_info *mtd,
>> + struct nand_chip *chip, struct nand_onfi_params *p)
>> +{
>> + struct onfi_ext_param_page *ep;
>> + struct onfi_ext_section *s;
>> + struct onfi_ext_ecc_info *ecc;
>> + uint8_t *cursor;
>> + int len;
>> + int ret;
>> + int i;
>> +
>> + len =3D le16_to_cpu(p->ext_param_page_length) * 16;
>> + ep =3D kmalloc(len, GFP_KERNEL);
>> + if (!ep) {
>> + ret =3D -ENOMEM;
>> + goto ext_out;
>
> Just return -ENOMEM.
> Why do you free the memory when it is not allocated? (Though it=20
> doesn't cause any harm)
For the simplicity of the code. i did so on purpose.

it's no use to add new error label for this case.

thanks
Huang Shijie
