Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 579C7C6379F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Feb 2023 12:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zH3QiWXfdizanhZX+W3dBDZdd+szLGN5KuDZZ5VZQVE=; b=q2fjwtlXJO0viq
	k3DIv3M4m+0Efe9KPv5aAt6Ti+pXdNWjuD7JYsEqTrHFSDQTOKPvwXqiSqiCmzurl9AxSR4OMkzt1
	MLO1a/ue9wAVGTfutVIyBiYmFe288fXgGenMv5rX6/PVUGbhyIdlgXN6J5eRKArNhdqw6ktqg6S3J
	UvZNGbJddYuD6MA7c3SgfgVAeXxHxw9SjpZR7zJZgWZCQ2i4qcMzfbrhaw+RMcDvivxWKWEul1ebh
	jo2jwBX1+RIF/10XjAdV8W68Oeoj9fPdqcdG2MHcEBQBScoJo2WX07FgAlbAQ84dtONVL4VxQLO0B
	W2j8JwucXfUQgI36xJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5jn-001SMf-DV; Thu, 09 Feb 2023 12:09:15 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ5jh-001SIO-UM
	for linux-mtd@lists.infradead.org; Thu, 09 Feb 2023 12:09:11 +0000
Received: by mail-pj1-x1036.google.com with SMTP id v6-20020a17090ad58600b00229eec90a7fso6208147pju.0
        for <linux-mtd@lists.infradead.org>; Thu, 09 Feb 2023 04:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TJXqeVPgT0T3ycz08rZaZvrFNnG5zMbbQNwdl8wOe8=;
        b=Y2IGfkHL2aNm23ihMjFsO+XonrWOcOHeMdGcHIm6IsfLau3dSrPWaEN2OaIoMV+VDP
         sTZPwyIaQYcLZ+iprYEOW42nc4YC1oJaLDTtr9YW5sXGMV6nOtiOls4hIG8Wy5VusSkx
         TYXEaBDlxlGgYGFsTtxjoTLsPCNkB22WFMRH8Q6tgQFvHDXjt/+uvafPurmR3YkEi7m5
         dWrI7hNCVIxLqlnbhpCRzVLeH4E3e8+MjF6bLL8Be++Y/FKy8XUAIzxfXYU9T6fElk/I
         H2GsUGXGXdmuEXi9SBX2J2xh5/2XGerrBlW79g0JHJjMTUyqVBuobjRmaolnWhrwW12i
         MehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3TJXqeVPgT0T3ycz08rZaZvrFNnG5zMbbQNwdl8wOe8=;
        b=OHRnA64fxUxRf6a2JRNeNGr0kAeANDagaDN97ZIqgDe4HVcj10CLcJoh6e9i3Hh1Np
         f7Fwq1P2HWqO4XzU5EFExxcSKOtrNfy0pF/cZ4liIpH7WGpLYHHWq0YPvi9XeqmuRrjJ
         i1JF5mitMd7c09ZcCA2ty4gaoIc1tz/zevd3JIxjBhZTBu1uSaC3zd96ZV44iocMD+RO
         xtLlTkG2NOMBb62JyXfqLGbfBF5wHouErlmNYcH6W/8w6wHfr4vhD3MgyJ3VHJjNCJIk
         qUbytAw7sRH/Mk9ocs74Pb1webePWp+OFmwp8g79GVxwEg3Ed/93fZQiXcPNfTc3E9kK
         Pw/w==
X-Gm-Message-State: AO0yUKWfMHVYCMkV0PqwOSpZSoUMoAm2Nug4jujCuzrl5J+ptOekHDQ1
	FvFjTAxEQ1WAJHi5V/RN7MdKQN6JFF0=
X-Google-Smtp-Source: AK7set98N/8MJn2qU3ABwyNSVV68YFORheHVYsgcfzcURGztJO7OuQ9b6HjSMdLdR1vVWfO9ejWJZw==
X-Received: by 2002:a17:90a:196:b0:22b:ecea:8b1b with SMTP id 22-20020a17090a019600b0022becea8b1bmr12572426pjc.45.1675944546699;
        Thu, 09 Feb 2023 04:09:06 -0800 (PST)
Received: from mp600-ThinkCentre-M710t.. ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id ms15-20020a17090b234f00b00233217fa85esm449746pjb.28.2023.02.09.04.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 04:09:06 -0800 (PST)
From: Jaime Liao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com
Subject: [PATCH v2 3/4] mtd: spinand: Add support continuous read operation
Date: Thu,  9 Feb 2023 20:08:52 +0800
Message-Id: <20230209120853.660564-4-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209120853.660564-1-jaimeliao.tw@gmail.com>
References: <20230209120853.660564-1-jaimeliao.tw@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_040910_008213_B6EECBB6 
X-CRM114-Status: GOOD (  27.04  )
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

