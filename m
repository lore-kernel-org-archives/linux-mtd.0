Received: from mail.acc.umu.se ([130.239.18.156])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HpQVH-0007YD-MI
	for linux-mtd@lists.infradead.org; Sat, 19 May 2007 11:05:59 -0400
Date: Sat, 19 May 2007 16:45:56 +0200
From: David Weinehall <tao@acc.umu.se>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@lazybastard.org>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070519144556.GS11766@vasa.acc.umu.se>
References: <20070515151919.GA32510@lazybastard.org>
	<17994.1241.436841.681216@stoffel.org>
	<20070515191926.GB1220@lazybastard.org>
	<1179291255.2859.195.camel@shinybook.infradead.org>
	<20070516110933.GA5472@lazybastard.org>
	<20070516113434.GC20482@mail.shareable.org>
	<20070516115003.GD5472@lazybastard.org>
	<17995.2550.581854.8393@stoffel.org>
	<20070516135318.GK5472@lazybastard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070516135318.GK5472@lazybastard.org>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, John Stoffel <john@stoffel.org>,
	Jamie Lokier <jamie@shareable.org>, linux-kernel@vger.kernel.org,
	Ingo Oeser <ioe-lkml@rameria.de>, Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, Jan Engelhardt <jengelh@linux01.gwdg.de>,
	Greg KH <greg@kroah.com>, linux-fsdevel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 16, 2007 at 03:53:19PM +0200, J�rn Engel wrote:
> On Wed, 16 May 2007 09:41:10 -0400, John Stoffel wrote:
> > Jörn> On Wed, 16 May 2007 12:34:34 +0100, Jamie Lokier wrote:
> > 
> > Jörn> How many of you have worked for IBM before?  Vowels are not
> > evil. ;)
> > 
> > Nope, they're not.  I just think that LogFS isn't descriptive enough,
> > or more accurately, is the *wrong* description of this filesystem.  
> 
> That was the whole point.  JFFS2, the journaling flash filesystem, is a
> strictly log-structured filesystem.  LogFS has a journal.
> 
> It is also the filesystem that tries to scale logarithmically, as Arnd
> has noted.  Maybe I should call it Log2 to emphesize this point.  Log1
> would be horrible scalability.

So, log2fs...  Sounds great to me.

[snip]


Regards: David
-- 
 /) David Weinehall <tao@acc.umu.se> /) Northern lights wander      (\
//  Maintainer of the v2.0 kernel   //  Dance across the winter sky //
\)  http://www.acc.umu.se/~tao/    (/   Full colour fire           (/
