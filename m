Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294DBC25B0C
	for <linux-mtd@archiver.kernel.org>; Thu, 11 Aug 2022 09:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cdd8tw/fCJoX8ZNicdL4VbJo5SLy9EuQrBDE0OgihbU=; b=jHFumVnUeFwL6Y
	1/TVUScTKgtxVqIcxz0dIB+jOSlzAVnYMaHHTxfO7pjobpOBvYX1IvdGthqOViu8gQKEQ4Q8drCrY
	3OCYFpznU6J+H8/0oX2GujjfQzZSyq5z+1rZ9Sc3o4mWcG9AOU55H6nl32ITo8/U3cb8SNEx6HlM0
	o4igWIoLalMEnIrT3G+E8Wkj0TJDlnycUWYesvtF+0qbJoz7E0wZlMkdVrMfBI3Mhs3w4FzKbsOFX
	1oMuwPNB3EdBkgOFMmCOswRLjRlLYodH+AP0NXvFudsRWl80hDO36XvQyIpgqTMnJF0NisWfCfT+k
	FHSEuHBNqCvvpvPrkp0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4lI-00AsoK-GZ; Thu, 11 Aug 2022 09:45:56 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM4lB-00Asis-AZ
	for linux-mtd@lists.infradead.org; Thu, 11 Aug 2022 09:45:51 +0000
Received: by mail-pg1-x52f.google.com with SMTP id q16so16689008pgq.6
        for <linux-mtd@lists.infradead.org>; Thu, 11 Aug 2022 02:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc;
        bh=Ha/lvee0KK2/2qKnmL2WjozlV+b2jRfYZD7dgGtUoBc=;
        b=aCSkSs4su+Rd9GhiKWfidgzxTOsBQssoRYChVBUYpUbosMJB2aWUkHeSef6yukzOPv
         3RmaSZriYt8QwYOZd72nkPF0KObC+DtpA/ra4JQra7ExrCOgTZp4vct7KWWr4Lzi1nCk
         LRcGoSdGXRonkWeTgrXpO4D2Z078foWHHlFwxpuXRwMCqFnv9oMjB62Q+eUaqiQiB+ji
         mbISlI9wJ1dMrrgRYJhfg2W8fO0IQSx3zy5A5PIewcCOqbTqz5UB5QLKeka3Y07HzWt9
         zty/uYBHNKy/aMqArXsnF+NKpTMoNM1VBoZe3EqBC/FoFBkaCNGUwcHSm6o6EmaigUxi
         lg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=Ha/lvee0KK2/2qKnmL2WjozlV+b2jRfYZD7dgGtUoBc=;
        b=WtX8+EUBZhS2x196yAL6PSJgkrjgWkAHvwfFfhwFchDFy/HRa/NlGeihJ0GC8rLwgO
         2zjJ/lyUUP8s2IhHUS2KZ2TDridQdD/rIw4zzVXjHDwrepEIE+2XHgItsPS1MfeEdRx4
         OkWZIBPdadvR3lMKZNe8y6rJs1XDqAC4zHAjVfwm0Ylk4OwEabrSiEXCaBsNwa4AaJDz
         MkLYEo2CHOxZTk2C7C15FDGwl1El55LppCpSmQR/oKUKjTISAf0oNAgrTzN5XiEhmVu5
         M3IPTOlF8GcukB6E5LpvhLyl5JrZ8kvuIf0BNoc9NmeYeGYNFbGrjHtw0Lmw6CQGQM1h
         WY3Q==
X-Gm-Message-State: ACgBeo3zwBtbWT0jaUDmbzEV/PFBJfkNGu5fSBjd/2J3Q/aUVi3t7mdc
	Fs09Da2MO2GE1y7KP+a4eMQJh2TDGgU=
X-Google-Smtp-Source: AA6agR7cglkh2jR+iuRuHoFXaVPhrFK3e8MkpyY3tXrvUaT5oQgkMgPMiNVwt+cBpNgFm+qjoZ0B3g==
X-Received: by 2002:a05:6a02:205:b0:41b:96dc:bb2a with SMTP id bh5-20020a056a02020500b0041b96dcbb2amr26353201pgb.116.1660211147033;
        Thu, 11 Aug 2022 02:45:47 -0700 (PDT)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id x14-20020aa79ace000000b0052d7606d144sm3586922pfp.74.2022.08.11.02.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 02:45:46 -0700 (PDT)
From: JaimeLiao <jaimeliao.tw@gmail.com>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com
Cc: jaimeliao@mxic.com.tw,
	JaimeLiao <jaimeliao.tw@gmail.com>
Subject: [PATCH v1 3/4] mtd: spinand: Add support continuous read operation
Date: Thu, 11 Aug 2022 17:45:35 +0800
Message-Id: <20220811094536.24498-4-jaimeliao.tw@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220811094536.24498-1-jaimeliao.tw@gmail.com>
References: <20220811094536.24498-1-jaimeliao.tw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_024549_392953_97DC1945 
X-CRM114-Status: GOOD (  25.72  )
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

Continuous reads have a positive impact when reading more than
one page and the column address is don't care in this operation,
a full page data will be read out for each page.

The performance of continuous read mode is as follows. Set the
flash to QUAD mode and run 25MZ direct mapping mode on the SPI
bus and use the MTD test module to show the performance of
continuous reads.

=================================================
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

Signed-off-by: JaimeLiao <jaimeliao.tw@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 99 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  1 +
 2 files changed, 100 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 380411feab6c..ef09bedda8d4 100644
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
 
@@ -412,6 +416,9 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		buf += ret;
 	}
 
+	if (spinand->use_continuous_read)
+		return 0;
+
 	if (req->datalen)
 		memcpy(req->databuf.in, spinand->databuf + req->dataoffs,
 		       req->datalen);
@@ -640,6 +647,80 @@ static int spinand_write_page(struct spinand_device *spinand,
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
+		return ret;
+
+	ret = spinand_reset_op(spinand);
+	if (ret)
+		return ret;
+
+	ret = spinand_continuous_read_disable(spinand);
+	if (ret)
+		return ret;
+
+	spinand->use_continuous_read = false;
+
+	ops->retlen = iter->req.datalen;
+
+	return ret;
+}
+
 static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 			    struct mtd_oob_ops *ops)
 {
@@ -656,6 +737,24 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 
 	mutex_lock(&spinand->lock);
 
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
index d70a6f49cc6f..c296d4d0dda5 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -308,6 +308,7 @@ struct spinand_ecc_info {
 
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
