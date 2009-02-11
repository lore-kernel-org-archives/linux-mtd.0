Date: Wed, 11 Feb 2009 10:04:29 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: [PATCH v3] ubiformat: make it work on mtd parts > 2GiB
Message-ID: <20090211090429.GA32207@www.tglx.de>
References: <20090210095614.GA1995@www.tglx.de>
	<1234260416.17790.109.camel@localhost.localdomain>
	<20090210103354.GA8405@www.tglx.de>
	<1234337417.17790.123.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
In-Reply-To: <1234337417.17790.123.camel@localhost.localdomain>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have here a mtd part which is 3 GiB with a flash page size of 256KiB.
The 2GiB limit is at erase block 8192. In mtd_is_bad() the computation
for the MEMGETBADBLOCK ioctl() looks like the following:

| seek = eb * mtd->eb_size;

with both eb and mtd->eb_size being a signed int results in seek being a
signed result. Therefore I cast them to int as Artem suggested.

The _FILE_OFFSET_BITS=64 define is required to switch off_t from 32bit
to 64bit an 32bit systems. This is required in order to keep using
lseek() as lseek64 on 32bit system. Without this change lseek() in
mtd_read() is called with a 32bit value with most significat bit set and
the kernel performs a sign extension for the 64bit value which is used
in the mtd layer.

The last change also changes the size of the parameter which is passed
to the MEMGETBADBLOCK ioctl() from 32 to 64bit. The counter part in
kernel is also defined as loff_t which is of type __kernel_loff_t and
this is "long long". So this must have been broken for a while unless I
missed something.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
* Artem Bityutskiy | 2009-02-11 09:30:17 [+0200]:
>I believe this should be:
>
>seek = (off_t)eb * mtd->eb_size;
Yup, else it stops working for the bigger flashes. I sticked to the type
of seek.

 common.mk                        |    2 +-
 ubi-utils/new-utils/src/libmtd.c |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/common.mk b/common.mk
index 77d28bf..65fc1cc 100644
--- a/common.mk
+++ b/common.mk
@@ -2,7 +2,7 @@ CC := $(CROSS)gcc
 AR := $(CROSS)ar
 RANLIB := $(CROSS)ranlib
 CFLAGS ?= -O2 -g
-CFLAGS += -Wall -Wwrite-strings -W
+CFLAGS += -Wall -Wwrite-strings -W -D_FILE_OFFSET_BITS=64
 
 DESTDIR ?= /usr/local
 PREFIX=/usr
diff --git a/ubi-utils/new-utils/src/libmtd.c b/ubi-utils/new-utils/src/libmtd.c
index aab4b0e..b60ddbd 100644
--- a/ubi-utils/new-utils/src/libmtd.c
+++ b/ubi-utils/new-utils/src/libmtd.c
@@ -189,7 +189,7 @@ int mtd_is_bad(const struct mtd_info *mtd, int eb)
 	if (!mtd->allows_bb)
 		return 0;
 
-	seek = eb * mtd->eb_size;
+	seek = (loff_t)eb * mtd->eb_size;
 	ret = ioctl(mtd->fd, MEMGETBADBLOCK, &seek);
 	if (ret == -1) {
 		sys_errmsg("MEMGETBADBLOCK ioctl failed for "
@@ -231,7 +231,7 @@ int mtd_read(const struct mtd_info *mtd, int eb, int offs, void *buf, int len)
 	}
 
 	/* Seek to the beginning of the eraseblock */
-	seek = eb * mtd->eb_size + offs;
+	seek = (off_t)eb * mtd->eb_size + offs;
 	if (lseek(mtd->fd, seek, SEEK_SET) != seek) {
 		sys_errmsg("cannot seek mtd%d to offset %llu",
 			   mtd->num, (unsigned long long)seek);
@@ -296,7 +296,7 @@ int mtd_write(const struct mtd_info *mtd, int eb, int offs, void *buf, int len)
 #endif
 
 	/* Seek to the beginning of the eraseblock */
-	seek = eb * mtd->eb_size + offs;
+	seek = (off_t)eb * mtd->eb_size + offs;
 	if (lseek(mtd->fd, seek, SEEK_SET) != seek) {
 		sys_errmsg("cannot seek mtd%d to offset %llu",
 			   mtd->num, (unsigned long long)seek);
-- 
1.5.6.5
