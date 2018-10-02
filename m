Received: from mail.bugwerft.de ([46.23.86.59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7G4b-0006N8-23
 for linux-mtd@lists.infradead.org; Tue, 02 Oct 2018 08:30:30 +0000
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20181001234120.425ae1f5@bbrezillon>
 <c8de62fb56fd493baa8b1f6343bb8bfe@svr-chch-ex1.atlnz.lc>
 <20181002001328.7f64ecbc@bbrezillon> <20181002084601.2a118f10@xps13>
 <20181002092500.3dc2ac7a@xps13>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <09d3f8ab-6c5e-56be-479f-6ca28dca5778@zonque.org>
Date: Tue, 2 Oct 2018 10:22:59 +0200
MIME-Version: 1.0
In-Reply-To: <20181002092500.3dc2ac7a@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Miquel,

On 2/10/2018 9:25 AM, Miquel Raynal wrote:
> Miquel Raynal <miquel.raynal@bootlin.com> wrote on Tue, 2 Oct 2018
> 08:46:01 +0200:
>> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Tue, 2 Oct 2018
>> 00:13:28 +0200:

>>> Also, it looks like complete() is not called until the RDDREQ, WRDREQ
>>> and WRCMDREQ are cleared in the interrupt handler [1], which is weird.
>>> Miquel, do you happen to remember why you had to do that?
>>
>> The RDDREQ, WRDREQ and WRCMDREQ events might potentially happen while
>> the interrupts are enabled while we only wait for R/B signalling. This
>> check is to avoid calling complete() on these situations.
> 
> Actually Boris is right on the fact that while the intention is good,
> the writing of [1] is not accurate. Daniel, could you please test if
> the following diff changes something with your setup, without your
> patch?
> 
> 
> diff --git a/drivers/mtd/nand/raw/marvell_nand.c b/drivers/mtd/nand/raw/marvell_nand.c
> index bc2ef5209783..c7573ccdbacd 100644
> --- a/drivers/mtd/nand/raw/marvell_nand.c
> +++ b/drivers/mtd/nand/raw/marvell_nand.c
> @@ -686,7 +686,7 @@ static irqreturn_t marvell_nfc_isr(int irq, void *dev_id)
>   
>          marvell_nfc_disable_int(nfc, st & NDCR_ALL_INT);
>   
> -       if (!(st & (NDSR_RDDREQ | NDSR_WRDREQ | NDSR_WRCMDREQ)))
> +       if (st & (NDSR_RDY(0) | NDSR_RDY(1)))
>                  complete(&nfc->complete);
>   
>          return IRQ_HANDLED;

Yes! That seems to work nicely as a replacement for my patch.

Chris, how is that going on your board?


Thanks,
Daniel
