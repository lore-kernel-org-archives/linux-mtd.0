Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JK2kY-0004wj-Qs
	for linux-mtd@lists.infradead.org; Wed, 30 Jan 2008 02:32:36 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JVF0019HR1UBBB0@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 21:32:18 -0500 (EST)
Date: Tue, 29 Jan 2008 21:32:18 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH] MTD: Intel StrataFlash P33 is locked on bootup
In-reply-to: <6934efce0801291813n68b796f5j5f3db1e90eb174a9@mail.gmail.com>
Message-id: <alpine.LFD.1.00.0801292127400.22568@xanadu.home>
References: <1201631809-32193-1-git-send-email-hskinnemoen@atmel.com>
	<6934efce0801291813n68b796f5j5f3db1e90eb174a9@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, Paolo.Santos@devoteam.com,
	David Woodhouse <dwmw2@infradead.org>,
	Justin Treon <justin_treon@yahoo.com>,
	Haavard Skinnemoen <hskinnemoen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 29 Jan 2008, Jared Hulbert wrote:

> > Add appropriate fixups for all the devices listed in the Intel P33
> > data sheet.
> 
> Please don't merge this patch.
> 
> We worked on a patch that will unlock _all_ intel parts that have this
> behavior in a more acceptable way.  It was discussed back in November.
> 
> I thought Justin had finished running this through review but I don't
> see it now.  So I thought you had Acked this patch Nicolas, I can't
> find where.  Was I mistaken?

I did, but the MTD mailing list has a tendency to require moderator 
aproval for some of my emails.

> Anyway I added it to my freshly updated git tree
> "git://git.infradead.org/users/jehulber/mtd.git" (with a possibly
> unearned Acked-by: Nicolas Pitre)

Please consider it was acked.


Nicolas
