Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA11T-0005l9-QY
 for linux-mtd@lists.infradead.org; Fri, 18 Dec 2015 19:49:04 +0000
Subject: Re: [PATCH] mtd: onenand: omap2: Simplify the DMA setup for various
 paths
To: Brian Norris <computersforpeace@gmail.com>
References: <1450086572-15224-1-git-send-email-peter.ujfalusi@ti.com>
 <20151218181111.GK10460@google.com>
CC: <kyungmin.park@samsung.com>, <dwmw2@infradead.org>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-omap@vger.kernel.org>, Tony Lindgren <tony@atomide.com>
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Message-ID: <567462F9.1010703@ti.com>
Date: Fri, 18 Dec 2015 21:48:09 +0200
MIME-Version: 1.0
In-Reply-To: <20151218181111.GK10460@google.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/18/2015 08:11 PM, Brian Norris wrote:
> On Mon, Dec 14, 2015 at 11:49:32AM +0200, Peter Ujfalusi wrote:
>> We have 4 functions containing almost identical DMA setup code. Create one
>> function which can set up the DMA for both read and write and use this in
>> place for the setup code in the driver.
>> The new function will use wait_for_completion_timeout() and it will figure
>> out the best data_type to be used for the transfer instead of hardwiring
>> 32 or 16 bit data.
>>
>> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> 
> Does anyone use this driver? I've seen practically zero activity on the
> entire OneNAND codebase in the last few years, and I presumed it was
> essentially dead.
> 
> If it's not dead, I'd like to know some contingency of people who are
> willing to actually maintain (or at least review) this stuff.
> 
> Kyungmin, are you still out there? Or Tony, do you know of any users for
> this?
> 
> Peter, are you actually using this, or are you just refactoring for the
> fun of it?

Not really for fun, but I want to get rid of all legacy/direct sDMA use so at
the end we will have omap_start_dma() visible in two files:
arch/arm/plat-omap/dma.c
drivers/dma/omap-dma.c

from there it will be possible to get rid of the plat-omap code. This onenand
driver was the first in the 'git grep omap_start_dma' result ;)

-- 
Péter
