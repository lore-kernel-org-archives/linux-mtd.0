Received: from anubis.se.axis.com ([195.60.68.12])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sf3zT-00087p-VM
 for linux-mtd@lists.infradead.org; Thu, 14 Jun 2012 06:57:13 +0000
Date: Thu, 14 Jun 2012 08:57:03 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ran Shalit <ranshalit@gmail.com>
Subject: Re: Q: Cramfs Vs. Ubifs
In-Reply-To: <1339654981.3257.7.camel@orca.stoopid.dyndns.org>
Message-ID: <Pine.LNX.4.64.1206140850260.4247@lnxricardw.se.axis.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
 <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
 <CAJ2oMhLn-FNqXgdTOSamQry1BBm+Otu3PdjEPCyj2qsS-F_=QA@mail.gmail.com>
 <Pine.LNX.4.64.1206130851420.4247@lnxricardw.se.axis.com>
 <CAJ2oMhL4Y-=sfWTzKuFvqr2Ci9MiVGWHx8sHpJLoZz9wzcgF1Q@mail.gmail.com>
 <Pine.LNX.4.64.1206131656130.4247@lnxricardw.se.axis.com>
 <CAJ2oMhKGbvN5E9R_Ybw4OCDVtFq6sqhZ+R0qx68A_SzSLW-x5A@mail.gmail.com>
 <1339602380.32578.4.camel@doorstop.aus.2wire.com>
 <CAJ2oMhK1g2_HtZspi9S9-6K-FjKjCwCXnrUHHHkP4-3K0EGc9g@mail.gmail.com>
 <1339654981.3257.7.camel@orca.stoopid.dyndns.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Nathan Lynch <ntl@pobox.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 14 Jun 2012, Nathan Lynch wrote:

>
>> Can you please elaborate why accessing the flash while main "real-time
>> application" is running it is not a problem. I also read in
>> free-electrons tutorial on embedded linux such recommendation for
>> using file system such as cramfs, ubifs, which also access the flash
>> during execution.
>> Why is it not a problem for embedded linux ? From my experience with
>> other embedded OS, it is not recommended to access flash during
>> execution.

I think the question to ask is 'why is it a problem'? If you can meet your=
=20
real time requirements even if there is latency due to parts of the=20
application being fetched (i.e. paged in) runtime, it is not a problem.

If you do rely on your application having millisecond response times, then=
=20
you have quite stringent real time requirements, and you may need to lock=
=20
your application in memory to avoid latency due to paging. You may also=20
have to look at configuring the Linux kernel so that it doesn't introduce=
=20
any latency due to task switching. And there may be other issues in that=20
case, with paging from mass storage being but one of them.

For reference, the company I work for makes network cameras, running=20
embedded Linux, which is definitely a real time application (streaming=20
live video), but our requirements are such that we have not needed to take=
=20
measures such as mlockall in order to keep applications in memory at all=20
times.

So I wouldn't say as a general rule that accessing flash memory during=20
execution is a problem, it all depends on what your requirements are.

> On Thu, 2012-06-14 at 08:37 +0300, Ran Shalit wrote:
>
> Did you read the man page for mlockall?  It does seem to address your
> concern as I understand it.
>
> (This has become off-topic for the MTD list IMO.)

Principally, yes, but since MTD devices tend to be used primarily in=20
embedded systems, and they are often the ones with the most real time=20
intensive requirements, there is a certain relevancy even if it is not=20
directly related to mtd.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
