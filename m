Received: from smtp.nokia.com ([131.228.20.171] helo=mgw-ext12.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GxgXE-000502-Ks
	for linux-mtd@lists.infradead.org; Fri, 22 Dec 2006 04:17:51 -0500
Subject: Re: OneNAND: Update OOB free table
From: Artem Bityutskiy <dedekind@infradead.org>
To: kyungmin.park@samsung.com
In-Reply-To: <31196440.367141166752320332.JavaMail.weblogic@ep_ml29>
References: <31196440.367141166752320332.JavaMail.weblogic@ep_ml29>
Content-Type: multipart/mixed; boundary="=-LrcHu31NxCMI8XAjwHft"
Date: Fri, 22 Dec 2006 11:17:25 +0200
Message-Id: <1166779045.3939.58.camel@sauron>
Mime-Version: 1.0
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-LrcHu31NxCMI8XAjwHft
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Fri, 2006-12-22 at 01:52 +0000, Kyungmin Park wrote:
> Okay, I understand the MTD_OOB_AUTO concept. but now JFFS2 only use the M=
TD_OOB_PLACE.=20
> so JFFS2 skip the ecc position for backward compatibility.
...
>=20
> Now OneNAND don't support MTD_OOB_AUTO, but if the jffs2 supports the thi=
s one. I will support it.
> I think it's more reasonable to handle oob in driver level instead of fil=
esystem.

I take care about this in JFFS, you take care in OneNAND, OK?

> Actually, I'm not sure where's the right place. But if we don't touch the=
 watchdong.
> it will soft lockup when mounting the JFFS2 with big partition. (I just b=
orrowed it from nand.)

Anyway, you should not touch watchdog. You problem is fixed by adding
cond_resched() at the right places. What you did - you shut up watchdog
which screamed about a real error, instead of solving the error.

I have prepared a patch - it is in my dedekind-mtd-2.6.git GIT tree. It
is also attached.

> No, I used it in infradead.org. but I just used for commit.

Cool.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)

--=-LrcHu31NxCMI8XAjwHft
Content-Disposition: attachment; filename=onenand-sched.diff
Content-Type: application/mbox; name=onenand-sched.diff
Content-Transfer-Encoding: 7bit

>From 6adeda7bf64b72a210c6ed518f3aaf3525d8d740 Mon Sep 17 00:00:00 2001
From: Artem Bityutskiy <dedekind@infradead.org>
Date: Fri, 22 Dec 2006 11:13:40 +0200
Subject: [PATCH] [MTD] OneNAND: release CPU in cycles

This patch teaches OneNAND to release processor in
read/write/erase cycles and let other processes proceed.
Also, remove buggi touch watchdog call which only hides
the problem instead of solving it.

Signed-off-by: Artem Bityutskiy <dedekind@infradead.org>
---
 drivers/mtd/onenand/onenand_base.c |   17 +++++++++--------
 1 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/onenand_base.c
index 63ca61b..fbdc865 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -310,7 +310,6 @@ static int onenand_wait(struct mtd_info *mtd, int state)
 
 		if (state != FL_READING)
 			cond_resched();
-		touch_softlockup_watchdog();
 	}
 	/* To get correct interrupt status in timeout case */
 	interrupt = this->read_word(this->base + ONENAND_REG_INTERRUPT);
@@ -372,11 +371,7 @@ static int onenand_interrupt_wait(struct mtd_info *mtd, int state)
 {
 	struct onenand_chip *this = mtd->priv;
 
-	/* To prevent soft lockup */
-	touch_softlockup_watchdog();
-
 	wait_for_completion(&this->complete);
-
 	return onenand_wait(mtd, state);
 }
 
@@ -395,9 +390,6 @@ static int onenand_try_interrupt_wait(struct mtd_info *mtd, int state)
 	/* We use interrupt wait first */
 	this->wait = onenand_interrupt_wait;
 
-	/* To prevent soft lockup */
-	touch_softlockup_watchdog();
-
 	timeout = msecs_to_jiffies(100);
 	remain = wait_for_completion_timeout(&this->complete, timeout);
 	if (!remain) {
@@ -739,6 +731,8 @@ static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
 
 	stats = mtd->ecc_stats;
 	while (read < len) {
+		cond_resched();
+
 		thislen = min_t(int, mtd->writesize, len - read);
 
 		column = from & (mtd->writesize - 1);
@@ -820,6 +814,8 @@ int onenand_do_read_oob(struct mtd_info *mtd, loff_t from, size_t len,
 	column = from & (mtd->oobsize - 1);
 
 	while (read < len) {
+		cond_resched();
+
 		thislen = mtd->oobsize - column;
 		thislen = min_t(int, thislen, len);
 
@@ -984,6 +980,8 @@ static int onenand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	while (written < len) {
 		int thislen = min_t(int, mtd->writesize, len - written);
 
+		cond_resched();
+
 		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, mtd->writesize);
 
 		this->write_bufferram(mtd, ONENAND_DATARAM, buf, 0, thislen);
@@ -1059,6 +1057,8 @@ static int onenand_do_write_oob(struct mtd_info *mtd, loff_t to, size_t len,
 	while (written < len) {
 		int thislen = min_t(int, mtd->oobsize, len - written);
 
+		cond_resched();
+
 		column = to & (mtd->oobsize - 1);
 
 		this->command(mtd, ONENAND_CMD_BUFFERRAM, to, mtd->oobsize);
@@ -1186,6 +1186,7 @@ static int onenand_erase(struct mtd_info *mtd, struct erase_info *instr)
 	instr->state = MTD_ERASING;
 
 	while (len) {
+		cond_resched();
 
 		/* Check if we have a bad block, we do not erase bad blocks */
 		if (onenand_block_checkbad(mtd, addr, 0, 0)) {
-- 
1.4.4.2


--=-LrcHu31NxCMI8XAjwHft--
