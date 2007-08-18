Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IMET5-0003mu-Mm
	for linux-mtd@lists.infradead.org; Fri, 17 Aug 2007 22:55:16 -0400
Received: from xanadu.home ([74.56.106.175]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0JMY0065U83S4U90@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Fri, 17 Aug 2007 22:55:04 -0400 (EDT)
Date: Fri, 17 Aug 2007 22:55:02 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: cfi_cmdset_0001: Use max value for block erase timeout?
In-reply-to: <53923.212.247.11.6.1187380929.squirrel@webmail.sys.kth.se>
To: =?iso-8859-15?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
Message-id: <alpine.LFD.0.999.0708172251360.16727@xanadu.home>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_laU2UhK8AolanA2s2JtYnQ)"
References: <53923.212.247.11.6.1187380929.squirrel@webmail.sys.kth.se>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--Boundary_(ID_laU2UhK8AolanA2s2JtYnQ)
Content-type: TEXT/PLAIN; charset=iso-8859-15
Content-transfer-encoding: 8BIT

On Fri, 17 Aug 2007, Anders Grafström wrote:

> I am experiencing a problem with a failing erase block on
> Intel J3 Strataflash. After receiving the block erase command,
> the chip returns to ready state after 25 seconds (see errata #2).
> The status register says 0xA0.
> 
> The MTD block erase timeout is set to the typical value which is 1 second.
> So the 1 second timeout happens. JFFS2 puts the block on the bad_list and
> continues, but all operations on the chip within the next 24 seconds will fail
> since get_chip() will timeout. JFFS2 is not happy.
> 
> Increasing the block erase timeout to 32 seconds solves the problem for me.
> A couple of warnings about the failed block erase is printed but JFFS2 has
> no errors.
> 
> This brings the question of which timeout value should be used for block erase
> (and word write and buffer write), typical or max?

Ideally, the typical value should be used for the command wait delay.
The max value should be the hard limit after which a timeout error is 
signaled.


Nicolas

--Boundary_(ID_laU2UhK8AolanA2s2JtYnQ)--
