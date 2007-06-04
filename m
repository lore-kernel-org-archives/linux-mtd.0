Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HvDn9-0006Yf-Ej
	for linux-mtd@lists.infradead.org; Mon, 04 Jun 2007 10:44:21 -0400
Date: Mon, 4 Jun 2007 11:01:26 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Patch 09/18] fs/logfs/gc.c
Message-ID: <20070604090126.GB14823@lazybastard.org>
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184604.GJ8952@lazybastard.org>
	<200706040007.38578.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200706040007.38578.arnd@arndb.de>
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

On Mon, 4 June 2007 00:07:36 +0200, Arnd Bergmann wrote:
> On Sunday 03 June 2007, Jörn Engel wrote:
> > +static long decay(long t0, long t, long theta)
> > +{
> > +       long shift, fac;
> > +
> > +       if (t >= 32*theta)
> > +               return 0;
> > +
> > +       shift = t/theta;
> > +       fac = theta - (t%theta)/2;
> > +       return (t0 >> shift) * fac / theta;
> > +}
> 
> I think it's confusion to work with 'long' arguments
> here. If you actually allow larger than 32 bit arguments,
> that means that the gc logic behaves differently on
> 32 and 64 bit CPUs, which I don't think is what you
> intended.

Different behaviour would be fine.  This function will be used to pick
good candidates for garbage collection.  If one segment will get chosen
over another depending on BITS_PER_LONG, either one would have been a
good candidate anyway.

Hmm.  Maybe I should s/32/BITS_PER_LONG/ in the function.

> Also, can any of the arguments be negative? How about
> making them all explicit u32 and u64 variables?

That would make sense, yes.

Jörn

-- 
I've never met a human being who would want to read 17,000 pages of
documentation, and if there was, I'd kill him to get him out of the
gene pool.
-- Joseph Costello
