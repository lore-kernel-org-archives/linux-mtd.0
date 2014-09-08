Received: from arroyo.ext.ti.com ([192.94.94.40])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQuLV-0004Gb-Gw
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 08:30:46 +0000
Message-ID: <540D691B.2060202@ti.com>
Date: Mon, 8 Sep 2014 11:30:19 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/3] nand: omap2: Two and a half improvements
References: <1410033389-32357-1-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1410033389-32357-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>, linux-mtd@lists.infradead.org,
 =?ISO-8859-1?Q?Guido_Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On 09/06/2014 10:56 PM, Ezequiel Garcia wrote:
> Hi Brian, Roger:
> 
> Pekon's attempt to add flash BBT support for this driver made me realise
> the addition made sense and there were good reasons for it. The first patch
> adds support for enabling a flash BBT either from legacy board files or
> from devicetree.
> 
> While testing this, I noticed how the driver relied on a whole bunch of
> horrible #ifdefs, which prevented me from loading the driver as a module.
> The second patch attempts to fix that.
> 
> The third patch is just a dummy cleanup replacing pr_errs with dev_errs.
> This driver is abusing from user messages, but I'm not sure fixing them
> worths the trouble.
> 
> Roger, do you think you can test patches 1 and 2 with different ECCs
> and configurations? It's an invasive patch and I don't want to see more
> regressions with this driver.

Yes. I will run them through all the boards that I have and let you know in
a day or two.

> 
> And speaking of modules, the driver loads as "modprobe omap2". And it's not
> the only one with a clumsy name: "modprobe elm". I guess we cannot fix it now,
> but it would be great to be more careful with driver naming in the future.

Why can't we fix it now? It seems nobody ever used it as a module before so now
is the right time to fix. Unless Tony has any objections.

cheers,
-roger

> 
> Ezequiel Garcia (3):
>   nand: omap2: Add support for a flash-based bad block table
>   nand: omap2: Refactor the code to remove horrible ifdefs
>   nand: omap2: Replace pr_err with dev_err
> 
>  arch/arm/mach-omap2/gpmc.c                   |   2 +
>  drivers/mtd/nand/omap2.c                     | 166 +++++++++++++++------------
>  include/linux/platform_data/elm.h            |  14 +++
>  include/linux/platform_data/mtd-nand-omap2.h |   1 +
>  4 files changed, 108 insertions(+), 75 deletions(-)
> 
