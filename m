Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7F560A3816
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hSBHjyZV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gmccXxFx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kXnPx35QN3AK+w3fNwUNjmZbHKnCbxA0bMQC/dZA80w=; b=hSBHjyZVKB9DmMwWKzQ0wirADz
	+owwBTXpTe1jTjdxtTnNTOz0j0mK/77aZ6qgsK15/eQhI2n7rq5k4SN12wkibwC4t77lFHEsIXNAc
	jU1Qs2nS7PNtpCQbDbqGW7XrcFIc3c3iCI0uVWq8FpWWtZaFSR0RLX73FEUB3SotdMCFgnygEbozh
	toOKySlBZmu3x6fJ9NesUr+B8SfPoZN4TqQZoex4nkjmiuIthfy6DDiEkM6F8Jm67bLslEr/16RBe
	rg50vvivNdbN0zfCvRYKle/b/TFDEuS5JoBzj9oOnqNxqyStuRS29PkEbgNm+Xutsbbj1NEgEL0D5
	sN4U8VEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvo5-0000000DqaK-0cqn;
	Fri, 13 Nov 2026 18:15:25 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvo0-0000000DqUo-2iOV
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:22 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-825b40f8a26so516852a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593719; x=1795198519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqxlSO42AcyT1zN6AADrQIgBebhNwVmV06DAJmOaHDE=;
        b=gmccXxFxDlWWCOJN8TrR9WELIclZTQ1taweJAxbSGCL1oqxl5K3HSfbP10G62EmS2g
         paY0mPb4ZeOGYLt7l6LqORfqW7GB6/RXWcpT/Ee6NC34PtO2NciCmHy1Zx6tQC9EdW06
         oPn1NGDOnED/AW2UaLxPbvuNkFNmWMuakL6w+7umgaywiImhThFKa9+t51u+Rcq3rK66
         6BNHNanePbfTSALpLTO0XfVzewsVCus7XePbC7BxzO48Q4GOVopdnLvpMjcsIrKY3Ae+
         nTf3rVDUGSAdrZ4psQJhTCE/0jZ5JDgLCkSgnZNzjDpERfdXQWJE2It2Ghim6ehDNoXN
         Khuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593719; x=1795198519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqxlSO42AcyT1zN6AADrQIgBebhNwVmV06DAJmOaHDE=;
        b=K1Gv+XMpfe85q0hQAwZg/xDd6CApri7M1Oq2Dj4pgCC/F+QiKi5jBazh+UFEGlpAFw
         hqD1ivNdJwcXEer6DEip5gPeSUrAmjDzBtCuoR8lwUm1Kwu5Dk1WMTDaYOjYkzEUfCRg
         6v7xIh8DJOikB85nHARHEUIHra67wIzUpzR1YqjxDjLvjQNv98np209IlGzw4aqD+Ji8
         zG1TyjinbDkT3ZQuT8LYLADbJfX60pTBTbW0/bVW7/uvxBQ04AleRSkrDmCS3AfKgWm2
         M9tpdLU4sjzxNn+wm5mUKM8j70v6gKz8+tMmr8Tr5s+e3yog7QhAcHc/K3DBE+JFaeIT
         PAZg==
X-Gm-Message-State: APuU4Z+6a6RBj8ZjC+4EUqXcVQEJV+Nxp8d5L402dP0xfcPTur0z0//k
	4EzsIKpGQERCJ1dPneDTgFLv+0Eyal4geSxp1XKmYoQNMAg5+miqoFel
