Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16OpwH-0006h1-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2002 00:52:57 +0000
To: David Woodhouse <dwmw2@infradead.org>
Cc: Alice Hennessy <ahennessy@mvista.com>, linux-mtd@lists.infradead.org
Subject: Re: Problem with cfi_probe.c and Intel chip
References: <3C3E1515.CD99EB0@mvista.com> <17564.1010702853@redhat.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 10 Jan 2002 18:03:24 -0700
In-Reply-To: <17564.1010702853@redhat.com>
Message-ID: <m3sn9d8zs3.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

David Woodhouse <dwmw2@infradead.org> writes:

> ahennessy@mvista.com said:
> > I just tried the latest code  and discovered that the command used
> > before the query command  and also to return to read mode  in
> > cfi_probe.c  has been changed to 0xF0 - it used to be 0xFF .  The
> > board I'm testing on has an Intel strata chip and is not responding to
> > the query.  If I use 0xFF, then everything is fine.  AMD chips seems
> > to be happy with either command (
> 
> I seem to recall someone complaining before, and having to change it. But 
> if so, I don't see why it only came in with the jedec-probe stuff. 

O.k. I just did a skim through the JEDEC 21c section 3.5 assuming most
of the time flash designers would follow a variant of the standard.
And at various points both 0xF0 and 0xFF are mentioned as a reset,
with perhaps a little preference towards 0xFF.

The probe algorithm is pretty much reset the chip, and then read it's
id.  So there isn't a lot that can be simplified there.

We are pretty much probing for the jedec 1 byte command set
(intel) or the jedec multibyte command set (amd).  With respect to the
single byte command set, we are already sending the nonsense byte
multibyte prefix and expecting it to ignore it.  So expecting the
multibyte command set to ignore the reset for the single byte command
set is reasonable.  

If we run into further problems we can detangle the single byte and
the multibyte command set probes.
 
> Three options:
> 1. Change it to 0xFF and see if anyone screams.
Well I just did remove 0xFF and see if anyone screams, I should have
looked closer but I thought it was an intel specific then, and nothing
I have required it.  Though I admit 0xFF was not there originally.

> 2. Make it send both 0xFF and 0xF0.
So far I haven't heard of any breakage with this combination.  And now
that I have double checked and discovered in some weird fashion that
they are both equally valid, it is probably safe to leave them both
in.  At least until we hear of further breakage.

> 3. Make it work out what type of chip it's talking to and send the _right_ 
> 	command.
This suffers from extreme catch22.



Eric
