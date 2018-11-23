Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gQ3dp-0001lI-6o
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2018 05:04:34 +0000
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com
 [209.85.221.173]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id wAN53lE5013232
 for <linux-mtd@lists.infradead.org>; Fri, 23 Nov 2018 14:03:47 +0900
Received: by mail-vk1-f173.google.com with SMTP id y14so2414728vky.9
 for <linux-mtd@lists.infradead.org>; Thu, 22 Nov 2018 21:03:47 -0800 (PST)
MIME-Version: 1.0
References: <1542726258-8418-1-git-send-email-yamada.masahiro@socionext.com>
 <20181120162543.GB4765@roeck-us.net>
In-Reply-To: <20181120162543.GB4765@roeck-us.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 23 Nov 2018 14:03:10 +0900
Message-ID: <CAK7LNARSR6nHxusgBUn3BGPSN2KTYu0YdVQWfX-oDKm9ucvTXg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: announce removal of SUBDIRS if used
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 linux-watchdog@vger.kernel.org, wim@linux-watchdog.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 jim.cromie@gmail.com, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 21, 2018 at 1:25 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> On Wed, Nov 21, 2018 at 12:04:18AM +0900, Masahiro Yamada wrote:
> > SUBDIRS has been kept as a backward compatibility since
> > commit ("[PATCH] kbuild: external module support") in 2002.
> >
> > We do not need multiple ways to do the same thing, so I will remove
> > SUBDIRS after the Linux 5.3 release. I cleaned up in-tree code, and
> > updated the document so that nobody would try to use it.
> >
> > Meanwhile, display the following warning if SUBDIRS is used.
> >
> > Makefile:189: ================= WARNING ================
> > Makefile:190: 'SUBDIRS' will be removed after Linux 5.3
> > Makefile:191: Please use 'M=' or 'KBUILD_EXTMOD' instead
> > Makefile:192: ==========================================
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---

Applied to linux-kbuild.



> >  Documentation/kbuild/kbuild.txt    | 7 +------
> >  Makefile                           | 4 ++++
> >  drivers/mtd/maps/scx200_docflash.c | 7 -------
> >  drivers/watchdog/scx200_wdt.c      | 7 -------
>
> For watchdog:
>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
>
> >  samples/connector/Makefile         | 2 +-
> >  5 files changed, 6 insertions(+), 21 deletions(-)
> >
> > diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
> > index 8390c36..c9e3d93 100644
> > --- a/Documentation/kbuild/kbuild.txt
> > +++ b/Documentation/kbuild/kbuild.txt
> > @@ -81,12 +81,7 @@ KBUILD_EXTMOD
> >  --------------------------------------------------
> >  Set the directory to look for the kernel source when building external
> >  modules.
> > -The directory can be specified in several ways:
> > -1) Use "M=..." on the command line
> > -2) Environment variable KBUILD_EXTMOD
> > -3) Environment variable SUBDIRS
> > -The possibilities are listed in the order they take precedence.
> > -Using "M=..." will always override the others.
> > +Setting "M=..." takes precedence over KBUILD_EXTMOD.
> >
> >  KBUILD_OUTPUT
> >  --------------------------------------------------
> > diff --git a/Makefile b/Makefile
> > index 370d13b..57be5fb 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -186,6 +186,10 @@ endif
> >  # Old syntax make ... SUBDIRS=$PWD is still supported
> >  # Setting the environment variable KBUILD_EXTMOD take precedence
> >  ifdef SUBDIRS
> > +  $(warning ================= WARNING ================)
> > +  $(warning 'SUBDIRS' will be removed after Linux 5.3)
> > +  $(warning Please use 'M=' or 'KBUILD_EXTMOD' instead)
> > +  $(warning ==========================================)
> >    KBUILD_EXTMOD ?= $(SUBDIRS)
> >  endif
> >
> > diff --git a/drivers/mtd/maps/scx200_docflash.c b/drivers/mtd/maps/scx200_docflash.c
> > index f1c1f73..7f1a0e6 100644
> > --- a/drivers/mtd/maps/scx200_docflash.c
> > +++ b/drivers/mtd/maps/scx200_docflash.c
> > @@ -216,10 +216,3 @@ static void __exit cleanup_scx200_docflash(void)
> >
> >  module_init(init_scx200_docflash);
> >  module_exit(cleanup_scx200_docflash);
> > -
> > -/*
> > -    Local variables:
> > -        compile-command: "make -k -C ../../.. SUBDIRS=drivers/mtd/maps modules"
> > -        c-basic-offset: 8
> > -    End:
> > -*/
> > diff --git a/drivers/watchdog/scx200_wdt.c b/drivers/watchdog/scx200_wdt.c
> > index 836377c..ec4063e 100644
> > --- a/drivers/watchdog/scx200_wdt.c
> > +++ b/drivers/watchdog/scx200_wdt.c
> > @@ -262,10 +262,3 @@ static void __exit scx200_wdt_cleanup(void)
> >
> >  module_init(scx200_wdt_init);
> >  module_exit(scx200_wdt_cleanup);
> > -
> > -/*
> > -    Local variables:
> > -     compile-command: "make -k -C ../.. SUBDIRS=drivers/char modules"
> > -     c-basic-offset: 8
> > -    End:
> > -*/
> > diff --git a/samples/connector/Makefile b/samples/connector/Makefile
> > index fe3c854..6ad7162 100644
> > --- a/samples/connector/Makefile
> > +++ b/samples/connector/Makefile
> > @@ -14,4 +14,4 @@ HOSTCFLAGS_ucon.o += -I$(objtree)/usr/include
> >  all: modules
> >
> >  modules clean:
> > -     $(MAKE) -C ../.. SUBDIRS=$(CURDIR) $@
> > +     $(MAKE) -C ../.. M=$(CURDIR) $@
> > --
> > 2.7.4
> >



-- 
Best Regards
Masahiro Yamada
