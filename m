Message-ID: <1398926587.28080.5.camel@x220>
Subject: Re: [PATCH v2 01/12] ARM: imx/mxs defconfigs: add MTD_SPI_NOR (new
 dependency for M25P80)
From: Paul Bolle <pebolle@tiscali.nl>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 01 May 2014 08:43:07 +0200
In-Reply-To: <1398925607-7482-2-git-send-email-computersforpeace@gmail.com>
References: <1398925607-7482-1-git-send-email-computersforpeace@gmail.com>
 <1398925607-7482-2-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, Linux Kernel <linux-kernel@vger.kernel.org>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
 Shawn Guo <shawn.guo@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-04-30 at 23:26 -0700, Brian Norris wrote:
> These defconfigs contain the CONFIG_M25P80 symbol, which is now

That's a typo: use "the MTD_M25P80 symbol" (but only if you need to
resend anyway, I'd say; the same typo can be found in the subject too).

> dependent on the MTD_SPI_NOR symbol. Add CONFIG_MTD_SPI_NOR to satisfy
> the new dependency.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Shawn Guo <shawn.guo@freescale.com>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Reviewed-by: Marek Vasut <marex@denx.de>


Paul Bolle
