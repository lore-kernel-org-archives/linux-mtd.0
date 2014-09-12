Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSMd1-0001wN-32
 for linux-mtd@lists.infradead.org; Fri, 12 Sep 2014 08:54:54 +0000
Message-ID: <5412B4C0.505@ti.com>
Date: Fri, 12 Sep 2014 11:54:24 +0300
From: Roger Quadros <rogerq@ti.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/3] nand: Renaming, moving and fixing NAND and ELM drivers
References: <1410443224-18477-1-git-send-email-ezequiel@vanguardiasur.com.ar>
In-Reply-To: <1410443224-18477-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On 09/11/2014 04:47 PM, Ezequiel Garcia wrote:
> Following the recent discussion with Roger, here's a few patches that
> (hopefully) fix all the issues.
> 
> The first patches rename the OMAP NAND drivers, so they are now called
> omap2_nand and omap_elm.
> 
> The last patch picks an idea from Yann E. Morin and fixes the build issue
> reported by Roger. Quoting Roger:
> 
> ""
> I still get the following error if I set CONFIG_MTD_NAND_OMAP2 to y and
> CONFIG_MTD_NAND_OMAP_BCH to m.
> 
> CONFIG_MTD_NAND_OMAP_BCH is used to select the ELM driver and it must be limited to
> be built-in if CONFIG_MTD_NAND_OMAP2 is built-in.
> 
> Maybe it should be a sub option of CONFIG_MTD_NAND_OMAP2.
> IMHO the elm.c file must be moved from mtd/devices to mtd/nand and renamed to omap_elm.c
> 
> drivers/built-in.o: In function `omap_nand_probe':
> /work/linux-2.6/drivers/mtd/nand/omap2.c:2010: undefined reference to `elm_config'
> /work/linux-2.6/drivers/mtd/nand/omap2.c:1980: undefined reference to `elm_config'
> /work/linux-2.6/drivers/mtd/nand/omap2.c:1927: undefined reference to `elm_config'
> drivers/built-in.o: In function `omap_elm_correct_data':
> /work/linux-2.6/drivers/mtd/nand/omap2.c:1444: undefined reference to `elm_decode_bch_error_page'
> make: *** [vmlinux] Error 1
> ""
> 
> [1] https://lkml.org/lkml/2013/5/4/84
> 
> Ezequiel Garcia (3):
>   mtd: nand: Move ELM driver and rename as omap_elm
>   mtd: nand: Rename OMAP NAND driver
>   mtd: nand: Force omap_elm to be built as a module if omap2_nand is a
>     module

Thanks for the patches. I see a lot of errors reported by checkpatch.pl which need fixing.

cheers,
-roger

> 
>  drivers/mtd/devices/Makefile                   | 1 -
>  drivers/mtd/nand/Kconfig                       | 8 +++++++-
>  drivers/mtd/nand/Makefile                      | 3 ++-
>  drivers/mtd/nand/{omap2.c => omap2_nand.c}     | 0
>  drivers/mtd/{devices/elm.c => nand/omap_elm.c} | 0
>  5 files changed, 9 insertions(+), 3 deletions(-)
>  rename drivers/mtd/nand/{omap2.c => omap2_nand.c} (100%)
>  rename drivers/mtd/{devices/elm.c => nand/omap_elm.c} (100%)
> 
