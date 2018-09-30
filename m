Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6izq-0008N7-EG
 for linux-mtd@lists.infradead.org; Sun, 30 Sep 2018 21:11:24 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Daniel Mack <daniel@zonque.org>, Miquel Raynal <miquel.raynal@bootlin.com>
CC: Boris Brezillon <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Date: Sun, 30 Sep 2018 21:10:50 +0000
Message-ID: <3d7b337f701c45caa35aef94f8d93731@svr-chch-ex1.atlnz.lc>
References: <20180927071751.21513-1-daniel@zonque.org>
 <20180927101145.4c2d1159@xps13> <20180927105630.19fc1ff8@bbrezillon>
 <de6fbe4af7904d6db23e42bf3e4e2565@svr-chch-ex1.atlnz.lc>
 <9b32fe67-c6fb-5f8c-d97a-4419557e6768@zonque.org>
 <20180928102454.325644f3@xps13>
 <692a1133-59d1-ae45-fa06-2a684e94c350@zonque.org>
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

On 28/09/18 20:29, Daniel Mack wrote:=0A=
> On 28/9/2018 10:24 AM, Miquel Raynal wrote:=0A=
>> Hi Daniel,=0A=
>>=0A=
>> Daniel Mack <daniel@zonque.org> wrote on Fri, 28 Sep 2018 09:43:18=0A=
>> +0200:=0A=
>>=0A=
>>> Hi Chris,=0A=
>>>=0A=
>>> On 27/9/2018 11:55 PM, Chris Packham wrote:=0A=
>>>> On 27/09/18 20:56, Boris Brezillon wrote:=0A=
>>>>> On Thu, 27 Sep 2018 10:11:45 +0200=0A=
>>>>> Miquel Raynal <miquel.raynal@bootlin.com> wrote:=0A=
>>>>>    =0A=
>>>>>> Hi Daniel,=0A=
>>>>>>=0A=
>>>>>> Daniel Mack <daniel@zonque.org> wrote on Thu, 27 Sep 2018 09:17:51=
=0A=
>>>>>> +0200:=0A=
>>>>>>    =0A=
>>>>>>> At least on PXA3xx platforms, enabling RDY interrupts in the NDCR r=
egister=0A=
>>>>>>> will only cause the IRQ to latch when the RDY lanes are changing, a=
nd not=0A=
>>>>>>> in case they are already asserted.=0A=
>>>>>>>=0A=
>>>>>>> This means that if the controller finished the command in flight be=
fore=0A=
>>>>>>> marvell_nfc_wait_op() is called, that function will wait for a chan=
ge in=0A=
>>>>>>> the bit that can't ever happen as it is already set.=0A=
>>>>>>>=0A=
>>>>>>> To address this race, check for the RDY bits after the IRQ was enab=
led,=0A=
>>>>>>> and complete the completion immediately if the condition is already=
 met.=0A=
>>>>>>>=0A=
>>>>>>> This fixes a bug that was observed with a NAND chip that holds a UB=
IFS=0A=
>>>>>>> parition on which file system stress tests were executed. When=0A=
>>>>>>> marvell_nfc_wait_op() reports an error, UBI/UBIFS will eventually m=
ount=0A=
>>>>>>> the filesystem read-only, reporting lots of warnings along the way.=
=0A=
>>>>>>>=0A=
>>>>>>> Fixes: 02f26ecf8c77 mtd: nand: add reworked Marvell NAND controller=
 driver=0A=
