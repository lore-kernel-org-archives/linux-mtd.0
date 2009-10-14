Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1My46T-0006mI-Tl
	for linux-mtd@lists.infradead.org; Wed, 14 Oct 2009 13:41:26 +0000
Date: Wed, 14 Oct 2009 15:41:13 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Linus Torvalds <torvalds@linux-foundation.org>, linux-mtd
	<linux-mtd@lists.infradead.org>
Subject: [PATCH v6 3/5]: mtdoops: Make page (record) size configurable
Message-ID: <20091014154113.11c0837f@marrow.netinsight.se>
In-Reply-To: <20091014153458.05e31db6@marrow.netinsight.se>
References: <20091012113758.GB11035@elte.hu>
	<20091012140149.6789efab@marrow.netinsight.se>
	<20091012120951.GA16799@elte.hu>
	<1255349748.10605.13.camel@macbook.infradead.org>
	<20091012122023.GA19365@elte.hu>
	<20091012150650.51a4b4dc@marrow.netinsight.se>
	<20091012131528.GC25464@elte.hu>
	<20091012153937.0dcd73e5@marrow.netinsight.se>
	<alpine.LFD.2.01.0910120828390.3438@localhost.localdomain>
	<20091012110954.67d7d8d8.akpm@linux-foundation.org>
	<20091012182346.GH17138@elte.hu>
	<alpine.LFD.2.01.0910121130190.3438@localhost.localdomain>
	<20091014153458.05e31db6@marrow.netinsight.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Artem Bityutskiy <dedekind1@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
	"Koskinen Aaro \(Nokia-D/Helsinki\)" <aaro.koskinen@nokia.com>,
	Ingo Molnar <mingo@elte.hu>, David Woodhouse <dwmw2@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The main justification for this is to allow catching long messages
during a panic, where the top part might otherwise be lost since moving
to the next block can require a flash erase.

Signed-off-by: Simon Kagstrom <simon.kagstrom@netinsight.net>
Reviewed-by: Anders Grafstrom <anders.grafstrom@netinsight.net>
---
ChangeLog:
Review comments from Anders Grafstr=C3=B6m and own fixes:
       * Set record_size parameter permissions to 0400
       * Don't require power-of-two sizes

 drivers/mtd/mtdoops.c |   76 ++++++++++++++++++++++++++++-----------------=
---
 1 files changed, 44 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 08627c2..2870a11 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -34,7 +34,11 @@
 #include <linux/mtd/mtd.h>
=20
 #define MTDOOPS_KERNMSG_MAGIC 0x5d005d00
