Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7Rfl-0007lM-Oh
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 20:53:39 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Daniel Mack <daniel@zonque.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Boris Brezillon <boris.brezillon@bootlin.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Date: Tue, 2 Oct 2018 20:53:14 +0000
Message-ID: <da3e196e239545cfb533a84d9ad71656@svr-chch-ex1.atlnz.lc>
References: <20181001234120.425ae1f5@bbrezillon>
 <c8de62fb56fd493baa8b1f6343bb8bfe@svr-chch-ex1.atlnz.lc>
 <20181002001328.7f64ecbc@bbrezillon> <20181002084601.2a118f10@xps13>
 <20181002092500.3dc2ac7a@xps13>
 <09d3f8ab-6c5e-56be-479f-6ca28dca5778@zonque.org>
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

On 02/10/18 21:23, Daniel Mack wrote:=0A=
> Hi Miquel,=0A=
> =0A=
> On 2/10/2018 9:25 AM, Miquel Raynal wrote:=0A=
>> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Tue, 2 Oct 2018=0A=
>> 08:46:01 +0200:=0A=
>>> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 2 Oct 2018=
=0A=
>>> 00:13:28 +0200:=0A=
> =0A=
>>>> Also, it looks like complete() is not called until the RDDREQ, WRDREQ=
=0A=
>>>> and WRCMDREQ are cleared in the interrupt handler [1], which is weird.=
=0A=
>>>> Miquel, do you happen to remember why you had to do that?=0A=
>>>=0A=
>>> The RDDREQ, WRDREQ and WRCMDREQ events might potentially happen while=
=0A=
>>> the interrupts are enabled while we only wait for R/B signalling. This=
=0A=
>>> check is to avoid calling complete() on these situations.=0A=
>>=0A=
>> Actually Boris is right on the fact that while the intention is good,=0A=
>> the writing of [1] is not accurate. Daniel, could you please test if=0A=
>> the following diff changes something with your setup, without your=0A=
>> patch?=0A=
>>=0A=
>>=0A=
>> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/=
marvell_nand.c=0A=
>> index bc2ef5209783..c7573ccdbacd 100644=0A=
>> --- a/drivers/mtd/nand/raw/marvell_nand.c=0A=
>> +++ b/drivers/mtd/nand/raw/marvell_nand.c=0A=
>> @@ -686,7 +686,7 @@ static irqreturn_t marvell_nfc_isr(int irq, void *de=
v_id)=0A=
>>    =0A=
>>           marvell_nfc_disable_int(nfc, st & NDCR_ALL_INT);=0A=
>>    =0A=
>> -       if (!(st & (NDSR_RDDREQ | NDSR_WRDREQ | NDSR_WRCMDREQ)))=0A=
>> +       if (st & (NDSR_RDY(0) | NDSR_RDY(1)))=0A=
>>                   complete(&nfc->complete);=0A=
>>    =0A=
>>           return IRQ_HANDLED;=0A=
> =0A=
> Yes! That seems to work nicely as a replacement for my patch.=0A=
> =0A=
> Chris, how is that going on your board?=0A=
=0A=
Looks good to me. I've just re-run stress_{1,2,3} on the custom board =0A=
and DB-88F6820-AMC.=0A=
