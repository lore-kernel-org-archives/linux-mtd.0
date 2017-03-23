Date: Thu, 23 Mar 2017 14:00:20 -0700
From: Tony Lindgren <tony@atomide.com>
To: Franklin S Cooper Jr <fcooper@ti.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, robh+dt@kernel.org
Subject: Re: [PATCH 0/2] ARM: dts: am335x-icev2: Add support for W25Q64 NOR
 flash
Message-ID: <20170323210018.GS10760@atomide.com>
References: <20170307215751.29266-1-fcooper@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170307215751.29266-1-fcooper@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Franklin S Cooper Jr <fcooper@ti.com> [170307 14:01]:
> This patch set adds support for the on board SPI NOR flash on TI's AM335x
> Industrial Communication Engine rev 2.x board.
> 
> Franklin S Cooper Jr (1):
>   ARM: dts: am335x-icev2: Add SPI based NOR
> 
> Sekhar Nori (1):
>   doc: dt: mtd: add w25q64 to list of supported SPI flashes

Applying both into omap-for-v4.12/dt-v2 branch.

Thanks,

Tony
