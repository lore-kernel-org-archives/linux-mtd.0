Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15DB2G-0006mU-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 21:26:40 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <Pine.LNX.4.33.0106211347570.30096-100000@xanadu.home> 
References: <Pine.LNX.4.33.0106211347570.30096-100000@xanadu.home> 
To: Nicolas Pitre <nico@cam.org>
Cc: Frederic Giasson <fgiasson@mediatrix.com>,
    "=?iso-8859-1?Q?'K=E1ri_Dav=ED=F0sson'?=" <kd@flaga.is>,
    "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: Re: jffs2_scan_medium effor 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 21 Jun 2001 21:31:48 +0100
Message-ID: <23724.993155508@redhat.com>
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

nico@cam.org said:
>  Then what I would suggest is that you play tricks with offsets in
> your map driver so the firmware sector appears at the end and the two
> separate parts are seen as being contigous.

Not in the map driver - it may confuse the probe code and break the 'magic' 
unlock addresses, etc. Do it in the partition code - rather than using the 
generic partition code, use your own wrappers which do similar translation 
and then pass through to the 'master' device's methods.

--
dwmw2
