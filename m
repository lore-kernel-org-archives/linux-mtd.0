Return-Path: <SRS0=dO6W=QL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B351C282C4
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:22:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 497B42175B
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Feb 2019 18:22:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cI6ofGhw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=yahoo.co.jp header.i=@yahoo.co.jp header.b="ghpTopxh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 497B42175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yahoo.co.jp
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Y11XCwuCkftQWrw4TKpVYY4x2rNlJf2Q2zFnS0mJxCY=; b=cI6ofGhwZW688Z2G4/4wZsYeKU
	7KQzziP15H0fTvsb710gxaCjRJPJtOFcqUF1Awssf5K+fxZ9rA1LN3P5PVVRgiRE4O3usCoYDYDmC
	UxFTo3FD/dt7b2h9Cw8s1FhYu/3ZWcAk9AwmYNo+lBFaCCJd9ZhyLzBD5nUCkLw6ghrMRQ3Kr54o4
	nstTf6br+IgO7k18HkLv0uLWIiZ0uhr6pNJ11UbhnQ1KLklqoFMlpjkxXDi/TNoJrHjY6ukSuSYZy
	ObdBH9R5oaNQKtGnrpbeZkrd+bney14JLRdl9/l0MrRFUWOUUo31CH36w9JOBKkcTcRBtD4PsdLYq
	cTIGvNgg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gqit3-0007wu-9W; Mon, 04 Feb 2019 18:22:29 +0000
Received: from nh601-vm9.bullet.mail.ssk.yahoo.co.jp ([182.22.90.18])
 by bombadil.infradead.org with smtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gqiqr-0005hJ-L0
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2019 18:20:25 +0000
Received: from [182.22.66.104] by nh601.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:12 -0000
Received: from [182.22.91.206] by t602.bullet.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:12 -0000
Received: from [127.0.0.1] by omp609.mail.ssk.yahoo.co.jp with NNFMP;
 04 Feb 2019 18:20:12 -0000
X-Yahoo-Newman-Property: ymail-3
X-Yahoo-Newman-Id: 312292.36526.bm@omp609.mail.ssk.yahoo.co.jp
Received: (qmail 42092 invoked by alias); 4 Feb 2019 18:20:12 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.jp;
 s=yj20110701; t=1549304412; bh=y8HG0B/ptt1aiNktBMHs1kKs2PfbqW2y3J0jNa4aB04=;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=ghpTopxhmCaRuiYm5oBEfL4XckIovcOsQ+fuxKo7wYNr5NPMgZfImAAJALrV9aNRZFop1rAz4BSkwtAwmdR6eNuaOhxgD8t6mP3BDyFLyrTgTxYJ+WGQnnur9ZPphIs75q5XhafxehkS7RxUco2rWASbrDM92w8Z/59HD3yqNW0=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=yj20110701; d=yahoo.co.jp;
 h=Received:X-YMail-JAS:X-Apparently-From:X-YMail-OSG:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References;
 b=Moy+A+eMMLdgvht/dT/F+hhC2358y0anQ3KgKzqpOg77zIQ8bJZ7VOp9y8EWF/0t6I80QQ5tpNwiHZeJSMBKltJq3QXjAG7j/bWGnC1yMX2A73QXpWF5lciO8L5rrqIr7rq4sIrKC3sUo1wCHJ5K4N7FycTcF7hmQxVMsWZkZMQ=
 ; 
Received: from unknown (HELO localhost.localdomain) (106.72.39.32 with login)
 by smtp6006.mail.ssk.ynwp.yahoo.co.jp with SMTP;
 4 Feb 2019 18:20:12 -0000
X-YMail-JAS: p9oCtvkVM1kVekpC3xOvNaXPAPSgZcVmvQp71RDkr_MBJi4ZN6gY9y..AHMl.tW8uvftk.I0.GsYn_ReLCWp5oOwWlwNw4dDjgoBHSFvdQQuROuKMHwIQ_Ot3WEDX9xWBcCyoGsP0Q--
X-Apparently-From: <ikegami_to@yahoo.co.jp>
X-YMail-OSG: ZV9aKLQVM1mwByp9QicFvqGDGqmGOW4ala8rZIgIe447_Sb
 RZzAw68iQHUlLofaBUM85ndIJpEPYkY2vd4L2uQRwU8O2Q3E0kYaOZb2lSU4
 FqZVjZN.K4.BqxAAzbBRpesmG.bLFD3mHIVAzfwvPgAlHKFueCIly3u8Ei_X
 k75UUQvuDTKfd_5_NkmLyx8TDdpDTrEHwCs_wKxgrKI8Goji3653ne2mmlbe
 6CtAi4zO8XeW2L5wF0bo791IRpjGwkzkFsIPssoj8JAt1GV8XFOH0yc3uq4q
 MhN4pEgN220Mh0NTHtSdvNmOiRpQwwP3HzuzjXJs1EWGDpU9.3K1.PTuf11I
 LdZNhTj8gm4UjnQJKiymK2Eiu7ER1LFwxpxQztgAhMMrpxVBykds7kIQOWOK
 8Z90ye7laYFqpugyBmhA_.R9dnD.YEfXxupuHiFZH_66Eoh_WxEVp5kRWLNG
 vG9Xozl59AeIaMq4Dr2oqPI4NvxZO7bTAuQrYeTzjPx1irzqW7VDi0O0B5cj
 5td2qcelq.RQ7mxZYpbmArwmTqL9W8yQli0nbft2du0fJDPYHhvI4C2kn7cB
 MIbb4lgfShSzoxwXedpNJHI9pjTXvV5CrJ1x6uTpImPuZS7WX
