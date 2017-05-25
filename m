Received: from gate2.alliedtelesis.co.nz ([202.36.163.20])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dE14q-0006sy-A8
 for linux-mtd@lists.infradead.org; Thu, 25 May 2017 22:17:55 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, "ezequiel.garcia@free-electrons.com"
 <ezequiel.garcia@free-electrons.com>, Gregory Clement
 <gregory.clement@free-electrons.com>
Subject: Re: pxa3xx-nand failing to find device on linux-next
Date: Thu, 25 May 2017 22:12:12 +0000
Message-ID: <e0462e8bf0ca436ab1dee6bca275e7d2@svr-chch-ex1.atlnz.lc>
References: <b36366e358904310aee4970b77f57dba@svr-chch-ex1.atlnz.lc>
 <2a79405e219b4c37ba00defbe4a0dfe4@svr-chch-ex1.atlnz.lc>
 <20170524132301.12ad33d8@bbrezillon> <20170524132508.420614c7@bbrezillon>
 <ebe9d9bca4754d1ba920295f2fdd1359@svr-chch-ex1.atlnz.lc>
 <20170525003646.276516d0@bbrezillon>
 <69dfc0d5ca774efb8c92e9ec635f68ec@svr-chch-ex1.atlnz.lc>
 <20170525081747.4c86164c@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
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

On 25/05/17 18:19, Boris Brezillon wrote:=0A=
> Le Wed, 24 May 2017 22:58:53 +0000,=0A=
> Chris Packham <Chris.Packham@alliedtelesis.co.nz> a =E9crit :=0A=
> =0A=
>> On 25/05/17 10:36, Boris Brezillon wrote:=0A=
>>> Le Wed, 24 May 2017 22:03:52 +0000,=0A=
>>> Chris Packham <Chris.Packham@alliedtelesis.co.nz> a =E9crit :=0A=
>>>    =0A=
>>>> On 24/05/17 23:25, Boris Brezillon wrote:=0A=
>>>>> On Wed, 24 May 2017 13:23:01 +0200=0A=
>>>>> Boris Brezillon <boris.brezillon@free-electrons.com> wrote:=0A=
>>>>>       =0A=
>>>>>> Hi Chris,=0A=
>>>>>>=0A=
>>>>>> On Wed, 24 May 2017 09:36:56 +0000=0A=
>>>>>> Chris Packham <Chris.Packham@alliedtelesis.co.nz> wrote:=0A=
>>>>>>      =0A=
>>>>>>> On 23/05/17 17:27, Chris Packham wrote:=0A=
>>>>>>>> Hi,=0A=
>>>>>>>>=0A=
>>>>>>>> I'm doing some testing on linux-next and I'm finding that my nand =
flash=0A=
>>>>>>>> has disappeared.=0A=
>>>>>>>>=0A=
>>>>>>>> pxa3xx-nand f10d0000.flash: This platform can't do DMA on this dev=
ice=0A=
>>>>>>>> pxa3xx-nand f10d0000.flash: non-supported command ef=0A=
>>>>>>>> pxa3xx-nand f10d0000.flash: non-supported command ee=0A=
>>>>>>>> pxa3xx-nand f10d0000.flash: non-supported command ef=0A=
>>>>>>>> pxa3xx-nand f10d0000.flash: non-supported command ee=0A=
>>>>>>>> On-die ECC forcefully enabled, not supported=0A=
>>>>>>>> nand: No NAND device found=0A=
>>>>>>>> pxa3xx-nand f10d0000.flash: failed to scan nand at cs 0=0A=
>>>>>>>>=0A=
>>>>>>>> This was working around 4.11. I'll try to do some more digging tom=
orrow=0A=
>>>>>>>> to narrow down a failure point but I thought I'd send this out now=
 just=0A=
>>>>>>>> in case it rings any bells.=0A=
>>>>>>>>=0A=
>>>>>>>> The board I'm using (DB-88F6820-AMC) is unfortunately out-of tree =
but it=0A=
>>>>>>>> should be pretty close to the armada-388-db. I can make my dts ava=
ilable=0A=
>>>>>>>> if it's helpful.=0A=
>>>>>>>=0A=
>>>>>>> Still works on 4.12-rc2. Fails on next-20170524.=0A=
>>>>>>>=0A=
>>>>>>> This appears to be due to commit b566d9c055de ("mtd: nand: add supp=
ort=0A=
>>>>>>> for Micron on-die ECC"). Which based on the description seems inten=
tional.=0A=
>>>>>>>=0A=
>>>>>>> Since I have access to a hardware platform that has a micron flash =
with=0A=
>>>>>>> ECC forcefully enabled how can I help to get this implemented.=0A=
>>>>>>=0A=
>>>>>> Can you try with this patch applied [1]?=0A=
>>>>>=0A=
>>>>> Sorry, wrong patch. Can you try this one [1] instead?=0A=
>>>>>=0A=
>>>>> [1]http://code.bulix.org/pkfhmi-135875=0A=
>>>>>       =0A=
>>>>=0A=
>>>> With the patch above the chip is detected but ubifs is unhappy=0A=
>>>=0A=
>>> Hm, weird. And if you revert my both Thomas patch and mine, what do you=
=0A=
>>> get?=0A=
>>=0A=
>> Seems to work just fine.=0A=
> =0A=
> Okay. Let's try with something simpler then. Can you test the following=
=0A=
> patch?=0A=
> =0A=
> --->8---=0A=
>  From 0a0eaa39ea9b19191ae0c31ff3625c224a8a55f2 Mon Sep 17 00:00:00 2001=
=0A=
> From: Boris Brezillon <boris.brezillon@free-electrons.com>=0A=
> Date: Thu, 25 May 2017 08:15:15 +0200=0A=
> Subject: [PATCH] mtd: nand: pxa3xx: Implement failing=0A=
>   ->onfi_{set,get}_features() stubs=0A=
> =0A=
> Implement stubs returning -ENOTSUPP for ->onfi_{set,get}_features() so=0A=
> that we don't let the core think we are supporting the GET/SET FEATURES=
=0A=
> operation.=0A=
> =0A=
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>=0A=
> ---=0A=
=0A=
Yep that seems to work.=0A=
