Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HoPAQ-0000RB-TA
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 15:28:41 -0400
Date: Wed, 16 May 2007 21:23:32 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070516192329.GG8113@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<20070516191718.GB4577@ucw.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070516191718.GB4577@ucw.cz>
Cc: akpm@osdl.org, Evgeniy Polyakov <johnpol@2ka.mipt.ru>,
	Albert Cahalan <acahalan@gmail.com>, Greg KH <greg@kroah.com>,
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

On Wed, 16 May 2007 19:17:18 +0000, Pavel Machek wrote:
> 
> In kernel fsck....
> 
> > --- /dev/null	2007-04-18 05:32:26.652341749 +0200
> > +++ linux-2.6.21logfs/fs/logfs/progs/fsck.c	2007-05-15 00:54:22.000000000 +0200
> > @@ -0,0 +1,332 @@
> > +/*
> > + * fs/logfs/prog/fsck.c	- filesystem check
> > + *
> > + * As should be obvious for Linux kernel code, license is GPLv2
> > + *
> > + * Copyright (c) 2005-2007 Joern Engel
> > + *
> > + * In principle this could get moved to userspace.  However it might still
> > + * make some sense to keep it in the kernel.  It is a pure checker and will
> > + * only report problems, not attempt to repair them.
> > + */
> 
> Is there version that repairs?

No.

> BUG is not right thing to do for media error.

I know.  Top 3 items of my todo list are:
- Handle system crashes
- Add second journal
- Error handling

> > +
> > +#if 0
> > +/* rootdir */
> 
> Please just delete it, not comment it out like this.

That will get resurrected, even before the move to userspace.  I had to
change the filesystem format for compression support and this is an
artifact of the transition phase.

Jörn

-- 
Ninety percent of everything is crap.
-- Sturgeon's Law
