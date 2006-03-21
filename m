Received: from relais.videotron.ca ([24.201.245.36])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLiVX-0002v7-W1
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 15:10:53 +0000
Received: from xanadu.home ([74.56.105.38]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWH0048FGTN8400@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 10:10:35 -0500 (EST)
Date: Tue, 21 Mar 2006 10:10:35 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <44200D27.2060404@intel.com>
To: "Alexey, Korolev" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.64.0603211002250.3631@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.64.0603101044290.3274@localhost.localdomain>
	<44200D27.2060404@intel.com>
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

On Tue, 21 Mar 2006, Alexey, Korolev wrote:

> > But the thing is, if you look at get_chip(), you'll see that nothing can
> > go and erase another flash sector when a write is suspended.  In other
> > words, completion of a write operation always has priority on any erase
> > attempt.  So the problem you're describing may not be due to any erase
> > delay occurring in another thread.
> > 
> Oh. Seems if XIP while write is happened get chip will not allow to erase?

An erase request will never proceed if a write operation is pending.  
And this is true whether you have XIP or not.  The rational is that 
writes are significantly faster than erases so they should complete 
before any erase is started.


Nicolas
