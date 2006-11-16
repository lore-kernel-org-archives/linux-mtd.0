Received: from [2002:53a0:b870::1] (helo=xi.wantstofly.org)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1Gkk3X-0005Hg-Ie
	for linux-mtd@lists.infradead.org; Thu, 16 Nov 2006 11:25:46 -0500
Date: Thu, 16 Nov 2006 17:25:36 +0100
From: Lennert Buytenhek <buytenh@wantstofly.org>
To: Duke <ezbonites@gmail.com>
Subject: Re: commandline physmap changed?
Message-ID: <20061116162536.GE11019@xi.wantstofly.org>
References: <79ac09b60611160744u4e3c1804q81bce772fdac7851@mail.gmail.com>
	<20061116154822.GC11019@xi.wantstofly.org>
	<79ac09b60611160814x41618529s29de404fba35cccb@mail.gmail.com>
	<79ac09b60611160817t247871fag5d7fc2567daaaaa9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79ac09b60611160817t247871fag5d7fc2567daaaaa9@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 16, 2006 at 10:17:05AM -0600, Duke wrote:

> > > > I'm using 2.6.18 kernel setting up my nor flash with the commandline:
> > > >
> > > > mtdparts=phys_mapped_flash:2m(boot),-(root)mtdparts=phys_mapped_flash:2m(boot),-(root)
> > > > , and the phys mapped driver would not shot these partition on boot.
> > > >
> > > > I did the same thing on a previous 2.6.16 kernel and it worked ok.
> > > > What changed? I noticed a physmap-flash name change but that wasn't it
> > > > (i.e mtdparts=physmap-flash:2m(boot),-(root) ).
> > > > How do I fix it?
> > >
> > > Try using 'physmap-flash.0'.  This works for me:
> > >
> > >         mtdparts=physmap-flash.0:256k(boot),256k(bootvars),2048k(zImage),-(flashfs1)
> >
> > Thanks,
> > That worked. I wonder what's the idea behind the ".0"?

There might be multiple physmap devices in the system (.0, .1, etc.)
