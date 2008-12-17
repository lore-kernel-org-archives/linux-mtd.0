Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LCtV2-0001pB-9J
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 10:19:28 +0000
Received: from www.tglx.de (www.tglx.de [127.0.0.1])
	by www.tglx.de (8.13.8/8.13.8/TGLX-2007100201) with ESMTP id
	mBHAJO6j005482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Wed, 17 Dec 2008 11:19:24 +0100
Received: (from bigeasy@localhost)
	by www.tglx.de (8.13.8/8.13.8/Submit) id mBHAJOve005481
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 11:19:24 +0100
Date: Wed, 17 Dec 2008 11:19:24 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-mtd@lists.infradead.org
Subject: [RFC] remove -W from build process
Message-ID: <20081217101924.GB4999@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I didn't really figured what exactly goes wrong but if I compile with
CFLAGS unset then the compile process goes like this:
| gcc -O2 -Werror -Wall -Iinclude -Isrc -I../../include src/ubiupdatevol.c -c -o ubiupdatevol.o

Once I set the enviroment CFLAGS to "-g -O2" I also get
"-Wall -Wall -Wwrite-strings -W":
| gcc -g -O2 -Wall -Wall -Wwrite-strings -W -Werror -Wall -Iinclude -Isrc -I../../include src/ubiupdatevol.c -c -o ubiupdatevol.o
|cc1: warnings being treated as errors
|src/ubiupdatevol.c: In function 'truncate_volume':
|src/ubiupdatevol.c:179: error: comparison between signed and unsigned
|src/ubiupdatevol.c:183: error: comparison between signed and unsigned
....

and it aborts. I tried to cleanup the signed and unsigned thing but it is
a long a way. So I guess it may be the best to just disable -Wextra for
now.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
Would it be possible to use autotools for a clean build environment?

 ubi-utils/Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/ubi-utils/Makefile b/ubi-utils/Makefile
index 63058e1..67e9f6a 100644
--- a/ubi-utils/Makefile
+++ b/ubi-utils/Makefile
@@ -10,7 +10,7 @@ INCLUDEDIR=/usr/include
 
 CC := $(CROSS)gcc
 CFLAGS ?= -O2 -g -Werror
-CFLAGS += -Wall -Wwrite-strings -W
+CFLAGS += -Wall -Wwrite-strings
 CPPFLAGS += -I./inc -I./src -I$(KERNELHDR) \
 	-std=gnu99 -DPACKAGE_VERSION=\"1.0\"
 
-- 
1.5.6.5
