Received: from mail.shareable.org ([81.29.64.88])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoHXQ-00038O-FM
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 07:19:25 -0400
Date: Wed, 16 May 2007 12:18:40 +0100
From: Jamie Lokier <jamie@shareable.org>
To: Albert Cahalan <acahalan@gmail.com>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070516111840.GB20482@mail.shareable.org>
References: <20070515151919.GA32510@lazybastard.org>
	<787b0d920705151626x3a11b81csf0f3747a695131b0@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <787b0d920705151626x3a11b81csf0f3747a695131b0@mail.gmail.com>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Greg KH <greg@kroah.com>,
	=?iso-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>, linux-mtd@lists.infradead.org,
	Jan Engelhardt <jengelh@linux01.gwdg.de>, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Albert Cahalan wrote:
> Please don't forget the immutable bit. ("man lsattr")
> Having both, BSD-style, would be even better.
> The immutable bit is important for working around
> software bugs and "features" that damage files.
> 
> I also can't find xattr support.

Imho,

Given that the filesystem is still 'experimental', I'd concentrate on
getting it stable before worrying about immutable and xattrs unless
they are easy.  (Immutable is easy).

In 13 years of using Linux in all sorts of ways I've never yet to use
either feature.  They would be good to have, but stability in a
filesystem is much more useful.

I'm biased of course: if LogFS were stable and well tested, I'd be
using it right now in my embedded thingy - and that doesn't even
bother with uids :-)

-- Jamie
