Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19QOR6-0001su-Ja
	for <linux-mtd@lists.infradead.org>; Thu, 12 Jun 2003 10:32:00 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Pieter Grimmerink <mailinglists@grimmerink.nl>
In-Reply-To: <200306111831.07071.mailinglists@grimmerink.nl>
References: <200306111831.07071.mailinglists@grimmerink.nl>
Message-Id: <1055410352.2097.446.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 12 Jun 2003 10:32:33 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Errors compiling current mtd CVS version
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-06-11 at 17:31, Pieter Grimmerink wrote:
> I just checked out the mtd+jffs2 patches from CVS, and patched them into a 
> 2.4.19 kernel tree, using patchin.sh.
> 
> Now I've enabled mtd & jffs2, and try to compile.
> 
> #include <linux/init.h> seems to be missing in mtd/chips/amd_flash.c
> (errors on __init and __exit)

Fixed; thanks for the report. Why are you using amd_flash.c and not the
non-deprecated drivers?

> #include <linux/sched.h> seems to be missing in fs/jffs2/write.c
> (error on 'current')

That one is unexpected -- can you give more details? 

> If I have jffs enabled as well, it failes because Makefile.common is missing.

> When I also patch in zlib (using patchin.sh), Makefile.common is missing both 
> in zlib_inflate and zlib_deflate.

I've removed JFFS from patchin.sh, and also made the script substitute
Makefile.common for Makefile only if it's actually present (untested). 

-- 
dwmw2
