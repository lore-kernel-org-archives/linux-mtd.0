Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR4bN-0007d0-Nw
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 18:55:34 +0000
Date: Fri, 21 Mar 2014 15:54:46 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: David Mosberger-Tang <davidm@egauge.net>
Subject: Re: [PATCH] mtd: nand: fix byte addressing on 16-bit wide devices
Message-ID: <20140321185446.GA18141@arch.cereza>
References: <CALnQHM3PJCzB86S65TmKE14_HY7DxwVgtXAOcphrGcCJ4t24GQ@mail.gmail.com>
 <20140321180547.GA11793@arch.cereza>
 <CACwUX0PQP21PuSbQn6AvisaZuug9=JTwM3QoG5mXy54r6-tXCg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACwUX0PQP21PuSbQn6AvisaZuug9=JTwM3QoG5mXy54r6-tXCg@mail.gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Ccing Brian and Uwe)

On Mar 21, David Mosberger-Tang wrote:
> On Fri, Mar 21, 2014 at 12:05 PM, Ezequiel Garcia <
> ezequiel.garcia@free-electrons.com> wrote:
> >
> > You can take a look at these commits:
> >
> > 3dad2344e92c6e1aeae42df1c4824f307c51bcc7
> >
> > AFAIK, the READID command data is now issued as 8-bit, disregarding of
> > NAND_BUSWIDTH_16.
> >
> > Maybe you can re-test this building a kernel from linux-next.git and
> > report if your issues are now fixed?
> >
> 
> That's not sufficient.  GET_FEATURES and SET_FEATURES  also need
> byte-addressing.
> 

AFAIK, the issue for GET_FEATURES and SET_FEATURES was also fixed.
IIRC, it was done here:

commit 05f7835975dad6b3b517f9e23415985e648fb875
Author: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Date:   Thu Dec 5 22:22:04 2013 +0100

    mtd: nand: don't use {read,write}_buf for 8-bit transfers

> No offense, but my patch seems both simpler and more complete?
> 

Could be.

Have you actually tested linux-next? It would be good to check if we still
have issues with 16-bit devices on the latest kernel, or if this is
already fixed. Last time I checked, my 16-bit device was ONFI-detected.

Brian: Related to this, the current code for fixing READID on 16-bit devices
seem to apply *only* for drivers that don't override cmdfunc(), right?
So each of the drivers that have their cmdfunc() currently need some
tweak to support 16-bit devices.

Or am I missing anything?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
