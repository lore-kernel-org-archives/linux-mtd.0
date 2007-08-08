Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IIoZR-0006B3-CM
	for linux-mtd@lists.infradead.org; Wed, 08 Aug 2007 12:39:43 -0400
Date: Wed, 8 Aug 2007 18:35:45 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: LogFS take five
Message-ID: <20070808163545.GU15319@lazybastard.org>
References: <20070808161234.GB15319@lazybastard.org>
	<1186590437.19606.38.camel@sauron>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1186590437.19606.38.camel@sauron>
Cc: akpm@osdl.org, Arnd Bergmann <arnd@arndb.de>,
	=?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 8 August 2007 19:27:17 +0300, Artem Bityutskiy wrote:
> On Wed, 2007-08-08 at 18:12 +0200, Jörn Engel wrote:
> > It has been a while, mainly because I found a bunch of races and didn't
> > want to publish anything before those were fixed.  Patch is still
> > against 2.6.21 and just for review.
> 
> I'm very interested how do you account free/dirty space in LogFS:

Independently of the position where data goes.  There is a known amount
of space.  Each write decreases that, each delete increases that.
-ENOSPC when it gets too low.

> * When you need to write new data, how do you select the place where to
> write?

Next position in the appropriate segment (you remember the level
concept, I'm sure).

> * When you run out of space, how do select find the segment to
> garbage-collect?

Most amount of free space usually.  If space gets really tight, lower
levels are ignored.

> For any given segment (or eraseblock), how do you find amount of free
> and dirty space in it?

Scanning.  I don't have seperate accounting yet.

Jörn

-- 
When in doubt, use brute force.
-- Ken Thompson
