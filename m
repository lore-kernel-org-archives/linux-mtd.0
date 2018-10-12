Received: from mail-qt1-f195.google.com ([209.85.160.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAtcO-0003gV-1i
 for linux-mtd@lists.infradead.org; Fri, 12 Oct 2018 09:20:25 +0000
Received: by mail-qt1-f195.google.com with SMTP id q40-v6so13160577qte.0
 for <linux-mtd@lists.infradead.org>; Fri, 12 Oct 2018 02:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20181010184533.691620-1-arnd@arndb.de>
 <20181012111603.0d03e043@bbrezillon>
In-Reply-To: <20181012111603.0d03e043@bbrezillon>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 12 Oct 2018 11:19:52 +0200
Message-ID: <CAK8P3a1zYoGtfe6PVEM-oLNxXQAt12iiNR1ZLiaGvrY5LFKwwA@mail.gmail.com>
Subject: Re: [PATCH] mtd: sa1100: avoid VLA in sa1100_setup_mtd
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 12, 2018 at 11:16 AM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
>
> Hi Arnd,
>
> On Wed, 10 Oct 2018 20:44:50 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:
>
> > Enabling -Wvla found another variable-length array with randconfig
> > testing:
> >
> > drivers/mtd/maps/sa1100-flash.c: In function 'sa1100_setup_mtd':
> > drivers/mtd/maps/sa1100-flash.c:224:10: error: ISO C90 forbids variable length array 'cdev' [-Werror=vla]
> >
> > As far as I can tell, there is an upper bound on the number of resources
> > that can be passed, based on the number of CS lines on the bus.
> > In practice, all boards we support have either one or two resources,
> > but using six to be on the safe side has no extra cost.
>
> Why not dynamically allocate cdev instead? That removes any kind of
> guessing on the max value, and it shouldn't hurt much since this code is
> in the probe path.

Fine with me as well, If you prefer that one, please just add
Reported-by: Arnd Bergmann <arnd@arndb.de>

       Arnd
