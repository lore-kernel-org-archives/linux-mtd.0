Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1Fc0ix-0000y7-A1
	for linux-mtd@lists.infradead.org; Fri, 05 May 2006 09:52:05 -0400
Received: from xanadu.home ([74.56.108.184]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IYS009XDP6NDMB0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 05 May 2006 09:51:59 -0400 (EDT)
Date: Fri, 05 May 2006 09:51:59 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <F048F58F304F0040BC3E937DE4E231E701F9F027@NNSMSX401>
To: "Belyakov, Alexander" <alexander.belyakov@intel.com>
Message-id: <Pine.LNX.4.64.0605050949490.28543@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <F048F58F304F0040BC3E937DE4E231E701F9F027@NNSMSX401>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support (revised)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 5 May 2006, Belyakov, Alexander wrote:

> This patch adds concat_writev(), concat_writev_ecc(),
> concat_block_isbad(), concat_block_markbad() functions to make
> concatenation layer compatible with Sibley and NAND chips.
> 
> The patch has been changed to use writev() functions of underlying
> devices.

>From a quick glance at the writev part it looks much better than your 
former version.


Nicolas
