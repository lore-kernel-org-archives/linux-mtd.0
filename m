Received: from cc60549-a.deven1.ov.home.nl ([217.120.140.54]
	helo=server.grimmerink.dhs.org)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q8V8-0005wt-QN
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 17:31:07 +0100
Received: from lunarpieter (lunarpieter.wielewaal [192.168.14.99])
	with ESMTP id h5BGVAI03739
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 18:31:10 +0200
From: Pieter Grimmerink <mailinglists@grimmerink.nl>
To: linux-mtd@lists.infradead.org
Date: Wed, 11 Jun 2003 18:31:07 +0200
MIME-Version: 1.0
Message-Id: <200306111831.07071.mailinglists@grimmerink.nl>
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Errors compiling current mtd CVS version
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I just checked out the mtd+jffs2 patches from CVS, and patched them into =
a=20
2.4.19 kernel tree, using patchin.sh.

Now I've enabled mtd & jffs2, and try to compile.

#include <linux/init.h> seems to be missing in mtd/chips/amd_flash.c
(errors on __init and __exit)

#include <linux/sched.h> seems to be missing in fs/jffs2/write.c
(error on 'current')

If I have jffs enabled as well, it failes because Makefile.common is miss=
ing.

When I also patch in zlib (using patchin.sh), Makefile.common is missing =
both=20
in zlib_inflate and zlib_deflate.

Is there a problem with my config?

Best regards,

Pieter
