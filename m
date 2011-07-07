Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QevzD-0005R3-Uf
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 21:19:52 +0000
Received: by iwn35 with SMTP id 35so1438223iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 14:19:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE8LpRd+nMiwYFEAFG1gLmPuC8--FjkOxEbBS+iE7NnWTQ@mail.gmail.com>
References: <1310071467-9017-1-git-send-email-computersforpeace@gmail.com>
	<CAMjpGUeynErQnLO17QUPDgMAvgQKzFqi424mo66z0AbRTKrsWw@mail.gmail.com>
	<CAN8TOE8LpRd+nMiwYFEAFG1gLmPuC8--FjkOxEbBS+iE7NnWTQ@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 7 Jul 2011 17:12:16 -0400
Message-ID: <CAMjpGUdvJ_kvH9ifM+1mPTtt9ZZUOyNn4RkygiFXT_BGAUui8w@mail.gmail.com>
Subject: Re: [PATCH 1/3] Makefile: fix "version.h" build for cross-compiling
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On Thu, Jul 7, 2011 at 17:09, Brian Norris wrote:
> On Thu, Jul 7, 2011 at 1:48 PM, Mike Frysinger wrote:
>> i dont think it's just a matter of "diff build dir for diff
>> toolchains, so common version.h is ok". =C2=A0it's a matter of "building
>> out of tree should build out of tree".
>
> OK, but what is the point of in- vs. out-of-tree? So that we can have
> a readonly source directory where the mtd-utils code stays?

this one imo, but maybe Artem can speak to the origins (which predate
my contributions)

>> i think the fix to your problem is:
>> =C2=A0$(BUILDDIR)/include/version.h.tmp
>> + =C2=A0 =C2=A0$(Q)mkdir -p $(dir $@)
>> =C2=A0 =C2=A0 =C2=A0 $(Q)echo '#define VERSION "$(VERSION)"' > $@
>
> Except that gives this error:
> =C2=A0CC =C2=A0 =C2=A0 =C2=A0ftl_format.o
> =C2=A0CC =C2=A0 =C2=A0 =C2=A0lib/libmtd.o
> In file included from lib/libmtd.c:40:0:
> ./include/common.h:28:21: fatal error: version.h: No such file or directo=
ry
> compilation terminated.
> make: *** [/home/norris/git/mtd-utils/mipsel-linux/lib/libmtd.o] Error 1
>
> Really, the build system is setup to look for headers in-tree, not
> out-of-tree. I'm not sure a good way to fix this other than to
> generate that header in-tree...any better suggestions?

top level Makefile:
-CPPFLAGS +=3D -I./include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFL=
AGS)
+CPPFLAGS +=3D -I./include -I$(BUILDDIR)/include -I./ubi-utils/include
$(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
-mike
