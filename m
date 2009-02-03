Received: from smtp117.sbc.mail.sp1.yahoo.com ([69.147.64.90])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LUOIK-0007f4-IR
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 16:38:43 +0000
From: David Brownell <david-b@pacbell.net>
To: Geert Uytterhoeven <Geert.Uytterhoeven@sonycom.com>,
	Josh Boyer <jwboyer@gmail.com>
Subject: Re: [patch 2.6.29-rc3] NAND: =?iso-8859-1?q?=A0fix_broken_debug?=
	messages
Date: Tue, 3 Feb 2009 08:38:38 -0800
References: <200902021813.20748.david-b@pacbell.net>
	<20090203123507.GB2296@yoda.jdub.homelinux.org>
	<alpine.LRH.2.00.0902031345180.21407@vixen.sonytel.be>
In-Reply-To: <alpine.LRH.2.00.0902031345180.21407@vixen.sonytel.be>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Message-Id: <200902030838.38296.david-b@pacbell.net>
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Reply-To: dbrownell@users.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 03 February 2009, Geert Uytterhoeven wrote:
> > >-            DEBUG(MTD_DEBUG_LEVEL0, "nand_read_oob: "
> > >+            DEBUG(MTD_DEBUG_LEVEL0, "do_nand_write_oob: "
> > 
> > This is wrong too.  The function is called 'nand_do_write_oob'.

That's what happens sometimes when you edit patches by hand.
Originally I just changed "read" to "write", then I noticed
there was "do" in there ... obviously, it got inserted in
the wrong place.  ;)


> > Which leads me to wonder why we aren't doing something like:
> > 
> >       DEBUG(MTD_DEBUG_LEVEL0, "%s: <message>\n", __func__);

That would be sensible.

 
> Or use
> 
>     #define pr_fmt(fmt)  "%s: " fmt, __func__
> 
> at the top of the file, and start using the official pr_*() routines?

Yeah, DEBUG should be treated globally as a reserved
symbol.  Ever notice how dev_dbg() misbhaves in MTD
code?  Ditto pr_dbg(), but that's rarely the right thing
to use when there's a device node in hand.  Yeech.

"Now" (i.e. after rc1 and well before rc-last) would
be a good time to send a big patch changing all the
debug messaging to something less aggressively counter
to the core debug messaging convention of Linux...

- Dave
