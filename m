Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g5eBj-0001A6-LY
 for linux-mtd@lists.infradead.org; Thu, 27 Sep 2018 21:51:20 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Daniel Mack <daniel@zonque.org>, "miquel.raynal@bootlin.com"
 <miquel.raynal@bootlin.com>, "boris.brezillon@bootlin.com"
 <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] mtd: rawnand: marvell: check for RDY bits after enabling
 the IRQ
Date: Thu, 27 Sep 2018 21:50:28 +0000
Message-ID: <631eca7e453b4274ad461341fd0b0586@svr-chch-ex1.atlnz.lc>
References: <20180926212353.13399-1-daniel@zonque.org>
 <55f805fcf236481b869ba097a7db0194@svr-chch-ex1.atlnz.lc>
 <9b6db42cceb5424b9e0eca2704e0f2f2@svr-chch-ex1.atlnz.lc>
 <a3846a05-ba03-87ac-12ab-3986723fc0e0@zonque.org>
 <07720cf14e9b4bc0853649283a93d37a@svr-chch-ex1.atlnz.lc>
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

On 28/09/18 08:36, Chris Packham wrote:=0A=
> On 27/09/18 19:13, Daniel Mack wrote:=0A=
>> Hi,=0A=
>>=0A=
>> On 27/9/2018 1:42 AM, Chris Packham wrote:=0A=
>>> On 27/09/18 11:33, Chris Packham wrote:=0A=
>>>> On 27/09/18 09:24, Daniel Mack wrote:=0A=
>>=0A=
>>>>> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/r=
aw/marvell_nand.c=0A=
>>>>> index 666f34b58dec..e96ec7b9a152 100644=0A=
>>>>> --- a/drivers/mtd/nand/raw/marvell_nand.c=0A=
>>>>> +++ b/drivers/mtd/nand/raw/marvell_nand.c=0A=
>>>>> @@ -613,7 +613,8 @@ static int marvell_nfc_wait_cmdd(struct nand_chip=
 *chip)=0A=
>>>>>       static int marvell_nfc_wait_op(struct nand_chip *chip, unsigned=
 int timeout_ms)=0A=
>>>>>       {=0A=
>>>>>       	struct marvell_nfc *nfc =3D to_marvell_nfc(chip->controller);=
=0A=
>>>>> -	int ret;=0A=
>>>>> +	int ret =3D -EALREADY;=0A=
>>>>=0A=
>>>> Won't this cause us to hit the if (!ret) below if we don't end up=0A=
>>>> calling wait_for_completion_timeout()?=0A=
>>>=0A=
>>> Nope boolean logic fail.=0A=
>>=0A=
>> Yup :)=0A=
>>=0A=
>>>> In fact I did just hit something=0A=
>>>> like this on my Armada-385 based board=0A=
>>>>=0A=
>>>> marvell-nfc f10d0000.nand-controller: Timeout waiting for RB signal=0A=
>>>> ubi0 warning: do_sync_erase: error -5 while erasing PEB 755, retry=0A=
>>>>=0A=
>>>=0A=
>>> But this still might be something else, it doesn't happen regularly. Fo=
r=0A=
>>> what it's worth=0A=
>>>=0A=
>>> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
>>=0A=
>> Thanks. Did you see the issue that I described without that patch?=0A=
>>=0A=
> =0A=
> Yes. I've just tried a test without your patch and I see the same thing.=
=0A=
> I wonder if my R/B configuration is correct.=0A=
> =0A=
=0A=
Sure enough I was missing the pinctrl configuration so the R/B wasn't =0A=
quite configured correctly.=0A=
