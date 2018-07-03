Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1faFkK-0005dK-Kt
 for linux-mtd@lists.infradead.org; Tue, 03 Jul 2018 07:29:21 +0000
From: Richard Weinberger <richard@nod.at>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, y2038@lists.linaro.org,
 Deepa Dinamani <deepa.kernel@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ubifs: tnc: use monotonic znode timestamp
Date: Tue, 03 Jul 2018 09:28:56 +0200
Message-ID: <58899545.Szx3E6bSux@blindfold>
In-Reply-To: <31916482.81kKL2104G@blindfold>
References: <20180620082937.719067-1-arnd@arndb.de>
 <31916482.81kKL2104G@blindfold>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am Montag, 2. Juli 2018, 16:24:15 CEST schrieb Richard Weinberger:
> Arnd,
> 
> Am Mittwoch, 20. Juni 2018, 10:29:11 CEST schrieb Arnd Bergmann:
> > The tnc uses get_seconds() based timestamps to check the age of a znode,
> > which has two problems: on 32-bit architectures this may overflow in
> > 2038 or 2106, and it gives incorrect information when the system time
> > is updated using settimeofday().
> > 
> > Using montonic timestamps with ktime_get_seconds() solves both thes
> > problems.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  fs/ubifs/shrinker.c | 2 +-
> >  fs/ubifs/tnc.c      | 4 ++--
> >  fs/ubifs/tnc_misc.c | 2 +-
> >  fs/ubifs/ubifs.h    | 2 +-
> >  4 files changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/fs/ubifs/shrinker.c b/fs/ubifs/shrinker.c
> > index 9a9fb94a41c6..9d10cbdec2cc 100644
> > --- a/fs/ubifs/shrinker.c
> > +++ b/fs/ubifs/shrinker.c
> > @@ -71,7 +71,7 @@ static int shrink_tnc(struct ubifs_info *c, int nr, int age, int *contention)
> >  {
> >  	int total_freed = 0;
> >  	struct ubifs_znode *znode, *zprev;
> > -	int time = get_seconds();
> > +	time64_t time = ktime_get_seconds();
> 
> ubifs does
> 	abs(time - znode->time) >= age) {
> 
> Is this still legit with time64_t?

Answering my own question, yes.
abs() seems to be able to deal with 64bit numbers and time64_t is just a number.

Thanks,
//richard
