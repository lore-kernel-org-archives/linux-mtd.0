Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D4nZF-0000mu-GH
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2005 17:04:14 -0500
Received: from xanadu.home ([24.200.213.96]) by VL-MO-MR010.ip.videotron.ca
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTP id <0ICH0005KMN0A5@VL-MO-MR010.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 25 Feb 2005 17:04:12 -0500 (EST)
Date: Fri, 25 Feb 2005 17:04:08 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <421F9B58.60109@voxware.com>
To: "Craig A. Vanderborgh" <craigv@voxware.com>
Message-id: <Pine.LNX.4.62.0502251700220.25966@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <421F9B58.60109@voxware.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Kernel Panic w/Xscale (PXA255) & 2.6.10
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 25 Feb 2005, Craig A. Vanderborgh wrote:

> Our platform is a PXA-255 based SBC.  It is running kernel 2.6.10 *extremely*
> well, with one exception - when accessing a VIRGIN jffs2 filesystem, we get a
> kernel panic.  We cannot get past this unless we reload our 2.4.27 kernel and
> let it do the initial JFFS2 setup stuff.  After reloading kernel 2.6.10,
> everything is then okay.  Just the uninitialized JFFS2 is a problem.

Are you using L18 Intel flash? If so you should consider applying the 
latest fixes from MTD CVS.


Nicolas
