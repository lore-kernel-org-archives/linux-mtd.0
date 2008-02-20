Received: from exprod7og106.obsmtp.com ([64.18.2.165])
	by bombadil.infradead.org with smtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JRsL5-0003EI-Tr
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 17:02:36 +0000
Date: Wed, 20 Feb 2008 17:02:31 +0000
From: Stephane Chazelas <stephane.chazelas@emerson.com>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
Subject: Re: [PATCH 2.6.24] block2mtd: removing a device and typo fixes
Message-ID: <chaz20080220170231.GV4539@artesyncp.com>
References: <chaz20080212134751.GI30304@artesyncp.com>
	<chaz20080212161034.GJ30304@artesyncp.com>
	<20080219150822.GA29587@lazybastard.org>
	<200802192333.39707.arnd@arndb.de>
	<chaz20080220144339.GK4539@artesyncp.com>
	<20080220163042.GC5539@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20080220163042.GC5539@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2008-02-20 17:30:42 +0100, Jörn Engel:
> On Wed, 20 February 2008 14:43:39 +0000, Stephane Chazelas wrote:
> > 
> > note that for "loop", you have /dev/loop0, /dev/loop1... which
> > makes it a pain to handle
> > 
> > For block2mtd, you don't need several device files in /dev, you
> > only need one to pass ioctls down to create mtd devices.
> > 
> > That may end up creating new /dev devices via mtdblock or
> > mtdblock_ro for instance.
> > 
> > So I'm not sure reusing the "loop" ioctls is a good idea.
> 
> /me notes that you dislike both existing interfaces and would prefer a
> third.  How likely is it that you will still like the new interface two
> years down the road?  How likely is it that everyone else will agree
> with you?
> 
> In the end, a painful interface is still less painful than a choice of
> several incompatible ones.  I used to think different and have burned my
> fingers often enough to learn the lesson. :)
[...]

Hi Jörn,

sorry, I wasn't very clear.

With "loop", you're doing an ioctl() to /dev/loop<x> so that
/dev/loop<x> become a block device associated with a given file.

Applying that strictly to block2mtd wouldn't make sense.

At the moment, when you create a new block2mtd, the only thing
you see is an entry in /proc/mtd.

You don't access that mtd device directly (there's no
/dev/mtd<x>). Instead, you may access it via a /dev/mtdblock<x>
if you have "block2mtd" for instance.

Here, what you need, is an API that gets a block device (with fd
or path) and an erase size and that returns a mtd identifier.

Best regards,
Stephane
