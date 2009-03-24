Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LlurT-0002Sf-WD
	for linux-mtd@lists.infradead.org; Tue, 24 Mar 2009 00:51:30 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KGZ00EB0JPNKBF1@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 23 Mar 2009 20:51:23 -0400 (EDT)
Date: Mon, 23 Mar 2009 20:51:23 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Daniel Mack <daniel@caiaq.de>
Subject: Re: [PATCH] pxa2xx-flash.c: fix memory leak
In-reply-to: <20090324003145.GC13851@buzzloop.caiaq.de>
Message-id: <alpine.LFD.2.00.0903232051040.26337@xanadu.home>
References: <1237853943-6472-1-git-send-email-daniel@caiaq.de>
	<alpine.LFD.2.00.0903232021480.26337@xanadu.home>
	<20090324003145.GC13851@buzzloop.caiaq.de>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 24 Mar 2009, Daniel Mack wrote:

> On Mon, Mar 23, 2009 at 08:22:26PM -0400, Nicolas Pitre wrote:
> > > Signed-off-by: Daniel Mack <daniel@caiaq.de>
> > > Cc: Nicolas Pitre <nico@cam.org>
> > 
> > Acked-by: Nicolas Pitre <nico@cam.org>
> 
> Thanks - any idea which channel to choose to make it go mainline?

The MTD tree.


Nicolas
