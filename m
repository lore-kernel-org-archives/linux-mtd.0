Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fFjjD-0008UW-EW
 for linux-mtd@lists.infradead.org; Mon, 07 May 2018 17:15:13 +0000
Received: by mail-wr0-x243.google.com with SMTP id p5-v6so29497505wre.12
 for <linux-mtd@lists.infradead.org>; Mon, 07 May 2018 10:15:00 -0700 (PDT)
Subject: Re: support for non-uniform SPI NOR flash memories
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Cyrille Pitchen <cyrille.pitchen@microchip.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
References: <5bc6ab91-9ae3-28b1-2110-452f58fee8c7@microchip.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <e9218dcf-dce6-a009-70ec-33d0cac5bc4d@gmail.com>
Date: Mon, 7 May 2018 19:14:57 +0200
MIME-Version: 1.0
In-Reply-To: <5bc6ab91-9ae3-28b1-2110-452f58fee8c7@microchip.com>
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

On 05/07/2018 07:11 PM, Tudor Ambarus wrote:
> Hi, Marek, all,
> 
> I'm studying Cyrille's patch for non-uniform SPI NOR flash memories:
> https://lkml.org/lkml/2017/4/15/70.
> 
> It's not clear to me whether interleaved regions are possible or not. I
> read the JEDEC Standard No. 216B and it looks like each region is well
> delimited, there is no such thing as interleaved regions (see section
> 6.5):
> 
> "When there is more than one sector size in a device, each contiguous
> group of sectors, that are of the same size, and support the same erase
> types, is called a region."
> 
> If interleaved regions are not possible, the code can be simplified. Do
> I miss something, is there anything else that I should read in this
> regard?
> 
> Apart of how we represent the regions, there is some improvement that we
> can do. When in a region, I see that is preferred the biggest possible
> erase type that meets all the conditions. If so, we can iterate from the
> biggest erase type to the smallest, and when find one that meets all the
> conditions, break the loop.

There are flashes which have larger erase blocks at the beginning/end
and then there are flashes with multiple dies, which support die-wide
erase and chip-wide erase . Not all flashes support everything though.

But indeed there are -- to my knowledge -- no flashes with interleaved
erase blocks. And yes, there could be improvement in erasing exactly the
required chunk of flash with a fitting opcode :)

-- 
Best regards,
Marek Vasut
