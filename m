Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QevUn-0004gX-Hv
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2011 20:48:26 +0000
Received: by iyn15 with SMTP id 15so1450857iyn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 07 Jul 2011 13:48:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1310071467-9017-1-git-send-email-computersforpeace@gmail.com>
References: <1310071467-9017-1-git-send-email-computersforpeace@gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 7 Jul 2011 16:48:03 -0400
Message-ID: <CAMjpGUeynErQnLO17QUPDgMAvgQKzFqi424mo66z0AbRTKrsWw@mail.gmail.com>
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

On Thu, Jul 7, 2011 at 16:44, Brian Norris wrote:
> When using "make CROSS=mipsel-linux-", I get the following errors:
>
> /bin/sh: /home/norris/git/mtd-utils/mipsel-linux/include/version.h.tmp: No such file or directory
> make: *** [/home/norris/git/mtd-utils/mipsel-linux/include/version.h.tmp] Error 1
>
> So instead of "building" our version.h within $(BUILDIR), we should
> just build it in the main source directory, as it isn't architecture-
> specific or anything. Hopefully that doesn't "break the rules" of our
> cross-compilation setup...

i dont think it's just a matter of "diff build dir for diff
toolchains, so common version.h is ok".  it's a matter of "building
out of tree should build out of tree".

i think the fix to your problem is:
 $(BUILDDIR)/include/version.h.tmp
+    $(Q)mkdir -p $(dir $@)
       $(Q)echo '#define VERSION "$(VERSION)"' > $@
-mike
