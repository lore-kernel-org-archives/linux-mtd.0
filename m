Received: from filer.fsl.cs.sunysb.edu ([130.245.126.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JBbEj-0003vw-Li
	for linux-mtd@lists.infradead.org; Sun, 06 Jan 2008 19:32:52 +0000
Date: Sun, 6 Jan 2008 14:11:47 -0500
Message-Id: <200801061911.m06JBldW020012@agora.fsl.cs.sunysb.edu>
From: Erez Zadok <ezk@cs.sunysb.edu>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [PATCH] block2mtd lockdep_init_map warning 
In-reply-to: Your message of "Sun, 06 Jan 2008 14:13:43 +0100."
	<20080106131343.GA3120@lazybastard.org>
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, mingo@redhat.com,
	linux-mtd@lists.infradead.org, Erez Zadok <ezk@cs.sunysb.edu>,
	dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <20080106131343.GA3120@lazybastard.org>, =?utf-8?B?SsO2cm4=?= Engel writes:
> Maybe it is not obvious that I maintain this driver and would like to be
> kept on Cc:.  Will send a patch to fix that shortly.

I was looking in MAINTAINERS, and you weren't listed on the main MTD section
as a maintainer.  Perhaps an update?

If you get a patch, I'd love to test it.

> On Sun, 6 January 2008 02:17:32 -0500, Erez Zadok wrote:
[...]
> > In lieu of a better fix, is this patch acceptable?
> 
> Not for me.  I don't mind if you keep such a hack until a proper
> solution if found in your private tree.  But it is a horrible solution
> to a problem introduced elsewhere.

Yup, that's what I figured.  I'll keep this ugly hack but I won't push it to
my unionfs tree on kernel.org.

> Ingo, Peter, does either of you actually care about this problem?  In
> the last round when I debugged this problem there was a notable lack of
> reaction from either of you.

The problem appears to be an interaction of two components--module loading
and lockdep--that's perhaps why it wasn't given enough attention.

I run a lot of regression tests w/ unionfs on top of many different file
systems, and monitoring for all sorts of problems, including lockdep
warnings.  So it's frustrating that each time I get to test w/ jffs2, I get
this lockdep warning, and lockdep shuts down until a reboot.  That kills my
automated testing and masks out possible other lockdep problems (that's why
I wanted to at least have some workaround).  Other lockdep problems I
reported with other subsystems had been fixed within days; this one,
unfortunately, has lingered for a while.  So if a fix can be made in a
reasonable time-frame, I'd really appreciate it.

Thanks,
Erez.
