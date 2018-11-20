Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP7XP-0000Yl-Jp
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 15:02:04 +0000
Date: Tue, 20 Nov 2018 16:01:52 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tudor.Ambarus@microchip.com
Cc: marek.vasut@gmail.com, richard@nod.at, boris.brezillon@bootlin.com,
 linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr,
 computersforpeace@gmail.com, dwmw2@infradead.org
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: Use 4B opcodes when the NOR
 advertises both 3B and 4B
Message-ID: <20181120150152.GE8367@piout.net>
References: <20181031144504.19405-1-boris.brezillon@bootlin.com>
 <20181031144504.19405-2-boris.brezillon@bootlin.com>
 <bf8fe028-a9ad-56da-df3b-c4e232b5f5cb@microchip.com>
 <0b747728-0abf-7e88-0d83-3b3db1415837@microchip.com>
 <20181116134235.GD29768@piout.net>
 <210d4dff-b729-ae69-3b61-d63d6ae38604@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <210d4dff-b729-ae69-3b61-d63d6ae38604@microchip.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20/11/2018 13:18:49+0000, Tudor.Ambarus@microchip.com wrote:
> Hi, Alexandre,
> 
> On 11/16/2018 03:42 PM, Alexandre Belloni wrote:
> > On 16/11/2018 11:57:10+0000, Tudor.Ambarus@microchip.com wrote:
> >>
> >>
> >> On 11/09/2018 12:49 PM, Tudor.Ambarus@microchip.com wrote:
> >>>
> >>>
> >>> On 10/31/2018 04:45 PM, Boris Brezillon wrote:
> >>>> When the NOR supports 4 bytes opcodes we should use those instead of
> >>>> switching the flash in 4-bytes mode. This way, we don't have to restore
> >>>> the addressing mode when resetting the board.
> >>>>
> >>>> Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >>>> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> >>>> Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >>>> Reviewed-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> >>>
> >>> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >>>
> >>
> >> I propose to stall this patch for a week or so, until we will have a clearer
> >> view on how are defined the flashes that don't have 4B opcodes, but can enter
> >> the 4-Byte mode on command.
> >>
> > 
> > Note that this patch is badly needed for some of our boards. without it,
> > they can't reboot properly. I would very much like to see it enter
> > upstream and be backported sooner than later.
> 
> What flash do the boards use? Does your flash support SFDP 4-Byte Instruction
> table? If yes, the following patch should solve your problem indirectly:
> 

It is a MX25L25635FMI-10G

> https://lore.kernel.org/patchwork/patch/1015036/
> 
> You should also apply the following if you want to test it:
> 
> https://lore.kernel.org/patchwork/patch/1013294/
> 

Applying those two patches only doesn't fix the reboot issue.

spi_nor_parse_4bait() is never called.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
