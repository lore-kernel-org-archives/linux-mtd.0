Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IrhDO-0003Pt-4T
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 16:53:13 -0500
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JRE0093FXOM5W30@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 16:43:34 -0500 (EST)
Date: Mon, 12 Nov 2007 16:43:34 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Justin Treon <justin_treon@yahoo.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on power
	up
In-reply-to: <201904.92834.qm@web43134.mail.sp1.yahoo.com>
Message-id: <alpine.LFD.0.9999.0711121630090.21255@xanadu.home>
References: <201904.92834.qm@web43134.mail.sp1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 Nov 2007, Justin Treon wrote:

> > What about a new partition flag then?  When set the unlock method would 
> > be called on the corresponding partition if the partition is not already 
> > marked read-only.
> > 
> 
> I think that a partition flag is a good idea, but the mtd partition should be
> unlocked by defualt if it is not read only and adding the flag will keep it locked.
> 
> How do you think it could be done that others would be accepting of 
> it?  I do not think everyone would like to see another flag that is so 
> close to a read only flag.

Don't make the unlocking the default.  The flag has simply to be set 
explicitly for the unlock to occur.  Few reasons for this:

1) you don't know if a particular flash requires unlocking after boot, 
   (most flash models don't) so doing it unconditionally is wasteful;

2) the partition might as well be meant to remain locked, except for 
   rare occasions when its content is updated (think bootloader) meaning
   it cannot be marked read-only;

3) this is a security feature and should not be bypassed "by
   default", and therefore the auto-unlock should be dependent on an 
   explicit flag so people needing it will have the opportunity to think 
   about it.


Nicolas
