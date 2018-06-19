Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVQV0-0007Cy-3I
 for linux-mtd@lists.infradead.org; Tue, 19 Jun 2018 23:57:24 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Miquel Raynal <miquel.raynal@bootlin.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, "beanhuo@micron.com"
 <beanhuo@micron.com>
Subject: Re: [RFC PATCH 0/2] mtd: rawnand: support MT29F1G08ABAFAWP-ITE:F
Date: Tue, 19 Jun 2018 23:56:56 +0000
Message-ID: <66701c795bdc492aa3e3ffce6a0181d9@svr-chch-ex1.atlnz.lc>
References: <20180618045255.8015-1-chris.packham@alliedtelesis.co.nz>
 <20180618151450.3e740270@xps13>
 <f16525ea6b534123bda64b09e818ce6d@svr-chch-ex1.atlnz.lc>
 <0caaea1b4f5a4b45b436833424c4c8c8@svr-chch-ex1.atlnz.lc>
 <20180619065555.1900487c@bbrezillon>
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

Adding participants from =0A=
http://lists.infradead.org/pipermail/linux-mtd/2017-March/072974.html=0A=
=0A=
On 19/06/18 16:56, Boris Brezillon wrote:=0A=
=0A=
> Hi Chris, >=0A=
> On Tue, 19 Jun 2018 01:44:24 +0000=0A=
> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> On 19/06/18 12:35, Chris Packham wrote:=0A=
>>> On 19/06/18 01:15, Miquel Raynal wrote:=0A=
>>>> Hi Chris,=0A=
>>>>=0A=
>>>> On Mon, 18 Jun 2018 16:52:53 +1200, Chris Packham=0A=
>>>> <chris.packham@alliedtelesis.co.nz> wrote:=0A=
>>>>   =0A=
>>>>> Hi,=0A=
>>>>>=0A=
>>>>> I'm looking at adding support for the Micron MT29F1G08ABAFAWP-ITE:F c=
hip=0A=
>>>>> to one of our boards which uses the Marvell NFCv2 controller.=0A=
>>>>>=0A=
>>>>> This particular chip is a bit odd in that the datasheet states suppor=
t=0A=
>>>>> for ONFI 1.0 but the revision number field is 00 00. It also is marke=
d=0A=
>>>>> ABAFA but reports internally as ABAGA. Finally it has internal 8-bit =
ECC=0A=
>>>>> which cannot be disabled.=0A=
>>>>=0A=
>>>> Boris and I agree that in this case, the chip should not be probed if=
=0A=
>>>> ecc->type !=3D ON_DIE (and eventually NONE).=0A=
>>>>=0A=
>>>> This should be handled in the Micron driver.=0A=
>>>>=0A=
>>>> Also, what is the returned value of micron_supports_on_die_ecc() (with=
=0A=
>>>> patch 1/2)?=0A=
>>>=0A=
>>> micron_supports_on_die_ecc() returns MICRON_ON_DIE_UNSUPPORTED.=0A=
>>> Technically this chip should be MICRON_ON_DIE_MANDATORY since it can't=
=0A=
>>> be disabled but that wouldn't be much help since that would still resul=
t=0A=
>>> in -EINVAL. I'll dig into micron_supports_on_die_ecc() and see if I can=
=0A=
>>> find something in the datasheet to use.=0A=
>>>    =0A=
>>=0A=
>> Some further debugging. Nothing (in 4.17) calls=0A=
>> set_bit(ONFI_FEATURE_ON_DIE_ECC) so I don't think=0A=
>> micron_supports_on_die_ecc() can return anything other than=0A=
>> MICRON_ON_DIE_UNSUPPORTED, unless I'm missing something for how the=0A=
>> {get,set}_feature_list is populated.=0A=
> =0A=
> Nope you're not. Looks like we broke Micron on-die ECC in 4.17.=0A=
> =0A=
>>=0A=
>> With the onfi.version fix and the following=0A=
>>=0A=
>> --- a/drivers/mtd/nand/raw/nand_micron.c=0A=
>> +++ b/drivers/mtd/nand/raw/nand_micron.c=0A=
>> @@ -66,7 +66,9 @@ static int micron_nand_onfi_init(struct nand_chip *chi=
p)=0A=
>>=0A=
>>           if (p->supports_set_get_features) {=0A=
>>                   set_bit(ONFI_FEATURE_ADDR_READ_RETRY, p->set_feature_l=
ist);=0A=
>> +               set_bit(ONFI_FEATURE_ON_DIE_ECC, p->set_feature_list);=
=0A=
>>                   set_bit(ONFI_FEATURE_ADDR_READ_RETRY, p->get_feature_l=
ist);=0A=
>> +               set_bit(ONFI_FEATURE_ON_DIE_ECC, p->get_feature_list);=
=0A=
>>           }=0A=
> =0A=
> Can you send a patch containing only the above changes with the=0A=
> Cc-stable and Fixes tags?=0A=
> =0A=
>> @@ -240,7 +246,7 @@ static int micron_supports_on_die_ecc(struct=0A=
>> nand_chip *chip)=0A=
>>            * Some Micron NANDs have an on-die ECC of 4/512, some other=
=0A=
>> -         * 8/512. We only support the former.=0A=
>> +         * 8/512.=0A=
>>            */=0A=
>> -       if (chip->ecc_strength_ds !=3D 4)=0A=
>> +       if (chip->ecc_strength_ds !=3D 4 && chip->ecc_strength_ds !=3D 8=
)=0A=
>>                   return MICRON_ON_DIE_UNSUPPORTED;=0A=
>>=0A=
> =0A=
> This should be done in a separate patch.=0A=
>   =0A=
>> I can get micron_supports_on_die_ecc() to return MICRON_ON_DIE_SUPPORTED=
.=0A=
>>=0A=
> =0A=
> That's weird. You should have MICRON_ON_DIE_MANDATORY here. Could it be=
=0A=
> that the ONFI_FEATURE_ON_DIE_ECC_EN bit does not really reflect the ECC=
=0A=
> engine state? If that's the case, we'll have to change the way we=0A=
> detect if on-die ECC is supported/mandatory/not-supported (based on the=
=0A=
> model name stored in the ONFI param page?).=0A=
> =0A=
=0A=
Even though though MT29F1G08ABAFAWP-ITE:F says on-die ECC is enabled and =
=0A=
cannot be disabled it still seems to respond to =0A=
micron_nand_on_die_ecc_setup(chip, false); by clearing the feature bit =0A=
retrieved by nand_get_features(chip, ONFI_FEATURE_ON_DIE_ECC, feature).=0A=
=0A=
I see in the original thread that the detection of the 70s parts can be =0A=
done by the "Number of bits ECC correctability". Can we assume that all =0A=
70s has MICRON_ON_DIE_MANDATORY or do I need to make it based on =0A=
specific IDs?=0A=
