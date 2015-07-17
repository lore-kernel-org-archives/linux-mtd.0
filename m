Date: Fri, 17 Jul 2015 15:41:59 +0200
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>,
 boris.brezillon@free-electrons.com, zmxu@marvell.com,
 jszhang@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] mtd: pxa3xx_nand: rework the timing setup
Message-ID: <20150717134159.GC10608@kwain>
References: <1436281707-20106-1-git-send-email-antoine.tenart@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1436281707-20106-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,

On Tue, Jul 07, 2015 at 05:08:23PM +0200, Antoine Tenart wrote:
> 
> This series was part of a bigger one[1], which was split into smaller
> ones as asked by Ezequiel[2]. When we take this into account, this is
> v7. In addition, there was absolutely no comment for more than 1 month
> (since June 2nd). Given this, I really expect the series to be merge
> soon as other series are based on this.

Any news on this series?

Thanks,

Antoine

> The aim here is to use the nand framework to setup the timings,
> while keeping the old in-driver way of configuration timings for
> compatibility reasons.
> 
> Since v1:
> 	- Rebased on top of v4.2-rc1
> 
> Since the series was split up:
>         - reworked the ndcr setup
>         - removed the read_id_bytes update after device detection
> 
> [1] https://lkml.org/lkml/2015/5/11/495
> [2] https://lkml.org/lkml/2015/5/16/309
> 
> Antoine Tenart (4):
>   mtd: pxa3xx_nand: add a default chunk size
>   mtd: pxa3xx_nand: add helpers to setup the timings
>   mtd: pxa3xx_nand: rework flash detection and timing setup
>   mtd: pxa3xx_nand: clean up the pxa3xx timings
> 
>  drivers/mtd/nand/pxa3xx_nand.c                | 251 ++++++++++++++------------
>  include/linux/platform_data/mtd-nand-pxa3xx.h |  11 +-
>  2 files changed, 143 insertions(+), 119 deletions(-)
> 
> -- 
> 2.4.5
> 

-- 
Antoine Ténart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
