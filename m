Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HvDNh-0005hD-14
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 10:18:04 -0400
Date: Mon, 4 Jun 2007 11:05:07 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: LogFS take four
Message-ID: <20070604090507.GC14823@lazybastard.org>
References: <20070603183845.GA8952@lazybastard.org>
	<200706040018.23001.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200706040018.23001.arnd@arndb.de>
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Roland Dreier <rdreier@cisco.com>,
	Jamie Lokier <jamie@shareable.org>, Pekka Enberg <penberg@cs.helsinki.fi>,
	Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Thomas Gleixner <tglx@linutronix.de>, Bill Davidsen <davidsen@tmr.com>,
	Albert Cahalan <acahalan@gmail.com>,
	John Stoffel <john@stoffel.org>, linux-kernel@vger.kernel.org,
	Ondrej Zajicek <santiago@crfreenet.org>, linux-fsdevel@vger.kernel.org,
	David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 4 June 2007 00:18:21 +0200, Arnd Bergmann wrote:
> On Sunday 03 June 2007, Jörn Engel wrote:
> 
> > Unchanged:
> > o error handling
> > 
> ...
> > Won't happen (unless I get convinced to do otherwise):
> > o Change LOGFS_BUG() and LOGFS_BUG_ON() to inline functions
> >   These are macros for very much the same reasons BUG() and BUG_ON() are.
> 
> I wonder how many of your LOGFS_BUG{,_ON} still remain after the
> error handling is in place to deal with broken file system contents.
> Ideally, I'd say the current LOGFS_BUG() should be replaced with
> a function that prints about the kind of error it has hit (rate-limited),
> potentially calls logfs_crash_dump(), and remounts the medium read-only,
> but _not_ call BUG().

That sounds fairly useful, actually.  Do a WARN_ON(), call
logfs_crash_dump(), remount read-only and finished.  Rate-limiting might
be unnecessary as the read-only thing already limits the rate to 1.

I like the idea.

Jörn

-- 
Fools ignore complexity.  Pragmatists suffer it.
Some can avoid it.  Geniuses remove it.
-- Perlis's Programming Proverb #58, SIGPLAN Notices, Sept.  1982
