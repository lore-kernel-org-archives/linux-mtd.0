Received: from tim.rpsys.net ([194.106.48.114])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JKW3o-0006Lx-J4
	for linux-mtd@lists.infradead.org; Thu, 31 Jan 2008 09:50:34 +0000
Subject: Re: [RFC PATCH 1/3]] Add mtd panic_write function pointer
From: Richard Purdie <rpurdie@rpsys.net>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080130220631.GA6786@lazybastard.org>
References: <1201607964.5017.48.camel@localhost.localdomain>
	<20080129231104.GC32157@lazybastard.org>
	<1201687383.4668.1.camel@localhost.localdomain>
	<20080130220631.GA6786@lazybastard.org>
Content-Type: text/plain; charset=ISO-8859-1
Date: Thu, 31 Jan 2008 09:49:15 +0000
Message-Id: <1201772955.4996.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-01-30 at 23:06 +0100, Jörn Engel wrote:
> Yes.  struct mtd_info, like many other kernel interfaces, is nearly
> impossible to use without either copying example code or reading the
> implementation (aka reverse-engineering the kernel).  We could certainly
> do better than that.  And for new additions we should.

Totally agreed, updated patch follows.


MTDs are well suited for logging critical data and the mtdoops driver
allows kernel panics/oops to be written to flash in a blackbox flight
recorder fashion allowing better debugging and analysis of crashes.

Any kernel oops in user context can be easily handled since the kernel
continues as normal and any queued mtd writes are scheduled. Any kernel
oops in interrupt context results in a panic and the delayed writes will
not be scheduled however. The existing mtd->write function cannot be
called in interrupt context so these messages can never be written to
flash.

This patch adds a panic_write function pointer that drivers can
optionally implement which can be called in interrupt context. It is
only intended to be called when its known the kernel is about to panic
and we need to write to succeed. Since the kernel is not going to be
running for much longer, this function can break locks and delay to
ensure the write succeeds (but not sleep).

Signed-off-by: Richard Purdie <rpurdie@rpsys.net>

---
 drivers/mtd/mtdpart.c   |   17 +++++++++++++++++
 include/linux/mtd/mtd.h |    9 +++++++++
 2 files changed, 26 insertions(+)

Index: kernel-hacking/drivers/mtd/mtdpart.c
===================================================================
--- kernel-hacking.orig/drivers/mtd/mtdpart.c	2008-01-31 09:37:23.000000000 +0000
+++ kernel-hacking/drivers/mtd/mtdpart.c	2008-01-31 09:37:28.000000000 +0000
@@ -151,6 +151,20 @@ static int part_write (struct mtd_info *
 				    len, retlen, buf);
 }
 
+static int part_panic_write (struct mtd_info *mtd, loff_t to, size_t len,
+			size_t *retlen, const u_char *buf)
+{
+	struct mtd_part *part = PART(mtd);
+	if (!(mtd->flags & MTD_WRITEABLE))
+		return -EROFS;
+	if (to >= mtd->size)
+		len = 0;
+	else if (to + len > mtd->size)
+		len = mtd->size - to;
+	return part->master->panic_write (part->master, to + part->offset,
+				    len, retlen, buf);
+}
+
 static int part_write_oob(struct mtd_info *mtd, loff_t to,
 			 struct mtd_oob_ops *ops)
 {
@@ -352,6 +366,9 @@ int add_mtd_partitions(struct mtd_info *
 		slave->mtd.read = part_read;
 		slave->mtd.write = part_write;
 
+		if (master->panic_write)
+			slave->mtd.panic_write = part_panic_write;
+
 		if(master->point && master->unpoint){
 			slave->mtd.point = part_point;
 			slave->mtd.unpoint = part_unpoint;
Index: kernel-hacking/include/linux/mtd/mtd.h
===================================================================
--- kernel-hacking.orig/include/linux/mtd/mtd.h	2008-01-31 09:37:23.000000000 +0000
+++ kernel-hacking/include/linux/mtd/mtd.h	2008-01-31 09:44:06.000000000 +0000
@@ -152,6 +152,15 @@ struct mtd_info {
 	int (*read) (struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen, u_char *buf);
 	int (*write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
 
+	/* In blackbox flight recorder like scenarios we want to make successful
+	    writes in interrupt context. panic_write() is only intended to be
+	    called when its known the kernel is about to panic and we need the
+	    write to succeed. Since the kernel is not going to be running for much
+	    longer, this function can break locks and delay to ensure the write
+	    succeeds (but not sleep). */
+
+	int (*panic_write) (struct mtd_info *mtd, loff_t to, size_t len, size_t *retlen, const u_char *buf);
+
 	int (*read_oob) (struct mtd_info *mtd, loff_t from,
 			 struct mtd_oob_ops *ops);
 	int (*write_oob) (struct mtd_info *mtd, loff_t to,
