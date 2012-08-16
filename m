Message-ID: <502D032D.1000301@antcom.de>
Date: Thu, 16 Aug 2012 16:26:53 +0200
From: Roland Stigge <stigge@antcom.de>
MIME-Version: 1.0
To: artem.bityutskiy@linux.intel.com
Subject: Re: [PATCH 1/2] mtd: lpc32xx_slc: Adjust to pl08x DMA interface
 changes
References: <1342095778-13403-1-git-send-email-stigge@antcom.de>
 <1342095778-13403-2-git-send-email-stigge@antcom.de>
 <1345027069.3393.124.camel@sauron.fi.intel.com>
In-Reply-To: <1345027069.3393.124.camel@sauron.fi.intel.com>
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

Hi,

On 08/15/2012 12:37 PM, Artem Bityutskiy wrote:
> On Thu, 2012-07-12 at 14:22 +0200, Roland Stigge wrote:
>> This patch adjusts the LPC32xx SLC NAND driver to the new pl08x
>> DMA interface, fixing the compile error resulting from changed
>> pl08x structures.
>> 
>> Signed-off-by: Roland Stigge <stigge@antcom.de>
> 
> This patch breaks compilation:
> 
> ERROR: "pl08x_filter_id" [drivers/mtd/nand/lpc32xx_slc.ko]
> undefined!
> 
> Please, send a fix. The defconfig I used is attached.

Please see my just posted patches:

mtd: lpc32xx_slc: Make driver independent of AMBA DMA engine driver
mtd: lpc32xx_mlc: Make driver independent of AMBA DMA engine driver

This also fixes the above problem by getting rid of the reference to
pl08x_filter_id.

Thanks,

Roland
