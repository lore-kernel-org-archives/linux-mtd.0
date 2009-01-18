Received: from pfepa.post.tele.dk ([195.41.46.235])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LOUaF-0002uK-3B
	for linux-mtd@lists.infradead.org; Sun, 18 Jan 2009 10:08:49 +0000
Date: Sun, 18 Jan 2009 11:10:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Ingo Molnar <mingo@elte.hu>
Subject: Re: [GIT PULL -tip] fix 33 make headers_check warnings
Message-ID: <20090118101029.GA31461@uranus.ravnborg.org>
References: <1232223441.3966.22.camel@localhost.localdomain>
	<1232228261.27094.0.camel@macbook.infradead.org>
	<20090117221932.GA4956@uranus.ravnborg.org>
	<20090118091300.GA24849@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090118091300.GA24849@elte.hu>
Cc: urs.thuermann@volkswagen.de, neilb@suse.de, greg@kroah.com,
	bfields@fieldses.org, linux-mtd@lists.infradead.org,
	dbrownell@users.sourceforge.net,
	x86 maintainers <x86@kernel.org>, tiwai@suse.de,
	netfilter-devel@vger.kernel.org, linux-media@vger.kernel.org,
	mchehab@infradead.org, linux-raid@vger.kernel.org,
	netfilter@vger.kernel.org, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Jaswinder Singh Rajput <jaswinder@kernel.org>,
	oliver.hartkopp@volkswagen.de, spi-devel-general@lists.sourceforge.net,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 18, 2009 at 10:13:00AM +0100, Ingo Molnar wrote:
> 
> * Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > On Sun, Jan 18, 2009 at 08:37:41AM +1100, David Woodhouse wrote:
> > > On Sun, 2009-01-18 at 01:47 +0530, Jaswinder Singh Rajput wrote:
> > > > --- a/include/linux/dvb/audio.h
> > > > +++ b/include/linux/dvb/audio.h
> > > > @@ -24,9 +24,8 @@
> > > >  #ifndef _DVBAUDIO_H_
> > > >  #define _DVBAUDIO_H_
> > > >  
> > > > -#ifdef __KERNEL__
> > > >  #include <linux/types.h>
> > > > -#else
> > > > +#ifndef __KERNEL__
> > > >  #include <stdint.h>
> > > >  #endif
> > > >  
> > > 
> > > That patch looks wrong, and unnecessary. It was fine before.
> > Nope - include/linux/dvb/audio.h failed to include linux/types.h
> > despite the fact that is uses __u32 etc.
> > 
> > But why the _kernel_ should include a userspace header is
> > much more questionable.
> 
> ok, i dropped this one for the time being.
> 
> Sam, Andrew, et al, i've got the commit lineup below, to fix the ~200 new 
> CONFIG_HEADERS_CHECK=y warnings we have in current -git, on x86 
> allyesconfig.
> 
> Note that i have restructured the tree and the commits so that this effort 
> can be tracked more easily: each commit has a "headers_check fix" subject 
> line prefix. So you can go back later and revisit these things - for 
> example whether a header really needs to be exported to user-space, via:
> 
>   git log --grep='headers_check fix:' --pretty=format:"%h: %s"
> 
> to get an overview and a historic track record. We can follow this 
> notation in the future too.
> 
> So if there are no objections, i'll send this to Linus tomorrow-ish and 
> we'll have the worst of the fallout behind us and can embark on a much 
> more fluid (and per maintainer) headers_check related workflow.

Thanks for taking care of this Ingo and please push towards Linus.
And thanks to all the contributors too - it was great to see this dealt
with soo quickly!

	Sam
