Received: from dsl-64-130-201-237.telocity.com ([64.130.201.237] helo=Dual166.localdomain)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Wi2o-0007Tg-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 18:04:14 +0000
Reply-To: <acurtis@onz.com>
From: "Allen Curtis" <acurtis@onz.com>
To: "Andrew Dixon" <andrew.dixon@seranoa.com>, <linux-mtd@lists.infradead.org>
Subject: RE: Space Loss in JFFS on an EST-SBC8260
Date: Fri, 1 Feb 2002 10:06:56 -0800
Message-ID: <NCBBIINEHIPFGJPLBEIFCEOHDDAA.acurtis@onz.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3C5AD45D.9B6EBA1F@seranoa.com>
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

We are having the same problem. We are using HHL 2.0 which is Linux 2.4.2.
According to some other feedback we have received, the latest version of the
code does a better job of reporting the correct size. I have not completed
the testing to tell you about the performance issue.

Background on performance:
Since it does not appear that the JFFS space is reclaimed, when the flash
gets "full" and it is forced to reclaim space, the system gets very slow.
(unacceptably slow when this is your primary FS)

Note:
If you do a directory listing a few times and then look at "du", you should
see the available space change. (at least in our experience) Not sure what
triggers the garbage collection but that seems to force the issue if you are
looking for test cases.

> -----Original Message-----
> From: linux-mtd-admin@lists.infradead.org
> [mailto:linux-mtd-admin@lists.infradead.org]On Behalf Of Andrew Dixon
> Sent: Friday, February 01, 2002 9:46 AM
> To: linux-mtd@lists.infradead.org
> Subject: Re: Space Loss in JFFS on an EST-SBC8260
>
>
> Scott Ikenaga wrote:
> >
> > We are using JFFS on EST-SBC8260. The problem we are facing now is that
> > the space can't be reclaimed after files being deleted.
>
> I don't believe that space should be reclaimed right away.  You only get
> space back after the garbage collector has been through and cleaned up
> the flash.  (The preceding is mostly a guess.  You should get
> independent conformation.)
>
>  So we are
> > running out of space as shown by "du".
>
> What's your kernel configuration?
>
> >
> > Questions:
> > (1)Is this a known problem? If so, is there a fix?
>
> I haven't seen it before.
>
> > (2)Could this contribute to another problem where the system becomes
> >    very sluggish?
>
> It doesn't seem very likely to me but it's hard to tell without knowing
> what the configuration of your system is.  You could try running off of
> an NFS root filesystem (if that's an option) and see if you performance
> is better.
>
> --
> Andrew Dixon
> Software Engineer
> Seranoa Networks
> 978.897.3434 x231
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
