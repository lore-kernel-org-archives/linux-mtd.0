Received: from tx2ehsobe003.messaging.microsoft.com ([65.55.88.13]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UUTBV-0006DE-3c
 for linux-mtd@lists.infradead.org; Tue, 23 Apr 2013 02:42:22 +0000
Message-ID: <5175F56B.5040200@freescale.com>
Date: Tue, 23 Apr 2013 10:43:55 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 3/8] mtd: get the ECC info from the Extended Parameter
 Page
References: <1366616878-29481-1-git-send-email-b32955@freescale.com>	<1366616878-29481-4-git-send-email-b32955@freescale.com>
 <CAN8TOE_xOBTv7weAqYinFMmTStXgY93KanV-jDAqFnY=CEfkdQ@mail.gmail.com>
In-Reply-To: <CAN8TOE_xOBTv7weAqYinFMmTStXgY93KanV-jDAqFnY=CEfkdQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B404=E6=9C=8823=E6=97=A5 05:22, Brian Norris =E5=86=99=
=E9=81=93:
> On Mon, Apr 22, 2013 at 12:47 AM, Huang Shijie<b32955@freescale.com>  w=
rote:
>> Since the ONFI 2.1, the onfi spec adds the Extended Parameter Page
>> to store the ECC info.
>>
>> The onfi spec tells us that if the nand chip's recommended ECC codewor=
d
>> size is not 512 bytes, then the @ecc_bits is 0xff. The host _SHOULD_ t=
hen
>> read the Extended ECC information that is part of the extended paramet=
er
>> page to retrieve the ECC requirements for this device.
>>
>> This patch implement the reading of the Extended Parameter Page, and p=
arses
>> the sections for ECC type, and get the ECC info from the ECC section.
>>
>> Tested this patch with Micron MT29F64G08CBABAWP.
>>
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> ---
>>   drivers/mtd/nand/nand_base.c |   54 ++++++++++++++++++++++++++++++++=
++++++++++
>>   1 files changed, 54 insertions(+), 0 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base=
.c
>> index beff911..48ff097 100644
>> --- a/drivers/mtd/nand/nand_base.c
>> +++ b/drivers/mtd/nand/nand_base.c
>> @@ -2846,6 +2846,56 @@ static u16 onfi_crc16(u16 crc, u8 const *p, siz=
e_t len)
>>          return crc;
>>   }
>>
>> +/* Parse the Extended Parameter Page. */
>> +static void nand_flash_detect_ext_param_page(struct mtd_info *mtd,
>> +               struct nand_chip *chip, struct nand_onfi_params *p, in=
t last)
>> +{
> I think we want a return code (int) for this function. It obviously
> can fail, and the caller needs to know this.
I not sure who will uses ecc_strength/ecc_size, except the gpmi.
So i ignore the return value.

If you think we should add it, i will add it.
> The "last" parameter is not very obvious until you read the whole
> function, where you see that this function assumes a lot about the
> caller. Please address the comments below and/or fully document the
> parameters and calling context for this function.
>
ok. I can add more comments.

>> +       struct onfi_ext_param_page *ep;
>> +       struct onfi_ext_section *s;
>> +       struct onfi_ext_ecc_info *ecc;
>> +       uint8_t *cursor;
>> +       int len;
>> +       int i;
>> +
>> +       len =3D le16_to_cpu(p->ext_param_page_length) * 16;
>> +       ep =3D kcalloc(1, max_t(int, len, sizeof(*p)), GFP_KERNEL);
>> +       if (!ep)
>> +               goto ext_out;
>> +
>> +       /*
>> +        * Skip the ONFI Parameter Pages.
>> +        * The Change Read Columm command may does not works here.
> Why not?
>
You can give me a fix patch which bases on my patch set.
I can test it. :)

I tried to use the Change-read-columm command, but failed.

>> +        */
>> +       for (i =3D last + 1; i<  p->num_of_param_pages; i++)
>> +               chip->read_buf(mtd, (uint8_t *)ep, sizeof(*p));
> You never sent a command to the chip. How can you expect to read from i=
t?
we have sent a command in the nand_flash_detect_onfi().
> It seems that you are writing this function with the assumption of a
> particular calling context (a context in which the last command was
> CMD_PARAM). IMO, it would make a lot more sense that this function
> actually send its own CMD_PARAM followed by either X bytes of skipped
> read_buf() or a change read column command. Then it doesn't need the
> "last" argument, and its usage makes much more sense.
>
I added the "last" argument just because the Change-read-column command=20
did not works.


thanks
Huang Shijie
