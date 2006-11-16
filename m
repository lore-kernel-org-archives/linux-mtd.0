Received: from ug-out-1314.google.com ([66.249.92.170])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GkjvK-0004z1-7V
	for linux-mtd@lists.infradead.org; Thu, 16 Nov 2006 11:17:17 -0500
Received: by ug-out-1314.google.com with SMTP id m2so451948uge
	for <linux-mtd@lists.infradead.org>;
	Thu, 16 Nov 2006 08:17:05 -0800 (PST)
Message-ID: <79ac09b60611160817t247871fag5d7fc2567daaaaa9@mail.gmail.com>
Date: Thu, 16 Nov 2006 10:17:05 -0600
From: Duke <ezbonites@gmail.com>
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: commandline physmap changed?
In-Reply-To: <79ac09b60611160814x41618529s29de404fba35cccb@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <79ac09b60611160744u4e3c1804q81bce772fdac7851@mail.gmail.com>
	<20061116154822.GC11019@xi.wantstofly.org>
	<79ac09b60611160814x41618529s29de404fba35cccb@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adding the list...

On 11/16/06, Duke <ezbonites@gmail.com> wrote:
> On 11/16/06, Lennert Buytenhek <buytenh@wantstofly.org> wrote:
> > On Thu, Nov 16, 2006 at 09:44:08AM -0600, Duke wrote:
> >
> > > I'm using 2.6.18 kernel setting up my nor flash with the commandline:
> > >
> > > mtdparts=phys_mapped_flash:2m(boot),-(root)mtdparts=phys_mapped_flash:2m(boot),-(root)
> > > , and the phys mapped driver would not shot these partition on boot.
> > >
> > > I did the same thing on a previous 2.6.16 kernel and it worked ok.
> > > What changed? I noticed a physmap-flash name change but that wasn't it
> > > (i.e mtdparts=physmap-flash:2m(boot),-(root) ).
> > > How do I fix it?
> >
> > Try using 'physmap-flash.0'.  This works for me:
> >
> >         mtdparts=physmap-flash.0:256k(boot),256k(bootvars),2048k(zImage),-(flashfs1)
> >
>
> Thanks,
> That worked. I wonder what's the idea behind the ".0"?
>
