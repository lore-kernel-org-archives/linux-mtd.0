Subject: Re: [Patch 04/18] include/linux/logfs.h
From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
In-Reply-To: <20070604091245.GF14823@lazybastard.org>
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184205.GE8952@lazybastard.org>
	<200706032342.27252.arnd@arndb.de>
	<20070604091245.GF14823@lazybastard.org>
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Jun 2007 14:38:23 +0100
Message-Id: <1180964303.25232.358.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Roland Dreier <rdreier@cisco.com>, Arnd Bergmann <arnd@arndb.de>,
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

On Mon, 2007-06-04 at 11:12 +0200, Jörn Engel wrote:
> On Sun, 3 June 2007 23:42:25 +0200, Arnd Bergmann wrote:
> > On Sunday 03 June 2007, Jörn Engel wrote:
> > > +struct logfs_je_spillout {
> > > +       __be64  so_segment[0];
> > > +}__packed;
> > 
> > All the on-disk data structures you define in this file have naturally
> > aligned members, so the __packed attribute is not needed.
> 
> Amen.  It is purely paranoia and I don't even know who is out to get me.

You can _never_ know who is out to get you, or what architecture we'll
be ported to next week.

The advice "don't tell the compiler what you want unless you _know_
it'll do the wrong thing otherwise" runs counter to everything we've
learned, slowly and painfully, over the last few years.

We should never rely on compiler behaviour which is undocumented and
unrequired. Even if you know that the ABI forces it to continue to do
the right thing on the platforms you _currently_ care about, it might
not do it on new platforms (or existing platforms you didn't manage to
test).

It would be better if GCC had a 'nopadding' attribute which gave us what
we need without the _extra_ implications about alignment. In the absence
of that, though, you should at _least_ have a check on the size of the
structure if you're doing to drop the packed attribute.

-- 
dwmw2
