Received: from fish.redhat.com ([213.86.99.237]
	helo=executor.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19p2EL-0007z7-Q3
	for <linux-mtd@lists.infradead.org>; Tue, 19 Aug 2003 09:52:41 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: jon.hoekwater@spansion.com
In-Reply-To: <BCBC9D21763E5C42BEF10DC3BF958C9E05924FC8@txexmtab.amd.com>
References: <BCBC9D21763E5C42BEF10DC3BF958C9E05924FC8@txexmtab.amd.com>
Message-Id: <1061283143.9943.1154.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 19 Aug 2003 09:52:23 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: cfi_cmdset_0002.c support for erase suspend and resume
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-08-15 at 16:24 -0500, jon.hoekwater@spansion.com wrote:
> I noticed that support for erase suspend and resume
> is present in cfi_cmdset_0001.c but not in cfi_cmdset_0002.c.
> After reviewing the files, it seems like the same type
> solution could be applied to cfi_cmdset_0002.c for AMD/"AMD 
> like" devices.  Is this a correct assessment, or are there 
> some pitfalls that I have failed to see ?

As long as we don't try to do it on devices which don't support it, or
on devices which have bugs when we try it (the early Intel ones did), it
should be fine.

> I am adding support for the Am29LV640M.
> 
> I will add support for the three byte device ID and buffered
> writes.  Testing will be done on an Alchemy DbAU1500 using
> MontaVista Linux.
> 
> What do I need to do to become a contributing developer?

In the first instance, send code to the list and/or me. For
cfi_cmdset_0002 patches, also Cc Thayne Harbaugh since he seems to have
mostly volunteered himself to maintain it ;)

I fairly quickly get bored and start letting you commit stuff yourself
-- the CVS logs are more truthful that way and then I know who to blame
when you break it... :)

-- 
dwmw2
