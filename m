Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1clrDv-0004KF-2p
 for linux-mtd@lists.infradead.org; Thu, 09 Mar 2017 06:06:52 +0000
Date: Thu, 9 Mar 2017 07:06:29 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Peter Pan <peterpansjtu@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger
 <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, "linshunquan (A)"
 <linshunquan1@hisilicon.com>
Subject: Re: [PATCH v2 6/6] nand: spi: Add generic SPI controller support
Message-ID: <20170309070629.216778fe@bbrezillon>
In-Reply-To: <CAAyFORLpv7QoBDz5MQ8g98MEVsKrnN3fnoB-7s1XaEttFkOXHw@mail.gmail.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-7-git-send-email-peterpandong@micron.com>
 <20170308094425.694c5e07@bbrezillon>
 <CAAyFORLpv7QoBDz5MQ8g98MEVsKrnN3fnoB-7s1XaEttFkOXHw@mail.gmail.com>
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

On Thu, 9 Mar 2017 10:02:03 +0800
Peter Pan <peterpansjtu@gmail.com> wrote:

 
> >  
> >>  5 files changed, 167 insertions(+)
> >>  create mode 100644 drivers/mtd/nand/spi/chips/Kconfig
> >>  create mode 100644 drivers/mtd/nand/spi/chips/Makefile
> >>  create mode 100644 drivers/mtd/nand/spi/chips/generic_spi.c  
> >
> > Just controllers/generic.c?  
> 
> generic.c or just spi.c?

As you prefer. BTW, I prefer '-' to '_' in file names :-).
generic-spi.c is fine too, I'm just nitpicking. 
