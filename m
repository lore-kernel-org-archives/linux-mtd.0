Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUqqU-0001Ku-AR
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2018 10:25:33 +0000
Date: Thu, 6 Dec 2018 11:25:02 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <alexandre.belloni@bootlin.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>, <alexander.sverdlin@nokia.com>
Subject: Re: [PATCH v4 2/3] mtd: spi-nor: Add a post BFPT parsing fixup hook
Message-ID: <20181206112502.3b32bf12@bbrezillon>
In-Reply-To: <6d2f2c1d-9c95-296e-6907-a8aa8b7b80ef@microchip.com>
References: <20181129144143.26079-1-boris.brezillon@bootlin.com>
 <20181129144143.26079-3-boris.brezillon@bootlin.com>
 <6d2f2c1d-9c95-296e-6907-a8aa8b7b80ef@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 5 Dec 2018 16:35:15 +0000
<Tudor.Ambarus@microchip.com> wrote:

> On 11/29/2018 04:41 PM, Boris Brezillon wrote:
> > +struct spi_nor_fixups {
> > +	int (*post_bfpt)(struct spi_nor *nor,
> > +			 const struct sfdp_parameter_header *bfpt_header,
> > +			 const struct sfdp_bfpt *bfpt,
> > +			 struct spi_nor_flash_parameter *params);
> > +};  
> 
> I like the idea. The code looks good. What I noticed is that the sfdp logic is
> now split in different sections of spi-nor file. In order to avoid the burden of
> moving the sfdp code inside spi-nor, you can have these 3 forward declarations
> and do the sfdp move later on, in a separate file.

I tried that, but then I need some of those definitions in my
mx25l25635_post_bfpt_fixups(), so I'm screwed anyway. Also, it's not
really a matter to have SFDP split in 2 sections as we're going to move
all the code in a separate file soon ;-).
