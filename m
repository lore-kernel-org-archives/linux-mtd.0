Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SepSA-0004Iv-QY
 for linux-mtd@lists.infradead.org; Wed, 13 Jun 2012 15:25:51 +0000
Received: by lbbgg6 with SMTP id gg6so1404306lbb.36
 for <linux-mtd@lists.infradead.org>; Wed, 13 Jun 2012 08:25:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1206131656130.4247@lnxricardw.se.axis.com>
References: <CAJ2oMhJxM6UTfj3zX7DFnc8PPcNNLfnXeV68ELLaCY=_8inFTg@mail.gmail.com>
 <Pine.LNX.4.64.1206050837380.4247@lnxricardw.se.axis.com>
 <CAJ2oMhLn-FNqXgdTOSamQry1BBm+Otu3PdjEPCyj2qsS-F_=QA@mail.gmail.com>
 <Pine.LNX.4.64.1206130851420.4247@lnxricardw.se.axis.com>
 <CAJ2oMhL4Y-=sfWTzKuFvqr2Ci9MiVGWHx8sHpJLoZz9wzcgF1Q@mail.gmail.com>
 <Pine.LNX.4.64.1206131656130.4247@lnxricardw.se.axis.com>
Date: Wed, 13 Jun 2012 18:25:48 +0300
Message-ID: <CAJ2oMhKGbvN5E9R_Ybw4OCDVtFq6sqhZ+R0qx68A_SzSLW-x5A@mail.gmail.com>
Subject: Re: Q: Cramfs Vs. Ubifs
From: Ran Shalit <ranshalit@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: =?ISO-8859-1?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Even if you copy all files to a RAM-based file system, such as /tmp, they
> still need to be copied from the file system to directly accessible memory
> before execution. While it may be faster than performing the same operation
> from flash, the demand paging functionality is still in operation.
>
> The only way to avoid it would be to force loading of all pages for a
> program at its start, I've never had the need so I don't know how though.
>
>
Yes, that what I meant. At the initialization stage we will copy all
files from ubifs section into root file system in RAM and so I assume
that there will be no any access to flash during application life for
read or write (any desired access will be controlled by application).
I wonder why I didn't find any information about disadvantage of using
ubifs as root file system in embedded system in terms of access to
flash during application life.

Regards, Ran
