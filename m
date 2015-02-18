Received: from smtp11.smtpout.orange.fr ([80.12.242.133]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YO8F2-0005HA-7j
 for linux-mtd@lists.infradead.org; Wed, 18 Feb 2015 17:16:52 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] mtd: pxa3xx-nand: handle PIO in threaded interrupt
References: <1424203617-29431-1-git-send-email-robert.jarzmik@free.fr>
 <20150218101646.GO25269@lukather>
Date: Wed, 18 Feb 2015 18:16:17 +0100
In-Reply-To: <20150218101646.GO25269@lukather> (Maxime Ripard's message of
 "Wed, 18 Feb 2015 11:16:46 +0100")
Message-ID: <87vbiz87j2.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Maxime Ripard <maxime.ripard@free-electrons.com> writes:

> On Tue, Feb 17, 2015 at 09:06:57PM +0100, Robert Jarzmik wrote:
>> Change the handling of the data stage in the driver : don't pump data in
>> the top-half interrupt, but rather schedule a thread for non dma cases.
>> 
>> This will enable latencies in the data pumping, especially if delays are
>> required. Moreover platform shall be more reactive as other interrupts
>> can be served while pumping data.
>> 
>> No throughput degradation was observed, at least on the zylonite
>> platform, while a slight degradation was being expected.
>> 
>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>
> Tested-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>
> On a sidenote...
Thanks.

>> @@ -1672,7 +1688,8 @@ static int alloc_nand_resource(struct platform_device *pdev)
>>  	/* initialize all interrupts to be disabled */
>>  	disable_int(info, NDSR_MASK);
>>  
>> -	ret = request_irq(irq, pxa3xx_nand_irq, 0, pdev->name, info);
>> +	ret = request_threaded_irq(irq, pxa3xx_nand_irq,
>> +				   pxa3xx_nand_irq_thread, 0, pdev->name, info);
>
> Using IRQF_ONESHOT would allow you not to do the interrupt enable /
> disable dance.
Yes, that's a very good point. Would your Tested-by still hold with this change ?

Cheers.

-- 
Robert
