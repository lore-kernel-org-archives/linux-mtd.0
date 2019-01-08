Date: Tue, 8 Jan 2019 19:14:15 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tudor.Ambarus@microchip.com
Cc: Nicolas.Ferre@microchip.com, Ludovic.Desroches@microchip.com,
 robh+dt@kernel.org, mark.rutland@arm.com,
 Claudiu.Beznea@microchip.com, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 boris.brezillon@bootlin.com, linux-mtd@lists.infradead.org,
 broonie@kernel.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: at91: at91-sama5d27_som1: add QSPI1 + SPI
 NOR memory nodes
Message-ID: <20190108181415.GE10218@piout.net>
References: <20181212163057.22183-1-tudor.ambarus@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181212163057.22183-1-tudor.ambarus@microchip.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/12/2018 16:31:08+0000, Tudor.Ambarus@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@microchip.com>
> 
> Configure the QSPI1 controller pin muxing and declare the
> jedec,spi-nor memory (SST26VF064).
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> [tudor.ambarus@microchip.com: add spi-rx/tx-bus-width, drop partitions,
> reword commit.]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  arch/arm/boot/dts/at91-sama5d27_som1.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
