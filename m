Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYmVa-0004WD-PD
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 12:05:05 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IYC0031C7C3NM60@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 12:04:51 -0400 (EDT)
Date: Wed, 26 Apr 2006 12:04:51 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
To: "Belyakov, Alexander" <alexander.belyakov@intel.com>
Message-id: <Pine.LNX.4.64.0604261157030.18520@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 26 Apr 2006, Belyakov, Alexander wrote:

> JFFS2 (and not only JFFS2) does not work on top of concatenated MTD
> device in case of NAND and Sibley chips due to missing
> concat_block_isbad(), concat_block_markbad(), concat_writev() and
> concat_writev_ecc() functions. If anyone cares - the patch below fixes
> that issue.

That won't work with Sibley.  You must call the underlying devices with 
writev() as well, using the appropriate vector for each device, and only 
once per subdevice.  Sibley flash must write everything all at once with 
a single writev call.


Nicolas
