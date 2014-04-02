Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVOMx-0001mj-1V
 for linux-mtd@lists.infradead.org; Wed, 02 Apr 2014 16:50:33 +0000
Date: Wed, 2 Apr 2014 18:50:02 +0200
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger-Tang <davidm@egauge.net>
Subject: Re: [PATCH v4 1/5] mtd: nand: Detect Micron flash with on-die ECC
 (aka "internal ECC") enabled.
Message-ID: <20140402164933.GC11339@book.gsilab.sittig.org>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-2-git-send-email-davidm@egauge.net>
 <20140401063958.GA6400@brian-ubuntu>
 <CALnQHM1Z048h0BvbhAwussYH27mdV9kO6Q=74Wqa1CHpsbi4+w@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC059F@DBDE04.ent.ti.com>
 <CACwUX0O2NZYU+FysS46Rtvpm2C5G06yee1C1rSM2CEm0XEo-_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACwUX0O2NZYU+FysS46Rtvpm2C5G06yee1C1rSM2CEm0XEo-_A@mail.gmail.com>
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

On Wed, 2014-04-02 at 09:07 -0600, David Mosberger-Tang wrote:
> 
> Pekon,
> 
> On Wed, Apr 2, 2014 at 1:27 AM, Gupta, Pekon <pekon@ti.com> wrote:
> 
> > You have to consider multiple scenarios here (as Brian also suggested).
> >
> > (1) If a system does _not_ boot from NAND, instead it enables NAND
> > only in kernel (like for rootfs). Then you need a mechanism to
> > enable/disable on-die ECC in the kernel, the same way boot-loader does.
> 
> Why?  Like I said before, on-die ECC does not get turned on "accidentally".
> Furthermore, it is always *safe* to use on-die ECC,  unlike the ECC provided
> by the platform-specific drivers.

I feel that the motivation has been given in previous messages.

You appear to assume that the complete system runtime is using
the same ECC method.  This just need not be a necessity, and need
not be the best idea either.

Any component in the startup sequence may choose any arbitrary
method to deal with the chips.  It's perfectly fine for a ROM
loader to enable the on-die-ECC which was off after POR.  It's
fine for a bootloader to find the chip in this state and keep
using this method.  And it's fine for an operating system to find
the chip in this state yet picking a different ECC method, and
thus disabling the on-die-ECC within the chip.

All that is required for data integrity is that those who work
with data do so by the method which was used to create that data.
Still you can have boot files in areas that use on-die-ECC, and
have a filesystem in an area that uses software or hardware ECC
different from the on-die-ECC method, using the OOB as they
please.

Just provide tools, don't encode policy.  Leave it to the users
what they want to do.  Don't assume that everybody is in the very
same situation which you are in, or shares your priorities.

> > (2) If a boot-loader, has enabled on-die ECC, but kernel driver supports
> > even higher ECC scheme, then you need a hook in driver to allow user
> > to 'disable' this feature.
> 
> Does that really happen in practice?

Simple answer: Yes.  The example was given, when hardware or
software support methods which are stronger than the chip's ECC,
or evenly strong yet preferrable for some other reason (like
speed, or existing support and portability or general
availability).


Please take a step back, take a deep breath, and try to see why
people are asking questions.  It's not that you are being
rejected or need to "defend" something.  It's the opposite that
we are trying to create something that scratches more than one
personal itch, and serves other people's needs as well as yours.
And please accept that thorough review isn't free either, yet
spending the work upfront is cheaper than maintaining things that
don't fit, or have stuff rot and cause problems.  Getting ignored
is worse than receiving feedback and help. :)  Try to see the
benefit of it, please.  People spend their time on communicating
with you, nobody's fighting (it's easier to turn around and do
something else, if emotions get in the way and hinder progress --
we are all busy after all).


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
