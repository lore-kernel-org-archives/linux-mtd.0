Received: from h1.handhelds.org ([192.58.209.91] helo=handhelds.org)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1Bzgh0-0000EF-EY
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2004 15:10:51 -0400
Message-ID: <412B92A9.4060901@joshuawise.com>
Date: Tue, 24 Aug 2004 15:10:33 -0400
From: Joshua Wise <joshua@joshuawise.com>
MIME-Version: 1.0
To: Todd Poynor <tpoynor@mvista.com>
References: <412B53F9.5030006@bergeron.com>	<1093360220.14552.12475.camel@hades.cambridge.redhat.com>
	<412B8EF2.8050606@mvista.com>
In-Reply-To: <412B8EF2.8050606@mvista.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: Can jffs2 support XIP extensions?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> For the kernel boot time it's true that boot times tend to be dominated 
> by the decompression step.  I measured this on a couple platforms at one 
> point (some of my measurements may have been in the OLS presentation, 
> not sure).  I didn't directly measure kernel boot times of an 
> uncompressed non-XIP kernel, but would roughly guess an uncompressed 
> non-XIP kernel would boot to /sbin/init in only about a few tens of 
> milliseconds more time (I'm guessing about the increased time to copy an 
> uncompressed tetx image to RAM) than an XIP kernel on a 266MHz PowerPC 
> 405LP, and 168MHz OMAP ARM 926T is probably similar (it seems to better 
> deal with the cache effects).
Also remember that on many systems, flash is a lot slower than RAM, so 
it is entirely possible that an XIP kernel would actually be _SLOWER_ 
than non-XIP!

joshua
