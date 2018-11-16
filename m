Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNeUa-0003yk-1x
 for linux-mtd@lists.infradead.org; Fri, 16 Nov 2018 13:49:05 +0000
Date: Fri, 16 Nov 2018 14:42:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tudor.Ambarus@microchip.com
Cc: boris.brezillon@bootlin.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, marek.vasut@gmail.com, richard@nod.at,
 linux-mtd@lists.infradead.org, cyrille.pitchen@wedev4u.fr
Subject: Re: [PATCH v3 2/2] mtd: spi-nor: Use 4B opcodes when the NOR
 advertises both 3B and 4B
Message-ID: <20181116134235.GD29768@piout.net>
References: <20181031144504.19405-1-boris.brezillon@bootlin.com>
 <20181031144504.19405-2-boris.brezillon@bootlin.com>
 <bf8fe028-a9ad-56da-df3b-c4e232b5f5cb@microchip.com>
 <0b747728-0abf-7e88-0d83-3b3db1415837@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b747728-0abf-7e88-0d83-3b3db1415837@microchip.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16/11/2018 11:57:10+0000, Tudor.Ambarus@microchip.com wrote:
> 
> 
> On 11/09/2018 12:49 PM, Tudor.Ambarus@microchip.com wrote:
> > 
> > 
> > On 10/31/2018 04:45 PM, Boris Brezillon wrote:
> >> When the NOR supports 4 bytes opcodes we should use those instead of
> >> switching the flash in 4-bytes mode. This way, we don't have to restore
> >> the addressing mode when resetting the board.
> >>
> >> Reported-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> >> Tested-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> >> Reviewed-by: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
> > 
> > Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> > 
> 
> I propose to stall this patch for a week or so, until we will have a clearer
> view on how are defined the flashes that don't have 4B opcodes, but can enter
> the 4-Byte mode on command.
> 

Note that this patch is badly needed for some of our boards. without it,
they can't reboot properly. I would very much like to see it enter
upstream and be backported sooner than later.

> >> ---
> >> Changes in v3:
> >> - Add Alexandre R-b+T-b
> >> - Add Cyrille R-b
> >>
> >> Changes in v2
> >> - None
> >> ---
> >>  drivers/mtd/spi-nor/spi-nor.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
> >> index 798915b5c2b0..b20bc4b36f0f 100644
> >> --- a/drivers/mtd/spi-nor/spi-nor.c
> >> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >> @@ -2643,6 +2643,7 @@ static int spi_nor_parse_bfpt(struct spi_nor *nor,
> >>  		break;
> >>  
> >>  	case BFPT_DWORD1_ADDRESS_BYTES_4_ONLY:
> >> +	case BFPT_DWORD1_ADDRESS_BYTES_3_OR_4:
> >>  		nor->flags |= SNOR_F_4B_OPCODES;
> 
> 
> Maybe we will also want to check that BFPT DWORD16[31:24] has value xx1x_xxxxb -
> it indicates that 4B opcodes are supported.
> 
> Cheers,
> ta
> 
> >>  		nor->addr_width = 4;
> >>  		break;
> >>
> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
