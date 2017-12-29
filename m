Received: from fllnx209.ext.ti.com ([198.47.19.16])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eUqnq-0003iT-PK
 for linux-mtd@lists.infradead.org; Fri, 29 Dec 2017 09:18:12 +0000
Subject: Re: [PATCH 0/3] mtd: spi-nor: fix DMA-unsafe buffer issue between MTD
 and SPI
To: Trent Piepho <tpiepho@impinj.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "linux@armlinux.org.uk"
 <linux@armlinux.org.uk>, "broonie@kernel.org" <broonie@kernel.org>,
 "cyrille.pitchen@wedev4u.fr" <cyrille.pitchen@wedev4u.fr>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "boris.brezillon@free-electrons.com"
 <boris.brezillon@free-electrons.com>, "richard@nod.at" <richard@nod.at>,
 "marek.vasut@gmail.com" <marek.vasut@gmail.com>
CC: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 "robh@kernel.org" <robh@kernel.org>, "radu.pirea@microchip.com"
 <radu.pirea@microchip.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
References: <cover.1514087323.git.cyrille.pitchen@wedev4u.fr>
 <1514313927.26695.19.camel@impinj.com>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <46499c32-f513-1781-bb42-f56b1f534941@ti.com>
Date: Fri, 29 Dec 2017 14:46:31 +0530
MIME-Version: 1.0
In-Reply-To: <1514313927.26695.19.camel@impinj.com>
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



On Wednesday 27 December 2017 12:15 AM, Trent Piepho wrote:
> On Sun, 2017-12-24 at 05:36 +0100, Cyrille Pitchen wrote:
>> this series tries to solve a long time issue of compatibility between the
>> MTD and SPI sub-systems about whether we should use DMA-safe memory.
> 
> Can this should replace SoC specific fixes like:
> 
> c687c46e9e45
> spi: spi-ti-qspi: Use bounce buffer if read buffer is not DMA'ble
> 

Yes, I plan to revert this patch once m25p80 starts using bounce buffers.

I am interested in knowing which other SPI clients end up passing non
DMA'able buffers. AFAIK, its UBIFS and JFFS2. Most other SPI devices on
TI boards that I have dealt with like Touch, Sensors (IIO), GPIO
expanders etc all provide DMA'able buffers.


-- 
Regards
Vignesh
