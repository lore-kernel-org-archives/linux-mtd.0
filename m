Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGS8Y-0001A1-SB
 for linux-mtd@lists.infradead.org; Wed, 09 May 2018 16:40:20 +0000
Subject: Re: support for non-uniform SPI NOR flash memories
To: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@microchip.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <boris.brezillon@bootlin.com>,
 <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
References: <5bc6ab91-9ae3-28b1-2110-452f58fee8c7@microchip.com>
 <e9218dcf-dce6-a009-70ec-33d0cac5bc4d@gmail.com>
From: Tudor Ambarus <tudor.ambarus@microchip.com>
Message-ID: <b7cbad40-8340-0a8f-e539-932b777757d8@microchip.com>
Date: Wed, 9 May 2018 19:40:03 +0300
MIME-Version: 1.0
In-Reply-To: <e9218dcf-dce6-a009-70ec-33d0cac5bc4d@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
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


On 05/07/2018 08:14 PM, Marek Vasut wrote:
> But indeed there are -- to my knowledge -- no flashes with interleaved
> erase blocks. And yes, there could be improvement in erasing exactly the
> required chunk of flash with a fitting opcode:)

Thanks Marek.

Other improvement would be to minimize the amount of erase() calls by
using the best sequence of erase type commands depending on alignment.
But this will increase the number of queries.

I've read again the Sector Map section of the JEDECB standard and it
looks like "overlaid" regions are possible. Here's an example that I
found there:

Bottom: 8x 4KB sectors at bottom (only 4KB erase supported),
         1x overlaid 64KB sector at bottom (only 64KB erase supported),
         511 uniform 64KB sectors (only 64KB erase supported)

That's interesting, when one wants to erase the overlaid 64KB sector, I
guess that the 8x 4KB sectors will be erased too.

I'm still studying this, I'll try to come with a proposal in the next
few days.

Cheers,
ta
