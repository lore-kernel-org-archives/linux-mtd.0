From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 02/10] mtd: spi-nor: add a new field for spi_nor{}
Date: Mon, 28 Apr 2014 22:23:26 +0200
References: <1398657227-20721-1-git-send-email-b32955@freescale.com>
 <1398657227-20721-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1398657227-20721-3-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404282223.26174.marex@denx.de>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday, April 28, 2014 at 05:53:39 AM, Huang Shijie wrote:
> We need the SPI NOR child node to store some specific features, such as the
> dummy cycles for the DDR Quad read.
> 
> But now, we only have the @dev field in the spi_nor{}. The @dev may points
> to a spi_device{} for m25p80, while it may points to a platform_deivice{}
> for the SPI NOR controller, such as fsl_quadspi.c.
> 
> It is not convenient for us to get come information from the SPI NOR flash.
> 
> This patch adds a new field @np to spi_nor{}, it points to the child node
> for the SPI NOR flash.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Just handle the case where dev->of_node == NULL instead ?

Best regards,
Marek Vasut
