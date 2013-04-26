Received: from mail-vc0-f180.google.com ([209.85.220.180])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVbwJ-0002im-I2
 for linux-mtd@lists.infradead.org; Fri, 26 Apr 2013 06:15:24 +0000
Received: by mail-vc0-f180.google.com with SMTP id m17so3480846vca.39
 for <linux-mtd@lists.infradead.org>; Thu, 25 Apr 2013 23:15:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5178EFC9.9080207@freescale.com>
References: <1366707297-31309-1-git-send-email-b32955@freescale.com>
 <1366707297-31309-7-git-send-email-b32955@freescale.com>
 <CAN8TOE_5CeJfGpgJtKBXmb5ai3w9dZ8juk5GdQhRTZQ7MPKbZw@mail.gmail.com>
 <5178EFC9.9080207@freescale.com>
Date: Thu, 25 Apr 2013 23:15:18 -0700
Message-ID: <CAN8TOE9VfdC38wJO0=_+nZ2d7qz3citSb7yVKsUj3Zsz91WpWA@mail.gmail.com>
Subject: Re: [PATCH V3 6/9] mtd: add a new field for ecc info in the
 nand_flash_dev{}
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=GB2312
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

On Thu, Apr 25, 2013 at 1:56 AM, Huang Shijie <b32955@freescale.com> wrote:
> =D3=DA 2013=C4=EA04=D4=C225=C8=D5 14:57, Brian Norris =D0=B4=B5=C0:
>
>>
>> A bit late on this one, but is there a good reason this wasn't just 2
>> separate 16-bit fields? We already have a few, and I don't see why
>> this couldn't be the same.
>>
> I just want to make the ecc_strength/ecc_size more coupled for the
> nand_flash_dev{}.
> If we spilit to two fields. It makes the nand_flash_ids[] less readable.

Sure, that's a decent reason. But how about as an instance of an
anonymous struct instead? See my suggestion below.

>>> Signed-off-by: Huang Shijie<b32955@freescale.com>
>>> ---
>>>   include/linux/mtd/nand.h |   10 ++++++++++
>>>   1 files changed, 10 insertions(+), 0 deletions(-)
>>>
>>> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
>>> index 063e517..f4c7777 100644
>>> --- a/include/linux/mtd/nand.h
>>> +++ b/include/linux/mtd/nand.h
>>> @@ -624,6 +624,10 @@ struct nand_chip {
>>>          { .name =3D (nm), {{ .dev_id =3D (devid) }}, .chipsize =3D (ch=
ipsz), \
>>>            .options =3D (opts) }
>>>
>>> +#define NAND_ECC_INFO(strength, size)  (((strength)<<  16) | (size))
>>
>> We could redefine this:
>>
>> #define NAND_ECC_INFO(strength, size) .ecc_strength =3D (strength),
>> .ecc_size =3D (size)
>
> Do this type of macro could be accepted by the kernel?

Something like this should be acceptable, I think, if I can straighten
it out so that it compiles right (!)

> I think your macro needs a pair of bracket, such as:
> #define NAND_ECC_INFO(strength, size) (.ecc_strength =3D (strength), .ecc=
_size
> =3D (size))
>
> But if we add the brackets, we will meet a compiler error.

Here's my modification (note the underscores, since we can't have the
field .strength in the same macro as the "parameter" strength):

#define ECC_INFO(_strength, _size)        { .strength =3D (_strength),
.size =3D (_size) }
#define ECC_STRENGTH(type)              ((type)->ecc.strength)
#define ECC_SIZE(type)                  ((type)->ecc.strength)

And replace the field in nand_flash_dev with:

        struct {
                uint16_t strength;
                uint16_t size;
        } ecc;

How does that look? It's actually quite similar to the construct Artem
used with mfr_id and dev_id, except that we give the struct a name.
And this time, it actually compiles!

Brian
