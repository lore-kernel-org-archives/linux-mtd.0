Date: Thu, 5 Mar 2015 13:55:00 +0100
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v3 4/9] mtd: pxa3xx_nand: rework timings setup
Message-ID: <20150305125500.GB5265@kwain>
References: <1425555085-29531-1-git-send-email-antoine.tenart@free-electrons.com>
 <1425555085-29531-5-git-send-email-antoine.tenart@free-electrons.com>
 <20150305135023.45727776@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20150305135023.45727776@free-electrons.com>
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, jszhang@marvell.com,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thomas,

On Thu, Mar 05, 2015 at 01:50:23PM +0100, Thomas Petazzoni wrote:
> On Thu,  5 Mar 2015 12:31:20 +0100, Antoine Tenart wrote:
> > Use the nand framework helpers: onfi_get_async_timing_mode() and
> > onfi_async_timing_mode_to_sdr_timings() to retrieve the timing
> > configuration. Then update the pxa3xx timing setup function to use the
> > timing configuration retrieved.
> > 
> > Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c                | 101 ++++++++++++++++++--------
> >  include/linux/platform_data/mtd-nand-pxa3xx.h |   2 -
> >  2 files changed, 69 insertions(+), 34 deletions(-)
> 
> After this commit, the pxa3xx_nand_timing structure type is no longer
> used as far as I understand. So maybe it can be removed from
> include/linux/platform_data/mtd-nand-pxa3xx.h ?

Right, I'll remove it.

Antoine

-- 
Antoine Ténart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
