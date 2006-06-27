Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FvKjN-0007Un-Nu
	for linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 17:04:31 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J1J006O9EJ8JYG0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 17:04:21 -0400 (EDT)
Date: Tue, 27 Jun 2006 17:04:20 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: [PATCH]Fixes of performance and stability issues in CFI driver.
In-reply-to: <1151438714.6394.232.camel@pmac.infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
Message-id: <Pine.LNX.4.64.0606271701120.28771@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.56.0606271335001.21751@pentafluge.infradead.org>
	<Pine.LNX.4.64.0606271222570.28771@localhost.localdomain>
	<1151433983.6394.230.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0606271454150.28771@localhost.localdomain>
	<1151438714.6394.232.camel@pmac.infradead.org>
Cc: linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@pentafluge.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 27 Jun 2006, David Woodhouse wrote:

> On Tue, 2006-06-27 at 15:16 -0400, Nicolas Pitre wrote:
> > > I'm not sure I follow that argument. cfi_udelay() is used in basically
> > > the same circumstances by other chip drivers, so why not do it there
> > > instead of open-coding it?
> > 
> > The code simply ends up being simpler. 
> 
> OK, fine. If someone could send me a tested version with an appropriate
> commit comment and Signed-off-by:, or better still stick it in a git
> tree for me to pull from, I'll add it to my tree.

I'll wait for Alexey's testing and confirmation since he evidently has 
the test bench ready and knows what results to expect.


Nicolas
