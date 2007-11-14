Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Is6vs-00068e-0y
	for linux-mtd@lists.infradead.org; Tue, 13 Nov 2007 20:20:51 -0500
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JRH000442E8R760@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Tue, 13 Nov 2007 20:20:32 -0500 (EST)
Date: Tue, 13 Nov 2007 20:20:32 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on power
	up
In-reply-to: <230770.87331.qm@web43138.mail.sp1.yahoo.com>
Message-id: <alpine.LFD.0.9999.0711132015240.21255@xanadu.home>
References: <230770.87331.qm@web43138.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 Nov 2007, Justin Treon wrote:

> I think the following patch should satisfy everyones concerns.  It has 
> not been tested.
> 
> 1. I have added a kernel config option to enable/disable automatic 
> unlocking.

Please get rid of it.  This risk creating more confusion for little 
gain.  Just always do the fixup.

Everything looks fine otherwise, but make sure it is tested please.


Nicolas
