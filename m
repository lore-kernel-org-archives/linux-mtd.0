Date: Mon, 30 Nov 2015 12:44:28 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] mtd: cfi: enforce valid geometry configuration
Message-ID: <20151130204428.GM64635@google.com>
References: <3747078.dk5V5gxuXa@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3747078.dk5V5gxuXa@wuerfel>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 23, 2015 at 02:39:33PM +0100, Arnd Bergmann wrote:
> MTD allows compile-time configuration of the possible CFI geometry
> settings that are allowed by the kernel, but that includes a couple of
> invalid configurations, where no bank width or no interleave setting
> is allowed. These are then caught with a compile-time warning:
> 
> include/linux/mtd/cfi.h:76:2: warning: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
> include/linux/mtd/map.h:145:2: warning: #warning "No CONFIG_MTD_MAP_BANK_WIDTH_xx selected. No NOR chip support can work"
> 
> This is a bit annoying for randconfig tests, and can be avoided if
> we change the Kconfig logic to always select the simplest configuration
> when no other one is enabled.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Pushed to l2-mtd.git. Thanks for fixing this one! I guess an ugly fix is
better than nothing here.
