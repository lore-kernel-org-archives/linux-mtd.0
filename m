Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSLjq-0001zW-Gj
 for linux-mtd@lists.infradead.org; Thu, 20 Aug 2015 09:02:23 +0000
From: Marek Vasut <marex@denx.de>
To: Viet Nga Dao <vndao@altera.com>
Subject: Re: [PATCH] [PATCH v5] mtd:spi-nor: Add Altera Quad SPI Driver
Date: Thu, 20 Aug 2015 11:01:58 +0200
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nga_chi86" <ngachi86@gmail.com>
References: <1440053705-3836-1-git-send-email-vndao@altera.com>
 <CAN1oZWwLRYxs=eeWi8jh-jo8+C7WckdW1hfyunmq5_1qb1Jb8w@mail.gmail.com>
 <CAN1oZWxdk9XNW02Ldc0Da6dUcoR+-dLeutdYPAK_BMmSpxh7Zg@mail.gmail.com>
In-Reply-To: <CAN1oZWxdk9XNW02Ldc0Da6dUcoR+-dLeutdYPAK_BMmSpxh7Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201508201101.58702.marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday, August 20, 2015 at 10:17:57 AM, Viet Nga Dao wrote:
> Sorry for missing to reply the last question

Hi!

> >>> diff --git a/drivers/mtd/spi-nor/spi-nor.c
> >>> b/drivers/mtd/spi-nor/spi-nor.c index 14a5d23..2ab7279 100644
> >>> --- a/drivers/mtd/spi-nor/spi-nor.c
> >>> +++ b/drivers/mtd/spi-nor/spi-nor.c
> >>> @@ -687,6 +687,24 @@ static const struct spi_device_id spi_nor_ids[] =
> >>> {
> >>> 
> >>>       { "cat25c09", CAT25_INFO( 128, 8, 32, 2, SPI_NOR_NO_ERASE |
> >>> 
> >>> SPI_NOR_NO_FR) }, { "cat25c17", CAT25_INFO( 256, 8, 32, 2,
> >>> SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) }, { "cat25128", CAT25_INFO(2048, 8,
> >>> 64, 2, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) }, +
> >>> +     /* Altera EPCQ/EPCS Flashes are non-JEDEC */
> >> 
> >> Are they really ? Last time I checked on CV SoC, I was able to read
> >> their JEDEC ID just fine ; though it's true I used that EPCS core.
> 
> Altera EPCS flash is non-jedec device. And this new controller is not
> EPCS controller. If you look at the documentation i sent in another
> email, they are not the same.

https://www.altera.com/content/dam/altera-
www/global/en_US/pdfs/literature/hb/cfg/cfg_cf52012.pdf page 15 ; seems
like opcode 0x9f is supported. All the other opcodes seems compatible too.
What is the problem ?

Best regards,
Marek Vasut
