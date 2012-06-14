Received: from a-pb-sasl-sd.pobox.com ([74.115.168.62]
 helo=sasl.smtp.pobox.com)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sf3SS-0008KO-BD
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2012 06:23:04 +0000
Message-ID: <1339654981.3257.7.camel@orca.stoopid.dyndns.org>
Subject: Re: Q: Cramfs Vs. Ubifs
From: Nathan Lynch <ntl@pobox.com>
To: Ran Shalit <ranshalit@gmail.com>
Date: Thu, 14 Jun 2012 01:23:01 -0500
In-Reply-To: <CAJ2oMhK1g2_HtZspi9S9-6K-FjKjCwCXnrUHHHkP4-3K0EGc9g@mail.gmail.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
 <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
 <CAJ2oMhLn-FNqXgdTOSamQry1BBm+Otu3PdjEPCyj2qsS-F_=QA@mail.gmail.com>
 <Pine.LNX.4.64.1206130851420.4247@lnxricardw.se.axis.com>
 <CAJ2oMhL4Y-=sfWTzKuFvqr2Ci9MiVGWHx8sHpJLoZz9wzcgF1Q@mail.gmail.com>
 <Pine.LNX.4.64.1206131656130.4247@lnxricardw.se.axis.com>
 <CAJ2oMhKGbvN5E9R_Ybw4OCDVtFq6sqhZ+R0qx68A_SzSLW-x5A@mail.gmail.com>
 <1339602380.32578.4.camel@doorstop.aus.2wire.com>
 <CAJ2oMhK1g2_HtZspi9S9-6K-FjKjCwCXnrUHHHkP4-3K0EGc9g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Ricard =?ISO-8859-1?Q?Wanderl=F6f?= <ricardw@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-06-14 at 08:37 +0300, Ran Shalit wrote:
> >> I wonder why I didn't find any information about disadvantage of using
> >> ubifs as root file system in embedded system in terms of access to
> >> flash during application life.
> >>
> >
> > This isn't an issue specific to UBIFS.  Look into mlock/mlockall if your
> > application needs to avoid latencies associated with demand-paging from
> > flash or any other storage.
> >
> Can you please elaborate why accessing the flash while main "real-time
> application" is running it is not a problem. I also read in
> free-electrons tutorial on embedded linux such recommendation for
> using file system such as cramfs, ubifs, which also access the flash
> during execution.
> Why is it not a problem for embedded linux ? From my experience with
> other embedded OS, it is not recommended to access flash during
> execution.

Did you read the man page for mlockall?  It does seem to address your
concern as I understand it.

(This has become off-topic for the MTD list IMO.)
