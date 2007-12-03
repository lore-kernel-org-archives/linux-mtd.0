Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IzEqf-0003jR-Ct
	for linux-mtd@lists.infradead.org; Mon, 03 Dec 2007 17:12:56 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JSH00BVFH51JAG0@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 03 Dec 2007 12:12:38 -0500 (EST)
Date: Mon, 03 Dec 2007 12:12:37 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: massimo cirillo <maxcir@gmail.com>
Subject: Re: [PATCH][CFI] Wrong cache invalidation bug fix
In-reply-to: <62cbdcd90712030834o28f9126fs841b3b9d46324fb7@mail.gmail.com>
Message-id: <alpine.LFD.0.99999.0712031210180.9605@xanadu.home>
References: <62cbdcd90712030834o28f9126fs841b3b9d46324fb7@mail.gmail.com>
Cc: joern@logfs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 3 Dec 2007, massimo cirillo wrote:

> Hi,
> 
> We encountered the problem with cache invalidation in CFI driver. It
> causes corruptions of data read from flash.
> 
> The problem is investigated. The original code performs cache
> invalidation from "adr" to "adr + len" in do_write_buffer(). Since len
> and adr could be updated in the code before invalidation - it causes
> improper setting of cache invalidation regions.
> The following patch fixes this problem. This patch has been verified
> on our OMAP based platform.
> Could you please acknowledge and commit this patch?
> 
> Thanks a lot.
> 
> Signed-off-by Massimo Cirillo <maxcir@gmail.com> and Giuseppe D'Eliseo
> <giuseppedeliseo@gmail.com>

This patch is correct.  However, to make it more obvious, please change 
the used variable in the XIP_INVAL_CACHED_RANGE() call used in the same 
function as well.

With that change you can add "Acked-by: Nicolas Pitre <nico@cam.org>".


Nicolas
