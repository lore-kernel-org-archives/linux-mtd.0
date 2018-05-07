Received: from esa6.microchip.iphmx.com ([216.71.154.253])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFjfQ-0007DG-NU
 for linux-mtd@lists.infradead.org; Mon, 07 May 2018 17:11:18 +0000
To: <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@microchip.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@bootlin.com>, <richard@nod.at>
From: Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: support for non-uniform SPI NOR flash memories
CC: <linux-mtd@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
Message-ID: <5bc6ab91-9ae3-28b1-2110-452f58fee8c7@microchip.com>
Date: Mon, 7 May 2018 20:11:02 +0300
MIME-Version: 1.0
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

Hi, Marek, all,

I'm studying Cyrille's patch for non-uniform SPI NOR flash memories:
https://lkml.org/lkml/2017/4/15/70.

It's not clear to me whether interleaved regions are possible or not. I
read the JEDEC Standard No. 216B and it looks like each region is well
delimited, there is no such thing as interleaved regions (see section
6.5):

"When there is more than one sector size in a device, each contiguous
group of sectors, that are of the same size, and support the same erase
types, is called a region."

If interleaved regions are not possible, the code can be simplified. Do
I miss something, is there anything else that I should read in this
regard?

Apart of how we represent the regions, there is some improvement that we
can do. When in a region, I see that is preferred the biggest possible
erase type that meets all the conditions. If so, we can iterate from the
biggest erase type to the smallest, and when find one that meets all the
conditions, break the loop.

Thanks,
ta
