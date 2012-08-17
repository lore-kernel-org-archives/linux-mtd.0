Message-ID: <502E2279.1030604@antcom.de>
Date: Fri, 17 Aug 2012 12:52:41 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: artem.bityutskiy@linux.intel.com
Subject: Re: [PATCH] ARM: LPC32xx: Provide DMA filter callbacks via platform
 data
References: <1345122935-22115-1-git-send-email-stigge@antcom.de>
 <1345198171.27859.39.camel@sauron.fi.intel.com>
In-Reply-To: <1345198171.27859.39.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: srinivas.bakki@nxp.com, linux@arm.linux.org.uk, arnd@arndb.de,
 linux-kernel@vger.kernel.org, kevin.wells@nxp.com,
 linux-mtd@lists.infradead.org, aletes.xgr@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/17/2012 12:09 PM, Artem Bityutskiy wrote:
> On Thu, 2012-08-16 at 15:15 +0200, Roland Stigge wrote:
>> The SLC and MLC NAND drivers now need their dma_filter callbacks
>> via platform data to make them independent of single DMA engine
>> drivers.
>> 
>> (This also helps fixing build errors of the SLC and MLC drivers
>> when building as modules because direct access to AMBA dma filter
>> functions isn't available via export.)
>> 
>> Signed-off-by: Roland Stigge <stigge@antcom.de>
> 
> Pushed the 3 patches to l2-mtd.git, thanks!

To later avoid collisions on subsystem merge, can you please leave the
patch with arch/arm/mach-lpc32xx/phy3250.c for arm-soc.git? (I will
provide a pull request for Arnd and Olof, as usual.)

Thanks,

Roland
