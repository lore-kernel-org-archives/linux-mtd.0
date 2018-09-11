Subject: Re: [PATCH v3 2/2] mtd: spi-nor: parse SFDP Sector Map Parameter Table
To: Tudor Ambarus <tudor.ambarus@microchip.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, cyrille.pitchen@microchip.com,
 nicolas.ferre@microchip.com, Cristian.Birsan@microchip.com
References: <20180911154007.17195-1-tudor.ambarus@microchip.com>
 <20180911154007.17195-3-tudor.ambarus@microchip.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <dbfc2491-5fd8-eec9-650f-183c63f9963b@gmail.com>
Date: Tue, 11 Sep 2018 20:56:16 +0200
MIME-Version: 1.0
In-Reply-To: <20180911154007.17195-3-tudor.ambarus@microchip.com>
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
> Add support for the SFDP (JESD216B) Sector Map Parameter Table. This
> table is optional, but when available, we parse it to identify the
> location and size of sectors within the main data array of the
> flash memory device and to identify which Erase Types are supported by
> each sector.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>


-- 
Best regards,
Marek Vasut
