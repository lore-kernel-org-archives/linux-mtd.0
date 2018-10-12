Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAtfd-00058G-GD
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2018 09:23:46 +0000
Date: Fri, 12 Oct 2018 11:22:59 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: sa1100: avoid VLA in sa1100_setup_mtd
Message-ID: <20181012112259.56f3c44f@bbrezillon>
In-Reply-To: <CAK8P3a1zYoGtfe6PVEM-oLNxXQAt12iiNR1ZLiaGvrY5LFKwwA@mail.gmail.com>
References: <20181010184533.691620-1-arnd@arndb.de>
 <20181012111603.0d03e043@bbrezillon>
 <CAK8P3a1zYoGtfe6PVEM-oLNxXQAt12iiNR1ZLiaGvrY5LFKwwA@mail.gmail.com>
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

On Fri, 12 Oct 2018 11:19:52 +0200
Arnd Bergmann <arnd@arndb.de> wrote:

> On Fri, Oct 12, 2018 at 11:16 AM Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> >
> > Hi Arnd,
> >
> > On Wed, 10 Oct 2018 20:44:50 +0200
> > Arnd Bergmann <arnd@arndb.de> wrote:
> >  
> > > Enabling -Wvla found another variable-length array with randconfig
> > > testing:
> > >
> > > drivers/mtd/maps/sa1100-flash.c: In function 'sa1100_setup_mtd':
> > > drivers/mtd/maps/sa1100-flash.c:224:10: error: ISO C90 forbids variable length array 'cdev' [-Werror=vla]
> > >
> > > As far as I can tell, there is an upper bound on the number of resources
> > > that can be passed, based on the number of CS lines on the bus.
> > > In practice, all boards we support have either one or two resources,
> > > but using six to be on the safe side has no extra cost.  
> >
> > Why not dynamically allocate cdev instead? That removes any kind of
> > guessing on the max value, and it shouldn't hurt much since this code is
> > in the probe path.  
> 
> Fine with me as well, If you prefer that one, please just add
> Reported-by: Arnd Bergmann <arnd@arndb.de>

Oh, I thought I'd let you send a v2, but I can do it if you prefer.
