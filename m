Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ffXVf-00042O-92
 for linux-mtd@lists.infradead.org; Tue, 17 Jul 2018 21:27:54 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Richard Weinberger <richard@nod.at>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Marek Vasut <marek.vasut@gmail.com>, "Brian
 Norris" <computersforpeace@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Bean Huo <beanhuo@micron.com>
Subject: Re: [2/3] mtd: rawnand: micron: Disable ECC earlier in the read path
Date: Tue, 17 Jul 2018 21:27:26 +0000
Message-ID: <16b088c3887b4f1b84bd1002b0de75cb@svr-chch-ex1.atlnz.lc>
References: <20180703122009.29914-3-boris.brezillon@bootlin.com>
 <a01b89d899504e8596da9e416d22b1f7@svr-chch-ex1.atlnz.lc>
 <20180716181057.65d78303@bbrezillon> <20180716225538.542cb096@bbrezillon>
 <afe826dcb4934dea9795541ee0385542@svr-chch-ex1.atlnz.lc>
 <20180717134156.3d8e016c@bbrezillon>
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

Hi Boris,=0A=
=0A=
On 17/07/18 23:42, Boris Brezillon wrote:=0A=
> On Mon, 16 Jul 2018 22:42:54 +0000=0A=
> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
> =0A=
>> On 17/07/18 08:55, Boris Brezillon wrote:=0A=
>>> On Mon, 16 Jul 2018 18:10:57 +0200=0A=
>>> Boris Brezillon <boris.brezillon@bootlin.com> wrote:=0A=
>>>    =0A=
>>>> On Mon, 16 Jul 2018 09:00:59 +0000=0A=
>>>> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
>>>>   =0A=
>>>>> Hi Boris,=0A=
>>>>>=0A=
>>>>> On 04/07/18 00:20, Boris Brezillon wrote:=0A=
>>>>>> We are about to support extracting the real number of bitflips for=
=0A=
>>>>>> 4-bits ECC when WRITE_RECOMMEND is returned. This requires re-readin=
g=0A=
>>>>>> the page in raw mode to compare it to the corrected version, and thi=
s=0A=
>>>>>> logic will be placed in micron_nand_on_die_ecc_status_4().=0A=
>>>>>>=0A=
>>>>>> Moving the micron_nand_on_die_ecc_setup() will allow us to disable=
=0A=
>>>>>> ECC only once.=0A=
>>>>>>=0A=
>>>>>> As a result, we have to rework the exit path and add an error path=
=0A=
>>>>>> where the ECC is disabled.=0A=
>>>>>>=0A=
>>>>>> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>=0A=
>>>>>=0A=
>>>>> As I said on the other thread this appears to cause a problem for me =
on=0A=
>>>>> the MT29F1G08ABAFAWP-ITE setup I have. I notice we're not able to fin=
d=0A=
>>>>> the BBT, not sure if that is symptom or cause.=0A=
>>>=0A=
>>> It's most likely the symptom, not the cause.=0A=
>>>    =0A=
>>>>>>=0A=
>>>>>> diff --git a/drivers/mtd/nand/raw/nand_micron.c b/drivers/mtd/nand/r=
aw/nand_micron.c=0A=
>>>>>> index 63ac98a36ed7..b9cbaf125a98 100644=0A=
>>>>>> --- a/drivers/mtd/nand/raw/nand_micron.c=0A=
>>>>>> +++ b/drivers/mtd/nand/raw/nand_micron.c=0A=
>>>>>> @@ -197,30 +197,37 @@ micron_nand_read_page_on_die_ecc(struct mtd_in=
fo *mtd, struct nand_chip *chip,=0A=
>>>>>>     =0A=
>>>>>>     	ret =3D nand_read_page_op(chip, page, 0, NULL, 0);=0A=
>>>>>>     	if (ret)=0A=
>>>>>> -		goto out;=0A=
>>>>>> +		goto err_disable_ecc;=0A=
>>>>>>     =0A=
>>>>>>     	ret =3D nand_status_op(chip, &status);=0A=
>>>>>>     	if (ret)=0A=
>>>>>> -		goto out;=0A=
>>>>>> +		goto err_disable_ecc;=0A=
>>>>>>     =0A=
>>>>>>     	ret =3D nand_exit_status_op(chip);=0A=
>>>>>>     	if (ret)=0A=
>>>>>> -		goto out;=0A=
>>>>>> +		goto err_disable_ecc;=0A=
>>>>>>     =0A=
>>>>>> -	if (chip->ecc.strength =3D=3D 4)=0A=
>>>>>> -		max_bitflips =3D micron_nand_on_die_ecc_status_4(chip, status);=
=0A=
>>>>>> -	else=0A=
>>>>>> -		max_bitflips =3D micron_nand_on_die_ecc_status_8(chip, status);=
=0A=
>>>>>> +	micron_nand_on_die_ecc_setup(chip, false);=0A=
>>>>=0A=
>>>> Hm, can you try to move the micron_nand_on_die_ecc_setup(chip, false)=
=0A=
>>>> call just before nand_exit_status_op()?=0A=
>>>>   =0A=
>>>=0A=
>>> Just pushed a branch fixing that [1]. Can you test it? If it works,=0A=
>>> I'll ask Miquel to drop the initial set of patches and instead pick the=
=0A=
>>> fixed ones so that we don't break bisectibility.=0A=
>>>=0A=
>>> [1]https://github.com/bbrezillon/linux-0day/commits/nand/next=0A=
>>>    =0A=
>>=0A=
>> Still appears to have the same problem.=0A=
>>=0A=
>> I'm guessing that since you can't actually disable ecc on this chip=0A=
>> calling micron_nand_on_die_ecc_setup(chip, false); before reading the=0A=
>> oob data interferes with it somehow (if I call it after there is no=0A=
>> problem).=0A=
>>=0A=
>> We could add code to qualify the attempt to disable ecc early based on=
=0A=
>> it being optional/mandatory or just stick with it being disabled late.=
=0A=
> =0A=
> Okay. I gave up on disabling ECC earlier and instead implemented what=0A=
> you suggested. Can you test=0A=
> https://github.com/bbrezillon/linux-0day/commits/nand/next again and=0A=
> let me know if it works for you?=0A=
=0A=
Yes that works for me. Feel free to add=0A=
=0A=
Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
=0A=
to=0A=
=0A=
88240e244026 mtd: rawnand: micron: Make ECC activation stateful=0A=
6ae7f205cec0 mtd: rawnand: micron: Avoid enabling/disabling ECC when it =0A=
can't be disabled=0A=
=0A=
=0A=
