Subject: Re: [PATCH v3 1/2] mtd: spi-nor: add support to non-uniform SFDP SPI
 NOR flash memories
To: Tudor Ambarus <tudor.ambarus@microchip.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, cyrille.pitchen@microchip.com,
 nicolas.ferre@microchip.com, Cristian.Birsan@microchip.com
References: <20180911154007.17195-1-tudor.ambarus@microchip.com>
 <20180911154007.17195-2-tudor.ambarus@microchip.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <a62a8dc2-796d-8560-22d9-9377f39cbf52@gmail.com>
Date: Tue, 11 Sep 2018 20:55:58 +0200
MIME-Version: 1.0
In-Reply-To: <20180911154007.17195-2-tudor.ambarus@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/11/2018 05:40 PM, Tudor Ambarus wrote:
> Based on Cyrille Pitchen's patch https://lkml.org/lkml/2017/3/22/935.
> 
> This patch is a transitional patch in introducing  the support of
> SFDP SPI memories with non-uniform erase sizes like Spansion s25fs512s.
> Non-uniform erase maps will be used later when initialized based on the
> SFDP data.
> 
> Introduce the memory erase map which splits the memory array into one
> or many erase regions. Each erase region supports up to 4 erase types,
> as defined by the JEDEC JESD216B (SFDP) specification.
> 
> To be backward compatible, the erase map of uniform SPI NOR flash memories
> is initialized so it contains only one erase region and this erase region
> supports only one erase command. Hence a single size is used to erase any
> sector/block of the memory.
> 
> Besides, since the algorithm used to erase sectors on non-uniform SPI NOR
> flash memories is quite expensive, when possible, the erase map is tuned
> to come back to the uniform case.
> 
> The 'erase with the best command, move forward and repeat' approach was
> suggested by Cristian Birsan in a brainstorm session, so:
> 
> Suggested-by: Cristian Birsan <cristian.birsan@microchip.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

-- 
Best regards,
Marek Vasut
