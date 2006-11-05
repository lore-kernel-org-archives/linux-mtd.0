Subject: Re: Fw: Top 100 inline functions (make allyesconfig) was Re:
	[ANNOUNCE] pahole and other DWARF2 utilities
From: David Woodhouse <dwmw2@infradead.org>
To: Andrew Morton <akpm@osdl.org>
In-Reply-To: <20061104132050.4950866b.akpm@osdl.org>
References: <20061104132050.4950866b.akpm@osdl.org>
Content-Type: text/plain
Date: Sun, 05 Nov 2006 14:32:17 +0800
Message-Id: <1162708337.3374.21.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: lwn@lwn.net, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@mandriva.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-11-04 at 13:20 -0800, Andrew Morton wrote:
> cfi_build_cmd() is nutty. 

Damn right it's nutty. Imagine the number of ways you can wire up 1-8
flash chips in either 8-bit or 16-bit mode to a bus which is between 8
and 64 bits wide. Deal with it in software, with a "chip driver"
abstraction which knows what data to put at which address on each
_chip_, and which needs to calculate the corresponding bus data/address.

In the sensible case where you build in support for what you have -- one
interleave, one mode, one bus size -- it's simple. And that's why it's
inline. This is one of the cases where 'allyesconfig' just doesn't make
much sense.

I'm not entirely averse to taking it out-of-line, but show me data on
the interesting case rather than the allyesconfig case.

And tell me about it in about two weeks' time when the sky stops falling
on my head and I get to go home. :)

-- 
dwmw2
