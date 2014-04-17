From: Marek Vasut <marex@denx.de>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/5] ARM: defconfigs: add MTD_SPI_NOR (new dependency for
 M25P80)
Date: Thu, 17 Apr 2014 13:08:34 +0200
References: <1397719309-2022-1-git-send-email-computersforpeace@gmail.com>
 <1397719309-2022-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397719309-2022-2-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404171308.34570.marex@denx.de>
Cc: Russell King <linux@arm.linux.org.uk>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
 Olof Johansson <olof@lixom.net>, Shawn Guo <shawn.guo@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, April 17, 2014 at 09:21:45 AM, Brian Norris wrote:
> These defconfigs contain the CONFIG_M25P80 symbol, which is now
> dependent on the MTD_SPI_NOR symbol. Add CONFIG_MTD_SPI_NOR to the
> relevant defconfigs.
> 
> At the same time, drop the now-nonexistent CONFIG_MTD_CHAR symbol.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Russell King <linux@arm.linux.org.uk>
> Cc: Shawn Guo <shawn.guo@freescale.com>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---

mxs_defconfig is
Reviewed-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
