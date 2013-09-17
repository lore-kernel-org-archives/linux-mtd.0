Received: from mail-oa0-x230.google.com ([2607:f8b0:4003:c02::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLjH4-0005Fa-0t
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2013 00:36:14 +0000
Received: by mail-oa0-f48.google.com with SMTP id i10so675440oag.35
 for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2013 17:35:53 -0700 (PDT)
Date: Mon, 16 Sep 2013 17:35:49 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Subject: Re: [PATCH [mtd-utils] 2/3] mtd-utils: new prompt() helper for
 talking to the user
Message-ID: <20130917003549.GJ4550@ld-irv-0074.broadcom.com>
References: <1368030446-343-1-git-send-email-vapier@gentoo.org>
 <1368030446-343-2-git-send-email-vapier@gentoo.org>
 <CAN8TOE8zAiSxxB5X_wVJ+=Fi8tSDoFEDatRRY-qQy9805J5H=Q@mail.gmail.com>
 <201308241919.43159.vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201308241919.43159.vapier@gentoo.org>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Aug 24, 2013 at 07:19:42PM -0400, Mike Frysinger wrote:
> On Wednesday 03 July 2013 22:01:52 Brian Norris wrote:
> > On Wed, May 8, 2013 at 9:27 AM, Mike Frysinger <vapier@gentoo.org> wrote:
> > > --- a/include/common.h
> > > +++ b/include/common.h
> > > 
> > > +               if (strcmp("\n", line) != 0) {
> > > +                       switch (rpmatch(line)) {
> > 
> > rpmatch() is not POSIX-compliant and is not available on my uclibc, so
> > this breaks my compile.
> 
> i added this to uClibc already :)

So I have to upgrade uClibc if I'm going to upgrade mtd-utils. Nice! And
to top it off, Huang is adding some NAND SLC/MLC changes that will
require an mtd-utils update soon.

I should be moving away from uClibc soon enough, so this isn't too
important for me to whine about.

Brian
