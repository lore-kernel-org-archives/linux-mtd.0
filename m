Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JjjJD-0003kk-Pu
	for linux-mtd@lists.infradead.org; Wed, 09 Apr 2008 23:02:28 +0000
MIME-version: 1.0
Content-type: multipart/mixed; boundary="Boundary_(ID_nHtVGNq0gZ1eV3YBHKdxwg)"
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JZ2007L7YO2MW30@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 09 Apr 2008 19:02:26 -0400 (EDT)
Date: Wed, 09 Apr 2008 19:02:26 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Joakim Tjernlund <Joakim.Tjernlund@transmode.se>
Subject: RE: [PATCH] Fix of broken state in CFI driver caused by FL_SHUTDOWN
In-reply-to: <009801c89a95$09ae4680$1d0ad380$%Tjernlund@transmode.se>
Message-id: <alpine.LFD.1.00.0804091901270.2947@xanadu.home>
References: <Pine.LNX.4.64.0804040949090.2042@pentafluge.infradead.org>
	<20080404093359.GA4338@logfs.org>
	<Pine.LNX.4.64.0804041310550.10410@pentafluge.infradead.org>
	<009801c89a95$09ae4680$1d0ad380$%Tjernlund@transmode.se>
Cc: haokexin@gmail.com, 'Alexey Korolev' <akorolev@infradead.org>,
	=?ISO-8859-15?Q?'J=F6rn_Engel'?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
	dwmw2@infradead.org
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

--Boundary_(ID_nHtVGNq0gZ1eV3YBHKdxwg)
Content-type: TEXT/PLAIN; charset=iso-8859-1
Content-transfer-encoding: 8BIT

On Thu, 10 Apr 2008, Joakim Tjernlund wrote:

> > -----Original Message-----
> > From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf
> > Of Alexey Korolev
> > Sent: den 4 april 2008 14:22
> > To: Jörn Engel
> > Cc: nico@cam.org; haokexin@gmail.com; dwmw2@infradead.org; akpm@linux-foundation.org; linux-
> > mtd@lists.infradead.org
> > Subject: Re: [PATCH] Fix of broken state in CFI driver caused by FL_SHUTDOWN
> > 
> > Hi
> > 
> > 
> >  CFI driver in 2.6.24 kernel is broken. Not so intensive read/write operations cause incomplete writes
> > which lead to kernel panics in JFFS2.
> >  We investigated the issue - it is caused by bug in FL_SHUTDOWN parsing code. Sometimes chip returns -
> > EIO as if it is in FL_SHUTDOWN state when it should wait in FL_PONT (error in order of conditions).
> > 
> > The following patch fixes the bug in state parsing code of CFI.
> > Also I've added comments to notify developers if they want to add new case in future.
> > Please include it.
> > 
> > Signed-off-by: Alexey Korolev <akorolev@infradead.org>
> > Reviewed-By: Joern Engel <joern@logfs.org>
> 
> Acked-By: Joakim Tjernlund <Joakim.Tjenrlund@transmode.se>
> 
> Guys, I think you should sent this directly to Linus as David seems
> unavailable ATM. It should really go into 2.6.25

It is already in mainline.  See commit fb6d080c.


Nicolas

--Boundary_(ID_nHtVGNq0gZ1eV3YBHKdxwg)--
