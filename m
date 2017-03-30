Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctZYt-000623-7M
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 12:52:26 +0000
Date: Thu, 30 Mar 2017 14:52:01 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Peter Pan <peterpandong@micron.com>,
 richard@nod.at, computersforpeace@gmail.com,
 thomas.petazzoni@free-electrons.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, peterpansjtu@gmail.com,
 linshunquan1@hisilicon.com
Subject: Re: [PATCH v4 4/9] nand: spi: add basic blocks for infrastructure
Message-ID: <20170330145201.4a36ad5b@bbrezillon>
In-Reply-To: <d5bb74fa-a049-1116-ad9a-485496233d88@gmail.com>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-5-git-send-email-peterpandong@micron.com>
 <ac67260f-94ba-7336-5cd4-abc8e9c91cf1@denx.de>
 <20170323164000.34288ed9@bbrezillon>
 <d35d8136-5c62-a144-2aaa-bb39f7a3bac3@denx.de>
 <d5bb74fa-a049-1116-ad9a-485496233d88@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 30 Mar 2017 14:25:41 +0200
Arnaud Mouiche <arnaud.mouiche@gmail.com> wrote:

> On 23/03/2017 17:33, Marek Vasut wrote:
> > On 03/23/2017 04:40 PM, Boris Brezillon wrote:  
> >> On Thu, 23 Mar 2017 12:29:58 +0100
> >> Marek Vasut <marex@denx.de> wrote:
> >>
> >>  
> >>>> +
> >>>> +/*
> >>>> + * spinand_read_status - get status register value
> >>>> + * @chip: SPI NAND device structure
> >>>> + * @status: buffer to store value
> >>>> + * Description:
> >>>> + *   After read, write, or erase, the NAND device is expected to set the
> >>>> + *   busy status.
> >>>> + *   This function is to allow reading the status of the command: read,
> >>>> + *   write, and erase.
> >>>> + */
> >>>> +static int spinand_read_status(struct spinand_device *chip, uint8_t *status)
> >>>> +{
> >>>> +	return spinand_read_reg(chip, REG_STATUS, status);
> >>>> +}
> >>>> +
> >>>> +/*
> >>>> + * spinand_wait - wait until the command is done
> >>>> + * @chip: SPI NAND device structure
> >>>> + * @s: buffer to store status register value (can be NULL)
> >>>> + */
> >>>> +static int spinand_wait(struct spinand_device *chip, u8 *s)
> >>>> +{
> >>>> +	unsigned long timeo = msecs_to_jiffies(400);
> >>>> +	u8 status;
> >>>> +
> >>>> +	do {
> >>>> +		spinand_read_status(chip, &status);
> >>>> +		if ((status & STATUS_OIP_MASK) == STATUS_READY)
> >>>> +			goto out;
> >>>> +	} while (time_before(jiffies, timeo));
> >>>> +
> >>>> +	/*
> >>>> +	 * Extra read, just in case the STATUS_READY bit has changed
> >>>> +	 * since our last check
> >>>> +	 */  
> >>> Is this likely to happen ? Probably not ... so in case you reach this
> >>> place here, timeout happened.  
> >> If the timeout is big enough, no. But it does not hurt to do one last
> >> check.  
> > 400 mSec is not big enough ? It's huge ... this seems like a duplication
> > to me. btw the ad-hoc 400 mSec delay value should be replaced with a macro.
> >  
> In fact, there is a bug:
> 
> > unsigned long timeo = msecs_to_jiffies(400);
> > [...]
> > do { } while (time_before(jiffies, timeo));  
> 
> The condition is almost true except during the 5 minutes following the boot (before jiffies wrap around).
> So, only one status read is done, which give a high chance of returning a timeout status.
> I guess you should do : 	
> 
> 	unsigned long timeo = jiffies + msecs_to_jiffies(400);
> 
> I also suspect that this is the reason why you have an additional status read.

Oh, nice catch!
