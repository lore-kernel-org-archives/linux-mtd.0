Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUzKh-0002du-JW
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 14:06:33 +0000
Date: Tue, 1 Apr 2014 16:06:07 +0200
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [REV3] mtd: nand: Prepare for Micron on-die ECC controller
 support.
Message-ID: <20140401140607.GQ2775@book.gsilab.sittig.org>
References: <1396025800-18444-1-git-send-email-davidm@egauge.net>
 <20140329131642.GA2775@book.gsilab.sittig.org>
 <CALnQHM2whsLcM_4q76Skgjj4oVjgAbofX7iAVBgqZkPOu5UWEQ@mail.gmail.com>
 <20140331194522.GL2775@book.gsilab.sittig.org>
 <CALnQHM29vnXxpFNEe1rtgc1-yuSSy8e6hSna-WJ+=YvzZJ1pAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALnQHM29vnXxpFNEe1rtgc1-yuSSy8e6hSna-WJ+=YvzZJ1pAQ@mail.gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-03-31 at 14:58 -0600, David Mosberger wrote:
> 
> Gerhard,
> 
> On Mon, Mar 31, 2014 at 1:45 PM, Gerhard Sittig <gsi@denx.de> wrote:
> 
> > Isn't there the ONFI SETFEATURE request?  And don't you use this
> > very request to disable and enable chip internal ECC support, to
> > get the raw (uncorrected) bits after bitflips were detected?  So
> > I understand that there is support to enable this mode at will,
> > and we already have (or will have) code to do so.
> >
> > If we consider disabling on-die-ECC support when we find it
> > enabled and know it's not what the user wants to run, then the
> > next logical step might be to support enabling this feature if
> > the user wants it and the chip doesn't have it enabled at this
> > point in time.
> >
> > So I guess the buffers should get allocated as soon as the chip
> > supports on-die-ECC.  (While the allocation should only get
> > introduced in the phase where the raw-read and bitflip count gets
> > added.)
> 
> The ECC-mode of the driver never changes.
> Sure, what you describe could be implemented as an additional feature
> in the future (I don't have any plans to do so since it makes little sense to
> me, as no other ECC-mode uses the layout of the on-die-controller).

I'm sorry, it appears that I was unspecific or sloppy there.

The situation is that there are several phases in the setup:
There is the identification of the chip and its capabilities, an
optional adjustment of pre-set values according to the
information that was gathered, and then the "final" setup after
everything was evaluated.  This (in my mind) maps to the sequence
of nand_scan_ident(), nand_scan_tail(), and what might glue them
together.

So yes, after the ECC scheme was determined, it won't change for
the remainder of the driver's runtime.  Yet there is the code in
your submission that a pre-set software ECC would "turn into"
on-die-ECC if the chip was found in a specific state.  There has
been discussion that we might not blindly follow the chip's
current state, but involve a user's request and potentially
adjust what was found if it's different.

So please drop my thought of chaning ECC mode at runtime, after
the initial determination of which mode to use.  This really does
not apply.  The only change that might occur would be to
enable/disable the chip's feature if it differs from the user's
request, and this would happen before resource allocation in
nand_scan_tail().  At the very point of resource allocation, the
situation is stable.  Having determined the use of on-die-ECC
here at this point in time has involved all of the "supported",
"enabled", and "wanted" conditions.

I'm sorry for the confusion that I may have caused.


> To be honest, I'm a bit confused: on the one hand, you're asking me to
> simplify the patches into smaller pieces, on the other you seem to ask
> for new features.

This might look like a conflict only at first glance.  But I feel
that you can construct larger things with higher confidence if
you can inspect and verify individual pieces which you then snug
together.  If you know that the foundation is solid, you can put
more stuff on it with less worry.  Nothing in the kernel started
out at the complexity that's present now.  So no, splitting a
large patch into a series does not conflict with growing more
features within the resulting series.


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
