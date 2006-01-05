Received: from mgw-ext01.nokia.com ([131.228.20.93])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EuV47-0001oO-In
	for linux-mtd@lists.infradead.org; Thu, 05 Jan 2006 08:22:10 -0500
From: Juha =?ISO-8859-1?Q?Yrj=F6l=E4?= <juha.yrjola@nokia.com>
To: Vitaly Wool <vwool@ru.mvista.com>
In-Reply-To: <43BD118B.2050606@ru.mvista.com>
References: <1136235272.8963.21.camel@two.research.nokia.com>
	<43BD118B.2050606@ru.mvista.com>
Content-Type: text/plain; charset=ISO-8859-1
Date: Thu, 05 Jan 2006 15:20:06 +0200
Message-Id: <1136467206.22022.28.camel@two.research.nokia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [JFFS2] Make NAND OOB usage more flexible
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Vitaly,

Sorry, I wasn't aware of any patch; I just joined the list.  Is this the
patch?

http://lists.infradead.org/pipermail/linux-mtd/2005-December/014521.html

If it is, it seems to be ignorant of at least OneNAND.

However, I do agree that the OOB stuff is not handled well at all in the
current code (even after my patch).  When you come up with a better
version, please update the OneNAND code, too.

As a side note, on OneNAND it'd actually probably be faster to do a one
big write of 64 OOB bytes instead of a lot of 2- or 3-byte writes.
Looks like your patch is paving way for this by moving the OOB handling
lower, which is good.

So I do agree that for the long term the OOB handling needs rework, but
my patch is a stopgap measure that allows all the devices (NAND and
OneNAND) to work right now.

BTW, this patch is bad:

http://lists.infradead.org/pipermail/linux-mtd/2005-December/014522.html

APIs visible to user-space should _never_ be broken if it's possible to
avoid it.  You should implement a backwards-compatibility layer instead
of just removing the old ioctls.

Cheers,
Juha

On Thu, 2006-01-05 at 15:31 +0300, ext Vitaly Wool wrote:
> Oh my goodness... Maybe just apply my patch for OOB handling and all 
> that stuff will go away?
> 
> Vitaly
> 
> Juha Yrjölä wrote:
> 
> >Many (if not all) OneNAND devices have the free OOB bytes scattered
> >around the whole OOB area in blocks of 2 or 3 bytes.  To work around
> >this, the JFFS2 wbuf code needs to consider _all_ the free OOB bytes
> >specified by the oobfree array.
