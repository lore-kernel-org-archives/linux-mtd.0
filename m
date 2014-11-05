Date: Wed, 5 Nov 2014 00:27:29 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v2 01/10] mtd: spi-nor: fix the wrong dummy value
Message-ID: <20141105082729.GE22361@norris-Latitude-E6410>
References: <1398657227-20721-1-git-send-email-b32955@freescale.com>
 <1398657227-20721-2-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1398657227-20721-2-git-send-email-b32955@freescale.com>
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 28, 2014 at 11:53:38AM +0800, Huang Shijie wrote:
> For the DDR Quad read, the dummy cycles maybe 3 or 6 which is less then 8.
> The dummy cycles is actually 8 for SPI fast/dual/quad read.
> 
> This patch makes preparations for the DDR quad read, it fixes the wrong dummy
> value for both the spi-nor.c and m25p80.c.
> 
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
> This ia actually v3.

Don't know why this got left behind. Applied to l2-mtd.git.

Brian
