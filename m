Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FLN1x-0007cX-4i
	for linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 11:15:04 -0500
Received: from xanadu.home ([74.56.105.38]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IWF0070OP4QJUI0@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 20 Mar 2006 11:14:50 -0500 (EST)
Date: Mon, 20 Mar 2006 11:14:50 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <61285.58.105.227.226.1142567282.squirrel@58.105.227.226>
To: yh@bizmail.com.au
Message-id: <Pine.LNX.4.64.0603201110240.3631@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <61285.58.105.227.226.1142567282.squirrel@58.105.227.226>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Intel P30 flash support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 17 Mar 2006, yh@bizmail.com.au wrote:

> Hello,
> 
> Thanks for your response. I am sorry, it was my mistake, I was asking for
> Intel P30 flash. But, if you did mean that the MTD should support Intel
> P30 flash, could you please let me know which version of MTD suports P30?
> I am currently using mtd_20011217, what the patch I need, or do I have to
> use the latest version of the MTD?

Please realize that mtd_20011217 means it was released on december 17th 
of 2001, i.e. more than four years ago.  I'm not even sure P30 flash 
existed back then.

Using the latest version should obviously be the first thing to try.


Nicolas
