Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs8qR-0004UF-U9
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 12:31:48 +0000
Date: Fri, 30 Oct 2015 13:30:56 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Andrea Scian <rnd4@dave-tech.it>, Iwo
 Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, "Bean Huo =?UTF-8?B?6ZyN5paM5paM?=
 \"\"\"(beanhuo)\"\"\"" <beanhuo@micron.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
Message-ID: <20151030133056.53c04eb1@bbrezillon>
In-Reply-To: <1446205395.6126.69.camel@gmail.com>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon>
 <1446035085.12536.71.camel@gmail.com>
 <20151030091521.439f436b@bbrezillon>
 <1446196090.6126.48.camel@gmail.com>
 <20151030104537.2196c4a8@bbrezillon>
 <1446205395.6126.69.camel@gmail.com>
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

On Fri, 30 Oct 2015 13:43:15 +0200
Artem Bityutskiy <dedekind1@gmail.com> wrote:

> On Fri, 2015-10-30 at 10:45 +0100, Boris Brezillon wrote:
> > Moreover, the standard GC only takes place when you can't find a free
> > LEB anymore, which will probably happen when you reach something
> > close
> > to half the partition size in case of MLC chips (it may be a bit
> > higher if you managed to occupy more than half of each LEB capacity).
> > This means that your FS will become slower when you reach this limit,
> > though maybe this can be addressed by triggering the GC before we run
> > out of free LEBs.
> 
> Right. I'd call it a detail. But the big picture is - if you have to GC
> all the data you write, you write twice. When exactly you do the second
> write is a detail - sometimes it is deferred, it is in background etc,
> sometimes right away - you have to GC older data before being able to
> write new data.

You're right, but it makes a big difference when all your writes are
taking longer because you need to run the GC to retrieve a free LEB, and
this is probably what's gonna happen when your FS raises ~1/2 its
maximum size. Doing it in background (collecting a few valid nodes on
each GC step and letting user operations take place between each of
these step) should help mitigating this problem.

> 
> Now, by no means I am criticizing you or your decisions, you are doing
> great job. I am more like summarizing and trying to give you some food
> for thoughts. :-)

No problem, I don't take it personally. I actually think arguing
on technical stuff is a good way to find the best solution ;-).

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
