Received: from filer.fsl.cs.sunysb.edu ([130.245.126.2])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IiyeF-0003qy-QC
	for linux-mtd@lists.infradead.org; Fri, 19 Oct 2007 21:40:51 +0100
Date: Fri, 19 Oct 2007 16:37:28 -0400
Message-Id: <200710192037.l9JKbSsh018946@agora.fsl.cs.sunysb.edu>
From: Erez Zadok <ezk@cs.sunysb.edu>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: [BLOCK2MTD] WARNING: at kernel/lockdep.c:2331 lockdep_init_map() 
In-reply-to: Your message of "Fri, 19 Oct 2007 21:14:33 +0200."
	<20071019191433.GK26913@lazybastard.org>
Cc: linux-mtd@lists.infradead.org, Erez Zadok <ezk@cs.sunysb.edu>,
	dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <20071019191433.GK26913@lazybastard.org>, =?utf-8?B?SsO2cm4=?= Engel writes:
> On Fri, 19 October 2007 13:53:40 -0400, Erez Zadok wrote:
> >
> > I've been having this problem for some time with mtd, which I use to mount
> > jffs2 images (for unionfs testing).  I've seen it in several recent major
> > kernels, including 2.6.24.  Here's the sequence of ops I perform:
> 
> Since when roughly?  2.6.20ish?  Before?

I was able to verify that the same lockdep warning comes up in every major
kernel all the way back to 2.6.18.  Of course the line number in lockdep.c
that causes the warning is slightly different from kernel to kernel, but the
stack trace is the same.

Hope this helps.

Erez.
