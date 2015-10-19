Date: Mon, 19 Oct 2015 11:32:52 +0200
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>,
 sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com, zmxu@marvell.com,
 jszhang@marvell.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 robert.jarzmik@free.fr
Subject: Re: [PATCH v3 3/4] mtd: pxa3xx_nand: rework flash detection and
 timing setup
Message-ID: <20151019093252.GB29389@kwain>
References: <1444893451-16610-1-git-send-email-antoine.tenart@free-electrons.com>
 <1444893451-16610-4-git-send-email-antoine.tenart@free-electrons.com>
 <20151017140144.GB1578@laptop.cereza>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20151017140144.GB1578@laptop.cereza>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Oct 17, 2015 at 11:01:44AM -0300, Ezequiel Garcia wrote:
> On 15 Oct 09:17 AM, Antoine Tenart wrote:
> > Rework the pxa3xx_nand driver to allow using functions exported by the
> > nand framework to detect the flash and the timings. Then setup the
> > timings using the helpers previously added.
> > 
> > Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> > ---
> >  drivers/mtd/nand/pxa3xx_nand.c | 118 +++++++++--------------------------------
> >  1 file changed, 25 insertions(+), 93 deletions(-)
> > 
> 
> This patch is not applying on l2-mtd.git master. Care to rebase it?

I'll do this for the next version.

Antoine

-- 
Antoine Ténart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
