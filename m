Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1otf-0008H0-43
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2018 08:28:44 +0000
Date: Mon, 17 Sep 2018 10:28:21 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, David
 Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] mtd: spi-nor: Use DMA-safe buffer for JEDEC ID in
 spi_nor_read_id()
Message-ID: <20180917102821.16c69697@bbrezillon>
In-Reply-To: <20180917101851.3d359d18@bbrezillon>
References: <20180917081018.14475-1-jarkko.nikula@linux.intel.com>
 <20180917101851.3d359d18@bbrezillon>
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

On Mon, 17 Sep 2018 10:18:51 +0200
Boris Brezillon <boris.brezillon@bootlin.com> wrote:

> On Mon, 17 Sep 2018 11:10:18 +0300
> Jarkko Nikula <jarkko.nikula@linux.intel.com> wrote:
> 
> > After commit 4120f8d158ef ("mtd: spi-nor: Use the spi_mem_xx() API")
> > there is no allocation for DMA-safe buffer when transmitting data bytes
> > over SPI bus in m25p80 driver.
> > 
> > JEDEC ID reading in spi_nor_read_id() has the buffer in stack. This is
> > not safe with the m25p80 driver anymore after commit 4120f8d158ef if
> > underlying SPI controller is using DMA for transfers.
> > 
> > Therefore allocate a temporary DMA-safe buffer for JEDEC ID reading.
> > 
> > Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>  
> 
> Oh, I forgot to mention that you should have Cc and Fixes tag here, to
> make sure the patch gets backported to 4.18:
> 
> Fixes: 4120f8d158ef ("mtd: spi-nor: Use the spi_mem_xx() API")
> Cc: <stable@vger.kernel.org>
> 
> No need to send a new version, I can add them when applying.

Hm, I just had a look at all ->read/write_reg() call sites and it seems
we have the same problem in other places. Maybe it's just better to fix
the problem in m25p80 ->read/write_reg() implems for now and see how we
can fix that generically afterwards.
