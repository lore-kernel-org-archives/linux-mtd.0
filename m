Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QewEy-0005fq-IZ
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 21:36:09 +0000
Received: by wwi14 with SMTP id 14so53937wwi.0
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 14:36:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMjpGUdvJ_kvH9ifM+1mPTtt9ZZUOyNn4RkygiFXT_BGAUui8w@mail.gmail.com>
References: <1310071467-9017-1-git-send-email-computersforpeace@gmail.com>
	<CAMjpGUeynErQnLO17QUPDgMAvgQKzFqi424mo66z0AbRTKrsWw@mail.gmail.com>
	<CAN8TOE8LpRd+nMiwYFEAFG1gLmPuC8--FjkOxEbBS+iE7NnWTQ@mail.gmail.com>
	<CAMjpGUdvJ_kvH9ifM+1mPTtt9ZZUOyNn4RkygiFXT_BGAUui8w@mail.gmail.com>
Date: Thu, 7 Jul 2011 14:36:05 -0700
Message-ID: <CAN8TOE8r9e_M=diAsxLtyX1Qfxv-aF3Nt6ZdkyfZ0ERwUtF4tA@mail.gmail.com>
Subject: Re: [PATCH 1/3] Makefile: fix "version.h" build for cross-compiling
From: Brian Norris <computersforpeace@gmail.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jul 7, 2011 at 2:12 PM, Mike Frysinger <vapier.adi@gmail.com> wrote:
> top level Makefile:
> -CPPFLAGS += -I./include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
> +CPPFLAGS += -I./include -I$(BUILDDIR)/include -I./ubi-utils/include
> $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)

I still get the same error.

The rule for:
 CC      lib/libmtd.o
doesn't include $(CPPFLAGS). Is this intentional? See:
%: %.o $(LDDEPS)
        $(call BECHO,LD)
        $(Q)$(CC) $(CFLAGS) $(LDFLAGS) $(LDFLAGS_$(notdir $@)) -g -o
$@ $^ $(LDLIBS) $(LDLIBS_$(notdir $@))

Anyway, it's hard to trade lines about Makefile fixes, since one fix
will pop up another problem in hacked-together build systems like
mtd-utils...can you reproduce my bug completely, Mike? Or shall I
continue trial and error until we find something good enough for both
of us? :)

Brian