X-Gm-Gg: AYBFou0nVlcQvNBfCygdGFFgxfs1lVvHaKvVEnpLZvsCOusPE/rnltH8RptRU7Z5fK8
	A28+OPOGt9FcUO7REjDtypDE1oeMyZsuKXK47b9PwyI8bKep1vBRjAzYjcmd0ka7bGRbwhTeNsn
	i7w8gkjfNwDnxxu+tCqdyxDcgfsF4o1f0ugoEpk8hxu/KVSmISz8O9q2WjTcXnuKVwt4Xaq3g3e
	bhiLDaQZvSPCWe0HRHWd4BaO3NsiI5o+VUJg0Jdc5iJA0sxLAR82hEt4jVHrf6ktAfhzdho9Y0j
	6tfGgBQ5RABktnlVgKLSbM1x0/l9bMk/y2cAX3yXoInc6fmN0/L3sbXhHM3ssYbcJIJ2SkJLYhs
	UwoMCy2LZ8hhR+MWEA4WV97GjF2jN1iwreyJrudWURZI1YsZhHyC16nkxKWhsEd1sND2P5WEKyo
	EJsg1XnVIiLuwMcYrs/YxD1dEIM1ZcoJQ8ULPl12s+7aDXLy0Uayiv19BY9+TCWT4ZMzongqJOX
	Qbti2zo/p8odSV/qR5lx3zxXFE5rcdoTxIwkxoiDueoB7OlO49Dbqyjxz/8NJClBoPX01jg8smE
	0hZfKp9nMZ5C2sLz0YORNk02NP5xriWy8ILRZfKfPEXWGWIYljC4d86sa1gLoejFuw4l+WNLV1A
	I3RFMDGwyTBXNWCzfK9IaRHU31iFNe/sVb8D3f610tYWiWjS0GQJw2XAbllj4SJeX+CWswumeDu
	C4BhaKonJzEangcp7xRweh6+u7w9cAeQWChgnztbrUIgg5y0D6v/dD
X-Received: by 2002:a05:6830:230f:b0:83b:3feb:4f04 with SMTP id 46e09a7af769-86289746345mr2963367a34.4.1794593719527;
        Fri, 13 Nov 2026 10:15:19 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:21 -0700
Subject: [PATCH v4 05/58] mtd: rawnand: separate hardware disconnection
 from cleanup
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-5-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Arseniy Krasnov <AVKrasnov@sberdevices.ru>, 
 Tze Yee Ng <tze.yee.ng@altera.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101520_758889_5701F08A 
