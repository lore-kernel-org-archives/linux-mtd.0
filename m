Received: from mail-wr0-x232.google.com ([2a00:1450:400c:c0c::232])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGjpj-0006PO-6V
 for linux-mtd@lists.infradead.org; Thu, 10 May 2018 11:34:04 +0000
Received: by mail-wr0-x232.google.com with SMTP id y15-v6so1659307wrg.11
 for <linux-mtd@lists.infradead.org>; Thu, 10 May 2018 04:33:52 -0700 (PDT)
Subject: Re: support for non-uniform SPI NOR flash memories
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Cyrille Pitchen <cyrille.pitchen@microchip.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>
References: <5bc6ab91-9ae3-28b1-2110-452f58fee8c7@microchip.com>
 <e9218dcf-dce6-a009-70ec-33d0cac5bc4d@gmail.com>
 <b7cbad40-8340-0a8f-e539-932b777757d8@microchip.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <825117a7-0412-0558-f7e0-37e026b45db2@gmail.com>
Date: Thu, 10 May 2018 12:19:23 +0200
MIME-Version: 1.0
In-Reply-To: <b7cbad40-8340-0a8f-e539-932b777757d8@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/09/2018 06:40 PM, Tudor Ambarus wrote:
> 
> On 05/07/2018 08:14 PM, Marek Vasut wrote:
>> But indeed there are -- to my knowledge -- no flashes with interleaved
>> erase blocks. And yes, there could be improvement in erasing exactly the
>> required chunk of flash with a fitting opcode:)
> 
> Thanks Marek.
> 
> Other improvement would be to minimize the amount of erase() calls by
> using the best sequence of erase type commands depending on alignment.
> But this will increase the number of queries.
> 
> I've read again the Sector Map section of the JEDECB standard and it
> looks like "overlaid" regions are possible. Here's an example that I
> found there:
> 
> Bottom: 8x 4KB sectors at bottom (only 4KB erase supported),
>         1x overlaid 64KB sector at bottom (only 64KB erase supported),
>         511 uniform 64KB sectors (only 64KB erase supported)
> 
> That's interesting, when one wants to erase the overlaid 64KB sector, I
> guess that the 8x 4KB sectors will be erased too.

Ah yes, some old flashes had these few 64 kiB erase blocks at the
beginning/end, which could either be erased as one 64 kiB block or as
smaller 8k/4k blocks .

> I'm still studying this, I'll try to come with a proposal in the next
> few days.

Cool!

-- 
Best regards,
Marek Vasut
