Received: from mail-wr0-f193.google.com ([209.85.128.193])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cbYKn-0005qM-Bg
 for linux-mtd@lists.infradead.org; Wed, 08 Feb 2017 19:55:23 +0000
Received: by mail-wr0-f193.google.com with SMTP id o16so9759135wra.2
 for <linux-mtd@lists.infradead.org>; Wed, 08 Feb 2017 11:55:00 -0800 (PST)
Subject: Re: [GIT PULL] mtd: spi-nor: Changes for 4.11
To: Brian Norris <computersforpeace@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
References: <2f46eee5-35c1-291a-52e9-132ced5749a9@atmel.com>
 <1e124883-d21a-8066-2c22-e9aae98dd775@gmail.com>
 <0e2e8e2b-4003-5dae-2f6d-f72375d9ca03@gmail.com>
 <c89577f7-2908-3a75-6be4-78455c5cffcb@atmel.com>
 <20170208190939.GA97840@google.com>
Cc: Marek Vasut <marek.vasut@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Richard Weinberger <richard@nod.at>, Mark Brown <broonie@kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <4c61efd5-3671-3346-524f-b25a68f2ad99@gmail.com>
Date: Wed, 8 Feb 2017 20:53:48 +0100
MIME-Version: 1.0
In-Reply-To: <20170208190939.GA97840@google.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 08.02.2017 um 20:09 schrieb Brian Norris:
> + Mark, as the disagreement touches his area
> 
> Hi,
> 
> On Wed, Feb 08, 2017 at 11:36:10AM +0100, Cyrille Pitchen wrote:
>> Le 08/02/2017 à 06:52, Heiner Kallweit a écrit :
>>> Am 08.02.2017 um 02:09 schrieb Marek Vasut:
>>>> On 02/07/2017 04:31 PM, Cyrille Pitchen wrote:
>> [...]
>>>>> Heiner Kallweit (1):
>>>>>       mtd: m25p80: consider max message size in m25p80_read
>>>>
>>>> I cannot say I'm super-happy about this particular patch, still ...
>>>>
>>> W/o it at least the fsl-espi driver is broken for transfers >= 64kB.
>>>
>>
>> We asked Mark Brown about the need to check the limits for the size of SPI
>> transfers and messages and I've understood his answer correctly, he told us
>> we should check those limits:
>>
>> http://patchwork.ozlabs.org/patch/688176/
>>
>> "> Does this imply that we have to fix every single driver this way ?"
>>
>> "Ideally.  Any SPI driver that has an upper limit really ought to export
>> it, and any driver that might bump into one of those limits should
>> check.  A lot of drivers are either unlikely to be deployed in a system
>> that has relevant limits or tend to only do short enough transfers
>> though - if systems are currently working it's just neatening things up
>> really"
>>
>> Then the discussion ended there. I didn't see any comment after that so I
>> just thought the discussion was over and everybody agreed.
> 
> I thought we more or less settled on this a while ago. But I could be
> wrong.
> 
>> Besides, this patch doesn't introduce the check of SPI controller limits
>> but only extend this check. What I mean is that the m25p80 driver already
>> checks the maximum transfer size. This check was introduced by commit
>>
>> 95193796256c ("mtd: m25p80: read in spi_max_transfer_size chunks")
>>
>> Then if we already check the SPI max transfer size, I guess it make sense
>> to also test other limits such as the SPI max message size.
> 
> Yes, if this patch is wrong, then I'd expect commit 95193796256c was
> also wrong.
> 
> The central disagreement seems to be on the existence of upper limits
> for transfer and/or message size. Marek seemed to suggest elsewhere that
> there is usually no upper limit (or that "upper limits" are usually just
> driver bugs that are being worked around). I don't disagree that often
> these might just be driver bugs, but I *do* disagree that there are
> never limits. I think Mark (? or somebody else, not reading too closely)
> suggested that there are just few drivers that tickle the limits.
> 
> One example that shows both sides of this coin:
> 
> 5185a81c02d4 "spi: rockchip: limit transfers to (64K - 1) bytes"
> 
> The hardware has a hard limit on transfers, at least, which can only be
> 64K. For some reason there's an off-by-one error (probably a driver
> bug?), so I cheated and made it one smaller.
> 
> [...]
> 
> (snip the rest about trying to split spi_messages within the SPI driver;
> I agree that would be awful.)
> 
> But one question: *why* exactly is the transfer or message limit so
> fixed? If a SPI controller allows manual control over the CS line, then
> why would anybody care if a sequence of data gets split up into multiple
> HW sequences (e.g., for a long spi_transfer, why can't we split it into
> 2 sub-transfers, while keeping the CS asserted?).
> 
> For the above rockchip SPI controller, AIUI we could actually support
> the "transfer limit" by doing this. And in fact, it could probably be
> done within the SPI core code, instead either the SPI driver or the MTD
> driver.
> 
> Now, in this case, *transfer* vs. *message* seems to have a difference,
> in whether or not you have guarantees about the CS line. The CS must
> stay asserted (barring the 'cs_change' flag) between transfers, but not
> between messages.
> 
> So the one thing I can see that might support Marek's disagreement here:
> does the FSL ESPI hardware support controlling the CS line? It seems
> like currently, the driver just uses a few fixed settings for its CSMODE
> register fields, whereas it might be able to support ->transfer_one()
> (and flexible CS assertion, and splitting large transactions into
> smaller chunks) if you handled that differently...
> 
> Heiner (or others), any thoughts on the above? I might be very mistaken,
> especially since I'm not intimately familiar with a lot of SPI drivers.
> 
FSL ESPI has hardware-controlled CS. You program the length of transfer
(max. 64K) and when starting the transfer HW will assert CS and after
having transferred the programmed number of bytes CS is deasserted
internally.

And because of course this question came up:
No, you can't use pinmux to turn the CS line into a GPIO. It's only
possible to change the complete block of SPI signal to GPIOs.
But then we would end up with bitbanging, loose the HW FIFO etc.

Heiner

> Regardless, I think this patch is OK, given the established practice,
> and we should take it. We might want to push back to handle this better
> in the SPI layer, if at all possible.
> 
> One thing I do object to: why is this change marked for stable? It's not
> our fault you broke your duct-taped-together SPI driver in 4.9. I don't
> think backporting features is the way to satisfy the -stable
> requirements. Maybe some reverts would be the right way...
> 
> Brian
> 
