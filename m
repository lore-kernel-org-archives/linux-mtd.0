From: Marek Vasut <marex@denx.de>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 01/10] mtd: spi-nor: fix the wrong dummy value
Date: Mon, 28 Apr 2014 22:22:08 +0200
References: <1398657227-20721-1-git-send-email-b32955@freescale.com>
 <1398657227-20721-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1398657227-20721-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201404282222.08181.marex@denx.de>
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

On Monday, April 28, 2014 at 05:53:38 AM, Huang Shijie wrote:
> For the DDR Quad read, the dummy cycles maybe 3 or 6 which is less then 8.
> The dummy cycles is actually 8 for SPI fast/dual/quad read.
> 
> This patch makes preparations for the DDR quad read, it fixes the wrong
> dummy value for both the spi-nor.c and m25p80.c.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
> This ia actually v3.

Acked-by: Marek Vasut <marex@denx.de>

Best regards,
Marek Vasut
