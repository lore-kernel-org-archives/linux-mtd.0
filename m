Message-ID: <536283CF.2020304@wwwdotorg.org>
Date: Thu, 01 May 2014 11:26:39 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 04/12] ARM: tegra: add MTD_SPI_NOR (new dependency
 for M25P80)
References: <1398925607-7482-1-git-send-email-computersforpeace@gmail.com>
 <1398925607-7482-5-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1398925607-7482-5-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/01/2014 12:26 AM, Brian Norris wrote:
> This defconfig contains the CONFIG_M25P80 symbol, which is now
> dependent on the MTD_SPI_NOR symbol. Add CONFIG_MTD_SPI_NOR to satisfy
> the new dependency.

Squashed into Tegra's for-3.16/defconfig branch.
