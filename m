Received: from mail-pb0-x236.google.com ([2607:f8b0:400e:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WRBG5-0006lJ-Gd
 for linux-mtd@lists.infradead.org; Sat, 22 Mar 2014 02:02:02 +0000
Received: by mail-pb0-f54.google.com with SMTP id ma3so3131205pbc.13
 for <linux-mtd@lists.infradead.org>; Fri, 21 Mar 2014 19:01:39 -0700 (PDT)
Date: Fri, 21 Mar 2014 19:01:35 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH] mtd: nand: fix byte addressing on 16-bit wide devices
Message-ID: <20140322020135.GC29542@ld-irv-0074>
References: <CALnQHM3PJCzB86S65TmKE14_HY7DxwVgtXAOcphrGcCJ4t24GQ@mail.gmail.com>
 <20140321180547.GA11793@arch.cereza>
 <CACwUX0PQP21PuSbQn6AvisaZuug9=JTwM3QoG5mXy54r6-tXCg@mail.gmail.com>
 <20140321185446.GA18141@arch.cereza>
 <CALnQHM0U4FPi22P+SGuJqPb2QvjRHq3-oAR4i1QvCyMrnoXh5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALnQHM0U4FPi22P+SGuJqPb2QvjRHq3-oAR4i1QvCyMrnoXh5w@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 21, 2014 at 01:43:41PM -0600, David Mosberger wrote:
> On Fri, Mar 21, 2014 at 12:54 PM, Ezequiel Garcia
> <ezequiel.garcia@free-electrons.com> wrote:
> > (Ccing Brian and Uwe)
> 
> > AFAIK, the issue for GET_FEATURES and SET_FEATURES was also fixed.
> > IIRC, it was done here:
> >
> > commit 05f7835975dad6b3b517f9e23415985e648fb875
> 
> This commit fixes the transfer, but not the addressing.

And the $SUBJECT patch fixes the addressing and not the transfer :)

> Let me switch to linux-next and take it from there.

I see that you did already.

Regards,
Brian
