Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FHjZ1-00076w-5C
	for linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 10:30:04 -0500
Received: from xanadu.home ([66.131.142.204]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IVX00C8W4DR2TE0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 10 Mar 2006 10:29:52 -0500 (EST)
Date: Fri, 10 Mar 2006 10:29:51 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <20060310135431.62022.qmail@web86903.mail.ukl.yahoo.com>
To: Adam Ward <adamward2005@yahoo.co.uk>
Message-id: <Pine.LNX.4.64.0603101027230.3274@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <20060310135431.62022.qmail@web86903.mail.ukl.yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Read only forced on jffs2 by mtd layer?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 10 Mar 2006, Adam Ward wrote:

> My jffs2 image will mount as ro.
> If I do 'mount / -o remount,rw' it appears to be
> happy, but I soon get told 'Read-only file system' if
> I try anything too presumptuous!
> 
> As running mount still declares it as read/write, I am
> assuming the error is with the mtd block driver
> refusing to co-operate.
> 
> Is there anything you guys can suggest that I should
> pay closer attention to?

Did you unlock the flash partition with the flash_unlock tool?
Some NOR flash parts initialize themselves with all sectors locked by 
default.


Nicolas