The continuous read operation includes three phases:
Firstly, starting with the page read command and the 1st
page data will be read into the cache after the read latency tRD.
Secondly, Issuing the Read From Cache commands
(03h/0Bh/3Bh/6Bh/BBh/EBh) to read out the data from cache continuously.
After all the data is read out, the host should pull CS# high
to terminate this continuous read operation and wait tRST for the NAND
device resets read operation.

Continuous reads have a positive impact when reading more than
one page and the column address is don't care in this operation,
a full page data will be read out for each page.

The performance of continuous read mode is as follows. Set the
flash to QUAD mode and run 25MHz direct mapping mode on the SPI
bus and use the MTD test module to show the performance of
continuous reads.

As below is the test result on two cases.
We could reduce time on continuous read when multiple page read.

===============Continuous======================
mtd_speedtest: MTD device: 0    count: 100
mtd_speedtest: MTD device size 268435456, eraseblock size 131072,
               page size 2048, count of eraseblocks 2048, pages per
               eraseblock 64, OOB size 64
mtd_test: scanning for bad eraseblocks
mtd_test: scanned 100 eraseblocks, 0 are bad
mtd_speedtest: testing eraseblock write speed
mtd_speedtest: eraseblock write speed is 1298 KiB/s
mtd_speedtest: testing eraseblock read speed
mtd_speedtest: eraseblock read speed is 11053 KiB/s
mtd_speedtest: testing page write speed
mtd_speedtest: page write speed is 1291 KiB/s
mtd_speedtest: testing page read speed
mtd_speedtest: page read speed is 3240 KiB/s
mtd_speedtest: testing 2 page write speed
mtd_speedtest: 2 page write speed is 1289 KiB/s
mtd_speedtest: testing 2 page read speed
mtd_speedtest: 2 page read speed is 2909 KiB/s
mtd_speedtest: Testing erase speed
mtd_speedtest: erase speed is 45229 KiB/s
mtd_speedtest: Testing 2x multi-block erase speed
mtd_speedtest: 2x multi-block erase speed is 62135 KiB/s
mtd_speedtest: Testing 4x multi-block erase speed
mtd_speedtest: 4x multi-block erase speed is 60093 KiB/s
mtd_speedtest: Testing 8x multi-block erase speed
mtd_speedtest: 8x multi-block erase speed is 61244 KiB/s
mtd_speedtest: Testing 16x multi-block erase speed
mtd_speedtest: 16x multi-block erase speed is 61538 KiB/s
mtd_speedtest: Testing 32x multi-block erase speed
mtd_speedtest: 32x multi-block erase speed is 61835 KiB/s
mtd_speedtest: Testing 64x multi-block erase speed
mtd_speedtest: 64x multi-block erase speed is 60663 KiB/s
mtd_speedtest: finished
=================================================

===============Normal============================
mtd_speedtest: MTD device: 0    count: 100
mtd_speedtest: MTD device size 268435456, eraseblock size 131072,
	       page size 2048, count of eraseblocks 2048, pages per
	       eraseblock 64, OOB size 128
mtd_test: scanning for bad eraseblocks
mtd_test: scanned 100 eraseblocks, 0 are bad
mtd_speedtest: testing eraseblock write speed
mtd_speedtest: eraseblock write speed is 4467 KiB/s
mtd_speedtest: testing eraseblock read speed
mtd_speedtest: eraseblock read speed is 2278 KiB/s
mtd_speedtest: testing page write speed
mtd_speedtest: page write speed is 4447 KiB/s
mtd_speedtest: testing page read speed
mtd_speedtest: page read speed is 2204 KiB/s
mtd_speedtest: testing 2 page write speed
mtd_speedtest: 2 page write speed is 4479 KiB/s
mtd_speedtest: testing 2 page read speed
mtd_speedtest: 2 page read speed is 2274 KiB/s
mtd_speedtest: Testing erase speed
mtd_speedtest: erase speed is 44982 KiB/s
mtd_speedtest: Testing 2x multi-block erase speed
mtd_speedtest: 2x multi-block erase speed is 33766 KiB/s
mtd_speedtest: Testing 4x multi-block erase speed
mtd_speedtest: 4x multi-block erase speed is 66876 KiB/s
mtd_speedtest: Testing 8x multi-block erase speed
mtd_speedtest: 8x multi-block erase speed is 67518 KiB/s
mtd_speedtest: Testing 16x multi-block erase speed
mtd_speedtest: 16x multi-block erase speed is 67792 KiB/s
mtd_speedtest: Testing 32x multi-block erase speed
mtd_speedtest: 32x multi-block erase speed is 67964 KiB/s
mtd_speedtest: Testing 64x multi-block erase speed
mtd_speedtest: 64x multi-block erase speed is 68101 KiB/s
mtd_speedtest: finished
=================================================

