Subject: Re: [PATCH v2 0/3] add support to non-uniform SFDP SPI NOR flash
 memories
To: <marek.vasut@gmail.com>, <cyrille.pitchen@microchip.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nicolas.ferre@microchip.com>,
 <Cristian.Birsan@microchip.com>
References: <20180712173235.7901-1-tudor.ambarus@microchip.com>
From: Tudor Ambarus <tudor.ambarus@microchip.com>
Message-ID: <1a3a29a7-abdd-cfb4-b955-48dad6417cca@microchip.com>
Date: Mon, 30 Jul 2018 11:53:31 +0300
MIME-Version: 1.0
In-Reply-To: <20180712173235.7901-1-tudor.ambarus@microchip.com>
Content-Type: text/plain; charset="utf-8"
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

As a side note, the SFDP code increases its size, it would make sense to move
all SFDP logic into a spi-nor-sfdp.c file. I'm volunteering to do this after
this patch set gets applied.

Best,
ta
