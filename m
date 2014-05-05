Date: Sun, 4 May 2014 21:03:44 -0400
From: Jason Cooper <jason@lakedaemon.net>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2 08/12] ARM: marvell: add MTD_SPI_NOR (new dependency
 for M25P80)
Message-ID: <20140505010344.GE28159@titan.lakedaemon.net>
References: <1398925607-7482-1-git-send-email-computersforpeace@gmail.com>
 <1398925607-7482-9-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398925607-7482-9-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Andrew Lunn <andrew@lunn.ch>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 30, 2014 at 11:26:43PM -0700, Brian Norris wrote:
> These defconfigs contain the CONFIG_M25P80 symbol, which is now
> dependent on the MTD_SPI_NOR symbol. Add CONFIG_MTD_SPI_NOR to satisfy
> the new dependency.
> 
> At the same time, drop the now-nonexistent CONFIG_MTD_CHAR symbol.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Jason Cooper <jason@lakedaemon.net>
> ---
>  arch/arm/configs/dove_defconfig     | 2 +-
>  arch/arm/configs/kirkwood_defconfig | 1 +
>  arch/arm/configs/mvebu_v5_defconfig | 1 +
>  arch/arm/configs/mvebu_v7_defconfig | 1 +
>  4 files changed, 4 insertions(+), 1 deletion(-)

Applied to mvebu/defconfig with Ezequiel's Ack, and a reworded subject:

"ARM: mvebu: defconfig: add MTD_SPI_NOR (new dependency for M25P80)"

thx,

Jason.
