Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVHxG-0003oO-NO
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2013 08:55:04 +0000
Message-ID: <5178EFC9.9080207@freescale.com>
Date: Thu, 25 Apr 2013 16:56:41 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V3 6/9] mtd: add a new field for ecc info in the
 nand_flash_dev{}
References: <1366707297-31309-1-git-send-email-b32955@freescale.com>	<1366707297-31309-7-git-send-email-b32955@freescale.com>
 <CAN8TOE_5CeJfGpgJtKBXmb5ai3w9dZ8juk5GdQhRTZQ7MPKbZw@mail.gmail.com>
In-Reply-To: <CAN8TOE_5CeJfGpgJtKBXmb5ai3w9dZ8juk5GdQhRTZQ7MPKbZw@mail.gmail.com>
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

=E4=BA=8E 2013=E5=B9=B404=E6=9C=8825=E6=97=A5 14:57, Brian Norris =E5=86=99=
=E9=81=93:
>
> A bit late on this one, but is there a good reason this wasn't just 2
> separate 16-bit fields? We already have a few, and I don't see why
> this couldn't be the same.
>
I just want to make the ecc_strength/ecc_size more coupled for the=20
nand_flash_dev{}.
If we spilit to two fields. It makes the nand_flash_ids[] less readable.
>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>> ---
>>   include/linux/mtd/nand.h |   10 ++++++++++
>>   1 files changed, 10 insertions(+), 0 deletions(-)
>>
>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>> index 063e517..f4c7777 100644
>> --- a/include/linux/mtd/nand.h
>> +++ b/include/linux/mtd/nand.h
>> @@ -624,6 +624,10 @@ struct nand_chip {
>>          { .name =3D (nm), {{ .dev_id =3D (devid) }}, .chipsize =3D (c=
hipsz), \
>>            .options =3D (opts) }
>>
>> +#define NAND_ECC_INFO(strength, size)  (((strength)<<  16) | (size))
> We could redefine this:
>
> #define NAND_ECC_INFO(strength, size) .ecc_strength =3D (strength),
> .ecc_size =3D (size)
Do this type of macro could be accepted by the kernel?

I think your macro needs a pair of bracket, such as:
#define NAND_ECC_INFO(strength, size) (.ecc_strength =3D (strength),=20
.ecc_size =3D (size))

But if we add the brackets, we will meet a compiler error.




thanks
Huang Shijie
