From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cfi: enforce valid geometry configuration
Date: Mon, 23 Nov 2015 23:12:40 +0100
Message-ID: <4492128.vrqmf1niG3@wuerfel>
In-Reply-To: <3747078.dk5V5gxuXa@wuerfel>
References: <3747078.dk5V5gxuXa@wuerfel>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 23 November 2015 14:39:33 Arnd Bergmann wrote:
> MTD allows compile-time configuration of the possible CFI geometry
> settings that are allowed by the kernel, but that includes a couple of
> invalid configurations, where no bank width or no interleave setting
> is allowed. These are then caught with a compile-time warning:
> 
> include/linux/mtd/cfi.h:76:2: warning: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
> include/linux/mtd/map.h:145:2: warning: #warning "No CONFIG_MTD_MAP_BANK_WIDTH_xx selected. No NOR chip support can work"
> 

I'm actually still getting the warnings for any file that includes <linux/mtd/map.h>
while CONFIG_MTD is disabled. I have a fix now that I'm testing overnight
and plan to post tomorrow, then we can decide whether it should be part of
the same patch, or we should have two separate patches.

	Arnd
