Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA14C5472E
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Aug 2024 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqUxa4C1Nf0P8LZXrIn8ueTP5zNW749tO9T0mGlqbgU=; b=mpWq05g8RGIkvO
	VsupWbnaKFdHTmT6TXcik6GhSMAa9ZkH8kxLPy0ttMTxrmE6J5fwzJcGd/py7qUKsdMv/vKAeRIfD
	DX3kd6a6OZcM03QFgyDD0yxsg52CbvNPMTuThujxAGzlUvRbi+SD3gKuTCi+plgPW/RXtusiwBURP
	mqJhZoAwnD8/6faykb9/tAPjDBX6JtIYgKqTZnuZqqaA0vd31B39n1M5isgzWL8ZXNqcboTZ3jx19
	J2ZFmh6WISy6pgpqnzVg/Qf+JnXcjYNHSQq764v7OON5dSLiTXy+4kEYUyj9vXDCc1D0sBu61bReg
	UxixZV8LIlduSRXD/MLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWMv-00000006loJ-1iRF;
	Mon, 26 Aug 2024 09:50:37 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siWJ2-00000006kTY-08wc
	for linux-mtd@lists.infradead.org;
	Mon, 26 Aug 2024 09:46:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 24B1EC000E;
	Mon, 26 Aug 2024 09:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724665594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dFDvS7sF20/Fxav7jaL4726PvDjY4xIbA67yymawCpo=;
	b=ehbgM7A8z6tuQOItCUaLMvqmxhJ84qwlcY4ptboJxHzQjnG6YYPFHtKHzGigh83tws4KKP
	D2Yxc8Uxuk+fzE0BmJOJhS7tH+FQXRV26COxiragr86T50iQfODwGgo915B0tksMCuOPqq
	RylGOXiUZTVNqk5mE6BEoz2d7X40qUiCNTmTjoltBnEDqldo+zBW6niYLloylpsLn4X4zk
	GfX+ty/jkKaaddFoVLJGZ1X8Mw0GVquup/fASS2g69hmZXUt81f+tCJAFyuaqhrHdTnwjn
	9CnAmhvCb6EDRY+4ycdmziRISTXJqOzCB6gptrC/y9Kxnnxf2VtFM5oBqN4LWw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH mtd-utils 04/10] mtd-tests: nandbiterrs: Store the chunks size in an intermediate variable
Date: Mon, 26 Aug 2024 11:46:23 +0200
Message-ID: <20240826094629.19065-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826094629.19065-1-miquel.raynal@bootlin.com>
References: <20240826094629.19065-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_024636_552801_22B7A481 
X-CRM114-Status: GOOD (  14.40  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

'pagesize' is used for two purposes:
- accessing the size of a page
- getting the size of the test buffer, which happen to be the size of a
  page for now.
Use an intermediate variable when getting the size of the test buffer,
as we will later increase its size.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 tests/mtd-tests/nandbiterrs.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/tests/mtd-tests/nandbiterrs.c b/tests/mtd-tests/nandbiterrs.c
index f583c14..30954f5 100644
--- a/tests/mtd-tests/nandbiterrs.c
+++ b/tests/mtd-tests/nandbiterrs.c
@@ -68,7 +68,7 @@ static int peb = -1, page = -1, max_overwrite = -1, seed = -1;
 static const char *mtddev;
 
 static unsigned char *wbuffer, *rbuffer, *old_data;
-static int fd, pagesize, pagecount, flags;
+static int fd, pagesize, bs, pagecount, flags;
 static struct mtd_dev_info mtd;
 static libmtd_t mtd_desc;
 
@@ -235,9 +235,9 @@ static void init_buffer(void)
 	unsigned int i;
 
 	if (flags & PAGE_ERASED) {
-		memset(wbuffer, 0xff, pagesize);
+		memset(wbuffer, 0xff, bs);
 	} else {
-		for (i = 0; i < pagesize; ++i)
+		for (i = 0; i < bs; ++i)
 			wbuffer[i] = hash(i+seed);
 	}
 }
@@ -251,7 +251,7 @@ static int write_page(void)
 		goto fail_mode;
 
 	err = mtd_write(mtd_desc, &mtd, fd, peb, page*pagesize,
-					wbuffer, pagesize, NULL, 0, 0);
+					wbuffer, bs, NULL, 0, 0);
 
 	if (err)
 		fprintf(stderr, "Failed to write page %d in block %d\n", peb, page);
@@ -290,7 +290,7 @@ static int read_page(void)
 	if (ioctl(fd, ECCGETSTATS, &old) != 0)
 		goto failstats;
 
-	err = mtd_read(&mtd, fd, peb, page*pagesize, rbuffer, pagesize);
+	err = mtd_read(&mtd, fd, peb, page*pagesize, rbuffer, bs);
 	if (err) {
 		fputs("Read failed!\n", stderr);
 		return -1;
@@ -316,7 +316,7 @@ static int verify_page(void)
 	int erased = flags & PAGE_ERASED;
 	unsigned int i, errs = 0;
 
-	for (i = 0; i < pagesize; ++i) {
+	for (i = 0; i < bs; ++i) {
 		if (rbuffer[i] != (erased ? 0xff : hash(i+seed)))
 			++errs;
 	}
@@ -332,7 +332,7 @@ static int insert_biterror(void)
 {
 	int bit, mask, byte;
 
-	for (byte = 0; byte < pagesize; ++byte) {
+	for (byte = 0; byte < bs; ++byte) {
 		for (bit = 7, mask = 0x80; bit >= 0; bit--, mask >>= 1) {
 			if (wbuffer[byte] & mask) {
 				wbuffer[byte] &= ~mask;
@@ -461,6 +461,7 @@ int main(int argc, char **argv)
 
 	pagesize = mtd.subpage_size;
 	pagecount = mtd.eb_size / pagesize;
+	bs = pagesize;
 
 	if (peb >= mtd.eb_cnt)
 		return errmsg("Physical erase block %d is out of range!", peb);
@@ -483,13 +484,13 @@ int main(int argc, char **argv)
 		}
 	}
 
-	wbuffer = malloc(pagesize);
+	wbuffer = malloc(bs);
 	if (!wbuffer) {
 		perror(NULL);
 		goto fail_dev;
 	}
 
-	rbuffer = malloc(pagesize);
+	rbuffer = malloc(bs);
 	if (!rbuffer) {
 		perror(NULL);
 		goto fail_rbuffer;
-- 
2.43.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
