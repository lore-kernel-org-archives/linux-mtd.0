Date: Tue, 6 May 2014 21:55:44 +0800
From: Shawn Guo <shawn.guo@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 01/12] ARM: imx/mxs defconfigs: add MTD_SPI_NOR (new
 dependency for M25P80)
Message-ID: <20140506135541.GA2798@dragon>
References: <1398925607-7482-1-git-send-email-computersforpeace@gmail.com>
 <1398925607-7482-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <1398925607-7482-2-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Linux Kernel <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Sascha Hauer <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 30, 2014 at 11:26:36PM -0700, Brian Norris wrote:
> These defconfigs contain the CONFIG_M25P80 symbol, which is now
> dependent on the MTD_SPI_NOR symbol. Add CONFIG_MTD_SPI_NOR to satisfy
> the new dependency.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Shawn Guo <shawn.guo@freescale.com>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Marek Vasut <marex@denx.de>

Applied, thanks.
