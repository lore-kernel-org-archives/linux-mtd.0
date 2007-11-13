Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Irnhr-0000MV-DX
	for linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 23:49:06 -0500
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([74.56.106.175]) by VL-MH-MR002.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0JRF002C8HDMLXE1@VL-MH-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Mon, 12 Nov 2007 23:48:58 -0500 (EST)
Date: Mon, 12 Nov 2007 23:48:58 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: Jared Hulbert <jaredeh@gmail.com>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on power
	up
In-reply-to: <6934efce0711121450r553ba5fo12f6c676fa79c3fe@mail.gmail.com>
Message-id: <alpine.LFD.0.9999.0711121822050.21255@xanadu.home>
References: <201904.92834.qm@web43134.mail.sp1.yahoo.com>
	<alpine.LFD.0.9999.0711121630090.21255@xanadu.home>
	<6934efce0711121450r553ba5fo12f6c676fa79c3fe@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org, Justin Treon <justin_treon@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 12 Nov 2007, Jared Hulbert wrote:

> > Don't make the unlocking the default.  The flag has simply to be set
> > explicitly for the unlock to occur.  Few reasons for this:
> >
> > 1) you don't know if a particular flash requires unlocking after boot,
> >    (most flash models don't) so doing it unconditionally is wasteful;
> >
> > 2) the partition might as well be meant to remain locked, except for
> >    rare occasions when its content is updated (think bootloader) meaning
> >    it cannot be marked read-only;
> >
> > 3) this is a security feature and should not be bypassed "by
> >    default", and therefore the auto-unlock should be dependent on an
> >    explicit flag so people needing it will have the opportunity to think
> >    about it.
> 
> Why is it a security feature to have a partition marked as r/w come up
> as locked?  That's nutty.

How do you update your bootloader from Linux but protect it from 
possible corruptions otherwise?  By recompiling your kernel?  _That_ is 
nutty.

> If someone want's to implement some complex
> scheme to prevent errant programs, they can use the userspace tools
> and readonly flag for that.

Well, actually I just looked and the core already has the code to 
auto-unlock flash when they have the MTD_STUPID_LOCK bit set.

So... if one partition should _not_ be automatically unlocked, it just 
has to put MTD_STUPID_LOCK in its flag_mask.  I'd have prefered if the 
auto-unlock was explicitly enabled instead of its prevention, but 
whatever.

> The mailinglist gets an awful lot of
> questions that have pointlessly locked partitions as the core.

I guess it's only a matter of properly flagging flash models that do 
power up locked then.


Nicolas
