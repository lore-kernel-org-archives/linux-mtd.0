Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17aDSB-0000nT-00
	for <linux-mtd@lists.infradead.org>; Thu, 01 Aug 2002 11:45:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <FA06AA2C99BCD511951200005A99441001E3ECD8@irvexch1.sextantifs.com> 
References: <FA06AA2C99BCD511951200005A99441001E3ECD8@irvexch1.sextantifs.com> 
To: "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
Cc: jffs-dev@axis.com
Subject: Re: jffs2_scan_eraseblock() - errors 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 01 Aug 2002 11:44:54 +0100
Message-ID: <30325.1028198694@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

(Moved to JFFS list).

Allen.Curtis@Thales-IFS.com said:
> > real	47.258s

>  With the CRC patch:
>  real	36.7s

OK, that's respectable. I just need to finish the other part of the change 
-- to actually check the CRCs later on, rather than just leaving them 
unchecked. Make sure you take the patch back out of your tree now :)

We may get a little bit more of a speedup when we do that too, as we'll also
stop building up the fragment lists for every inode on mount, but in fact
that code wasn't showing up very high on the profile last time I looked.

> PS: The version of scan.c we are using is 1.57. The patch note was for
> 1.51.2.3.

Doesn't matter; it's basically the same in both branches. 

I suspect that if you profile it now you'll find the most time is taken in 
your flash map driver's copy_from routine or memcpy. 

I need to implement the XIP scheme which will also allow JFFS2 to directly
access the flash through a kind of pageable ioremap (which handles the times
when the flash is in a mode other than read mode correctly) instead of 
having to read into a buffer and work from that. We get to use caches and 
burst reads from flash at that point too.

--
dwmw2
