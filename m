Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XW8Za-0004dk-4v
 for linux-mtd@lists.infradead.org; Mon, 22 Sep 2014 18:42:54 +0000
Received: by mail-pa0-f54.google.com with SMTP id fb1so5052325pad.13
 for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2014 11:42:31 -0700 (PDT)
Date: Mon, 22 Sep 2014 11:42:28 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Subject: Re: [PATCH v4 0/5] nand: OMAP collected fixes
Message-ID: <20140922184228.GR1193@ld-irv-0074>
References: <1411231996-6387-1-git-send-email-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1411231996-6387-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 linux-mtd@lists.infradead.org, Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Sep 20, 2014 at 05:53:11PM +0100, Ezequiel Garcia wrote:
> I've collected all the changes recently discussed in a whole patchset.
> If you are just reading this for the first time please take a look at:
> 
> [1] http://www.spinics.net/lists/linux-omap/msg110965.html
> [2] http://www.spinics.net/lists/linux-omap/msg110958.html 
> 
> As requested by Roger, the omap_elm is a 'bool' driver now. The plan
> is to merge it inside omap2_nand, but my queue is really filled, so
> if anyone feels like doing, please be my guest.
> 
> Although I'm hoping this to be the last round, feedback and testing
> is welcome.
> 
> Brian: I wonder if it's too late for v3.18?
> 
> Thanks!
> 
> Ezequiel Garcia (5):
>   nand: omap2: Remove horrible ifdefs to fix module probe
>   nand: omap2: Replace pr_err with dev_err
>   mtd: nand: Move ELM driver and rename as omap_elm

Pushed the first 3 to l2-mtd.git. Thanks!

>   mtd: nand: Rename OMAP NAND driver

One comment on this one, which I'll poast on its patch.

>   mtd: nand: Constrain omap_elm to built-in
> 
>  drivers/mtd/devices/Makefile                   |   1 -
>  drivers/mtd/nand/Kconfig                       |   2 +-
>  drivers/mtd/nand/Makefile                      |   3 +-
>  drivers/mtd/nand/{omap2.c => omap2_nand.c}     | 160 ++++++++++++++-----------
>  drivers/mtd/{devices/elm.c => nand/omap_elm.c} |   0
>  include/linux/platform_data/elm.h              |  16 +++
>  6 files changed, 107 insertions(+), 75 deletions(-)
>  rename drivers/mtd/nand/{omap2.c => omap2_nand.c} (95%)
>  rename drivers/mtd/{devices/elm.c => nand/omap_elm.c} (100%)
> 

Brian
