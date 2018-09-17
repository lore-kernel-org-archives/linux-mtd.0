Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g1pB7-0000Yl-Ig
 for linux-mtd@lists.infradead.org; Mon, 17 Sep 2018 08:46:47 +0000
Date: Mon, 17 Sep 2018 10:46:33 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Marek Vasut <marek.vasut@gmail.com>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, David
 Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v2] mtd: spi-nor: Use DMA-safe buffer for JEDEC ID in
 spi_nor_read_id()
Message-ID: <20180917104633.5a18bcd1@bbrezillon>
In-Reply-To: <08b87712-b018-e448-21b5-aa7c3c7b82cc@linux.intel.com>
References: <20180917081018.14475-1-jarkko.nikula@linux.intel.com>
 <20180917101851.3d359d18@bbrezillon>
 <20180917102821.16c69697@bbrezillon>
 <08b87712-b018-e448-21b5-aa7c3c7b82cc@linux.intel.com>
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

On Mon, 17 Sep 2018 11:41:31 +0300
Jarkko Nikula <jarkko.nikula@linux.intel.com> wrote:

> On 09/17/2018 11:28 AM, Boris Brezillon wrote:
> > 
> > Hm, I just had a look at all ->read/write_reg() call sites and it seems
> > we have the same problem in other places. Maybe it's just better to fix
> > the problem in m25p80 ->read/write_reg() implems for now and see how we
> > can fix that generically afterwards.
> >   
> It's not only m25p80, how about all other cases calling spi_nor_scan()?
> 

I agree, the problem is more generic than that, but commit 4120f8d158ef
only breaks the m25p80 driver, and I'd like to keep the fix as simple as
possible.

We can also discuss how to fix that generically, but I'd like the fix
to be merged in 4.19.
