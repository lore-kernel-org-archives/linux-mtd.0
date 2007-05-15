Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Ho2UK-0007EV-KN
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 15:15:15 -0400
Date: Tue, 15 May 2007 21:10:46 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] LogFS take three
Message-ID: <20070515191046.GA1220@lazybastard.org>
References: <20070515151919.GA32510@lazybastard.org>
	<20070515183725.GA22003@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20070515183725.GA22003@uranus.ravnborg.org>
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

On Tue, 15 May 2007 20:37:25 +0200, Sam Ravnborg wrote:
> On Tue, May 15, 2007 at 05:19:20PM +0200, Jörn Engel wrote:
> > [ I have put everyone that gave comments to the last patch on Cc:.  Hope
> > that doesn't offend anyone. ]
> > 
> > 
> > Add LogFS, a scalable flash filesystem.
> 
> Have you run sparse on this code?

Several thousand times. :)

> I do not recall if you have written something about it.
> I do not see any obvious things sparse would catch (just browsing quickly)
> but it's always a good thing to do.

Absolutely! I added this line for sparse:
+#define __CHECK_ENDIAN__ 

Not sure how much of the kernel is endian-clean.  Logfs should be.

> +++ linux-2.6.21logfs/fs/logfs/progs/fsck.c     2007-05-15 00:54:22.000000000 +0200
> @@ -0,0 +1,332 @@
> +/*
> + * fs/logfs/prog/fsck.c        - filesystem check
> + *
> + * As should be obvious for Linux kernel code, license is GPLv2
> + *
> + * Copyright (c) 2005-2007 Joern Engel
> + *
> + * In principle this could get moved to userspace.  However it might still
> + * make some sense to keep it in the kernel.  It is a pure checker and will
> + * only report problems, not attempt to repair them.
> + */
> +#include "../logfs.h"
> +
> If potential userspace tools needs to include ../logfs.h then there is
> something that ought to be moved to include/linux/logfs.h instead.

There shouldn't be anything left in ../logfs.h that is needed for
userspace.  But the kernel fsck is lame and calls into functions like
iget(), which it pulls in from ../logfs.h.

Jörn

-- 
The only real mistake is the one from which we learn nothing.
-- John Powell
