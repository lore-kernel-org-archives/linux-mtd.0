Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sf2ka-0007KU-0x
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2012 05:37:44 +0000
Received: by lbbgg6 with SMTP id gg6so1872530lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2012 22:37:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1339602380.32578.4.camel@doorstop.aus.2wire.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
 <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
 <CAJ2oMhLn-FNqXgdTOSamQry1BBm+Otu3PdjEPCyj2qsS-F_=QA@mail.gmail.com>
 <Pine.LNX.4.64.1206130851420.4247@lnxricardw.se.axis.com>
 <CAJ2oMhL4Y-=sfWTzKuFvqr2Ci9MiVGWHx8sHpJLoZz9wzcgF1Q@mail.gmail.com>
 <Pine.LNX.4.64.1206131656130.4247@lnxricardw.se.axis.com>
 <CAJ2oMhKGbvN5E9R_Ybw4OCDVtFq6sqhZ+R0qx68A_SzSLW-x5A@mail.gmail.com>
 <1339602380.32578.4.camel@doorstop.aus.2wire.com>
Date: Thu, 14 Jun 2012 08:37:41 +0300
Message-ID: <CAJ2oMhK1g2_HtZspi9S9-6K-FjKjCwCXnrUHHHkP4-3K0EGc9g@mail.gmail.com>
Subject: Re: Q: Cramfs Vs. Ubifs
From: Ran Shalit <ranshalit@gmail.com>
To: Nathan Lynch <ntl@pobox.com>,
 =?ISO-8859-1?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> I wonder why I didn't find any information about disadvantage of using
>> ubifs as root file system in embedded system in terms of access to
>> flash during application life.
>>
>I think because it normally is not a problem. Also, the same goes for any =
file system which resides on the flash, it's not a ubifs-specific problem.
>
> This isn't an issue specific to UBIFS. =A0Look into mlock/mlockall if you=
r
> application needs to avoid latencies associated with demand-paging from
> flash or any other storage.
>
Can you please elaborate why accessing the flash while main "real-time
application" is running it is not a problem. I also read in
free-electrons tutorial on embedded linux such recommendation for
using file system such as cramfs, ubifs, which also access the flash
during execution.
Why is it not a problem for embedded linux ? From my experience with
other embedded OS, it is not recommended to access flash during
execution.
Many thanks, Ran
