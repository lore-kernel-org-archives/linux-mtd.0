Date: Sat, 17 Jan 2009 23:18:00 -0500
From: Kyle McMartin <kyle@infradead.org>
To: Jaswinder Singh Rajput <jaswinder@kernel.org>
Subject: Re: [GIT PULL -tip] fix 33 make headers_check warnings
Message-ID: <20090118041800.GB671@bombadil.infradead.org>
References: <1232223441.3966.22.camel@localhost.localdomain>
	<1232228261.27094.0.camel@macbook.infradead.org>
	<20090117221932.GA4956@uranus.ravnborg.org>
	<1232247901.3097.12.camel@localhost.localdomain>
	<20090118033339.GA671@bombadil.infradead.org>
	<1232249904.3097.15.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1232249904.3097.15.camel@localhost.localdomain>
Cc: urs.thuermann@volkswagen.de, neilb@suse.de, greg@kroah.com,
	bfields@fieldses.org, linux-mtd@lists.infradead.org,
	Sam Ravnborg <sam@ravnborg.org>, dbrownell@users.sourceforge.net,
	x86 maintainers <x86@kernel.org>, tiwai@suse.de,
	Ingo Molnar <mingo@elte.hu>, linux-media@vger.kernel.org,
	Kyle McMartin <kyle@infradead.org>, mchehab@infradead.org,
	linux-raid@vger.kernel.org, netfilter@vger.kernel.org,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
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

On Sun, Jan 18, 2009 at 09:08:24AM +0530, Jaswinder Singh Rajput wrote:
> If this file is _ONLY_ for userspace and kernel cannot use it then what
> is the point of keeping this file in kernel headers.
> 

There is effectively no point, especially when they reference a variable
that may or may not exist in the userspace code including it... It seems
entirely mtd-utils dependent.

Dave, will you queue Adrian's patch to nuke it?
