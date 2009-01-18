Date: Sat, 17 Jan 2009 22:33:39 -0500
From: Kyle McMartin <kyle@infradead.org>
To: Jaswinder Singh Rajput <jaswinder@kernel.org>
Subject: Re: [GIT PULL -tip] fix 33 make headers_check warnings
Message-ID: <20090118033339.GA671@bombadil.infradead.org>
References: <1232223441.3966.22.camel@localhost.localdomain>
	<1232228261.27094.0.camel@macbook.infradead.org>
	<20090117221932.GA4956@uranus.ravnborg.org>
	<1232247901.3097.12.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1232247901.3097.12.camel@localhost.localdomain>
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

On Sun, Jan 18, 2009 at 08:35:01AM +0530, Jaswinder Singh Rajput wrote:
> Hello Sam, David,
> 
> /home/jaswinder/jaswinder-git/linux-2.6-tip/usr/include/mtd/jffs2-user.h:20: extern's make no sense in userspace
> 

This file is for userspace only, and it makes sense where it's used
(mtd-utils.)

In general though, this file doesn't actually depend on the kernel and
could be entirely provided from the userspace library.

http://lkml.org/lkml/2006/12/1/180
