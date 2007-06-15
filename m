Received: from [212.112.238.170] (helo=longford.lazybastard.org)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HzBGn-0005le-1c
	for linux-mtd@lists.infradead.org; Fri, 15 Jun 2007 13:51:17 +0100
Date: Fri, 15 Jun 2007 13:14:04 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Evgeniy Polyakov <johnpol@2ka.mipt.ru>
Subject: Re: [Patch 09/18] fs/logfs/gc.c
Message-ID: <20070615111404.GB6791@lazybastard.org>
References: <20070603183845.GA8952@lazybastard.org>
	<20070603184604.GJ8952@lazybastard.org>
	<20070615090357.GC20361@2ka.mipt.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070615090357.GC20361@2ka.mipt.ru>
Cc: akpm@osdl.org, David Weinehall <tao@acc.umu.se>,
	Dongjun Shin <djshin90@gmail.com>, Kyle Moffett <mrmacman_g4@mac.com>,
	linux-mtd@lists.infradead.org, Pavel Machek <pavel@ucw.cz>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ulisses Furquim <ulissesf@gmail.com>, CaT <cat@zip.com.au>,
	Roland Dreier <rdreier@cisco.com>, Arnd Bergmann <arnd@arndb.de>,
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

On Fri, 15 June 2007 13:03:57 +0400, Evgeniy Polyakov wrote:
> On Sun, Jun 03, 2007 at 08:46:04PM +0200, Jörn Engel (joern@lazybastard.org) wrote:
> > --- /dev/null	2007-03-13 19:15:28.862769062 +0100
> > +++ linux-2.6.21logfs/fs/logfs/gc.c	2007-06-03 19:18:57.000000000 +0200
> 
> Number of bugs in case of error looks quite sad...

Agreed.  I've started working on error handling.  Most erase errors are
dealt with.  Write errors still need some infrastructure.

If you like I can send another round of patches for review.

Jörn

-- 
Joern's library part 12:
http://physics.nist.gov/cuu/Units/binary.html
