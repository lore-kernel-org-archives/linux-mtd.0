Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOdcU-0005vF-37
	for linux-mtd@lists.infradead.org; Wed, 29 Mar 2006 11:34:08 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWW00792E0SXH80@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 29 Mar 2006 11:34:04 -0500 (EST)
Date: Wed, 29 Mar 2006 11:34:04 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <442943A3.6060807@intel.com>
To: "Alexey, Korolev" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.64.0603291125480.14923@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.64.0603101044290.3274@localhost.localdomain>
	<44200D27.2060404@intel.com>
	<Pine.LNX.4.64.0603211002250.3631@localhost.localdomain>
	<442943A3.6060807@intel.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] cfi: Fixup of write errors on XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 28 Mar 2006, Alexey, Korolev wrote:

> Nicolas,
> 
> I've made some more investigations for the write errors issue on XIP.
> The issue takes place when I attempt to write some data to one chip and erase
> data from another.

Ahhhh !

> I'm afraid that this issue can be easily reproduced in case of system
> overload.

... and more than one flash chip.

> I found two possible ways for fixing this issue:
> 1. Which has been sent before.
> Add lines in waiting cycle of do_write_buffer.
> 
> 2. Fixup in xip_udelay function.
> xip_udelay already check's the status. So this function will not wait more
> than required.

I think both solutions, although they fix this particular problem, are 
not addressing the fundamental issue which is that the current code 
structure to cope with XIP and non-XIP is becoming a total mess.  In 
fact the whole timeout/error handling should be factored out of every 
functions into a sincle subfunction, actually one for XIP and one for 
non-XIP.  This way the non-XIP case would not have to care about chip 
state changing since that cannot happen, and the timeout treshold would 
be more accurately computed as well.


Nicolas
