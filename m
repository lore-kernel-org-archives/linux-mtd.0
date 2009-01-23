Received: from hera.kernel.org ([140.211.167.34])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LQPqx-0005xn-NA
	for linux-mtd@lists.infradead.org; Fri, 23 Jan 2009 17:29:59 +0000
Subject: Re: [GIT PULL -tip] fix 33 make headers_check warnings
From: Jaswinder Singh Rajput <jaswinder@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
In-Reply-To: <20090123170904.GA26083@uranus.ravnborg.org>
References: <1232223441.3966.22.camel@localhost.localdomain>
	<1232228261.27094.0.camel@macbook.infradead.org>
	<20090117221932.GA4956@uranus.ravnborg.org> <49725B1E.604@kernel.org>
	<1232498319.3123.34.camel@localhost.localdomain>
	<1232726359.3504.18.camel@localhost.localdomain>
	<1232726658.3504.22.camel@localhost.localdomain>
	<alpine.LSU.2.00.0901231710350.15413@fbirervta.pbzchgretzou.qr>
	<20090123162153.GA25766@uranus.ravnborg.org>
	<1232728304.3504.28.camel@localhost.localdomain>
	<20090123170904.GA26083@uranus.ravnborg.org>
Content-Type: text/plain
Date: Fri, 23 Jan 2009 22:58:37 +0530
Message-Id: <1232731717.3504.36.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: urs.thuermann@volkswagen.de, neilb@suse.de, greg@kroah.com,
	Jan Engelhardt <jengelh@medozas.de>, bfields@fieldses.org,
	linux-mtd@lists.infradead.org, "H. Peter Anvin" <hpa@kernel.org>,
	dbrownell@users.sourceforge.net,
	x86 maintainers <x86@kernel.org>, tiwai@suse.de,
	Ingo Molnar <mingo@elte.hu>, linux-media@vger.kernel.org,
	mchehab@infradead.org, linux-raid@vger.kernel.org,
	netfilter@vger.kernel.org, linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	netfilter-devel@vger.kernel.org, oliver.hartkopp@volkswagen.de,
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

On Fri, 2009-01-23 at 18:09 +0100, Sam Ravnborg wrote:
> On Fri, Jan 23, 2009 at 10:01:44PM +0530, Jaswinder Singh Rajput wrote:

> > So is this OK:
> > 
> > -#ifdef __KERNEL__
> >  #include <linux/types.h>
> > -#else
> > -#include <stdint.h>
> > -#endif
> 
> That was what I expected the final change to look like.
> If you want then combine it in one patch.
> 

Ok, thanks.

--
JSR
