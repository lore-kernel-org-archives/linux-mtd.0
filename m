Received: from ip68-7-112-74.sd.sd.cox.net ([68.7.112.74] helo=clpanic.kennet.coplanar.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16svyv-0004vY-00
	for <linux-mtd@lists.infradead.org>; Thu, 04 Apr 2002 02:24:05 +0100
Message-ID: <010d01c1db77$6062e690$7e0aa8c0@bridge>
From: "Jeremy Jackson" <jerj@coplanar.net>
To: "Eric W. Biederman" <ebiederman@lnxi.com>
Cc: <linuxbios@lanl.gov>, <linux-mtd@lists.infradead.org>
References: <00fd01c1db72$f225c200$7e0aa8c0@bridge> <m33cycnu7p.fsf@DLT.linuxnetworx.com>
Subject: Re: PIIX flashing woes with SST29EE010
Date: Wed, 3 Apr 2002 17:23:46 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

No I will need to patch it.  

I have been reading through
the source code of a DOS based flash utility, Uniflash (Pascal)
and it's probe routine appears to use both methods.
(it tries old method first BTW)
It works well (under DOS/FreeDOS) and supports a
surprising variety of chips and southbridges.

That's where I got the idea to try the old method.

I was just using an homemade one to try and figure out
what the problem was.  I'm looking at integrating it right
now.

Jeremy

----- Original Message ----- 
From: "Eric W. Biederman" <ebiederman@lnxi.com>
To: "Jeremy Jackson" <jerj@coplanar.net>
Cc: <linuxbios@lanl.gov>; <linux-mtd@lists.infradead.org>
Sent: Wednesday, April 03, 2002 5:11 PM
Subject: Re: PIIX flashing woes with SST29EE010


> "Jeremy Jackson" <jerj@coplanar.net> writes:
> 
> > (crossposted)
> > FYI,
> > 
> > A problem I was having that *appeared* to be a problem with
> > getting writes to the flash chip, wasn't
> > 
> > It turns out that SST's datasheet for SST29EE010 is incorrect.
> > It turns out that the part I have *doesn't* respond to "new" style
> > ID mode entry sequence, as indicated in the manual.
> > It only responds to the "old" AA 55 80 AA 55 60 sequence.
> > 
> > I should have a generic PIIX map driver for MTD soon now.
> 
> 
> So does jedec_probe work for you or do you need to patch it?
> 
> Eric
> 
