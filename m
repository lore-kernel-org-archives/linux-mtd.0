Received: from mail.bugwerft.de ([46.23.86.59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g6qnk-0002fU-PV
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2018 05:31:26 +0000
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20180927071751.21513-1-daniel@zonque.org>
 <20180927101145.4c2d1159@xps13> <20180927105630.19fc1ff8@bbrezillon>
 <de6fbe4af7904d6db23e42bf3e4e2565@svr-chch-ex1.atlnz.lc>
 <9b32fe67-c6fb-5f8c-d97a-4419557e6768@zonque.org>
 <20180928102454.325644f3@xps13>
 <692a1133-59d1-ae45-fa06-2a684e94c350@zonque.org>
 <3d7b337f701c45caa35aef94f8d93731@svr-chch-ex1.atlnz.lc>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <227028c0-e1e0-46b3-3c7d-2b242b31bb3f@zonque.org>
Date: Mon, 1 Oct 2018 07:31:05 +0200
MIME-Version: 1.0
In-Reply-To: <3d7b337f701c45caa35aef94f8d93731@svr-chch-ex1.atlnz.lc>
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

On 30/9/2018 11:10 PM, Chris Packham wrote:
>>> With this in mind, I don't see why this
>>>
>>> +	st = readl_relaxed(nfc->regs + NDSR);
>>> +	if (st & (NDSR_RDY(0) | NDSR_RDY(1)))
>>> +		complete(&nfc->complete);
>> Yeah, me neither. Chris, are you absolutely sure this is the reason? I'm
>> asking because it took me several tries sometimes to trigger the bug, so
>> is there a chance that you see an error at all times, regardless of
>> whether my patch is applied?
> It seems pretty consistent. Without this patch there seems to be no
> problem. With this patch it triggers pretty much straight away. I can't
> discount that there might be something wrong with my dts (the R/B
> configuration was missing initially).
> 
> I've also been able to run this on the DB-88F6820-AMC board with the
> same result (the dts for this is in the for-next branch of
> git://git.infradead.org/linux-mvebu.git).
> 
> The really odd thing is the following seems to avoid the problem
> 
> +        st = readl_relaxed(nfc->regs + NDSR);
> +        udelay(1000);
> +        if (st & (NDSR_RDY(0) | NDSR_RDY(1)))
> +                complete(&nfc->complete);
> 
> Which is weird because the st value has already been read so the udelay
> should have no effect.

Erm, yes. That's totally weird. Which gcc are you using for this?

Could you please try and use readl() here instead of readl_relaxed()? 
That will place a memory barrier after the read to enforce ordering.

But if this is a problem, many other parts of that driver should be 
equally affected.

> On 28/09/18 19:43, Daniel Mack wrote:
>   >
>   > Also, does my .EALREADY approach (v1) make any difference?
>   >
> 
> The v1 of this patch doesn't show the problem.

That's also very strange because the condition it triggers on is exactly 
the same.


Thanks,
Daniel
