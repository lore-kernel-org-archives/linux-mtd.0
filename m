Received: from nz-out-0506.google.com ([64.233.162.237])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1IrzkC-0007QR-4Q
	for linux-mtd@lists.infradead.org; Tue, 13 Nov 2007 12:40:18 -0500
Received: by nz-out-0506.google.com with SMTP id z3so1181975nzf
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Nov 2007 09:40:09 -0800 (PST)
Message-ID: <6934efce0711130940w69b566edvae62760a746588d2@mail.gmail.com>
Date: Tue, 13 Nov 2007 09:40:07 -0800
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Nicolas Pitre" <nico@cam.org>
Subject: Re: [PATCH 1/1] MTD: Unlocking all Intel flash that is locked on
	power up
In-Reply-To: <alpine.LFD.0.9999.0711121822050.21255@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <201904.92834.qm@web43134.mail.sp1.yahoo.com>
	<alpine.LFD.0.9999.0711121630090.21255@xanadu.home>
	<6934efce0711121450r553ba5fo12f6c676fa79c3fe@mail.gmail.com>
	<alpine.LFD.0.9999.0711121822050.21255@xanadu.home>
Cc: linux-mtd@lists.infradead.org, Justin Treon <justin_treon@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> How do you update your bootloader from Linux but protect it from
> possible corruptions otherwise?  By recompiling your kernel?  _That_ is
> nutty.

Okay, okay I get your point.  Yep that is a problem.  But one that the
MTD_STUPID_LOCK can be unset to deal will if the
fixup_use_powerup_lock() is changed to be more intelligent.  Oh that
and the name should be MTD_AUTO_UNLOCK or something like that.

> > If someone want's to implement some complex
> > scheme to prevent errant programs, they can use the userspace tools
> > and readonly flag for that.
>
> Well, actually I just looked and the core already has the code to
> auto-unlock flash when they have the MTD_STUPID_LOCK bit set.
>
> So... if one partition should _not_ be automatically unlocked, it just
> has to put MTD_STUPID_LOCK in its flag_mask.  I'd have prefered if the
> auto-unlock was explicitly enabled instead of its prevention, but
> whatever.

Right, Justin is just extending that functionality which today only
kicks in for one size of one chip family.

So to clarify the disagreement you feel the default behavior should be
to have your writeable partitions default to locked, we feel the
default behavior should be to have your writeable partitions default
to unlocked.  Does that sum it up the core philshopical disagreement
here?

> > The mailinglist gets an awful lot of
> > questions that have pointlessly locked partitions as the core.
>
> I guess it's only a matter of properly flagging flash models that do
> power up locked then.

Actually there is a bit in struct cfi_pri_intelext.FeatureSupport&32
that I _think_ tells us this is one of the flex lock parts that does
the nonvolatile locking.  I'll have to confirm that.  That could be
used in the function fixup_use_powerup_lock() in cfi_cmdset_0001.c to
be more intelligent than just unlocking everything.  Would that be
better?
