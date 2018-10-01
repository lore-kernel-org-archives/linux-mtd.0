Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g74M4-0001zx-21
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2018 19:59:46 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Daniel Mack <daniel@zonque.org>, Miquel Raynal <miquel.raynal@bootlin.com>
CC: Boris Brezillon <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Date: Mon, 1 Oct 2018 19:59:11 +0000
Message-ID: <59f9c342cf8140979329aa269aa0c2eb@svr-chch-ex1.atlnz.lc>
References: <20180927071751.21513-1-daniel@zonque.org>
 <20180927101145.4c2d1159@xps13> <20180927105630.19fc1ff8@bbrezillon>
 <de6fbe4af7904d6db23e42bf3e4e2565@svr-chch-ex1.atlnz.lc>
 <9b32fe67-c6fb-5f8c-d97a-4419557e6768@zonque.org>
 <20180928102454.325644f3@xps13>
 <692a1133-59d1-ae45-fa06-2a684e94c350@zonque.org>
 <3d7b337f701c45caa35aef94f8d93731@svr-chch-ex1.atlnz.lc>
 <227028c0-e1e0-46b3-3c7d-2b242b31bb3f@zonque.org>
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

On 01/10/18 18:31, Daniel Mack wrote:=0A=
> On 30/9/2018 11:10 PM, Chris Packham wrote:=0A=
>>>> With this in mind, I don't see why this=0A=
>>>>=0A=
>>>> +	st =3D readl_relaxed(nfc->regs + NDSR);=0A=
>>>> +	if (st & (NDSR_RDY(0) | NDSR_RDY(1)))=0A=
>>>> +		complete(&nfc->complete);=0A=
>>> Yeah, me neither. Chris, are you absolutely sure this is the reason? I'=
m=0A=
>>> asking because it took me several tries sometimes to trigger the bug, s=
o=0A=
>>> is there a chance that you see an error at all times, regardless of=0A=
>>> whether my patch is applied?=0A=
>> It seems pretty consistent. Without this patch there seems to be no=0A=
>> problem. With this patch it triggers pretty much straight away. I can't=
=0A=
>> discount that there might be something wrong with my dts (the R/B=0A=
>> configuration was missing initially).=0A=
>>=0A=
>> I've also been able to run this on the DB-88F6820-AMC board with the=0A=
>> same result (the dts for this is in the for-next branch of=0A=
>> git://git.infradead.org/linux-mvebu.git).=0A=
>>=0A=
>> The really odd thing is the following seems to avoid the problem=0A=
>>=0A=
>> +        st =3D readl_relaxed(nfc->regs + NDSR);=0A=
>> +        udelay(1000);=0A=
>> +        if (st & (NDSR_RDY(0) | NDSR_RDY(1)))=0A=
>> +                complete(&nfc->complete);=0A=
>>=0A=
>> Which is weird because the st value has already been read so the udelay=
=0A=
>> should have no effect.=0A=
> =0A=
> Erm, yes. That's totally weird. Which gcc are you using for this?=0A=
=0A=
arm-softfloat-linux-gnueabi-gcc (crosstool-NG crosstool-ng-1.22.0) 4.9.3=0A=
=0A=
> Could you please try and use readl() here instead of readl_relaxed()?=0A=
> That will place a memory barrier after the read to enforce ordering.=0A=
=0A=
I'd previously tried readl() based on the same hunch. No change.=0A=
=0A=
I think my snippet above might be misleading. While a delay between =0A=
readl_relaxed() and the if should not change the outcome, this is also a =
=0A=
delay between marvell_nfc_enable_int() and marvell_nfc_disable_int() =0A=
which is probably more significant. Sure enough if I move the delay to =0A=
just before the marvell_nfc_disable_int() the error is not seen.=0A=
=0A=
> But if this is a problem, many other parts of that driver should be=0A=
> equally affected.=0A=
> =0A=
>> On 28/09/18 19:43, Daniel Mack wrote:=0A=
>>    >=0A=
>>    > Also, does my .EALREADY approach (v1) make any difference?=0A=
>>    >=0A=
>>=0A=
>> The v1 of this patch doesn't show the problem.=0A=
> =0A=
> That's also very strange because the condition it triggers on is exactly=
=0A=
> the same.=0A=
=0A=
One difference is that by calling complete() interrupts will be disabled =
=0A=
in the spinlock.=0A=
=0A=
> =0A=
> =0A=
> Thanks,=0A=
> Daniel=0A=
> =0A=
=0A=
