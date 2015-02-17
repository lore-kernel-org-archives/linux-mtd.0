Message-ID: <54E3777B.20607@free-electrons.com>
Date: Tue, 17 Feb 2015 14:16:43 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v3 1/2] mtd: nand: pxa3xx: Fix PIO FIFO draining
References: <1424091072-7738-1-git-send-email-maxime.ripard@free-electrons.com>	<1424091072-7738-2-git-send-email-maxime.ripard@free-electrons.com>	<87oaotaa6r.fsf@free.fr>
 <20150216205825.GG25269@lukather>	<87k2zha69p.fsf@free.fr>
 <20150217103740.GK25269@lukather> <877fvga2mb.fsf@free.fr>
In-Reply-To: <877fvga2mb.fsf@free.fr>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: Lior Amsalem <alior@marvell.com>, Andrew Lunn <andrew@lunn.ch>,
 Jason Cooper <jason@lakedaemon.net>, Tawfik Bayouk <tawfik@marvell.com>,
 Thomas Petazzoni <thomas@free-electrons.com>, Seif Mazareeb <seif@marvell.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Sudhakar Gundubogula <sudhakar@marvell.com>, Nadav Haklai <nadavh@marvell.com>,
 Boris Brezillon <boris@free-electrons.com>, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/17/2015 02:07 PM, Robert Jarzmik wrote:
> Maxime Ripard <maxime.ripard@free-electrons.com> writes:
> 
>> On Mon, Feb 16, 2015 at 10:36:02PM +0100, Robert Jarzmik wrote:
>>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
>>> index e512902..6e569e9 100644
>>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>>> @@ -576,11 +576,20 @@ static void start_data_dma(struct pxa3xx_nand_info *info)
>>>  {}
>>>  #endif
>>>  
>>> +static irqreturn_t pxa3xx_nand_irq_thread(int irq, void *data)
>>> +{
>>> +	struct pxa3xx_nand_info *info = data;
>>> +
>>> +	handle_data_pio(info);
>>> +	return IRQ_HANDLED;
>>> +}
>>> +
>>>  static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
>>>  {
>>>  	struct pxa3xx_nand_info *info = devid;
>>>  	unsigned int status, is_completed = 0, is_ready = 0;
>>>  	unsigned int ready, cmd_done;
>>> +	irqreturn_t ret = IRQ_HANDLED;
>>>  
>>>  	if (info->cs == 0) {
>>>  		ready           = NDSR_FLASH_RDY;
>>> @@ -622,7 +631,7 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
>>>  		} else {
>>>  			info->state = (status & NDSR_RDDREQ) ?
>>>  				      STATE_PIO_READING : STATE_PIO_WRITING;
>>> -			handle_data_pio(info);
>>> +			ret = IRQ_WAKE_THREAD;
>>>  		}
>>>  	}
>>>  	if (status & cmd_done) {
>>> @@ -663,7 +672,7 @@ static irqreturn_t pxa3xx_nand_irq(int irq, void *devid)
>>>  	if (is_ready)
>>>  		complete(&info->dev_ready);
>>>  NORMAL_IRQ_EXIT:
>>> -	return IRQ_HANDLED;
>>> +	return ret;
>>>  }
>>>  
>>>  static inline int is_buf_blank(uint8_t *buf, size_t len)
>>> @@ -1688,7 +1697,8 @@ static int alloc_nand_resource(struct platform_device *pdev)
>>>  	/* initialize all interrupts to be disabled */
>>>  	disable_int(info, NDSR_MASK);
>>>  
>>> -	ret = request_irq(irq, pxa3xx_nand_irq, 0, pdev->name, info);
>>> +	ret = request_threaded_irq(irq, pxa3xx_nand_irq,
>>> +				   pxa3xx_nand_irq_thread, 0, pdev->name, info);
>>>  	if (ret < 0) {
>>>  		dev_err(&pdev->dev, "failed to request IRQ\n");
>>>  		goto fail_free_buf;
>>
>> I just gave this patch a try, and it blows up quite badly:
>> http://code.bulix.org/p96krc-87889?raw
> Confirmed.
> OTOH, replacing :
>>> +			ret = IRQ_WAKE_THREAD;
> With:
> +			ret = IRQ_WAKE_THREAD;
> +			goto NORMAL_IRQ_EXIT;
> 
> is fully working in my environment, now I got 10mn to test it.
> I also added for cosmetics in pxa3xx_nand_irq_thread() a :
> 	info->state = STATE_CMD_DONE;
> 
>> It looks like there's more work here, most likely in the waitqueues
>> wake up.
> Not that much if I'm right, hein ?
> And it enables the msleep() instead of mdelay().
> 
> And the flow of the driver is not changed for pxa3xx, only for Armada (ie. non
> dma case) for which you need to introduce a delay anyway, and therefore change
> the flow.
> 
> It will be Brian choice eventually, but if you say that you will submit that
> approach for next cycle, and yours for stable, and that for next you'll convert
> mdelay() to msleep(), I'll stop arguing.
> 

How about you push a proper patchset with this alternative (and a nice
cover letter explaining the need for a threaded irq) so we can discuss
properly this new turn?

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
