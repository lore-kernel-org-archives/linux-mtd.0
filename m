Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Oqsz-0006kT-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2002 01:53:38 +0000
Message-ID: <3C3E48B6.C9FF834D@mvista.com>
Date: Thu, 10 Jan 2002 18:06:46 -0800
From: Alice Hennessy <ahennessy@mvista.com>
MIME-Version: 1.0
To: "Eric W. Biederman" <ebiederman@lnxi.com>
CC: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: Problem with cfi_probe.c and Intel chip
References: <3C3E1515.CD99EB0@mvista.com> <17564.1010702853@redhat.com> <m3sn9d8zs3.fsf@DLT.linuxnetworx.com>
Content-Type: text/plain; charset=us-ascii
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

"Eric W. Biederman" wrote:

> David Woodhouse <dwmw2@infradead.org> writes:
>
> > ahennessy@mvista.com said:
> > > I just tried the latest code  and discovered that the command used
> > > before the query command  and also to return to read mode  in
> > > cfi_probe.c  has been changed to 0xF0 - it used to be 0xFF .  The
> > > board I'm testing on has an Intel strata chip and is not responding to
> > > the query.  If I use 0xFF, then everything is fine.  AMD chips seems
> > > to be happy with either command (
> >
> > I seem to recall someone complaining before, and having to change it. But
> > if so, I don't see why it only came in with the jedec-probe stuff.
>
> O.k. I just did a skim through the JEDEC 21c section 3.5 assuming most
> of the time flash designers would follow a variant of the standard.
> And at various points both 0xF0 and 0xFF are mentioned as a reset,
> with perhaps a little preference towards 0xFF.
>
> The probe algorithm is pretty much reset the chip, and then read it's
> id.  So there isn't a lot that can be simplified there.
>
> We are pretty much probing for the jedec 1 byte command set
> (intel) or the jedec multibyte command set (amd).  With respect to the
> single byte command set, we are already sending the nonsense byte
> multibyte prefix and expecting it to ignore it.  So expecting the
> multibyte command set to ignore the reset for the single byte command
> set is reasonable.
>
> If we run into further problems we can detangle the single byte and
> the multibyte command set probes.
>
> > Three options:
> > 1. Change it to 0xFF and see if anyone screams.
> Well I just did remove 0xFF and see if anyone screams, I should have
> looked closer but I thought it was an intel specific then, and nothing
> I have required it.  Though I admit 0xFF was not there originally.
>
> > 2. Make it send both 0xFF and 0xF0.
> So far I haven't heard of any breakage with this combination.  And now
> that I have double checked and discovered in some weird fashion that
> they are both equally valid, it is probably safe to leave them both
> in.  At least until we hear of further breakage.
>
> > 3. Make it work out what type of chip it's talking to and send the _right_
> >       command.
> This suffers from extreme catch22.
>
> Eric
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

>From reading the Intel spec,  I don't see any reason putting the chip into read
array
mode (0xff) would be necessary before the query command so I'm not sure why
my board is having problems.  Even if the bios has issued a command to the
flash
between power up and cfi_probe,  I don't think read array command is necessary
between commands.
If my board is the only Intel with a problem, then I need to investigate it
further.

Alice
