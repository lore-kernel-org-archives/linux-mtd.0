Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PASKd-0007GS-KS
	for linux-mtd@lists.infradead.org; Mon, 25 Oct 2010 19:03:49 +0000
Received: by fxm15 with SMTP id 15so2653519fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Oct 2010 12:03:41 -0700 (PDT)
Subject: Re: Issues with ubi utils Makefile
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Charles Manning <manningc2@actrix.gen.nz>, Mike Frysinger
	<vapier.adi@gmail.com>
In-Reply-To: <201010211643.33332.manningc2@actrix.gen.nz>
References: <201010211643.33332.manningc2@actrix.gen.nz>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Oct 2010 22:03:36 +0300
Message-ID: <1288033416.1865.2.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-10-21 at 16:43 +1300, Charles Manning wrote:
> Hi All
> 
> I'm getting some errors trying to mount a ubinized volume with a more recent 
> kernel and think it might be due to problems in the ubi utils distributed 
> with Ubuntu Meerkat.
> 
> I thus thought I'd build from git
> 
> When I do a make install from inside the mtd-utils/ubi-utils it tries to place 
> the binaries in /usr/local//usr/sbin.
> 
> Same happens if I try make install from mtd-utils/
> 
> Is something broken or am I driving it incorrectly?

Looks like Mike's commit broke it:

commit 96a4f76f2e9dad7fdbd6fd7740de44bc90d5769e
Author: Mike Frysinger <vapier@gentoo.org>

    Unify all common build system parts

I've quickly cooked this fix, does it work for you? Mike, are you ok
with this?

>From 69148e5bb5b0aa546c097a76e293585b3a839e0c Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Date: Mon, 25 Oct 2010 21:54:47 +0300
Subject: [PATCH] mtd-utils: fix make install

Commit 96a4f76f2e9dad7fdbd6fd7740de44bc90d5769e broke 'make install'.
Before that commit, $DESTDIR was undefined, so  ${DESTDIR}/${SBINDIR}
was /usr/sbin, and after the commit $DESTDIR became /usr/local, so
${DESTDIR}/${SBINDIR} became /usr/local//usr/sbin, which is wrong.

Fix this by making $DESTDIR become the distination directory of installing,
i.e. 'DESTDIR ?= /usr' and making SBINDIR become just 'sbin'.

While we are on it, fix $MANDIR similarly, and remove $PREFIX and
$EXEC_PREFIX variables, which become unneeded.

Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
Reported-by: Charles Manning <manningc2@actrix.gen.nz>
---
 common.mk |    9 +++------
 1 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/common.mk b/common.mk
index a55c548..2e4452f 100644
--- a/common.mk
+++ b/common.mk
@@ -20,12 +20,9 @@ ifneq ($(WITHOUT_LARGEFILE), 1)
   CPPFLAGS += -D_FILE_OFFSET_BITS=64
 endif
 
-DESTDIR ?= /usr/local
-PREFIX=/usr
-EXEC_PREFIX=$(PREFIX)
-SBINDIR=$(EXEC_PREFIX)/sbin
-MANDIR=$(PREFIX)/share/man
-INCLUDEDIR=$(PREFIX)/include
+DESTDIR ?= /usr
+SBINDIR=sbin
+MANDIR=share/man
 
 ifndef BUILDDIR
 ifeq ($(origin CROSS),undefined)
-- 
1.7.2.3

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
