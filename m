Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IqI5i-0002pZ-MJ
	for linux-mtd@lists.infradead.org; Thu, 08 Nov 2007 19:51:29 -0500
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JR7008XVRPBCJI1@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 08 Nov 2007 19:51:11 -0500 (EST)
Date: Thu, 08 Nov 2007 19:51:11 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on power
	up
In-reply-to: <752503.63551.qm@web43139.mail.sp1.yahoo.com>
Message-id: <alpine.LFD.0.9999.0711081950250.21255@xanadu.home>
References: <752503.63551.qm@web43139.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 8 Nov 2007, Justin Treon wrote:

> Adding the ability to unlocking all Intel flash that is locked on power up. 
> Currently only Intel P30 flash is unlocked.  All Intel flash is locked on power up.

What if you wanted for some of your flash partitions to remain locked?


Nicolas
