Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BBwWi-0007uq-Qy
	for linux-mtd@lists.infradead.org; Fri, 09 Apr 2004 14:58:37 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: John Lewis <john@lewistotle.net>
In-Reply-To: <6.0.1.1.2.20040408011048.022daec0@mailhost.dolphinage.com>
References: <E1BBAmq-00077a-ED@pentafluge.infradead.org>
	 <6.0.1.1.2.20040408011048.022daec0@mailhost.dolphinage.com>
Content-Type: text/plain
Message-Id: <1081518700.4799.218.camel@tubarao>
Mime-Version: 1.0
Date: 09 Apr 2004 07:51:41 -0600
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: proposed patch for 16-bit AMD/Atmel flash chips
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-04-08 at 02:26, John Lewis wrote:

> After going through the code for the driver, I noticed that, in many cases, 
> the bit-width sent to cfi_send_gen_cmd() was assumed to be 8 bit. This 
> likely works for most people, but it would not work for me and my 16-bit 
> flash until I changed the code as shown below.

Noted that the patch changes CFI_DEVICETYPE_X8 -> cfi->device_type. 
This change *looks* good and seems to make sense, but it does have some
problems.  Historically, I made the *same* change for revision 1.80 -
which was later reverted in revision 1.91.

cfi_send_gen_cmd() does some "scaling" of addresses with respect to the
device_type passed in.  The device_type is passed to
cfi_build_cmd_addr() which returns "cmd_ofs * type * interleave".
It seems that some chips *don't* need this and some chips *do* need
this.

The pool of FLASH chips is large.  Some manufacturers put subtle
differences into their chips that cause them to be less standard than
other chips - which can vary from chip-to-chip manufactured by the
*same* manufacturer (a certain manufacturer with the initials S. S. T.
comes to mind).  Sometimes a fix for one chip causes destabilization for
another chip - even though they should both be the same command set.

David Vrabel has been doing a good job of fixing some of the coding
problems in cfi_cmdset_0002.c.  Unfortunately, he has "fixed" some
things that are essential for certain chips and now the chips no longer
work.  It's hard for one person with a limited test pool of devices to
certify that the fix works everywhere.  It's short-sighted to add or
remove something because it "works for me" (yes, I've been guilty of
this same thing).  It's short sighted to change something because it's
"only needed for one chip" - that one chip might have a larger user base
than the six chips that need it the other way.  It's even hard for
several people with a larger pool of devices to verify a change across
all of the devices.

I think a different way of managing the code (at least
cfi_cmdset_0002.c) is needed, or that it needs to be written in a
different way so that tweaks can be put in for individual chips - maybe
a blacklist that sets up some function pointers or offsets.  It's
obviously not a good solution to spin off a new cfi_cmdset_0002.c for
every chip that has a subtle difference when everything else is the
same.

I've been toying with some different ideas, but I haven't had time to
put anything into action.  I'm hoping I stir some peoples thought so
that I get some replies and we can put together a fix that will be more
flexible.

BTW - John, thanks for the patch.  It gave me a good opportunity to
bring up something that has been problematic.

-- 
Thayne Harbaugh
Linux Networx
