MIME-Version: 1.0
In-Reply-To: <AANLkTinzmIud44FuZhZSs94yo16F0ipP-uPdX9gAhdPf@mail.gmail.com>
References: <AANLkTimvhEWIDupsj3Ty8vB9ualwU9RsaIxa0CDgWgYQ@mail.gmail.com>
	<AANLkTikTzNY2hI0JDTOOZpGeOPc_MU79jVJ_1L9XxA_e@mail.gmail.com>
	<AANLkTikmuCHqJQY2g8G3FsrufO5dKGt9WNZFnmvoSGl2@mail.gmail.com>
	<AANLkTinzmIud44FuZhZSs94yo16F0ipP-uPdX9gAhdPf@mail.gmail.com>
Date: Tue, 22 Jun 2010 19:24:20 +0800
Message-ID: <AANLkTinEOvQX0f6jKsGEALSLBMPmeSgx9n6QIsCcHVKG@mail.gmail.com>
Subject: Re: [PATCH 05/25] pxa3xx_nand: rework irq logic
From: Lei Wen <adrian.wenl@gmail.com>
To: Eric Miao <eric.y.miao@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <david.woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 22, 2010 at 6:02 PM, Eric Miao <eric.y.miao@gmail.com> wrote:
> On Tue, Jun 22, 2010 at 5:34 PM, Lei Wen <adrian.wenl@gmail.com> wrote:
>> On Fri, Jun 18, 2010 at 2:50 PM, Eric Miao <eric.y.miao@gmail.com> wrote:
>>> On Fri, Jun 18, 2010 at 1:34 PM, Haojian Zhuang
>>> <haojian.zhuang@gmail.com> wrote:
>>>> From 18d589a078871a09dec0862241fedd2d1d07be85 Mon Sep 17 00:00:00 2001
>>>> From: Lei Wen <leiwen@marvell.com>
>>>> Date: Mon, 31 May 2010 14:05:46 +0800
>>>> Subject: [PATCH 05/25] pxa3xx_nand: rework irq logic
>>>>
>>>> Enable all irq when we start the nand controller, and
>>>> put all the transaction logic in the pxa3xx_nand_irq.
>>>>
>>>
>>> Didn't look into the change too much, but the idea sounds to me like
>>> chaining all the logic with different IRQ events, which was my original
>>> reason of having different states. And considering the page read/write
>>> is actually to an internal SRAM within the controller, I guess it's quick
>>> enough. (though I'd suggest to do some experiments of time profiling
>>> to see if it's going to increase the interrupt latency)
>>>
>>>> By doing this way, we could dramatically increase the
>>>> performance by avoid unnecessary delay.
>>>>
>>>
>>> The removal of __read_id() doesn't look to be part of this patch, no?
>>>
>> For write_cmd function has been discard and __read_id function would
>> not be used, if
>> continue to keep the __read_id() definition would lead to make failure...
>>
>
> Well, the logic is: this change doesn't belong to this patch, so is it possible
> to separate the change apart and still keep it compiling?
>

Em... Seems reasonable, I'll try to do that. :-)

Best regards,
Lei
