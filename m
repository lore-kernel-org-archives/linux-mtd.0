Received: from relais.videotron.ca ([24.201.245.36])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IgLWm-00059c-Ve
	for linux-mtd@lists.infradead.org; Fri, 12 Oct 2007 15:30:16 +0100
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-0.15 (built Feb  9 2007))
	with ESMTP id <0JPS004RPYSFFM60@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 12 Oct 2007 10:26:40 -0400 (EDT)
Date: Fri, 12 Oct 2007 10:26:26 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Alexey Korolev <akorolev@infradead.org>
Subject: Re: Recursion in CFI driver. Is it really necessary to have.
In-reply-to: <Pine.LNX.4.64.0710121451280.15790@pentafluge.infradead.org>
Message-id: <alpine.LFD.0.9999.0710121014410.19446@xanadu.home>
References: <Pine.LNX.4.64.0710121451280.15790@pentafluge.infradead.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 12 Oct 2007, Alexey Korolev wrote:

> Hi,
> 
> We encountered some problems with CFI driver (cfi_cmdset_0001.c).
> Investigation showed that it is rather possible that the issues are related to
> recursion call of get_chip function. I am just wondering if it really needed
> to have the recursion in CFI drivers. 

For Sibley it is.

> From point of Flash commands the maximum
> necessary depth of recursive calls should be 1. (To handle suspend operatons).

Recursion should happen 1) only on Sibley, and 2) only when concurrent 
writing and/or erasing happens.

In that context, suspend happens only for erase.

> What do you think of little modification here?

Please be more clear about your problem first.


Nicolas
