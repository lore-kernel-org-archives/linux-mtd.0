Received: from marmot.wormnet.eu ([2a03:9800:10:2d:3203:b3a5:8bdc:5b68])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDi9o-0002mV-4X
 for linux-mtd@lists.infradead.org; Thu, 07 Mar 2013 21:15:21 +0000
Date: Thu, 7 Mar 2013 21:15:08 +0000
From: Alexander Clouter <alex@digriz.org.uk>
To: linux-mtd@lists.infradead.org
Subject: Re: plat-nand DT support
Message-ID: <20130307211508.GP1976@edkhil>
References: <20130303155226.GA1976@edkhil>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20130303155226.GA1976@edkhil>
Cc: hsweeten@visionengravers.com, devicetree-discuss@lists.ozlabs.org,
 blogic@openwrt.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Any comments...anyone?

On Sun, Mar 03, 2013 at 03:52:26PM +0000, Alexander Clouter wrote:
>
>I have been busy porting an ARM board (that uses plat_nand) to 
>devicetree and stumbled on John Crispin's patch from last year[1].  
>There was not much online about how to use it, so I went about 
>building upon his work it what seemed to be natural and a good fit.
>
>Attached is the work I have done to the driver its-self (including 
>the much needed bindings documentation), whilst on my github page I 
>have put up an example of its usage:
>
>https://github.com/jimdigriz/ts78xx/blob/gen-nand-dt/arch/arm/mach-orion5x/board-ts7800.c
>https://github.com/jimdigriz/ts78xx/blob/gen-nand-dt/arch/arm/boot/dts/orion5x-ts7800.dts
>
>Am I going in the right direction here?  plat_nand, by its nature, is 
>not very DT, the alternative would be a custom driver for my 
>platform[2] but then are we not just littering drivers/mtd/nand 
>rather than arch/arm/mach-foobar?
>
>Cheers
>
>[1] http://lists.infradead.org/pipermail/linux-mtd/2012-April/041025.html
>[2] could also support the NAND used by arch/arm/mach-ep93xx/ts72xx.c 
>	but the whole SoC has not been ported to DT

-- 
Alexander Clouter
.sigmonster says: The ends justify the means.
                   		-- after Matthew Prior