From: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
To: Boris Brezillon <bbrezillon@kernel.org>
Subject: [RESEND v4 10/11] mtd: cfi_cmdset_0002: Split to wait write buffer to
 check if completed
Date: Tue,  5 Feb 2019 03:20:03 +0900
Message-Id: <20190204182004.29894-11-ikegami_to@yahoo.co.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
References: <20190204182004.29894-1-ikegami_to@yahoo.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190204_102014_064149_E543404E 
X-CRM114-Status: GOOD (  14.70  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 linux-mtd@lists.infradead.org, Tokunori Ikegami <ikegami_to@yahoo.co.jp>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Fabio Bettoni <fbettoni@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Just refactor to split the wait from do_write_buffer().

Signed-off-by: Tokunori Ikegami <ikegami_to@yahoo.co.jp>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v3:
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- None.

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 81 +++++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index d5954bf..da48b4c 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1820,6 +1820,51 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
+static int __xipram do_write_buffer_wait(struct map_info *map,
+					 struct flchip *chip, unsigned long adr,
+					 map_word datum)
+{
+	unsigned long timeo;
+	unsigned long uWriteTimeout;
+	int ret = 0;
+
+	/*
+	 * Timeout is calculated according to CFI data, if available.
+	 * See more comments in cfi_cmdset_0002().
+	 */
+	uWriteTimeout = usecs_to_jiffies(chip->buffer_write_time_max);
+	timeo = jiffies + uWriteTimeout;
+
+	for (;;) {
+		if (chip->state != FL_WRITING) {
+			/* Someone's suspended the write. Sleep */
+			DECLARE_WAITQUEUE(wait, current);
+
+			set_current_state(TASK_UNINTERRUPTIBLE);
+			add_wait_queue(&chip->wq, &wait);
+			mutex_unlock(&chip->mutex);
+			schedule();
+			remove_wait_queue(&chip->wq, &wait);
+			timeo = jiffies + (HZ / 2); /* FIXME */
+			mutex_lock(&chip->mutex);
+			continue;
+		}
+
+		if (chip_good(map, adr, datum))
+			break;
+
+		if (time_after(jiffies, timeo)) {
+			ret = -EIO;
+			break;
+		}
+
+		/* Latency issues. Drop the lock, wait a while and retry */
+		UDELAY(map, chip, adr, 1);
+	}
+
+	return ret;
+}
+
 static void __xipram do_write_buffer_reset(struct map_info *map,
 					   struct flchip *chip,
 					   struct cfi_private *cfi)
@@ -1850,13 +1895,6 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				    int len)
 {
 	struct cfi_private *cfi = map->fldrv_priv;
-	unsigned long timeo = jiffies + HZ;
-	/*
-	 * Timeout is calculated according to CFI data, if available.
-	 * See more comments in cfi_cmdset_0002().
-	 */
-	unsigned long uWriteTimeout =
-				usecs_to_jiffies(chip->buffer_write_time_max);
 	int ret = -EIO;
 	unsigned long cmd_adr;
 	int z, words;
@@ -1913,34 +1951,7 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 				adr, map_bankwidth(map),
 				chip->word_write_time);
 
-	timeo = jiffies + uWriteTimeout;
-
-	for (;;) {
-		if (chip->state != FL_WRITING) {
-			/* Someone's suspended the write. Sleep */
-			DECLARE_WAITQUEUE(wait, current);
-
-			set_current_state(TASK_UNINTERRUPTIBLE);
-			add_wait_queue(&chip->wq, &wait);
-			mutex_unlock(&chip->mutex);
-			schedule();
-			remove_wait_queue(&chip->wq, &wait);
-			timeo = jiffies + (HZ / 2); /* FIXME */
-			mutex_lock(&chip->mutex);
-			continue;
-		}
-
-		if (chip_good(map, adr, datum))
-			break;
-
-		if (time_after(jiffies, timeo)) {
-			ret = -EIO;
-			break;
-		}
-
-		/* Latency issues. Drop the lock, wait a while and retry */
-		UDELAY(map, chip, adr, 1);
-	}
+	ret = do_write_buffer_wait(map, chip, adr, datum);
 
 	if (ret) {
 		do_write_buffer_reset(map, chip, cfi);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
