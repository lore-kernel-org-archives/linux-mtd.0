Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qevq8-0001b8-9R
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 21:10:29 +0000
Received: by wyf23 with SMTP id 23so1184387wyf.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 14:09:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMjpGUeynErQnLO17QUPDgMAvgQKzFqi424mo66z0AbRTKrsWw@mail.gmail.com>
References: <1310071467-9017-1-git-send-email-computersforpeace@gmail.com>
	<CAMjpGUeynErQnLO17QUPDgMAvgQKzFqi424mo66z0AbRTKrsWw@mail.gmail.com>
Date: Thu, 7 Jul 2011 14:09:37 -0700
Message-ID: <CAN8TOE8LpRd+nMiwYFEAFG1gLmPuC8--FjkOxEbBS+iE7NnWTQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] Makefile: fix "version.h" build for cross-compiling
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 7, 2011 at 1:48 PM, Mike Frysinger <vapier.adi@gmail.com> wrote=
:
> i dont think it's just a matter of "diff build dir for diff
> toolchains, so common version.h is ok". =A0it's a matter of "building
> out of tree should build out of tree".

OK, but what is the point of in- vs. out-of-tree? So that we can have
a readonly source directory where the mtd-utils code stays? Or so that
we keep object files away from code? Or some other reason?

> i think the fix to your problem is:
> =A0$(BUILDDIR)/include/version.h.tmp
> + =A0 =A0$(Q)mkdir -p $(dir $@)
> =A0 =A0 =A0 $(Q)echo '#define VERSION "$(VERSION)"' > $@

Except that gives this error:
  CC      ftl_format.o
  CC      lib/libmtd.o
In file included from lib/libmtd.c:40:0:
./include/common.h:28:21: fatal error: version.h: No such file or directory
compilation terminated.
make: *** [/home/norris/git/mtd-utils/mipsel-linux/lib/libmtd.o] Error 1

Really, the build system is setup to look for headers in-tree, not
out-of-tree. I'm not sure a good way to fix this other than to
generate that header in-tree...any better suggestions?

Brian
