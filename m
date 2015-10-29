Received: from smtp11.smtpout.orange.fr ([80.12.242.133]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrtuZ-00005s-9V
 for linux-mtd@lists.infradead.org; Thu, 29 Oct 2015 20:35:04 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Scott Wood <scottwood@freescale.com>, Josh Wu <josh.wu@atmel.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>,
 Huang Shijie <shijie.huang@arm.com>
Subject: Re: [PATCH 1/5] mtd: ofpart: grab device tree node directly from
 master device node
References: <1445913070-17950-1-git-send-email-computersforpeace@gmail.com>
 <87611qjibi.fsf@belgarion.home> <20151029082448.2a89c791@bbrezillon>
 <201510291823.47976.marex@denx.de>
 <20151029183421.5d2c73cf@bbrezillon>
Date: Thu, 29 Oct 2015 21:28:01 +0100
In-Reply-To: <20151029183421.5d2c73cf@bbrezillon> (Boris Brezillon's message
 of "Thu, 29 Oct 2015 18:34:21 +0100")
Message-ID: <87wpu5ifn2.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> On Thu, 29 Oct 2015 18:23:47 +0100
> Marek Vasut <marex@denx.de> wrote:
> Except it's now how devices supporting 16 bits data bus are supposed to
> work, which means your NAND controller will probably not be able to
> send the command/address value on the higher 8 bits...
Correct.

>> > 2/ NAND chips can have bad blocks, so even if you were able to address
>> > 2 chips (which according to #1 is impossible), you might try to write
>> > on a bad block on the chip connected on the MSB side of the data bus.
>> 
>> This one is a valid problem. The other valid issue here is where the
>> command might fail on one chip and pass on the other.
Probably the bad block wins, and the command is reported as a failure.

>> > 3/ There probably are plenty of other reasons why this is not
>> > possible ;-).
>> 
>> It's possible, implementable, but a really bad idea.
>
> Possible and implementable, maybe with an adapted software stack
> and a customized NAND controller. I know you're working on emulating
> flash devices using FPGA, so the next step is to create a new NAND
> controller IP supporting that kind of stuff and adding support for
> this feature to the NAND framework ;-).
> Anyway, it"s definitely a bad idea.
I agree, a bad idea.

Just to finish the discussion, let me quote the pxa3xx developper manual volume
2, chapter 3.7.6.1 "Flash Memory Data Width when Two Flash Devices Connect to
the Same Chip" :
    When NDCR[DWIDTH_C] = 1 and NDCR[DWIDTH_M] = 0, two flash devices are
    connected to the same chip select with DF_IO<7:0> interfacing to one device,
    and DF_IO<15:8> interfacing to the second device. In this scenario, since
    two devices are accessed simultaneously, the command and address are
    replicated between the lower and upper byte of the interface.

Now, regardless of this, please continue with your patches, this corner case is
not important, at least I don't care at all.

Cheers.

-- 
Robert
