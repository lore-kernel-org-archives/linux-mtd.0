Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MBQGJ-0008NN-Uo
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 09:26:34 +0000
Subject: Re: [PATCH] mkfs.ubifs: use libubi to format UBI volume
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00905270619s642868f5od0c30f913e61fa0f@mail.gmail.com>
References: <1243240816.21646.102.camel@localhost.localdomain>
	<1243343316-6201-1-git-send-email-corentincj@iksaif.net>
	<1243426912.11172.9.camel@localhost.localdomain>
	<71cd59b00905270619s642868f5od0c30f913e61fa0f@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 02 Jun 2009 12:26:16 +0300
Message-Id: <1243934776.5847.26.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-05-27 at 15:19 +0200, Corentin Chary wrote:
> On Wed, May 27, 2009 at 2:21 PM, Artem Bityutskiy
> <dedekind@infradead.org> wrote:
> > On Tue, 2009-05-26 at 15:08 +0200, Corentin Chary wrote:
> >> libubi is now used to format directly UBI volume.
> >> Typing mkfs.ubifs /dev/ubi0_0 is now possible.
> >> dtypes should be ok as they are taken from UBIFS code.
> >>
> >> Signed-off-by: Corentin Chary <corentincj@iksaif.net>
> >> ---
> >>  Makefile                |    2 +-
> >>  mkfs.ubifs/Makefile     |    5 +-
> >>  mkfs.ubifs/lpt.c        |   10 ++--
> >>  mkfs.ubifs/mkfs.ubifs.c |  179 +++++++++++++++++++++++++++++++++++++---------
> >>  mkfs.ubifs/mkfs.ubifs.h |    4 +-
> >>  mkfs.ubifs/ubifs.h      |    6 ++
> >>  6 files changed, 163 insertions(+), 43 deletions(-)
> >
> > Works fine. Good job, thanks!
> >
> > It would be 200% cool if you also provided a patch for
> > mtd-www and just added a note that the UBIFS image may
> > be written directly to the UBI volum, not jut to a file.
> >
> > I mean here:
> > http://www.linux-mtd.infradead.org/faq/ubifs.html#L_mkfubifs
> >
> > :-)
> >
> > Pushed your patch, thanks!
> 
> Ok, I'll do that ASAP, but I believe I won't find the time before next week.
> Thanks

I just updated the web site and added a note that mkfs.ubifs can write
straight to UBI volumes.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
