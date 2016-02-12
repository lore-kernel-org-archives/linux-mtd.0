Date: Fri, 12 Feb 2016 13:00:55 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Cc: linux-mtd@lists.infradead.org, nicolas.ferre@atmel.com,
 boris.brezillon@free-electrons.com, marex@denx.de, vigneshr@ti.com,
 beanhuo@micron.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
 ijc+devicetree@hellion.org.uk, galak@codeaurora.org
Subject: Re: [PATCH v3 01/14] mtd: spi-nor: remove micron_quad_enable()
Message-ID: <20160212210055.GG21465@google.com>
References: <cover.1454505161.git.cyrille.pitchen@atmel.com>
 <2904a1d704670a9ef57b09370782e198fab6b1f4.1454505161.git.cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2904a1d704670a9ef57b09370782e198fab6b1f4.1454505161.git.cyrille.pitchen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 03, 2016 at 02:26:46PM +0100, Cyrille Pitchen wrote:
> This patch remove the micron_quad_enable() function which force the Quad
> SPI mode. However, once this mode is enabled, the Micron memory expect ALL
> commands to use the SPI 4-4-4 protocol. Hence a failure does occur when
> calling spi_nor_wait_till_ready() right after the update of the Enhanced
> Volatile Configuration Register (EVCR) in the micron_quad_enable() as
> the SPI controller driver is not aware about the protocol change.
> 
> Since there is almost no performance increase using Fast Read 4-4-4
> commands instead of Fast Read 1-1-4 commands, we rather keep on using the
> Extended SPI mode than enabling the Quad SPI mode.
> 
> Let's take the example of the pretty standard use of 8 dummy cycles during
> Fast Read operations on 64KB erase sectors:
> 
> Fast Read 1-1-4 requires 8 cycles for the command, then 24 cycles for the
> 3byte address followed by 8 dummy clock cycles and finally 65536*2 cycles
> for the read data; so 131112 clock cycles.
> 
> On the other hand the Fast Read 4-4-4 would require 2 cycles for the
> command, then 6 cycles for the 3byte address followed by 8 dummy clock
> cycles and finally 65536*2 cycles for the read data. So 131088 clock
> cycles. The theorical bandwidth increase is 0.0%.

The assumption of whole-block reads is not always realistic. There are
some controllers that might not handle that length properly, and there
are also use cases that don't need to read that much at once.

> Now using Fast Read operations on 512byte pages:
> Fast Read 1-1-4 needs 8+24+8+(512*2) = 1064 clock cycles whereas Fast
> Read 4-4-4 would requires 2+6+8+(512*2) = 1040 clock cycles. Hence the
> theorical bandwidth increase is 2.3%.

This computation is probably more of a reasonable comparison.

> Consecutive reads for non sequential pages is not a relevant use case so
> The Quad SPI mode is not worth it.

So, I still agree with the conclusion.

Applied this patch to l2-mtd.git.

Brian

> mtd_speedtest seems to confirm these figures.
> 
> Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
> Fixes: 548cd3ab54da ("mtd: spi-nor: Add quad I/O support for Micron SPI NOR")
