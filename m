Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qewaq-0003eY-NM
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 21:58:45 +0000
Received: by iwn35 with SMTP id 35so1469274iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 14:57:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE8r9e_M=diAsxLtyX1Qfxv-aF3Nt6ZdkyfZ0ERwUtF4tA@mail.gmail.com>
References: <1310071467-9017-1-git-send-email-computersforpeace@gmail.com>
	<CAMjpGUeynErQnLO17QUPDgMAvgQKzFqi424mo66z0AbRTKrsWw@mail.gmail.com>
	<CAN8TOE8LpRd+nMiwYFEAFG1gLmPuC8--FjkOxEbBS+iE7NnWTQ@mail.gmail.com>
	<CAMjpGUdvJ_kvH9ifM+1mPTtt9ZZUOyNn4RkygiFXT_BGAUui8w@mail.gmail.com>
	<CAN8TOE8r9e_M=diAsxLtyX1Qfxv-aF3Nt6ZdkyfZ0ERwUtF4tA@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 7 Jul 2011 17:49:46 -0400
Message-ID: <CAMjpGUfF-_ctCKRkNHnqJM+H1xzyR1RmCJUT5uTr4cdjfdqVQw@mail.gmail.com>
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

On Thu, Jul 7, 2011 at 17:36, Brian Norris wrote:
> On Thu, Jul 7, 2011 at 2:12 PM, Mike Frysinger wrote:
>> top level Makefile:
>> -CPPFLAGS +=3D -I./include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCP=
PFLAGS)
>> +CPPFLAGS +=3D -I./include -I$(BUILDDIR)/include -I./ubi-utils/include
>> $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
>
> I still get the same error.
>
> The rule for:
> =C2=A0CC =C2=A0 =C2=A0 =C2=A0lib/libmtd.o
> doesn't include $(CPPFLAGS). Is this intentional? See:
> %: %.o $(LDDEPS)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0$(call BECHO,LD)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0$(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(LDFLAGS_$(not=
dir $@)) -g -o
> $@ $^ $(LDLIBS) $(LDLIBS_$(notdir $@))

that's a link, not a compile, so CPPFLAGS shouldnt be needed as it
should only be used on *.o files.  that also shows "BECHO,LD" but your
quoted output is "CC ...", and the CC rule does use CPPFLAGS.

> Anyway, it's hard to trade lines about Makefile fixes, since one fix
> will pop up another problem in hacked-together build systems like
> mtd-utils...can you reproduce my bug completely, Mike? Or shall I
> continue trial and error until we find something good enough for both
> of us? :)

np ... i'll look at it
-mike
