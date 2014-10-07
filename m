Date: Mon, 6 Oct 2014 23:44:04 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 0/2] mtd: nand: omap: Fix build with
 CONFIG_MTD_NAND_OMAP_BCH=m
Message-ID: <20141007064404.GA22169@norris-Latitude-E6410>
References: <1412163210-12948-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1412163210-12948-1-git-send-email-rogerq@ti.com>
Cc: arnd@arndb.de, pekon@pek-sem.com, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, linux-omap@vger.kernel.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 01, 2014 at 02:33:28PM +0300, Roger Quadros wrote:
> Hi,
> 
> Patch 1 fixes build with OMAP nand driver as built-in and the BCH driver as a module.
> Ezequiel, I took the liberty to address an issue with your original patch so this is v2.
> 
> Patch 2 fixes the help message for CONFIG_MTD_NAND_OMAP_BCH to avoid user confusion.
> CONFIG_MTD_NAND_OMAP_BCH is optional but doesn't harm on legacy OMAP platforms not having
> the ELM/BCH hardware.

Thanks for finishing these off properly. Pushed to l2-mtd.git.

Briarn