-#define OOPS_PAGE_SIZE 4096
+
+static unsigned long record_size =3D 4096;
+module_param(record_size, ulong, 0400);
+MODULE_PARM_DESC(record_size,
+		"record size for MTD OOPS pages in bytes (default 4096)");
=20
 static struct mtdoops_context {
 	int mtd_index;
@@ -80,8 +84,8 @@ static int mtdoops_erase_block(struct mtdoops_context *cx=
t, int offset)
 {
 	struct mtd_info *mtd =3D cxt->mtd;
 	u32 start_page_offset =3D mtd_div_by_eb(offset, mtd) * mtd->erasesize;
-	u32 start_page =3D start_page_offset / OOPS_PAGE_SIZE;
-	u32 erase_pages =3D mtd->erasesize / OOPS_PAGE_SIZE;
+	u32 start_page =3D start_page_offset / record_size;
+	u32 erase_pages =3D mtd->erasesize / record_size;
 	struct erase_info erase;
 	DECLARE_WAITQUEUE(wait, current);
 	wait_queue_head_t wait_q;
@@ -149,15 +153,15 @@ static void mtdoops_workfunc_erase(struct work_struct=
 *work)
 	if (!mtd)
 		return;
=20
-	mod =3D (cxt->nextpage * OOPS_PAGE_SIZE) % mtd->erasesize;
+	mod =3D (cxt->nextpage * record_size) % mtd->erasesize;
 	if (mod !=3D 0) {
-		cxt->nextpage =3D cxt->nextpage + ((mtd->erasesize - mod) / OOPS_PAGE_SI=
ZE);
+		cxt->nextpage =3D cxt->nextpage + ((mtd->erasesize - mod) / record_size);
 		if (cxt->nextpage >=3D cxt->oops_pages)
 			cxt->nextpage =3D 0;
 	}
=20
 	while (mtd->block_isbad) {
-		ret =3D mtd->block_isbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret =3D mtd->block_isbad(mtd, cxt->nextpage * record_size);
 		if (!ret)
 			break;
 		if (ret < 0) {
@@ -165,20 +169,20 @@ static void mtdoops_workfunc_erase(struct work_struct=
 *work)
 			return;
 		}
 badblock:
-		printk(KERN_WARNING "mtdoops: bad block at %08x\n",
-		       cxt->nextpage * OOPS_PAGE_SIZE);
+		printk(KERN_WARNING "mtdoops: bad block at %08lx\n",
+		       cxt->nextpage * record_size);
 		i++;
-		cxt->nextpage =3D cxt->nextpage + (mtd->erasesize / OOPS_PAGE_SIZE);
+		cxt->nextpage =3D cxt->nextpage + (mtd->erasesize / record_size);
 		if (cxt->nextpage >=3D cxt->oops_pages)
 			cxt->nextpage =3D 0;
-		if (i =3D=3D cxt->oops_pages / (mtd->erasesize / OOPS_PAGE_SIZE)) {
+		if (i =3D=3D cxt->oops_pages / (mtd->erasesize / record_size)) {
 			printk(KERN_ERR "mtdoops: all blocks bad!\n");
 			return;
 		}
 	}
=20
 	for (j =3D 0, ret =3D -1; (j < 3) && (ret < 0); j++)
-		ret =3D mtdoops_erase_block(cxt, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret =3D mtdoops_erase_block(cxt, cxt->nextpage * record_size);
=20
 	if (ret >=3D 0) {
 		printk(KERN_DEBUG "mtdoops: ready %d, %d\n",
@@ -188,7 +192,7 @@ badblock:
 	}
=20
 	if (mtd->block_markbad && ret =3D=3D -EIO) {
-		ret =3D mtd->block_markbad(mtd, cxt->nextpage * OOPS_PAGE_SIZE);
+		ret =3D mtd->block_markbad(mtd, cxt->nextpage * record_size);
 		if (ret < 0) {
 			printk(KERN_ERR "mtdoops: block_markbad failed, aborting\n");
 			return;
@@ -203,22 +207,22 @@ static void mtdoops_write(struct mtdoops_context *cxt=
, int panic)
 	size_t retlen;
 	int ret;
=20
-	if (cxt->writecount < OOPS_PAGE_SIZE)
+	if (cxt->writecount < record_size)
 		memset(cxt->oops_buf + cxt->writecount, 0xff,
-					OOPS_PAGE_SIZE - cxt->writecount);
+					record_size - cxt->writecount);
=20
 	if (panic)
-		ret =3D mtd->panic_write(mtd, cxt->nextpage * OOPS_PAGE_SIZE,
-					OOPS_PAGE_SIZE, &retlen, cxt->oops_buf);
+		ret =3D mtd->panic_write(mtd, cxt->nextpage * record_size,
+					record_size, &retlen, cxt->oops_buf);
 	else
-		ret =3D mtd->write(mtd, cxt->nextpage * OOPS_PAGE_SIZE,
-					OOPS_PAGE_SIZE, &retlen, cxt->oops_buf);
+		ret =3D mtd->write(mtd, cxt->nextpage * record_size,
+					record_size, &retlen, cxt->oops_buf);
=20
 	cxt->writecount =3D 0;
=20
-	if (retlen !=3D OOPS_PAGE_SIZE || ret < 0)
-		printk(KERN_ERR "mtdoops: write failure at %d (%td of %d written), error=
 %d\n",
-		       cxt->nextpage * OOPS_PAGE_SIZE, retlen, OOPS_PAGE_SIZE, ret);
+	if (retlen !=3D record_size || ret < 0)
+		printk(KERN_ERR "mtdoops: write failure at %ld (%td of %ld written), err=
or %d\n",
+		       cxt->nextpage * record_size, retlen, record_size, ret);
 	mark_page_used(cxt, cxt->nextpage);
=20
 	mtdoops_inc_counter(cxt);
@@ -243,10 +247,10 @@ static void find_next_position(struct mtdoops_context=
 *cxt)
 	for (page =3D 0; page < cxt->oops_pages; page++) {
 		/* Assume the page is used */
 		mark_page_used(cxt, page);
-		ret =3D mtd->read(mtd, page * OOPS_PAGE_SIZE, 8, &retlen, (u_char *) &co=
unt[0]);
+		ret =3D mtd->read(mtd, page * record_size, 8, &retlen, (u_char *) &count=
[0]);
 		if (retlen !=3D 8 || (ret < 0 && ret !=3D -EUCLEAN)) {
-			printk(KERN_ERR "mtdoops: read failure at %d (%td of 8 read), err %d\n",
-			       page * OOPS_PAGE_SIZE, retlen, ret);
+			printk(KERN_ERR "mtdoops: read failure at %ld (%td of 8 read), err %d\n=
",
+			       page * record_size, retlen, ret);
 			continue;
 		}
=20
@@ -300,7 +304,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	struct mtdoops_context *cxt =3D &oops_cxt;
 	u64 mtdoops_pages =3D mtd->size;
=20
-	do_div(mtdoops_pages, OOPS_PAGE_SIZE);
+	do_div(mtdoops_pages, record_size);
=20
 	if (cxt->name && !strcmp(mtd->name, cxt->name))
 		cxt->mtd_index =3D mtd->index;
@@ -314,7 +318,7 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 		return;
 	}
=20
-	if (mtd->erasesize < OOPS_PAGE_SIZE) {
+	if (mtd->erasesize < record_size) {
 		printk(KERN_ERR "mtdoops: eraseblock size of MTD partition %d too small\=
n",
 		       mtd->index);
 		return;
@@ -329,9 +333,9 @@ static void mtdoops_notify_add(struct mtd_info *mtd)
 	}
 	cxt->mtd =3D mtd;
 	if (mtd->size > INT_MAX)
-		cxt->oops_pages =3D INT_MAX / OOPS_PAGE_SIZE;
+		cxt->oops_pages =3D INT_MAX / record_size;
 	else
-		cxt->oops_pages =3D (int)mtd->size / OOPS_PAGE_SIZE;
+		cxt->oops_pages =3D (int)mtd->size / record_size;
=20
 	find_next_position(cxt);
=20
@@ -408,15 +412,15 @@ mtdoops_console_write(struct console *co, const char =
*s, unsigned int count)
 		cxt->writecount =3D 8;
 	}
=20
-	if (count + cxt->writecount > OOPS_PAGE_SIZE)
-		count =3D OOPS_PAGE_SIZE - cxt->writecount;
+	if (count + cxt->writecount > record_size)
+		count =3D record_size - cxt->writecount;
=20
 	memcpy(cxt->oops_buf + cxt->writecount, s, count);
 	cxt->writecount +=3D count;
=20
 	spin_unlock_irqrestore(&cxt->writecount_lock, flags);
=20
-	if (cxt->writecount =3D=3D OOPS_PAGE_SIZE)
+	if (cxt->writecount =3D=3D record_size)
 		mtdoops_console_sync();
 }
=20
@@ -455,8 +459,16 @@ static int __init mtdoops_console_init(void)
 {
 	struct mtdoops_context *cxt =3D &oops_cxt;
=20
+	if ((record_size & 4095) !=3D 0) {
+		printk(KERN_ERR "mtdoops: record_size must be a multiple of 4096\n");
+		return -EINVAL;
+	}
+	if (record_size < 4096) {
+		printk(KERN_ERR "mtdoops: record_size must be over 4096 bytes\n");
+		return -EINVAL;
+	}
 	cxt->mtd_index =3D -1;
-	cxt->oops_buf =3D vmalloc(OOPS_PAGE_SIZE);
+	cxt->oops_buf =3D vmalloc(record_size);
 	if (!cxt->oops_buf) {
 		printk(KERN_ERR "mtdoops: failed to allocate buffer workspace\n");
 		return -ENOMEM;
--=20
1.6.0.4
