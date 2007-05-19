Received: from static-71-162-243-5.phlapa.fios.verizon.net ([71.162.243.5]
	helo=grelber.thyrsus.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HpSjA-0001Lf-4r
	for linux-mtd@lists.infradead.org; Sat, 19 May 2007 13:28:25 -0400
From: Rob Landley <rob@landley.net>
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: [PATCH] LogFS take three
Date: Sat, 19 May 2007 13:26:30 -0400
References: <20070515151919.GA32510@lazybastard.org>
	<200705190215.36334.rob@landley.net>
	<Pine.LNX.4.61.0705191119330.9015@yvahk01.tjqt.qr>
In-Reply-To: <Pine.LNX.4.61.0705191119330.9015@yvahk01.tjqt.qr>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200705191326.31932.rob@landley.net>
Cc: Evgeniy Polyakov <johnpol@2ka.mipt.ru>, Albert Cahalan <acahalan@gmail.com>,
	Greg KH <greg@kroah.com>,
	=?iso-8859-1?q?J=F6rn_Engel?= <joern@lazybastard.org>,
	linux-kernel@vger.kernel.org, Ingo Oeser <ioe-lkml@rameria.de>,
	Pekka Enberg <penberg@cs.helsinki.fi>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Saturday 19 May 2007 5:24 am, Jan Engelhardt wrote:
> 
> On May 19 2007 02:15, Rob Landley wrote:
> >> > +
> >> > +static inline struct logfs_inode *LOGFS_INODE(struct inode *inode)
> >> > +{
> >> > +	return container_of(inode, struct logfs_inode, vfs_inode);
> >> > +}
> >> 
> >> Do these need to be uppercase?
> >
> >I'm trying to keep it clear in my head...
> >
> >When do you need to say __always_inline and when can you get away with 
> >just saying "static inline"?
> 
> When using "static inline", the compiler may ignore the inline keyword 
> (it's just a hint), and leave the function as a standalone function.
> 
> When CONFIG_FORCED_INLINING is active, and it is by default, inline is 
> always substituted by __always_inline, to be on the safe side. Some code 
> needs to be always inline; but not all code has been checked whether it 
> is safe to go from __always_inline to inline.

I've seen patches go by using __always_inline directly.  Is there some 
janitorial effort to examine each instance of the the inline keyword and 
either replace it with "__always_inline" or remove it?

Right now "inline" seems to be about as useful as the "register" keyword.  You 
don't feed hints to a compiler like gcc, you hit it with a two-by-four and 
thumbscrews if you want to get its' attention.

Rob
