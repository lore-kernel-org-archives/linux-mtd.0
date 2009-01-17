Received: from pfepb.post.tele.dk ([195.41.46.236])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LOJUN-0000tc-CF
	for linux-mtd@lists.infradead.org; Sat, 17 Jan 2009 22:18:14 +0000
Date: Sat, 17 Jan 2009 23:19:32 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [GIT PULL -tip] fix 33 make headers_check warnings
Message-ID: <20090117221932.GA4956@uranus.ravnborg.org>
References: <1232223441.3966.22.camel@localhost.localdomain>
	<1232228261.27094.0.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1232228261.27094.0.camel@macbook.infradead.org>
Cc: urs.thuermann@volkswagen.de, neilb@suse.de, greg@kroah.com,
	bfields@fieldses.org, linux-mtd@lists.infradead.org,
	dbrownell@users.sourceforge.net,
	x86 maintainers <x86@kernel.org>, tiwai@suse.de,
	netfilter-devel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>,
	linux-media@vger.kernel.org, mchehab@infradead.org,
	linux-raid@vger.kernel.org, netfilter@vger.kernel.org,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Jaswinder Singh Rajput <jaswinder@kernel.org>,
	oliver.hartkopp@volkswagen.de, spi-devel-general@lists.sourceforge.net,
	Andrew Morton <akpm@linux-foundation.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jan 18, 2009 at 08:37:41AM +1100, David Woodhouse wrote:
> On Sun, 2009-01-18 at 01:47 +0530, Jaswinder Singh Rajput wrote:
> > --- a/include/linux/dvb/audio.h
> > +++ b/include/linux/dvb/audio.h
> > @@ -24,9 +24,8 @@
> >  #ifndef _DVBAUDIO_H_
> >  #define _DVBAUDIO_H_
> >  
> > -#ifdef __KERNEL__
> >  #include <linux/types.h>
> > -#else
> > +#ifndef __KERNEL__
> >  #include <stdint.h>
> >  #endif
> >  
> 
> That patch looks wrong, and unnecessary. It was fine before.
Nope - include/linux/dvb/audio.h failed to include linux/types.h
despite the fact that is uses __u32 etc.

But why the _kernel_ should include a userspace header is
much more questionable.

	Sam
