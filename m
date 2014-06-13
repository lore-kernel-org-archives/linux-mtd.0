Message-ID: <539AB68C.5090001@ti.com>
Date: Fri, 13 Jun 2014 11:30:04 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 18/36] ARM: OMAP2+: gpmc-onenand: Move Synchronous setting
 code to drivers/
References: <1402477001-31132-1-git-send-email-rogerq@ti.com>
 <1402477001-31132-19-git-send-email-rogerq@ti.com>
 <20140613075527.GP17845@atomide.com>
In-Reply-To: <20140613075527.GP17845@atomide.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, nsekhar@ti.com,
 linux-kernel@vger.kernel.org, kyungmin.park@samsung.com,
 linux-mtd@lists.infradead.org, pekon@ti.com,
 ezequiel.garcia@free-electrons.com, javier@dowhile0.org,
 computersforpeace@gmail.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/13/2014 10:55 AM, Tony Lindgren wrote:
> * Roger Quadros <rogerq@ti.com> [140611 01:59]:
>> Move the code that puts the onenand in synchronous mode
>> into the appropriate place i.e. drivers/mtd/onenand/omap2.c.
>>
>> Make use of omap_gpmc_get_clk_period() and omap_gpmc_retime()
>> to calculate the necessary timings and configure the GPMC
>> parent's timings.
> 
> Ideally we would just use the drivers/mtd/onenand/generic.c
> and get rid of drivers/mtd/onenand/omap2.c. We still need
> the bus glue, which should probably be in drivers/memory?
> 

But what about the runtime synchronous timing calculations onenand/omap2.c?
There is also OMAP2 and OMAP3 specific dma handling done there, which should probably be done generically using dmaengine.

cheers,
-roger
