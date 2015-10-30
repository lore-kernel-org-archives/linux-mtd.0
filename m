Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs6G0-0007BR-2z
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 09:46:00 +0000
Date: Fri, 30 Oct 2015 10:45:37 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Andrea Scian <rnd4@dave-tech.it>, Iwo
 Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, "Bean Huo =?UTF-8?B?6ZyN5paM5paM?=
 \"\"(beanhuo)\"\"" <beanhuo@micron.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
Message-ID: <20151030104537.2196c4a8@bbrezillon>
In-Reply-To: <1446196090.6126.48.camel@gmail.com>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon>
 <1446035085.12536.71.camel@gmail.com>
 <20151030091521.439f436b@bbrezillon>
 <1446196090.6126.48.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 30 Oct 2015 11:08:10 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Fri, 2015-10-30 at 09:15 +0100, Boris Brezillon wrote:
> > Hi Artem,
> > 
> > Don't take the following answer as a try to teach you how UBI/UBIFS
> > work
> > or should work with MLC NANDs. I still listen to your suggestions,
> > but
> > when I had a look at how this "skip pages on demand" approach could
> > be implemented I realized it was not so simple.
> 
> Sure.
> 
> Could you verify my understanding please.
> 
> You realized that "skip on demand" is not easy, and you suggest that we
> simply write all the data twice - first time we skip pages, and then we
> garbage collect everything. At the end, roughly speaking, we trade off
> half of the IO speed, power, and NAND lifetime.

That will be pretty much the same with the "skip on demand" approach,
because you'll probably loose a lot of space when syncing the wbuf.
Remember that you have to skip between 3 and 8 pages, so if your
buffers are regularly synced (either manually of by the timer), you'll
increase the dirty space in those LEBs, and in the end you'll just rely
on the regular GC to collect those partially written LEB. Except that
the regular GC will in turn loose some space when syncing its wbuf.

Moreover, the standard GC only takes place when you can't find a free
LEB anymore, which will probably happen when you reach something close
to half the partition size in case of MLC chips (it may be a bit
higher if you managed to occupy more than half of each LEB capacity).
This means that your FS will become slower when you reach this limit,
though maybe this can be addressed by triggering the GC before we run
out of free LEBs.

> 
> About secure LEBs - do you suggest UBI exposes 2 different LEB sizes at
> the same time - secure and unsecure, or you it could be only in one of
> the modes.

A given LEB can only be in secure or unsecure mode, but a UBI volume
can expose both unsecure and secure LEBs, and those LEBs have different
sizes.
The secure/unsecure mode is chosen when mapping the LEB, and the LEB
stays in this mode until it's unmapped.

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
