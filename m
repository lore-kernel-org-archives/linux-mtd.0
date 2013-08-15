Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9zO0-0000zX-LF
 for linux-mtd@lists.infradead.org; Thu, 15 Aug 2013 15:22:54 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 00/20] ARM: pxa: move core and drivers to dmaengine
References: <1375889649-14638-1-git-send-email-zonque@gmail.com>
 <87zjsqzdg8.fsf@free.fr> <52061C53.4050905@gmail.com>
 <20130814100010.GO32147@intel.com>
Date: Thu, 15 Aug 2013 17:22:14 +0200
Message-ID: <8761v7nfmh.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: mark.rutland@arm.com, s.neumann@raumfeld.com, davem@davemloft.net,
 linux-mtd@lists.infradead.org, haojian.zhuang@linaro.org, cxie4@marvell.com,
 lars@metafoo.de, nico@linaro.org, sachin.kamat@linaro.org,
 marek.vasut@gmail.com, ezequiel.garcia@free-electrons.com,
 rmk+kernel@arm.linux.org.uk, devicetree@vger.kernel.org, samuel@sortiz.org,
 arnd@arndb.de, broonie@kernel.org, linux-arm-kernel@lists.infradead.org,
 thomas.petazzoni@free-electrons.com, eric.y.miao@gmail.com,
 mika.westerberg@linux.jf.intel.com, gregkh@linuxfoundation.org,
 Daniel Mack <zonque@gmail.com>, kernel@pengutronix.de, djbw@fb.com,
 g.liakhovetski@gmx.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vinod Koul <vinod.koul@intel.com> writes:
>> Yes, Vinod and and Dan are certainly the best ones to comment on that I
>> think.
> I read the file esp the "DMA flow" and "DMA hot chaining timeslice issue". I can
> say with "properly" implemented dmaengine driver this is very much doable.
Great.
>
>
> Have you guys read: Documentation/dmaengine.txt?
Yes. I had not understood the "hot chaining" was implied in it, but now I
understand it is part of it, and at the discretion of the slave engine driver.

> So for "hot chaning" it would work as follows:
>
> Client, allocates and channel and prepares the descriptors A B & C
> Client (video), submits buffer A, Buffer B. Both are queued by dma driver
> Client calls dma_async_issue_pending
> DMA driver will start Buffer A. It gets the completetion for A and then Starts
> B. It will invoke callbakc for A.
>
> If you submit C, and invoke dma_async_issue_pending(), C is queued
> On B completetion, the DMA driver will start C and invoke callback for B.
>
> If B completes before C is submitted, after submit and invoking
> dma_async_issue_pending(), the C buffer will be queued and started.
OK, that settles it then. The API allows hot chaining, and if I understand
Daniel's driver properly, he already thought about it (in
append_pending_queue()).

I have some homework now Daniel, I'll send you my work to include into your
patch serie for the review, and my tests of your patches.

I need a bit of time (1 or 2 weeks), because of holidays, for my patch.

Cheers.

-- 
Robert
