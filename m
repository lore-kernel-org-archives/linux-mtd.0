Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gH20C-0002RR-E0
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2018 07:30:21 +0000
Date: Mon, 29 Oct 2018 08:30:04 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Kees Cook <keescook@chromium.org>
Cc: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] mtd: sa1100: avoid VLA in sa1100_setup_mtd
Message-ID: <20181029083004.54d535d2@bbrezillon>
In-Reply-To: <CAGXu5jLS5sEFgM1Vzri+cAONYKUqdXbahyNUU1xvRF0cbZrX1w@mail.gmail.com>
References: <20181010184533.691620-1-arnd@arndb.de>
 <20181012111603.0d03e043@bbrezillon>
 <CAK8P3a1zYoGtfe6PVEM-oLNxXQAt12iiNR1ZLiaGvrY5LFKwwA@mail.gmail.com>
 <20181012112259.56f3c44f@bbrezillon>
 <CAGXu5jLS5sEFgM1Vzri+cAONYKUqdXbahyNUU1xvRF0cbZrX1w@mail.gmail.com>
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

Hi Kees,

On Sun, 28 Oct 2018 19:13:26 -0700
Kees Cook <keescook@chromium.org> wrote:

> On Fri, Oct 12, 2018 at 2:22 AM, Boris Brezillon
> <boris.brezillon@bootlin.com> wrote:
> > On Fri, 12 Oct 2018 11:19:52 +0200
> > Arnd Bergmann <arnd@arndb.de> wrote:
> >  
> >> On Fri, Oct 12, 2018 at 11:16 AM Boris Brezillon
> >> <boris.brezillon@bootlin.com> wrote:  
> >> >
> >> > Hi Arnd,
> >> >
> >> > On Wed, 10 Oct 2018 20:44:50 +0200
> >> > Arnd Bergmann <arnd@arndb.de> wrote:
> >> >  
> >> > > Enabling -Wvla found another variable-length array with randconfig
> >> > > testing:
> >> > >
> >> > > drivers/mtd/maps/sa1100-flash.c: In function 'sa1100_setup_mtd':
> >> > > drivers/mtd/maps/sa1100-flash.c:224:10: error: ISO C90 forbids variable length array 'cdev' [-Werror=vla]
> >> > >
> >> > > As far as I can tell, there is an upper bound on the number of resources
> >> > > that can be passed, based on the number of CS lines on the bus.
> >> > > In practice, all boards we support have either one or two resources,
> >> > > but using six to be on the safe side has no extra cost.  
> >> >
> >> > Why not dynamically allocate cdev instead? That removes any kind of
> >> > guessing on the max value, and it shouldn't hurt much since this code is
> >> > in the probe path.  
> >>
> >> Fine with me as well, If you prefer that one, please just add
> >> Reported-by: Arnd Bergmann <arnd@arndb.de>  
> >
> > Oh, I thought I'd let you send a v2, but I can do it if you prefer.  
> 
> Olof just pointed out to me that neither fix landed for this? What's
> needed for this?

Nothing in particular, I was planning on sending a new version after
-rc1 is out and then queue it for 4.21 (5.1?) (this patch came in a bit
late, and I had already stopped taking patches for 4.20).

If you consider this a fix or want to have it in 4.20 for other reasons,
just let me know and I'll queue it to the -fixes branch.

Regards,

Boris
