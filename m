Received: from modemcable084.137-200-24.mtl.mc.videotron.ca ([24.200.137.84] helo=xanadu.home)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DBFF-0006nX-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 21:40:06 +0100
Date: Thu, 21 Jun 2001 16:40:34 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: Frederic Giasson <fgiasson@mediatrix.com>,
        "=?iso-8859-1?Q?'K=E1ri_Dav=ED=F0sson'?=" <kd@flaga.is>,
        "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2_scan_medium effor 
In-Reply-To: <23724.993155508@redhat.com>
Message-ID: <Pine.LNX.4.33.0106211638420.30096-100000@xanadu.home>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


On Thu, 21 Jun 2001, David Woodhouse wrote:

>
> nico@cam.org said:
> >  Then what I would suggest is that you play tricks with offsets in
> > your map driver so the firmware sector appears at the end and the two
> > separate parts are seen as being contigous.
>
> Not in the map driver - it may confuse the probe code and break the 'magic'
> unlock addresses, etc. Do it in the partition code - rather than using the
> generic partition code, use your own wrappers which do similar translation
> and then pass through to the 'master' device's methods.

If you see the example code I posted I made sure the first half of addresses
aren't modified especially not to confuse the probe code...  Don't know
about unlock addresses.


Nicolas
