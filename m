Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QewVl-0005uF-8z
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 21:53:30 +0000
Received: by iyn15 with SMTP id 15so1504031iyn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 14:53:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMjpGUfF-_ctCKRkNHnqJM+H1xzyR1RmCJUT5uTr4cdjfdqVQw@mail.gmail.com>
References: <1310071467-9017-1-git-send-email-computersforpeace@gmail.com>
	<CAMjpGUeynErQnLO17QUPDgMAvgQKzFqi424mo66z0AbRTKrsWw@mail.gmail.com>
	<CAN8TOE8LpRd+nMiwYFEAFG1gLmPuC8--FjkOxEbBS+iE7NnWTQ@mail.gmail.com>
	<CAMjpGUdvJ_kvH9ifM+1mPTtt9ZZUOyNn4RkygiFXT_BGAUui8w@mail.gmail.com>
	<CAN8TOE8r9e_M=diAsxLtyX1Qfxv-aF3Nt6ZdkyfZ0ERwUtF4tA@mail.gmail.com>
	<CAMjpGUfF-_ctCKRkNHnqJM+H1xzyR1RmCJUT5uTr4cdjfdqVQw@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 7 Jul 2011 17:53:05 -0400
Message-ID: <CAMjpGUeZLiuqr4GAbqeveF4i5xB40JEuHuWZ8Qt-BTOLSQBVuw@mail.gmail.com>
Subject: Re: [PATCH 1/3] Makefile: fix "version.h" build for cross-compiling
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

with my two proposed changes, it's working for me now ...

$ git clean -x -d
$ git diff
--- a/Makefile
+++ b/Makefile
@@ -3,7 +3,7 @@

 VERSION = 1.4.5

-CPPFLAGS += -I./include -I./ubi-utils/include $(ZLIBCPPFLAGS) $(LZOCPPFLAGS)
+CPPFLAGS += -I./include -I$(BUILDDIR)/include -I./ubi-utils/include
$(ZLIBCPPFLAGS) $(LZOCPPFLAGS)

 ifeq ($(WITHOUT_XATTR), 1)
   CPPFLAGS += -DWITHOUT_XATTR
@@ -71,6 +71,7 @@ cscope:
 $(BUILDDIR)/include/version.h: $(BUILDDIR)/include/version.h.tmp
    $(Q)cmp -s $@ $@.tmp && rm -f $@.tmp || mv $@.tmp $@
 $(BUILDDIR)/include/version.h.tmp:
+   $(Q)mkdir -p $(dir $@)
    $(Q)echo '#define VERSION "$(VERSION)"' > $@

 #

$ make CROSS=x86_64-pc-linux-gnu- -j2
... success ...
-mike
