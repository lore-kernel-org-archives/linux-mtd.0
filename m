Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HHRlt-0002Kq-1E
	for linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 16:34:40 -0500
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0JDH00CEP2LN9U30@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 14 Feb 2007 16:34:36 -0500 (EST)
Date: Wed, 14 Feb 2007 16:34:35 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: [SPAM]  Re: P30 flash left in read status mode after a write
In-reply-to: <45D37D96.4010501@ringle.org>
To: Jon Ringle <jon@ringle.org>
Message-id: <Pine.LNX.4.64.0702141632470.1757@xanadu.home>
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_tH45bYubgREaXxsDLb84pA)"
References: <45D35A6F.3060203@ringle.org>
	<20070214205601.GB20486@lazybastard.org> <45D37D96.4010501@ringle.org>
Cc: linux-mtd@lists.infradead.org,
	=?UTF-8?B?SsO2cm4gRW5nZWw=?= <joern@lazybastard.org>
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

--Boundary_(ID_tH45bYubgREaXxsDLb84pA)
Content-type: TEXT/PLAIN; charset=utf-8
Content-transfer-encoding: 8BIT

On Wed, 14 Feb 2007, Jon Ringle wrote:

> Jörn Engel wrote:
> > On Wed, 14 February 2007 13:52:31 -0500, Jon Ringle wrote:
> >   
> >> This did indeed seem to fix the problem, but I'm not sure if I might 
> >> inadvertently be causing some side effect. I believe that I might be 
> >> taking a slight performance hit to consecutive jffs2 write operations 
> >> because now each write operation will need to spend more cycles putting 
> >> the flash in to a write mode.
> >>     
> >
> > If the performance hit concerns you, you could set a timer instead of
> > changing the chip state.  Only if the timer expires - which means that
> > consecutive writes are a non-issue - do you change the chip state.
> >
> >   
> Using a timer sounds like a good idea. I'll keep it in mind. I'm not 
> sure yet whether I'm concerned about the performance hit as I haven't 
> profiled the impact yet. Has anyone got any data that shows what kind of 
> improvement jffs2 write operations get with this optimization in place 
> to leave flash in read status mode?

It should be fairly minimal.  Probably less than 5% difference.


Nicolas

--Boundary_(ID_tH45bYubgREaXxsDLb84pA)--
