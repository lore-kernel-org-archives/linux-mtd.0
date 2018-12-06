Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUtYh-0000DV-KY
 for linux-mtd@lists.infradead.org; Thu, 06 Dec 2018 13:19:19 +0000
Date: Thu, 6 Dec 2018 14:18:50 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <computersforpeace@gmail.com>,
 <dwmw2@infradead.org>, <linux-mtd@lists.infradead.org>, <richard@nod.at>
Subject: Re: [PATCH v3 3/5] mtd: spi-nor: Stop passing flash_info around
Message-ID: <20181206141850.6627a2c1@bbrezillon>
In-Reply-To: <200af4c9-f0bf-30ff-08ca-2679bb07d572@microchip.com>
References: <20181206104120.6280-1-boris.brezillon@bootlin.com>
 <20181206104120.6280-4-boris.brezillon@bootlin.com>
 <200af4c9-f0bf-30ff-08ca-2679bb07d572@microchip.com>
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

On Thu, 6 Dec 2018 11:20:49 +0000
<Tudor.Ambarus@microchip.com> wrote:

> On 12/06/2018 12:41 PM, Boris Brezillon wrote:
> > Some functions called from spi_nor_scan() need a flash_info object.
> > Let's assign nor->info early on to avoid passing info as an extra
> > argument to each of these sub-functions.
> > 
> > We also stop passing a flash_info object to set_4byte() and use
> > nor->info directly.  
> 
> Should I apply this on top of git://git.infradead.org/linux-mtd.git spi-nor/next
> branch?
> 
> Applying: mtd: spi-nor: Stop passing flash_info around
> error: patch failed: drivers/mtd/spi-nor/spi-nor.c:3659
> error: drivers/mtd/spi-nor/spi-nor.c: patch does not apply

Oops. I forgot to mention that this series now depends on [1] (I
re-ordered patches to get [1] merged as soon as possible).

[1]http://patchwork.ozlabs.org/project/linux-mtd/list/?series=80112
