Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QuTZ3-0004nx-1R
	for linux-mtd@lists.infradead.org; Fri, 19 Aug 2011 18:13:05 +0000
Received: by bke17 with SMTP id 17so2982239bke.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 19 Aug 2011 11:13:03 -0700 (PDT)
Subject: Re: [BUG] mtd-utils: nandwrite: invalid erase after page write failure
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 19 Aug 2011 21:13:00 +0300
In-Reply-To: <CAN8TOE-1eO-pihTwU6ZE=HZtXNwXg3-ft7qXipvm0Utj6RWBLQ@mail.gmail.com>
References: <EBEBA6C3BD40EF4B8C0A5B8AD5A28F993B6C6EB71A@GVW0547EXC.americas.hpqcorp.net>
	<1313773387.6607.83.camel@sauron>
	<CAN8TOE-1eO-pihTwU6ZE=HZtXNwXg3-ft7qXipvm0Utj6RWBLQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Message-ID: <1313777581.2146.3.camel@koala>
Mime-Version: 1.0
Cc: "Fryar, Jeff" <jeff.fryar@hp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-08-19 at 10:22 -0700, Brian Norris wrote:
> On Fri, Aug 19, 2011 at 10:02 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Thu, 2011-08-11 at 16:30 +0100, Fryar, Jeff wrote:
> >> mtd-utils nandwrite.c: After a page write failure, the calculation
> >> of the block number to erase is incorrect.  The erase block size is
> >> being passed as the erase block number in the call to mtd_erase().
> >
> > Looks like correct fix, thanks! Your patch is not very well formatted,
> > but I've amended it and applied to mtd-utils, thanks!
> 
> Oops, my bad on the bug. I didn't ever get around to using this
> feature when I updated nandwrite a while back. Thanks for catching it.
> 
> BTW, are you going to rebase or merge the v1.4.6 tag into the master
> development branch? Just curious, since they forked when you did that
> last tag (this never happens!), and I sent another series of mtd-utils
> fixes...I assume I should still base off of master, right?

Hi Brian,

as always, sorry for long delays, I have very little time for hobby
projects. I guess I'll end up disappearing from mtd at some point, but
will see, the plan is to still help MTD moving forward.

Sure you have to base on the master branch. The tag was indeed a "fork"
- I took tag v1.4.5 and put your patch on top. So v1.4.6 is not part of
the master branch. I did so because I did not want to include whole
bunch of changes which could add new regressions - I wanted to make just
a "bugfix" release.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
