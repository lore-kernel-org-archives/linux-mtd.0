Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs8zr-0001Yy-1V
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 12:41:31 +0000
Message-ID: <1446208866.6126.88.camel@gmail.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Andrea Scian <rnd4@dave-tech.it>,  Iwo
 Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, Bean Huo =?UTF-8?Q?=E9=9C=8D=E6=96=8C=E6=96=8C?=
 "\"\"\"(beanhuo)\"\"\"" <beanhuo@micron.com>
Date: Fri, 30 Oct 2015 14:41:06 +0200
In-Reply-To: <20151030133056.53c04eb1@bbrezillon>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon> <1446035085.12536.71.camel@gmail.com>
 <20151030091521.439f436b@bbrezillon> <1446196090.6126.48.camel@gmail.com>
 <20151030104537.2196c4a8@bbrezillon> <1446205395.6126.69.camel@gmail.com>
 <20151030133056.53c04eb1@bbrezillon>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-10-30 at 13:30 +0100, Boris Brezillon wrote:
> You're right, but it makes a big difference when all your writes are
> taking longer because you need to run the GC to retrieve a free LEB,
> and
> this is probably what's gonna happen when your FS raises ~1/2 its
> maximum size. Doing it in background (collecting a few valid nodes on
> each GC step and letting user operations take place between each of
> these step) should help mitigating this problem.

It makes difference, yes. However, again, the worst case scenario is
that whenever I need to write, I have do GC, because I am "punished" by
previous writes. The worst case scenario is twice as slow write.

Guaranteed twice as fast wear is the other implication.

Increased power consumption is another one. Not every embedded system
will find the "you have to do a lot of job in background" UBIFS feature
attractive.

Anyway, could you spend a bit more time trying to provide convincing
arguments that doing "skip on demand" is hard, or does not gain
anything. You expressed this opinion, but so far it did not look 100%
convincing.

Thanks!
