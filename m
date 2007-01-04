Received: from wx-out-0506.google.com ([66.249.82.235])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H2RUW-0001l6-95
	for linux-mtd@lists.infradead.org; Thu, 04 Jan 2007 07:14:42 -0500
Received: by wx-out-0506.google.com with SMTP id h30so6748900wxd
	for <linux-mtd@lists.infradead.org>;
	Thu, 04 Jan 2007 04:14:38 -0800 (PST)
Message-ID: <740e30f50701040414v15faa160i83a52e94068f6c0b@mail.gmail.com>
Date: Thu, 4 Jan 2007 14:14:38 +0200
From: "Adrian Hunter" <hunter.programmer@gmail.com>
To: "Josh Boyer" <jwboyer@gmail.com>
Subject: Re: OneNAND: read-while-load
In-Reply-To: <625fc13d0701040335y41d8f811w5cb24646725f2e4c@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <740e30f50701040055r4d8d8472m299d697b51bd6120@mail.gmail.com>
	<625fc13d0701040335y41d8f811w5cb24646725f2e4c@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 1/4/07, Josh Boyer <jwboyer@gmail.com> wrote:
> On 1/4/07, Adrian Hunter <hunter.programmer@gmail.com> wrote:
> > Hi
> >
> > Here is a patch that implements read-while-load for OneNAND.  My
> > testing shows that it gives a measurable performance improvement for
> > large reads.
> >
> > Sorry the patch is in an attachment, but I have email problems.
>
> You're using a gmail account... what possible email problems could you have?
>
> josh
>

It word-wraps.  Maybe it is the browser: firefox 2.0

I do use plain text and view original, but it goes like this:

From: Adrian Hunter <hunter.programmer@gmail.com>
Date: Thu, 4 Jan 2007 09:51:26 +0200
Subject: [MTD] OneNand: Implement read-while-load

Read-while-load enables higher performance read operations.

Signed-off-by: Adrian Hunter <hunter.programmer@gmail.com>
---
 drivers/mtd/onenand/onenand_base.c |   46 ++++++++++++++++++++++--------------
 include/linux/mtd/onenand.h        |    1 +
 2 files changed, 29 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/onenand/onenand_base.c
b/drivers/mtd/onenand/onenand_base.c
index e121bcc..11da796 100644
--- a/drivers/mtd/onenand/onenand_base.c
+++ b/drivers/mtd/onenand/onenand_base.c
@@ -727,38 +727,45 @@ static int onenand_read(struct mtd_info
 	/* TODO handling oob */

 	stats = mtd->ecc_stats;
-	while (read < len) {
-		thislen = min_t(int, mtd->writesize, len - read);

-		column = from & (mtd->writesize - 1);
-		if (column + thislen > mtd->writesize)
-			thislen = mtd->writesize - column;
+	/* Read-while-load method */

+	/* Do first load to bufferRAM */
+	if (read < len) {
 		if (!onenand_check_bufferram(mtd, from)) {
 			this->command(mtd, ONENAND_CMD_READ, from, mtd->writesize);
-
 			ret = this->wait(mtd, FL_READING);
-			/* First copy data and check return value for ECC handling */
 			onenand_update_bufferram(mtd, from, !ret);
 		}
-
-		this->read_bufferram(mtd, ONENAND_DATARAM, buf, column, thislen);
-
-		if (ret) {
-			DEBUG(MTD_DEBUG_LEVEL0, "onenand_read: read failed = %d\n", ret);
-			goto out;
+	}
+	thislen = min_t(int, mtd->writesize, len - read);
+	column = from & (mtd->writesize - 1);
+	if (column + thislen > mtd->writesize)
+		thislen = mtd->writesize - column;
+	while (!ret) {
+		/* If there is more to load then start next load */
+		from += thislen;
+		if (read + thislen < len) {
+			this->command(mtd, ONENAND_CMD_READ, from, mtd->writesize);
+			ONENAND_SET_PREV_BUFFERRAM(this);
 		}
-
+		/* While load is going, read from last bufferRAM */
+		this->read_bufferram(mtd, ONENAND_DATARAM, buf, column, thislen);
+		/* See if we are done */
 		read += thislen;
-
 		if (read == len)
 			break;
-
-		from += thislen;
+		/* Set up for next read from bufferRAM */
+		ONENAND_SET_NEXT_BUFFERRAM(this);
 		buf += thislen;
+		thislen = min_t(int, mtd->writesize, len - read);
+		column = 0;
+		cond_resched();
+		/* Now wait for load */
+		ret = this->wait(mtd, FL_READING);
+		onenand_update_bufferram(mtd, from, !ret);
 	}

-out:
 	/* Deselect and wake up anyone waiting on the device */
 	onenand_release_device(mtd);

@@ -772,6 +779,9 @@ out:
 	if (mtd->ecc_stats.failed - stats.failed)
 		return -EBADMSG;

+	if (ret)
+		return ret;
+
 	return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEAN : 0;
 }

diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
index fe3500d..f775a7a 100644
--- a/include/linux/mtd/onenand.h
+++ b/include/linux/mtd/onenand.h
@@ -143,6 +143,7 @@ struct onenand_chip {
 #define ONENAND_CURRENT_BUFFERRAM(this)		(this->bufferram_index)
 #define ONENAND_NEXT_BUFFERRAM(this)		(this->bufferram_index ^ 1)
 #define ONENAND_SET_NEXT_BUFFERRAM(this)	(this->bufferram_index ^= 1)
+#define ONENAND_SET_PREV_BUFFERRAM(this)	(this->bufferram_index ^= 1)

 #define ONENAND_GET_SYS_CFG1(this)					\
 	(this->read_word(this->base + ONENAND_REG_SYS_CFG1))
-- 
1.4.3
