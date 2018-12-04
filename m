Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUGW5-0006Wf-6B
 for linux-mtd@lists.infradead.org; Tue, 04 Dec 2018 19:37:58 +0000
Date: Tue, 4 Dec 2018 20:37:35 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: <Tudor.Ambarus@microchip.com>
Cc: <marek.vasut@gmail.com>, <dwmw2@infradead.org>,
 <computersforpeace@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 3/6] mtd: spi-nor: Stop passing info to set_4byte()
Message-ID: <20181204203735.32903c07@bbrezillon>
In-Reply-To: <6e5ba477-fae5-10f3-9ffb-802a9f024ecd@microchip.com>
References: <20181129141026.24892-1-boris.brezillon@bootlin.com>
 <20181129141026.24892-4-boris.brezillon@bootlin.com>
 <6e5ba477-fae5-10f3-9ffb-802a9f024ecd@microchip.com>
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

On Tue, 4 Dec 2018 19:35:15 +0000
<Tudor.Ambarus@microchip.com> wrote:

> On 11/29/2018 04:10 PM, Boris Brezillon wrote:
> > info can be extracted from nor->info, no need to pass it as an
> > argument.  
> 
> Nice! If you move the assignment nor->info = info; earlier in spi_nor_scan(),
> you'll be able to spare more functions to pass info as argument.

You mean like in patch 6? ;)
