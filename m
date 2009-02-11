Date: Wed, 11 Feb 2009 10:05:32 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: [PATCH] get rid of "compare between signed and unsigned" warnings
Message-ID: <20090211090532.GB32207@www.tglx.de>
References: <20090210095614.GA1995@www.tglx.de>
	<1234260416.17790.109.camel@localhost.localdomain>
	<4991542C.4080206@linutronix.de>
	<1234261659.17790.117.camel@localhost.localdomain>
	<49915BAF.2070709@linutronix.de>
	<1234337444.17790.124.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1234337444.17790.124.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy said once:
|I mean, IMO most of these warnings are not really sane, and cleaning
|that up just adds mess - you stop understanding why is something signed
|or unsigned  :-)

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 common.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/common.mk b/common.mk
index 65fc1cc..0e8c62b 100644
--- a/common.mk
+++ b/common.mk
@@ -2,7 +2,7 @@ CC := $(CROSS)gcc
 AR := $(CROSS)ar
 RANLIB := $(CROSS)ranlib
 CFLAGS ?= -O2 -g
-CFLAGS += -Wall -Wwrite-strings -W -D_FILE_OFFSET_BITS=64
+CFLAGS += -Wall -Wextra -Wwrite-strings -Wno-sign-compare -D_FILE_OFFSET_BITS=64
 
 DESTDIR ?= /usr/local
 PREFIX=/usr
-- 
1.5.6.5
