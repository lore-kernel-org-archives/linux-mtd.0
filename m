Subject: Re: [Patch 04/18] include/linux/logfs.h
From: David Woodhouse <dwmw2@infradead.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
In-Reply-To: <db91817d295770e459727005108b05e2@kernel.crashing.org>
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184205.GE8952@lazybastard.org>
	<200706032342.27252.arnd@arndb.de>
	<20070604091245.GF14823@lazybastard.org>
	<1180964303.25232.358.camel@pmac.infradead.org>
	<18f622d94e9273fe6c93ef091fcec87c@kernel.crashing.org>
	<1181058836.16089.23.camel@hades.cambridge.redhat.com>
	<db91817d295770e459727005108b05e2@kernel.crashing.org>
Content-Type: text/plain
Date: Wed, 06 Jun 2007 09:50:20 +0100
Message-Id: <1181119820.25232.434.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Roland Dreier <rdreier@cisco.com>, Arnd Bergmann <arnd@arndb.de>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>,
	linux-fsdevel@vger.kernel.org, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-06-05 at 20:49 +0200, Segher Boessenkool wrote:
> >>> It would be better if GCC had a 'nopadding' attribute which gave us
> >>> what we need without the _extra_ implications about alignment.
> >>
> >> That's impossible; removing the padding from a struct
> >> _will_ make accesses to its members unaligned (think
> >> about arrays of that struct).
> >
> > It _might_ make accesses to _some_ of its members unaligned.
> 
> It _will_ make accesses to _at least one_ of the members
> unaligned, in the second array element.

It _might_, but not necessarily.

Won't a simple struct { uint16_t } get padded to a size of 4 bytes on
ARM? Even if I'm misremembering that, I certainly can't guarantee that
such a thing will _never_ happen on any newly-invented ABI. If you had
'nopadding' instead of 'packed', then there's no need to emit code to
handle unaligned loads.

Likewise, with a struct which looks like this: 
   { uint32_t, uint16_t, uint16_t, uint32_t, uint32_t }
I cannot _guarantee_ that there will never be an architecture on which
we'll end up using 32 bits of space for each uint16_t. I might _guess_
that and hope, but that's precisely the kind of moronic empirical
behaviour which caused Linux to have so many problems with newer
compilers in the past. If it isn't _guaranteed_ then I shouldn't be
assuming it.

Thus, I want a way to tell the compiler not to insert _any_ padding. But
without the compiler making extra inferences about the whole thing being
found at arbitrary alignments.

And if I had something like this (which is admittedly contrived, but
hardware people _do_ do stupid things to us):
   { uint32_t, uint8_t, uint16_t, uint8_t, uint32_t, uint32_t }

With the 'packed' attribute the compiler would assume arbitrary
alignment of all the 32-bit integers. But in reality it's only necessary
for the uint16_t in the middle. A 'nopadding' attribute would deal with
that correctly.

-- 
dwmw2
