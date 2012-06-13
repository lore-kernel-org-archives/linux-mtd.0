Received: from a-pb-sasl-sd.pobox.com ([74.115.168.62]
 helo=sasl.smtp.pobox.com)
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Sepm6-00088t-Hd
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 15:46:27 +0000
Message-ID: <1339602380.32578.4.camel@doorstop.aus.2wire.com>
Subject: Re: Q: Cramfs Vs. Ubifs
From: Nathan Lynch <ntl@pobox.com>
To: Ran Shalit <ranshalit@gmail.com>
Date: Wed, 13 Jun 2012 10:46:20 -0500
In-Reply-To: <CAJ2oMhKGbvN5E9R_Ybw4OCDVtFq6sqhZ+R0qx68A_SzSLW-x5A@mail.gmail.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
 <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
 <CAJ2oMhLn-FNqXgdTOSamQry1BBm+Otu3PdjEPCyj2qsS-F_=QA@mail.gmail.com>
 <Pine.LNX.4.64.1206130851420.4247@lnxricardw.se.axis.com>
 <CAJ2oMhL4Y-=sfWTzKuFvqr2Ci9MiVGWHx8sHpJLoZz9wzcgF1Q@mail.gmail.com>
 <Pine.LNX.4.64.1206131656130.4247@lnxricardw.se.axis.com>
 <CAJ2oMhKGbvN5E9R_Ybw4OCDVtFq6sqhZ+R0qx68A_SzSLW-x5A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
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

On Wed, 2012-06-13 at 18:25 +0300, Ran Shalit wrote:
> > Even if you copy all files to a RAM-based file system, such as /tmp, they
> > still need to be copied from the file system to directly accessible memory
> > before execution. While it may be faster than performing the same operation
> > from flash, the demand paging functionality is still in operation.
> >
> > The only way to avoid it would be to force loading of all pages for a
> > program at its start, I've never had the need so I don't know how though.
> >
> >
> Yes, that what I meant. At the initialization stage we will copy all
> files from ubifs section into root file system in RAM and so I assume
> that there will be no any access to flash during application life for
> read or write (any desired access will be controlled by application).
> I wonder why I didn't find any information about disadvantage of using
> ubifs as root file system in embedded system in terms of access to
> flash during application life.

This isn't an issue specific to UBIFS.  Look into mlock/mlockall if your
application needs to avoid latencies associated with demand-paging from
flash or any other storage.
