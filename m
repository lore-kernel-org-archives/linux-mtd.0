Received: from terminus.zytor.com ([198.137.202.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LOJk5-0004Ni-BJ
	for linux-mtd@lists.infradead.org; Sat, 17 Jan 2009 22:34:15 +0000
Message-ID: <49725B1E.604@kernel.org>
Date: Sat, 17 Jan 2009 14:26:38 -0800
From: "H. Peter Anvin" <hpa@kernel.org>
MIME-Version: 1.0
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [GIT PULL -tip] fix 33 make headers_check warnings
References: <1232223441.3966.22.camel@localhost.localdomain>
	<1232228261.27094.0.camel@macbook.infradead.org>
	<20090117221932.GA4956@uranus.ravnborg.org>
In-Reply-To: <20090117221932.GA4956@uranus.ravnborg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Sam Ravnborg wrote:
>>>  
>> That patch looks wrong, and unnecessary. It was fine before.
> Nope - include/linux/dvb/audio.h failed to include linux/types.h
> despite the fact that is uses __u32 etc.
> 
> But why the _kernel_ should include a userspace header is
> much more questionable.
> 

<stdint.h> is one of a handful of headers provided by gcc itself.

	-hpa
