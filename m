Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs85t-0002kR-Cc
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 11:43:42 +0000
Message-ID: <1446205395.6126.69.camel@gmail.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Andrea Scian <rnd4@dave-tech.it>,  Iwo
 Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff Lauruhn (jlauruhn)"
 <jlauruhn@micron.com>, Bean Huo =?UTF-8?Q?=E9=9C=8D=E6=96=8C=E6=96=8C?=
 "\"\"(beanhuo)\"\"" <beanhuo@micron.com>
Date: Fri, 30 Oct 2015 13:43:15 +0200
In-Reply-To: <20151030104537.2196c4a8@bbrezillon>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon> <1446035085.12536.71.camel@gmail.com>
 <20151030091521.439f436b@bbrezillon> <1446196090.6126.48.camel@gmail.com>
 <20151030104537.2196c4a8@bbrezillon>
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

On Fri, 2015-10-30 at 10:45 +0100, Boris Brezillon wrote:
> Moreover, the standard GC only takes place when you can't find a free
> LEB anymore, which will probably happen when you reach something
> close
> to half the partition size in case of MLC chips (it may be a bit
> higher if you managed to occupy more than half of each LEB capacity).
> This means that your FS will become slower when you reach this limit,
> though maybe this can be addressed by triggering the GC before we run
> out of free LEBs.

Right. I'd call it a detail. But the big picture is - if you have to GC
all the data you write, you write twice. When exactly you do the second
write is a detail - sometimes it is deferred, it is in background etc,
sometimes right away - you have to GC older data before being able to
write new data.

Now, by no means I am criticizing you or your decisions, you are doing
great job. I am more like summarizing and trying to give you some food
for thoughts. :-)
