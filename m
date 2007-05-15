Received: from nic.netdirect.ca ([216.16.235.2] helo=rubicon.netdirect.ca)
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HnyrY-0004ax-D8
	for linux-mtd@lists.infradead.org; Tue, 15 May 2007 16:22:57 +0100
Date: Tue, 15 May 2007 11:21:56 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: MikeW <mw_phil@yahoo.co.uk>
Subject: Re: When to use mtd.h or mtd-user.h
In-Reply-To: <loom.20070515T170629-855@post.gmane.org>
Message-ID: <Pine.LNX.4.64.0705151118590.6528@localhost.localdomain>
References: <loom.20070515T170629-855@post.gmane.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 15 May 2007, MikeW wrote:

> I note some applications for running in userspace say:
> #include <linux/mtd/mtd.h>
> and some say
> #include <mtd/mtd-user.h>
>
> Which is the recommended usage, and why ?

i'm not even sure where that first header file would be coming from.
it's not part of glibc, and it's not created as part of the sanitized
headers by the kernel.  are you sure you've seen that in someone's
*userspace* code?  and the inclusion worked?

in any event, it's that second header file that's correct.

rday
-- 
========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
========================================================================
