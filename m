Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099D7C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 11:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DZ1b6L8sYb7ncweLzmnfV3jc4MJ0FQsneTOj3qJD8YE=; b=SkG7/CkvgU6NwG
	UhG+Z8b2ncAN+JpaRXICx275fH+0ysSeUSN/ksl5ZDZLFiA6Ltl2PVhT1s9mulME5rGGus1hV9z7k
	/CwCcS9JcHsD3YSwTqCIQOzAAQsqJ9tt6nXIkNuzKA7kv4PKjt13i3kaamROwIh92kWDdWYFJihhu
	NlXG/XQPnpcWB44fR6hXucM9r/9L6N/6Mu7DzWWp/XGYVW2MbB2AwW1aJJl2tZEQa8ejuAAFsTYA2
	2oISqsxcb/EBW0z9ornD2u/3ul93WMmUzTCck7NgyTOh0ytTkyjoY0Edhdgx3J2Dc1zB6rKsoJWvd
	15tr0GnhozhovsapPIQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13AI-0063ZE-34;
	Thu, 09 Nov 2023 11:25:38 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13AF-0063Wf-0y
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 11:25:37 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6c4b06af98bso476761b3a.2
        for <linux-mtd@lists.infradead.org>; Thu, 09 Nov 2023 03:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699529131; x=1700133931; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=25nFi6OrBOjRJBr2BP/Tv/yTs9/pG21udy9nCvdLQVE=;
        b=TD64UFbH2whJNDQHtQfXHOKHGDkC4eBzHKaFJ67QgiUlahp9jho9/ZKTvYmX5Nsee/
         lvu8htqNkqTXCfJ2PEnLJv57XePhClVlLwbi/+4/Xu5Y3fIHNEYsuPDc5Z1JN6mLRIjI
         W8KIve/4M09aEu21r+mlwAsyTzD0A4UBXTtjV78VCHQE2NB2P/1gaCmOPQuct/Ze9n3t
         RUAXF/uqfiZZaWZ8V4i/92EwAdQE/0cd6cv5jR+vrwVrs9F+pFwq2LX2qtqQ4ZVP859V
         zTjbB3qpkQZfIYr0LAZk0ogALJ1vhPGOsJ8vLQTez2rM4sB4ml/KJIK6ZAFqwVWcDHRM
         A+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699529131; x=1700133931;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=25nFi6OrBOjRJBr2BP/Tv/yTs9/pG21udy9nCvdLQVE=;
        b=MOpqcNKTjkq0BoGTKybnOslqGGTbnSx0lAF6qq0h4d7ZET8ZaqTXpkyZerwdxSSlNj
         UEZ6JO3qHQXu3pL8uTEi4WNd9zMHwTzpPtzgUwRoUPDjGu2rssynUB3f9lO3FOWyTDsp
         mFS/lpnwQghABpjI3ZTPCgBZIl3PAiEjYbXq9KfCNcPihJFcmHp4DFko18jsTqe9H9YM
         UNUJCQ7A6dQyj9qNrgd6SXlMJ67tuZAt2nB++8saOjr04eWfamdk41JHkhizOOYpGlfo
         I4n6YFoUgLmQMLIGaqBvEmxRJZs1pcuOglXXyGENjThNgLEDSERwNPdaybghp+liFBPK
         4QWA==
X-Gm-Message-State: AOJu0YwqLG2/WzL10J77Aqog2VzyD7OIlA8DJS3si+S0LnuIHJTqNk+B
	zGYLz8cH1q+yomdfcvDfBkPoIPR0JX4=
X-Google-Smtp-Source: AGHT+IE3pumuyUfExy8vq18k16MMw1DVRXpIRs9iI19I84gFBv8XCYhlJciouC2wX5CoCVLArUVE5A==
X-Received: by 2002:a05:6a20:3b15:b0:136:e26b:6401 with SMTP id c21-20020a056a203b1500b00136e26b6401mr3749129pzh.16.1699529131451;
        Thu, 09 Nov 2023 03:25:31 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id y36-20020a056a00182400b0068790c41ca2sm10455953pfa.27.2023.11.09.03.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 03:25:31 -0800 (PST)
From: JaimeLiao <jaimeliao.tw@gmail.com>
X-Google-Original-From: JaimeLiao <jaimeliao@mxic.com.tw>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com,
	angyanyu13@gmail.com
Subject: [PATCH v3 4/5] mtd: spinand: Add support continuous read operation
Date: Thu,  9 Nov 2023 19:24:59 +0800
Message-Id: <20231109112500.4966-5-jaimeliao@mxic.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231109112500.4966-1-jaimeliao@mxic.com.tw>
References: <20231109112500.4966-1-jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_032535_338498_A989449D 
X-CRM114-Status: GOOD (  28.89  )
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
MIME-Version: 1.0
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

To prevent read data length bigger than controller limitation,
create a temperate operation for checking controller limitation
and read data length.

Exit continuous read mode and back to original read page method
if data length bigger than controller limitation.

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

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 drivers/mtd/nand/spi/core.c | 116 ++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |   1 +
 2 files changed, 117 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 33ad401d3a34..537302ea8281 100644
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
 
@@ -646,6 +654,92 @@ static int spinand_write_page(struct spinand_device *spinand,
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
+	 * Prevent data length bigger than controller limitation, create
+	 * a temperate operation for checking.
+	 */
+	struct spi_mem_op op = SPINAND_READID_OP(0, 0, spinand->scratchbuf, ops->len);
+	ret = spi_mem_adjust_op_size(spinand->spimem, &op);
+	if (ret) {
+		return ret;
+	}
+
+	if (op.data.nbytes != ops->len) {
+		pr_debug("%s: data length bigger than controller limitation\n", __func__);
+		return -ENOTSUPP;
+	}
+
+	if (from & (nanddev_page_size(nand) - 1)) {
+		pr_debug("%s: unaligned address\n", __func__);
+		return -ENOTSUPP;
+	}
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
@@ -665,6 +759,28 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 
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
+		if (ret == -ENOTSUPP)
+			goto read_each_page;
+
+		if (ecc_failed && !ret)
+			ret = -EBADMSG;
+
+		return ret ? ret : max_bitflips;
+	}
+
+read_each_page:
 	nanddev_io_for_each_page(nand, NAND_PAGE_READ, from, ops, &iter) {
 		if (disable_ecc)
 			iter.req.mode = MTD_OPS_RAW;
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 263420b2338e..4b8fe27eb6b8 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -313,6 +313,7 @@ struct spinand_ecc_info {
 
 #define SPINAND_HAS_QE_BIT		BIT(0)
 #define SPINAND_HAS_CR_FEAT_BIT		BIT(1)
+#define SPINAND_HAS_CONT_READ_BIT	BIT(2)
 
 /**
  * struct spinand_ondie_ecc_conf - private SPI-NAND on-die ECC engine structure
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
