Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LKytb-0002mO-AI
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 17:42:15 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KD500DHIYIEPFB0@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 08 Jan 2009 12:42:14 -0500 (EST)
Date: Thu, 08 Jan 2009 12:42:14 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Wolfgang Grandegger <wg@grandegger.com>
Subject: Re: [PATCH] CFI: remove major/minor version check for command set
	0x0002
In-reply-to: <4966310C.1010103@grandegger.com>
Message-id: <alpine.LFD.2.00.0901081237460.6007@xanadu.home>
References: <496624A4.3050808@grandegger.com>
	<alpine.LFD.2.00.0901081134110.6007@xanadu.home>
	<1231433317.28362.77.camel@macbook.infradead.org>
	<4966310C.1010103@grandegger.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 Jan 2009, Wolfgang Grandegger wrote:

> David Woodhouse wrote:
> > On Thu, 2009-01-08 at 11:47 -0500, Nicolas Pitre wrote:
> >>> The NOR Flash memory K8P2815UQB from Samsung uses the major version
> >>> number '0', which seems to be unusual but not illegal, IIUC. This
> >>> patch removes the major-minor version check to get this Flash memory
> >>> supported as well.
> >> Instead of removing the test entirely, I'd suggest you augment it with 
> >> the manufacturer ID (cfi->mfr and cfi->id).  Or better yet, just use 
> >> that information to fix up the version number to something sensible.
> > 
> > Couldn't you use a quirk to do the latter?
> 
> The major/minor version number is not used anywhere else and therefore a
> quirk seems to be overkill too me.

Please look again.  Searching for "MinorVersion" turns up a couple 
places.

A quirk is not overkill at all.  To the contrary it's the whole purpose 
of quirks to fix up things like this.

Although, in this case, I think quirks are evaluated only after the CFI 
version is tested, meaning that the fixup might have to be done inline.


Nicolas
