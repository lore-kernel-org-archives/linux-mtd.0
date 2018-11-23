Received: from conssluserg-06.nifty.com ([210.131.2.91])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gQ94Z-0006p0-7O
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2018 10:52:32 +0000
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43]) (authenticated)
 by conssluserg-06.nifty.com with ESMTP id wANAq3FX031276
 for <linux-mtd@lists.infradead.org>; Fri, 23 Nov 2018 19:52:03 +0900
Received: by mail-vs1-f43.google.com with SMTP id y27so6944531vsi.1
 for <linux-mtd@lists.infradead.org>; Fri, 23 Nov 2018 02:52:03 -0800 (PST)
MIME-Version: 1.0
References: <1542726258-8418-1-git-send-email-yamada.masahiro@socionext.com>
 <87d7d90bf8779a997b17c917680995abc455cf11.camel@infradead.org>
In-Reply-To: <87d7d90bf8779a997b17c917680995abc455cf11.camel@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 23 Nov 2018 19:51:26 +0900
Message-ID: <CAK7LNAQVV4hcVOvG8Yu6GFVEH=Shv=v=PkGkMghDBJbGBNSE1Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: announce removal of SUBDIRS if used
To: David Woodhouse <dwmw2@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
 wim@linux-watchdog.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Jim Cromie <jim.cromie@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 23, 2018 at 5:04 PM David Woodhouse <dwmw2@infradead.org> wrote=
:
>
> On Wed, 2018-11-21 at 00:04 +0900, Masahiro Yamada wrote:
> > SUBDIRS has been kept as a backward compatibility since
> > commit ("[PATCH] kbuild: external module support") in 2002.
> >
> > We do not need multiple ways to do the same thing, so I will remove
> > SUBDIRS after the Linux 5.3 release. I cleaned up in-tree code, and
> > updated the document so that nobody would try to use it.
> >
> > Meanwhile, display the following warning if SUBDIRS is used.
> >
> > Makefile:189: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D WARNI=
NG =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > Makefile:190: 'SUBDIRS' will be removed after Linux 5.3
> > Makefile:191: Please use 'M=3D' or 'KBUILD_EXTMOD' instead
> > Makefile:192: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>
> No, please don't do this. This is effectively a kernel=E2=86=90=E2=86=92u=
ser ABI.


External modules are just downstream kernel code.

There is no guarantee for eternal backward compatibility.


Actually, kernel headers and APIs are always changing.

We are not allowed to break the upstream code during API migration,
but we do not care about external modules.


If you want to compile external modules
with a new version of the kernel,
you need to adjust various parts of the code anyway.
Is it a problem to ask one-liner fix in a build script?


> The instructions for building a kernel module have been this, for
> *ages*:
>
>  echo 'obj-m :=3D mymod.o' > Makefile
>  make -C /lib/modules/`uname -r`/build SUBDIRS=3D`pwd`


It has been *ages* since the external module build
was improved in the current way.

Since then, M=3D<...> is a preferred way over SUBDIRS.

This case is even nicer.
I set a one-year grace period with a clear warning message.


> People have muscle memory, they have it encoded into various of their
> own makefiles and build scripts. Please don't make it stop working
> unless there's actually a really good reason to do so.

Dumping old code is a good reason.


--
Best Regards
Masahiro Yamada
