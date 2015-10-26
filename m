Received: from mail-qg0-x22d.google.com ([2607:f8b0:400d:c04::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqiEh-0004EZ-DX
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 13:54:56 +0000
Received: by qgem9 with SMTP id m9so119418547qge.1
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 06:54:34 -0700 (PDT)
Date: Mon, 26 Oct 2015 10:50:33 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Antoine Tenart <antoine.tenart@free-electrons.com>
Cc: sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com,
 thomas.petazzoni@free-electrons.com, robert.jarzmik@free.fr,
 zmxu@marvell.com, jszhang@marvell.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/5] mtd: pxa3xx_nand: rework the timing setup
Message-ID: <20151026135033.GA1820@laptop>
References: <1445416144-9194-1-git-send-email-antoine.tenart@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445416144-9194-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21 Oct 10:28 AM, Antoine Tenart wrote:
> Hello,
> 
> Let's try one more time to get this merged.
> 
> This series was part of a bigger one[1], which was split into smaller
> ones as asked by Ezequiel[2]. When we take this into account this is
> v9; with a v1 sent in January, 9 months ago.
> 
> Another series, introducing the Berlin nand support, depends on this.
> 
> The aim here is to use the nand framework to setup the timings,
> while keeping the old in-driver way of configuration timings for
> compatibility reasons.
> 
> You can find the series at:
> https://github.com/atenart/linux.git berlin/4.3/nand-timings
> 
> Antoine
> 
> Since v3:
>         - Moved back a chunk into the right patch.
>         - Called pxa3xx_nand_config_flash() before KEEP_CONFIG.
>         - Rebased on top of l2-mtd.git master.
> 
> Since v2:
>         - Added back the support for keep-config 16 bits devices
>         - Fixed wrong unit in a calculation
>         - Reworked the pxa3xx_nand_init_timings() logic
>         - Allowed compile test the pxa3xx driver
> 
> Since v1:
>         - Rebased on top of v4.2-rc1
> 
> Since the series was split up:
>         - Reworked the ndcr setup
>         - Removed the read_id_bytes update after device detection
> 
> Antoine Tenart (5):
>   mtd: pxa3xx: prepare allowing compile test

Nit: This commit subject sounds a bit off.

>   mtd: nand: allow compile test of MTD_NAND_PXA3xx
>   mtd: pxa3xx_nand: add helpers to setup the timings
>   mtd: pxa3xx_nand: rework flash detection and timing setup
>   mtd: pxa3xx_nand: clean up the pxa3xx timings
> 
>  drivers/mtd/nand/Kconfig       |   2 +-
>  drivers/mtd/nand/pxa3xx_nand.c | 274 +++++++++++++++++++++++++----------------
>  2 files changed, 168 insertions(+), 108 deletions(-)
> 

The series look good and it's certainly a great improvement.
Thomas and Robert tested it, so we should be good to go:

Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

We can take a look at the timeout reported by Thomas afterwards.

BTW, it would be great if you could post a patch using Boris'
timings helpers: https://patchwork.ozlabs.org/patch/534919/ ?
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
