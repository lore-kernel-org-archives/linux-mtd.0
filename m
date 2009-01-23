Received: from hera.kernel.org ([140.211.167.34])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LQOSZ-0002Zj-PB
	for linux-mtd@lists.infradead.org; Fri, 23 Jan 2009 16:00:44 +0000
Subject: Re: [GIT PULL -tip] fix 33 make headers_check warnings
From: Jaswinder Singh Rajput <jaswinder@kernel.org>
To: "H. Peter Anvin" <hpa@kernel.org>
In-Reply-To: <1232498319.3123.34.camel@localhost.localdomain>
References: <1232223441.3966.22.camel@localhost.localdomain>
	<1232228261.27094.0.camel@macbook.infradead.org>
	<20090117221932.GA4956@uranus.ravnborg.org> <49725B1E.604@kernel.org>
	<1232498319.3123.34.camel@localhost.localdomain>
Content-Type: text/plain
Date: Fri, 23 Jan 2009 21:29:19 +0530
Message-Id: <1232726359.3504.18.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: urs.thuermann@volkswagen.de, neilb@suse.de, greg@kroah.com,
	bfields@fieldses.org, linux-mtd@lists.infradead.org,
	Sam Ravnborg <sam@ravnborg.org>, dbrownell@users.sourceforge.net,
	x86 maintainers <x86@kernel.org>, tiwai@suse.de,
	Ingo Molnar <mingo@elte.hu>, linux-media@vger.kernel.org,
	mchehab@infradead.org, linux-raid@vger.kernel.org,
	netfilter@vger.kernel.org, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	netfilter-devel@vger.kernel.org, oliver.hartkopp@volkswagen.de,
	spi-devel-general@lists.sourceforge.net,
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


On Wed, 2009-01-21 at 06:08 +0530, Jaswinder Singh Rajput wrote:
> On Sat, 2009-01-17 at 14:26 -0800, H. Peter Anvin wrote:
> > Sam Ravnborg wrote:
> > >>>  
> > >> That patch looks wrong, and unnecessary. It was fine before.
> > > Nope - include/linux/dvb/audio.h failed to include linux/types.h
> > > despite the fact that is uses __u32 etc.
> > > 
> > > But why the _kernel_ should include a userspace header is
> > > much more questionable.
> > > 
> > 
> > <stdint.h> is one of a handful of headers provided by gcc itself.
> > 
> 
> Should I reintroduce my patch to solve this warning of 'make headers_check':
>  usr/include/linux/dvb/audio.h:133: found __[us]{8,16,32,64} type without #include <linux/types.h>
> 
> diff --git a/include/linux/dvb/audio.h b/include/linux/dvb/audio.h
> index 89412e1..758a48c 100644
> --- a/include/linux/dvb/audio.h
> +++ b/include/linux/dvb/audio.h
> @@ -24,9 +24,8 @@
>  #ifndef _DVBAUDIO_H_
>  #define _DVBAUDIO_H_
>  
> -#ifdef __KERNEL__
>  #include <linux/types.h>
> -#else
> +#ifndef __KERNEL__
>  #include <stdint.h>
>  #endif
> 

It seems one have objection for this. So I will again insert this in my
new patchset.

--
JSR
