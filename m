Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PBAlj-00062V-1E
	for linux-mtd@lists.infradead.org; Wed, 27 Oct 2010 18:30:39 +0000
Received: by bwz5 with SMTP id 5so916874bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 27 Oct 2010 11:30:38 -0700 (PDT)
Subject: Re: Issues with ubi utils Makefile
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <AANLkTinDuG62AapBDGvcjjJFUDxQDxcik3zEs2Gkm_st@mail.gmail.com>
References: <201010211643.33332.manningc2@actrix.gen.nz>
	<1288033416.1865.2.camel@brekeke>
	<AANLkTikd9uTV+8bRhjKt8P0vXC6p0FUbWd=bb6k2FGKi@mail.gmail.com>
	<AANLkTinDuG62AapBDGvcjjJFUDxQDxcik3zEs2Gkm_st@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 27 Oct 2010 21:30:30 +0300
Message-ID: <1288204230.1766.7.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Charles Manning <manningc2@actrix.gen.nz>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-10-25 at 16:57 -0400, Mike Frysinger wrote:
> On Mon, Oct 25, 2010 at 16:45, Mike Frysinger wrote:
> > On Mon, Oct 25, 2010 at 15:03, Artem Bityutskiy wrote:
> >> Commit 96a4f76f2e9dad7fdbd6fd7740de44bc90d5769e broke 'make install'.
> >> Before that commit, $DESTDIR was undefined, so  ${DESTDIR}/${SBINDIR}
> >> was /usr/sbin, and after the commit $DESTDIR became /usr/local, so
> >> ${DESTDIR}/${SBINDIR} became /usr/local//usr/sbin, which is wrong.
> >
> > that isnt really true.  DESTDIR had value in makefiles before my changes.
> >
> >> Fix this by making $DESTDIR become the distination directory of installing,
> >> i.e. 'DESTDIR ?= /usr' and making SBINDIR become just 'sbin'.
> >
> > i'd rather we change DESTDIR to match the standard -- it's a "root"
> > prefix only.  so the default should be:
> > DESTDIR ?=
> 
> i guess this is also why i never noticed before.  i never do plain
> `make install` since i'm not root and i dont want it clobbering
> things.  i always do `make install DESTDIR=$PWD/foo` when testing and
> in that regard, it works fine.  so i guess we want this simple change:
> --- a/common.mk
> +++ b/common.mk
> @@ -20,7 +20,7 @@ ifneq ($(WITHOUT_LARGEFILE), 1)
>    CPPFLAGS += -D_FILE_OFFSET_BITS=64
>  endif
> 
> -DESTDIR ?= /usr/local
> +DESTDIR?=
>  PREFIX=/usr
>  EXEC_PREFIX=$(PREFIX)
>  SBINDIR=$(EXEC_PREFIX)/sbin

Ok, pushed, made you the author, fabricated your signed-off-by as well.
Thanks.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
