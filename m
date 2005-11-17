Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EcpFK-0005A4-FZ
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2005 14:16:40 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IQ4000JB5JGILD0@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 17 Nov 2005 14:16:28 -0500 (EST)
Date: Thu, 17 Nov 2005 14:16:28 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <4D6E93075B31154298572E6B73CA849D015E4CAB@noida-mail.bbnet.ad>
To: Achin Gupta <achin.gupta@conexant.com>
Message-id: <Pine.LNX.4.64.0511171414230.14287@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <4D6E93075B31154298572E6B73CA849D015E4CAB@noida-mail.bbnet.ad>
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: RE: Crash while accessing Intel 28F128 flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 17 Nov 2005, Achin Gupta wrote:

> Hi,
> I am using Linux kernel version 2.6.11.12. I am not sure about the version of MTD. However, i checked out the code from CVS yesterday i.e. 14th Nov. I used the "patchkernel.sh" script to patch my kernel code using the "copy" option instead of the symlinks.There are no additional modifications to the kernel.
> Also, during boot-up the Flash device is being detected correctly using the "cfi_probe" method. However, upon performing any read/write operation on the Flash, the "mtd_close" crashes.

Well... I just can't reproduce your problem here.

I'm afraid you'll have to investigate by yourself.


> ________________________________
> 
> From: Nicolas Pitre [mailto:nico@cam.org]
> Sent: Wed 11/16/2005 10:37 PM
> To: Achin Gupta
> Cc: MTD mailing list
> Subject: Re: Crash while accessing Intel 28F128 flash
> 
> 
> 
> On Wed, 16 Nov 2005, Achin Gupta wrote:
> 
> > Hi,
> > I am consistently getting a crash in the "mtd_close" routine whenever I
> > try performing any read/write operation on an Intel NOR flash chip on my
> > harwdare. I have been trying to run utilities like "flash_info",
> > "mtd_debug", "flash_erase" & all of them crash with the following stack
> > backtrace :-
> 
> What kernel version?
> 
> What MTd version?
> 
> What additional modifications to your kernel if any?
> 
> 
> Nicolas
> 
> 
> 
> 
> 
> 
> ********************** Legal Disclaimer ****************************
> "This email may contain confidential and privileged material for the sole use of the intended recipient.  Any unauthorized review, use or distribution by others is strictly prohibited.  If you have received the message in error, please advise the sender by reply email and delete the message. Thank you."
> **********************************************************************
> 
> 


Nicolas