>>>>>>> Cc: stable@vger.kernel.org=0A=
>>>>>>> Signed-off-by: Daniel Mack <daniel@zonque.org>=0A=
>>>>>>> ---=0A=
>>>>>>=0A=
>>>>>> Sorry I haven't had the time to check on my Armada, but you figured =
it=0A=
>>>>>> out, and the fix looks good to me!=0A=
>>>>>>=0A=
>>>>>> Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>=0A=
>>>>>>=0A=
>>>>>> Boris, do you plan to send another fixes PR of can I take it into=0A=
>>>>>> the nand/next branch?=0A=
>>>>>=0A=
>>>>> Queued to mtd/master.=0A=
>>>>> After fixing my R/B configuration I get a new error with this patch w=
hen=0A=
>>>> running stress_1 from mtd-utils-2.0.0. I don't see this without the pa=
tch.=0A=
>>>=0A=
>>> That's strange. So your controller sets the RDY bits before it is ready=
? Could=0A=
>>> you check whether only checking for NDSR_RDY(0) changes anything? Not s=
ure=0A=
>>> about the handling of NDSR_RDY(1) in this driver anyway ...=0A=
>>>=0A=
>>=0A=
>> I suppose you mean this portion of code is not clear enough?=0A=
>>=0A=
>>=0A=
>>           u32 st =3D readl_relaxed(nfc->regs + NDSR);=0A=
>>           u32 ien =3D (~readl_relaxed(nfc->regs + NDCR)) & NDCR_ALL_INT;=
=0A=
>>=0A=
>>           /*=0A=
>>            * RDY interrupt mask is one bit in NDCR while there are two s=
tatus=0A=
>>            * bit in NDSR (RDY[cs0/cs2] and RDY[cs1/cs3]).=0A=
>>            */=0A=
>>           if (st & NDSR_RDY(1))=0A=
>>                   st |=3D NDSR_RDY(0);=0A=
>>=0A=
>>           if (!(st & ien))=0A=
>>                   return IRQ_NONE;=0A=
>>=0A=
>>=0A=
>> -> st is the status in the NDSR register which has two RDY bits, one=0A=
>>      for each RDY line.=0A=
>> -> ien is a view of the NDCR register which commands the interrupts=0A=
>>      and has one bit to enable both interrupt lines (let's call it=0A=
>>      NDCR_RDYM).=0A=
>>=0A=
>> The trick is that NDSR_RDY(0) is the same bit as NDCR_RDYM.=0A=
>> So whenever NDSR_RDY(1) is set, we fake NDSR_RDY(0) to be set (by=0A=
>> setting manually the bit in 'st') so that the (st & ien) comparison=0A=
>> can be true if NDSR_RDY(1) is valid and RDY interrupts are enabled.=0A=
>>=0A=
>> With this in mind, I don't see why this=0A=
>>=0A=
>> +	st =3D readl_relaxed(nfc->regs + NDSR);=0A=
>> +	if (st & (NDSR_RDY(0) | NDSR_RDY(1)))=0A=
>> +		complete(&nfc->complete);=0A=
> =0A=
> Yeah, me neither. Chris, are you absolutely sure this is the reason? I'm=
=0A=
> asking because it took me several tries sometimes to trigger the bug, so=
=0A=
> is there a chance that you see an error at all times, regardless of=0A=
> whether my patch is applied?=0A=
=0A=
It seems pretty consistent. Without this patch there seems to be no =0A=
problem. With this patch it triggers pretty much straight away. I can't =0A=
discount that there might be something wrong with my dts (the R/B =0A=
configuration was missing initially).=0A=
=0A=
I've also been able to run this on the DB-88F6820-AMC board with the =0A=
same result (the dts for this is in the for-next branch of =0A=
git://git.infradead.org/linux-mvebu.git).=0A=
=0A=
The really odd thing is the following seems to avoid the problem=0A=
=0A=
+        st =3D readl_relaxed(nfc->regs + NDSR);=0A=
+        udelay(1000);=0A=
+        if (st & (NDSR_RDY(0) | NDSR_RDY(1)))=0A=
+                complete(&nfc->complete);=0A=
=0A=
Which is weird because the st value has already been read so the udelay =0A=
should have no effect.=0A=
=0A=
On 28/09/18 19:43, Daniel Mack wrote:=0A=
 >=0A=
 > Also, does my .EALREADY approach (v1) make any difference?=0A=
 >=0A=
=0A=
The v1 of this patch doesn't show the problem.=0A=
=0A=