Signed-off-by: Jaime Liao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 97 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  1 +
 2 files changed, 98 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index aa57d5b0a3dc..1c9ec84e6361 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -386,6 +386,10 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 	if (req->datalen) {
 		buf = spinand->databuf;
 		nbytes = nanddev_page_size(nand);
+		if (spinand->use_continuous_read) {
+			buf = req->databuf.in;
+			nbytes = req->datalen;
+		}
 		column = 0;
 	}
 
@@ -415,6 +419,9 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		buf += ret;
 	}
 
+	if (spinand->use_continuous_read)
+		goto finish;
+
 	if (req->datalen)
 		memcpy(req->databuf.in, spinand->databuf + req->dataoffs,
 		       req->datalen);
@@ -430,6 +437,7 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 			       req->ooblen);
 	}
 
+finish:
 	return 0;
 }
 
@@ -646,6 +654,77 @@ static int spinand_write_page(struct spinand_device *spinand,
 	return nand_ecc_finish_io_req(nand, (struct nand_page_io_req *)req);
 }
 
+static int spinand_mtd_continuous_read(struct mtd_info *mtd, loff_t from,
+				       struct mtd_oob_ops *ops,
+				       struct nand_io_iter *iter)
+{
+	struct spinand_device *spinand = mtd_to_spinand(mtd);
+	struct nand_device *nand = mtd_to_nanddev(mtd);
+	int ret = 0;
+
+	/*
+	 * Continuous read mode could reduce some operation in On-die ECC free
+	 * flash when read page sequentially.
+	 */
+	iter->req.type = NAND_PAGE_READ;
+	iter->req.mode = MTD_OPS_RAW;
+	iter->req.dataoffs = nanddev_offs_to_pos(nand, from, &iter->req.pos);
+	iter->req.databuf.in = ops->datbuf;
+	iter->req.datalen = ops->len;
+
+	if (from & (nanddev_page_size(nand) - 1)) {
+		pr_debug("%s: unaligned address\n", __func__);
+		return -EINVAL;
+	}
+
+	ret = spinand_continuous_read_enable(spinand);
+	if (ret)
+		return ret;
+
+	spinand->use_continuous_read = true;
+
+	ret = spinand_select_target(spinand, iter->req.pos.target);
+	if (ret)
+		return ret;
+
+	/*
+	 * The continuous read operation including: firstly, starting with the
+	 * page read command and the 1 st page data will be read into the cache
+	 * after the read latency tRD. Secondly, Issuing the Read From Cache
+	 * commands (03h/0Bh/3Bh/6Bh/BBh/EBh) to read out the data from cache
+	 * continuously.
+	 *
+	 * The cache is divided into two halves, while one half of the cache is
+	 * outputting the data, the other half will be loaded for the new data;
+	 * therefore, the host can read out the data continuously from page to
+	 * page. Multiple of Read From Cache commands can be issued in one
+	 * continuous read operation, each Read From Cache command is required
+	 * to read multiple 4-byte data exactly; otherwise, the data output will
+	 * be out of sequence from one Read From Cache command to another Read
+	 * From Cache command.
+	 *
+	 * After all the data is read out, the host should pull CS# high to
+	 * terminate this continuous read operation and wait a 6us of tRST for
+	 * the NAND device resets read operation. The data output for each page
+	 * will always start from byte 0 and a full page data should be read out
+	 * for each page.
+	 */
+	ret = spinand_read_page(spinand, &iter->req);
+	if (ret)
+		goto continuous_read_error;
+
+	ret = spinand_reset_op(spinand);
+	if (ret)
+		goto continuous_read_error;
+
+continuous_read_error:
+	spinand->use_continuous_read = false;
+	ops->retlen = iter->req.datalen;
+
+	ret = spinand_continuous_read_disable(spinand);
+	return ret;
+}
+
 static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
@@ -665,6 +744,24 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 
 	old_stats = mtd->ecc_stats;
 
+	/*
+	 * If the device support continuous read mode and read length larger
+	 * than one page size will enter the continuous read mode. This mode
+	 * helps avoid issuing a page read command and read from cache command
+	 * again, and improves read performance for continuous addresses.
+	 */
+	if ((spinand->flags & SPINAND_HAS_CONT_READ_BIT) &&
+	    (ops->len > nanddev_page_size(nand))) {
+		ret = spinand_mtd_continuous_read(mtd, from, ops, &iter);
+
+		mutex_unlock(&spinand->lock);
+
+		if (ecc_failed && !ret)
+			ret = -EBADMSG;
+
+		return ret ? ret : max_bitflips;
+	}
+
 	nanddev_io_for_each_page(nand, NAND_PAGE_READ, from, ops, &iter) {
 		if (disable_ecc)
 			iter.req.mode = MTD_OPS_RAW;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index f598a0c5a376..efbd9caf53bf 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -310,6 +310,7 @@ struct spinand_ecc_info {
 
 #define SPINAND_HAS_QE_BIT		BIT(0)
 #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
+#define SPINAND_HAS_CONT_READ_BIT	BIT(2)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
