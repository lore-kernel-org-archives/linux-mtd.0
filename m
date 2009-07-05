Received: from sorrow.cyrius.com ([65.19.161.204])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MNqHF-0004YV-1c
	for linux-mtd@lists.infradead.org; Mon, 06 Jul 2009 15:38:51 +0000
Resent-Message-ID: <20090706153831.GC2467@deprecation.cyrius.com>
Sender: Florian Fainelli <f.fainelli@gmail.com>
From: Florian Fainelli <florian@openwrt.org>
To: Martin Michlmayr <tbm@cyrius.com>
Subject: Re: mtd related Cobalt build failure with current git
Date: Sun, 5 Jul 2009 13:10:01 +0200
References: <20090704213741.GA6438@deprecation.cyrius.com>
In-Reply-To: <20090704213741.GA6438@deprecation.cyrius.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200907051310.02673.florian@openwrt.org>
Cc: linux-mips@linux-mips.org, dwmw2@infradead.org,
	Yoichi Yuasa <yuasa@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Martin,

Le Saturday 04 July 2009 23:37:41 Martin Michlmayr, vous avez =C3=A9crit=C2=
=A0:
> I get the following Cobalt build failure with current git:
>
>   CC      arch/mips/cobalt/mtd.o
> cc1: warnings being treated as errors
> In file included from arch/mips/cobalt/mtd.c:22:
> include/linux/mtd/partitions.h:50: warning: =E2=80=98struct mtd_info=E2=
=80=99 declared
> inside parameter list include/linux/mtd/partitions.h:50: warning: its sco=
pe
> is only this definition or declaration, which is probably not what you wa=
nt
> include/linux/mtd/partitions.h:51: warning: =E2=80=98struct mtd_info=E2=
=80=99 declared
> inside parameter list include/linux/mtd/partitions.h:61: warning: =E2=80=
=98struct
> mtd_info=E2=80=99 declared inside parameter list include/linux/mtd/partit=
ions.h:67:
> warning: =E2=80=98struct mtd_info=E2=80=99 declared inside parameter list=
 make[1]: ***
> [arch/mips/cobalt/mtd.o] Error 1
> make: *** [arch/mips/cobalt] Error 2
>
> Does anyone know if there's a fix for this already?

I also had that problem and did the following fix, which still applies to
the mtd-2.6 tree, master branch.
=2D-
=46rom: Florian Fainelli <florian@openwrt.org>
Subject: [PATCH] Fix arch/mips/cobalt/mtd.c build failure

This patch fixes a warning in include/linux/mtd/partitions which
results in the following build failure on MIPS:
 CC arch/mips/cobalt/mtd.o
cc1: warnings being treated as errors
In file included from arch/mips/cobalt/mtd.c:22:
include/linux/mtd/partitions.h:50: warning: 'struct mtd_info' declared insi=
de parameter list
include/linux/mtd/partitions.h:50: warning: its scope is only this definiti=
on or declaration, which is probably not what you want
include/linux/mtd/partitions.h:51: warning: 'struct mtd_info' declared insi=
de parameter list
include/linux/mtd/partitions.h:61: warning: 'struct mtd_info' declared insi=
de parameter list
include/linux/mtd/partitions.h:67: warning: 'struct mtd_info' declared insi=
de parameter list
make[1]: *** [arch/mips/cobalt/mtd.o] Error 1
make: *** [arch/mips/cobalt] Error 2

Reported-by: Martin Michlmayr <tbm@cyrius.com>
Signed-off-by: Florian Fainelli <florian@openwrt.org>
=2D--
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index af6dcb9..c8eaf44 100644
=2D-- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -10,7 +10,7 @@
 #define MTD_PARTITIONS_H
=20
 #include <linux/types.h>
=2D
+#include <linux/mtd/mtd.h>
=20
 /*
  * Partition definition structure:
