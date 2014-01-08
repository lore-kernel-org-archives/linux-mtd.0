Date: Wed, 8 Jan 2014 11:18:37 -0800
From: Tony Lindgren <tony@atomide.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH 0/3] omap2: Assorted GPMC cleanups
Message-ID: <20140108191836.GD31323@atomide.com>
References: <1382921508-5104-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1382921508-5104-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Javier Martinez Canillas <martinez.javier@gmail.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Jon Hunter <jgchunter@gmail.com>,
 linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Ezequiel Garcia <ezequiel.garcia@free-electrons.com> [131027 17:52]:
> (I'm CCing the MTD list, because GPMC is the memory controller
> used for NOR, NAND and OneNAND devices).
> 
> Hi all,
> 
> Just a small patchset containing two small cleanups and a minor fix
> for the GPMC memory controller. The first two are cleanups and can
> be considered as preparation work for the fix.
> 
> The fix is patch 3/3: "Move legacy GPMC width setting". It makes
> explicit use of the DT property "gpmc,device-width" and removes the
> subsequent (and redundant) setting of the GPMC width, based in the
> NAND bus widht.

Thanks and sorry for the delay. Applying these all into branch
omap-for-v3.14/fixes-not-urgent.

Regards,

Tony
 
> Tested in AM335x (using DT) so I'd appreciate if someone can test using
> a board-file, on a device with NAND flash.
> 
> Jon: If you happen to read this, I'd like if you could take a look at
> patch 1/3, since you were the last to touch that part of the code.
> 
> Thanks!
> 
> Ezequiel Garcia (3):
>   omap2: gpmc: Move initialization outside the gpmc_t condition
>   omap2: gpmc: Introduce gpmc_set_legacy()
>   omap2: gpmc: Move legacy GPMC width setting
> 
>  arch/arm/mach-omap2/gpmc-nand.c | 50 +++++++++++++++++++++++------------------
>  1 file changed, 28 insertions(+), 22 deletions(-)
> 
> -- 
> 1.8.1.5
> 
