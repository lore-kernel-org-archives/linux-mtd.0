Received: from gprs189-60.eurotel.cz ([160.218.189.60] helo=spitz.ucw.cz)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HoP2i-0000Ez-99
	for linux-mtd@lists.infradead.org; Wed, 16 May 2007 15:20:21 -0400
Date: Wed, 16 May 2007 19:17:18 +0000
From: Pavel Machek <pavel@ucw.cz>
To: J Engel <joern@lazybastard.org>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070516191718.GB4577@ucw.cz>
References: <20070515151919.GA32510@lazybastard.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20070515151919.GA32510@lazybastard.org>
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

Hi!

In kernel fsck....

> --- /dev/null	2007-04-18 05:32:26.652341749 +0200
> +++ linux-2.6.21logfs/fs/logfs/progs/fsck.c	2007-05-15 00:54:22.000000000 +0200
> @@ -0,0 +1,332 @@
> +/*
> + * fs/logfs/prog/fsck.c	- filesystem check
> + *
> + * As should be obvious for Linux kernel code, license is GPLv2
> + *
> + * Copyright (c) 2005-2007 Joern Engel
> + *
> + * In principle this could get moved to userspace.  However it might still
> + * make some sense to keep it in the kernel.  It is a pure checker and will
> + * only report problems, not attempt to repair them.
> + */

Is there version that repairs?

> +	/* Some segments are reserved.  Just pretend they were all valid */
> +	reserved = btree_lookup(&super->s_reserved_segments, segno);
> +	if (reserved)
> +		return 0;
> +
> +	err = wbuf_read(sb, dev_ofs(sb, segno, 0), sizeof(sh), &sh);
> +	BUG_ON(err);

BUG is not right thing to do for media error.

> +/*
> + * fs/logfs/prog/mkfs.c	- filesystem generation
> + *
> + * As should be obvious for Linux kernel code, license is GPLv2
> + *
> + * Copyright (c) 2005-2007 Joern Engel
> + *
> + * Should get moved to userspace.
> + */

Indeed. 

> +
> +#if 0
> +/* rootdir */

Please just delete it, not comment it out like this.

							Pavel
-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