X-CRM114-Status: GOOD (  29.32  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A retained MTD handle can still enter NAND operations after its
controller is unbound. Closing a writable character device also calls
nand_sync(), which takes the chip and controller locks. Freeing their
storage during remove is therefore unsafe even without another explicit
read or write.

Add nand_disconnect() to serialize disconnection with regular operations
under the chip and controller locks. Make nand_get_device() reject a
disconnected chip and propagate that error through its callers. A sync
after disconnection becomes a no-op. Suspend also succeeds without
accessing hardware, so a retained disconnected device does not abort
system suspend; resume is a no-op.

Propagate lock-acquisition errors through Macronix OTP access and BBT
error recovery. Stop table updates on -ENODEV rather than treating
disconnection as a failed eraseblock and issuing another marker write.

Unregister MTD devices first so removal notifiers can finish their I/O,
then disconnect before releasing controller resources. Wake any
remaining suspended waiters when disconnecting. Panic writes also check
the disconnected flag; their notifier clients must be drained by MTD
unregistration before controller resources are released.

Disconnection does not free the chip or controller allocation. Their
storage must remain valid while existing MTD handles can enter the
disconnection check.

Cc: Arseniy Krasnov <AVKrasnov@sberdevices.ru>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/internals.h     |  2 +-
 drivers/mtd/nand/raw/nand_base.c     | 76 ++++++++++++++++++++++++++++++------
 drivers/mtd/nand/raw/nand_bbt.c      | 24 +++++++++---
 drivers/mtd/nand/raw/nand_macronix.c |  4 +-
 include/linux/mtd/rawnand.h          |  9 +++--
 5 files changed, 91 insertions(+), 24 deletions(-)

diff --git a/drivers/mtd/nand/raw/internals.h b/drivers/mtd/nand/raw/internals.h
index 2668f527e637..dcd9536da449 100644
--- a/drivers/mtd/nand/raw/internals.h
+++ b/drivers/mtd/nand/raw/internals.h
@@ -81,7 +81,7 @@ extern const struct nand_manufacturer_ops toshiba_nand_manuf_ops;
 extern const struct mtd_pairing_scheme dist3_pairing_scheme;
 
 /* Core functions */
-void nand_get_device(struct nand_chip *chip);
+int nand_get_device(struct nand_chip *chip);
 void nand_release_device(struct nand_chip *chip);
 const struct nand_manufacturer_desc *nand_get_manufacturer_desc(u8 id);
 int nand_bbm_get_next_page(struct nand_chip *chip, int page);
diff --git a/drivers/mtd/nand/raw/nand_base.c b/drivers/mtd/nand/raw/nand_base.c
index f6a054919c06..720da4174833 100644
--- a/drivers/mtd/nand/raw/nand_base.c
+++ b/drivers/mtd/nand/raw/nand_base.c
@@ -336,21 +336,47 @@ static int nand_isbad_bbm(struct nand_chip *chip, loff_t ofs)
  *
  * Lock the device and its controller for exclusive access
  */
-void nand_get_device(struct nand_chip *chip)
+int nand_get_device(struct nand_chip *chip)
 {
 	/* Wait until the device is resumed. */
 	while (1) {
 		mutex_lock(&chip->lock);
+		if (chip->disconnected) {
+			mutex_unlock(&chip->lock);
+			return -ENODEV;
+		}
 		if (!chip->suspended) {
 			mutex_lock(&chip->controller->lock);
-			return;
+			return 0;
 		}
 		mutex_unlock(&chip->lock);
 
-		wait_event(chip->resume_wq, !chip->suspended);
+		wait_event(chip->resume_wq, !READ_ONCE(chip->suspended) ||
+			   READ_ONCE(chip->disconnected));
 	}
 }
 
+/**
+ * nand_disconnect - drain hardware access and reject further operations
+ * @chip: NAND chip object
+ *
+ * Unregister the MTD device first so removal notifiers can finish their I/O.
+ * Call before releasing controller resources. Operations waiting for resume
+ * are woken and fail with -ENODEV.
+ * The chip, controller lock and NAND metadata must remain alive
+ * until existing MTD handles are released; nand_cleanup() is a separate step.
+ */
+void nand_disconnect(struct nand_chip *chip)
+{
+	mutex_lock(&chip->lock);
+	mutex_lock(&chip->controller->lock);
+	WRITE_ONCE(chip->disconnected, true);
+	mutex_unlock(&chip->controller->lock);
+	mutex_unlock(&chip->lock);
+	wake_up_all(&chip->resume_wq);
+}
+EXPORT_SYMBOL_GPL(nand_disconnect);
+
 /**
  * nand_check_wp - [GENERIC] check if the chip is write protected
  * @chip: NAND chip object
@@ -581,7 +607,9 @@ static int nand_block_markbad_lowlevel(struct nand_chip *chip, loff_t ofs)
 		nand_erase_nand(chip, &einfo, 0);
 
 		/* Write bad block marker to OOB */
-		nand_get_device(chip);
+		ret = nand_get_device(chip);
+		if (ret)
+			return ret;
 
 		ret = nand_markbad_bbm(chip, ofs);
 		nand_release_device(chip);
@@ -3879,7 +3907,9 @@ static int nand_read_oob(struct mtd_info *mtd, loff_t from,
 	    ops->mode != MTD_OPS_RAW)
 		return -ENOTSUPP;
 
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	old_stats = mtd->ecc_stats;
 
@@ -4449,6 +4479,9 @@ static int panic_nand_write(struct mtd_info *mtd, loff_t to, size_t len,
 	struct mtd_oob_ops ops;
 	int ret;
 
+	if (READ_ONCE(chip->disconnected))
+		return -ENODEV;
+
 	nand_select_target(chip, chipnr);
 
 	/* Wait for the device to get ready */
@@ -4479,7 +4512,9 @@ static int nand_write_oob(struct mtd_info *mtd, loff_t to,
 
 	ops->retlen = 0;
 
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	switch (ops->mode) {
 	case MTD_OPS_PLACE_OOB:
@@ -4539,7 +4574,9 @@ int nand_erase_nand(struct nand_chip *chip, struct erase_info *instr,
 		return -EIO;
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	/* Shift to get first page */
 	page = (int)(instr->addr >> chip->page_shift);
@@ -4627,7 +4664,8 @@ static void nand_sync(struct mtd_info *mtd)
 	pr_debug("%s: called\n", __func__);
 
 	/* Grab the lock and see if the device is available */
-	nand_get_device(chip);
+	if (nand_get_device(chip))
+		return;
 	/* Release it and go back */
 	nand_release_device(chip);
 }
@@ -4644,7 +4682,9 @@ static int nand_block_isbad(struct mtd_info *mtd, loff_t offs)
 	int ret;
 
 	/* Select the NAND device */
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 
 	nand_select_target(chip, chipnr);
 
@@ -4688,10 +4728,14 @@ static int nand_suspend(struct mtd_info *mtd)
 	int ret = 0;
 
 	mutex_lock(&chip->lock);
+	if (chip->disconnected) {
+		mutex_unlock(&chip->lock);
+		return 0;
+	}
 	if (chip->ops.suspend)
 		ret = chip->ops.suspend(chip);
 	if (!ret)
-		chip->suspended = 1;
+		WRITE_ONCE(chip->suspended, true);
 	mutex_unlock(&chip->lock);
 
 	return ret;
@@ -4706,10 +4750,12 @@ static void nand_resume(struct mtd_info *mtd)
 	struct nand_chip *chip = mtd_to_nand(mtd);
 
 	scoped_guard(mutex, &chip->lock) {
+		if (chip->disconnected)
+			return;
 		if (chip->suspended) {
 			if (chip->ops.resume)
 				chip->ops.resume(chip);
-			chip->suspended = 0;
+			WRITE_ONCE(chip->suspended, false);
 		} else {
 			pr_err("%s called for a chip which is not in suspended state\n",
 				__func__);
@@ -4743,7 +4789,9 @@ static int nand_lock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (!chip->ops.lock_area)
 		return -ENOTSUPP;
 
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 	ret = chip->ops.lock_area(chip, ofs, len);
 	nand_release_device(chip);
 
@@ -4764,7 +4812,9 @@ static int nand_unlock(struct mtd_info *mtd, loff_t ofs, uint64_t len)
 	if (!chip->ops.unlock_area)
 		return -ENOTSUPP;
 
-	nand_get_device(chip);
+	ret = nand_get_device(chip);
+	if (ret)
+		return ret;
 	ret = chip->ops.unlock_area(chip, ofs, len);
 	nand_release_device(chip);
 
diff --git a/drivers/mtd/nand/raw/nand_bbt.c b/drivers/mtd/nand/raw/nand_bbt.c
index 51fe991358d6..1d71a65bbd01 100644
--- a/drivers/mtd/nand/raw/nand_bbt.c
+++ b/drivers/mtd/nand/raw/nand_bbt.c
@@ -713,14 +713,17 @@ static int get_bbt_block(struct nand_chip *this, struct nand_bbt_descr *td,
  * block as bad using a bad block marker and invalidating the associated
  * td->pages[] entry.
  */
-static void mark_bbt_block_bad(struct nand_chip *this,
-			       struct nand_bbt_descr *td,
-			       int chip, int block)
+static int mark_bbt_block_bad(struct nand_chip *this,
+			      struct nand_bbt_descr *td,
+			      int chip, int block)
 {
 	loff_t to;
 	int res;
 
-	nand_get_device(this);
+	res = nand_get_device(this);
+	if (res)
+		return res;
+
 	bbt_mark_entry(this, block, BBT_BLOCK_WORN);
 
 	to = (loff_t)block << this->bbt_erase_shift;
@@ -731,6 +734,7 @@ static void mark_bbt_block_bad(struct nand_chip *this,
 			res, block);
 
 	td->pages[chip] = -1;
+	return 0;
 }
 
 /**
@@ -892,9 +896,13 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
 		einfo.len = 1 << this->bbt_erase_shift;
 		res = nand_erase_nand(this, &einfo, 1);
 		if (res < 0) {
+			if (res == -ENODEV)
+				goto outerr;
 			pr_warn("nand_bbt: error while erasing BBT block %d\n",
 				res);
-			mark_bbt_block_bad(this, td, chip, block);
+			res = mark_bbt_block_bad(this, td, chip, block);
+			if (res)
+				goto outerr;
 			continue;
 		}
 
@@ -902,9 +910,13 @@ static int write_bbt(struct nand_chip *this, uint8_t *buf,
 				     td->options & NAND_BBT_NO_OOB ?
 				     NULL : &buf[len]);
 		if (res < 0) {
+			if (res == -ENODEV)
+				goto outerr;
 			pr_warn("nand_bbt: error while writing BBT block %d\n",
 				res);
-			mark_bbt_block_bad(this, td, chip, block);
+			res = mark_bbt_block_bad(this, td, chip, block);
+			if (res)
+				goto outerr;
 			continue;
 		}
 
diff --git a/drivers/mtd/nand/raw/nand_macronix.c b/drivers/mtd/nand/raw/nand_macronix.c
index 7169c014d197..cd0d7d20a1d6 100644
--- a/drivers/mtd/nand/raw/nand_macronix.c
+++ b/drivers/mtd/nand/raw/nand_macronix.c
@@ -380,7 +380,9 @@ static int __macronix_30lfxg18ac_rw_otp(struct mtd_info *mtd,
 	int ret;
 
 	nand = mtd_to_nand(mtd);
-	nand_get_device(nand);
+	ret = nand_get_device(nand);
+	if (ret)
+		return ret;
 	nand_select_target(nand, 0);
 
 	ret = macronix_30lfxg18ac_otp_enable(nand);
diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index 5c70e7bd3ed5..90b2169cc745 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -1264,9 +1264,10 @@ struct nand_secure_region {
  * @pagecache.page: Page number currently in the cache. -1 means no page is
  *                  currently cached
  * @buf_align: Minimum buffer alignment required by a platform
- * @lock: Lock protecting the suspended field. Also used to serialize accesses
- *        to the NAND device
+ * @lock: Lock protecting the suspended and disconnected fields. Also serializes
+ *        accesses to the NAND device
  * @suspended: Set to 1 when the device is suspended, 0 when it's not
+ * @disconnected: Controller resources are unavailable; reject hardware access
  * @resume_wq: wait queue to sleep if rawnand is in suspended state.
  * @cur_cs: Currently selected target. -1 means no target selected, otherwise we
  *          should always have cur_cs >= 0 && cur_cs < nanddev_ntargets().
@@ -1326,7 +1327,8 @@ struct nand_chip {
 
 	/* Internals */
 	struct mutex lock;
-	unsigned int suspended : 1;
+	bool suspended;
+	bool disconnected;
 	wait_queue_head_t resume_wq;
 	int cur_cs;
 	int read_retries;
@@ -1595,6 +1597,7 @@ void nand_wait_ready(struct nand_chip *chip);
  * sucessful nand_scan().
  */
 void nand_cleanup(struct nand_chip *chip);
+void nand_disconnect(struct nand_chip *chip);
 
 /*
  * External helper for controller drivers that have to implement the WAITRDY

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
