Received: from relais.videotron.ca ([24.201.245.36])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HHQAc-0005uH-Ig
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 19:52:08 +0000
Received: from xanadu.home ([74.56.106.175]) by VL-MO-MR004.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0JDG00HIIXNYBVA0@VL-MO-MR004.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 14:47:59 -0500 (EST)
Date: Wed, 14 Feb 2007 14:47:58 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: P30 flash left in read status mode after a write
In-reply-to: <45D35A6F.3060203@ringle.org>
To: Jon Ringle <jon@ringle.org>
Message-id: <Pine.LNX.4.64.0702141443270.1757@xanadu.home>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <45D35A6F.3060203@ringle.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 14 Feb 2007, Jon Ringle wrote:

> I am running Linux 2.6.16.29 and I've 
> found that whenever a write is done to the jffs2 filesystem that flash 
> is left in read status mode and anything trying to do a read of flash 
> directly reads only 0x0080. Reading from an mtd device seems to fix the 
> problem.

This is done on purpose.  And as you deduced yourself this is so to 
avoid ...

> taking a slight performance hit to consecutive jffs2 write operations 
> because now each write operation will need to spend more cycles putting 
> the flash in to a write mode.
> 
> Any advice would be appreciated.

First, why is this a problem for you?


Nicolas
