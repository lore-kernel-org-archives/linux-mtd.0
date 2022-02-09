Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1E3DC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Feb 2022 09:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dybrZ3Xu9P46SdypUUQOF5uxvG5DTnLJMH/B1gFvpcM=; b=uaQE/k9liOEib4
	UnqbP9yHPp2UsUEqZGu9ogUdHC7NZRGtbZ4d6rPJYi00Bjf3ausebiXV6BjS7QGkEDLW6IHvFcItf
	h8FHQ3PCgyWerHVhoUrxgmw/DFWUVO3zUI9aGAvdU9+Y+CeSxnDhvZhwn14Zr/Vu556NKvcC5FgYP
	ey+mxfAYnlpH0u2XQnZ7wYgd3FnCseiiqfdKhM7vVWZnjS3ERGB+Gj2OGeVN1nFgjj9oCaWrRIQ+6
	iV9h7WO4hpqB83Ue/TZpKMtezIR5GKoxKELKbcX7aoFgoqIo7glRB3lPkrn95g/fijAv4/+O+Sl+0
	tdi0wHIDpWAf+wSTc/lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHj1Z-00Gptu-V0; Wed, 09 Feb 2022 09:12:30 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHj0T-00GpYY-Vi
 for linux-mtd@lists.infradead.org; Wed, 09 Feb 2022 09:11:23 +0000
Received: by mail-pl1-x635.google.com with SMTP id y17so1666709plg.7
 for <linux-mtd@lists.infradead.org>; Wed, 09 Feb 2022 01:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FTDu+Q0FSzmf9I72oPt1dQRPi0YQJWm7aaA5QtLNJAE=;
 b=LACQ4iXRBkEGUWYm7gywMhwg97uQhbOv/CB+NUd7udWiWX8rnKj74Du4dC6ZZTPE0D
 ELa/qRi5NRMe8Zg+uzrjlJfyA/b3oOx1qJhY1ZkabR6M/50nJ5oV4GfaAjkvMlAll0vb
 XG7qIz2OSe4CUEcuZLxsl8AExOf7EZdEIVzHxkTO/T5r1GJ7Nhk9FHYYbj2GyQGvSkTG
 A2gjd5oPdKtfc97VPFlLGTEkfbnp8GVVRmVEbqO6Bz7PltU2F/BUAC43Ci7Zv7Y08+Qc
 2epcaX2RcHjtR1h8OEOTZI6GBMx1eGI3jf/P6LcyHpW78JhoTOxPIxrdlyOc4Uv3vTiD
 xeWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FTDu+Q0FSzmf9I72oPt1dQRPi0YQJWm7aaA5QtLNJAE=;
 b=2hV5n5HWlL/e18boycjJtIVuERrO5to0WsMOYNf2hRJIdrBZA2njcrq5RPcakoIcvr
 AuuP46pXnZ1e7Uf2Qb/KqQILfjn2zOQYF/D870vZDZX7Z/TtVOLvnK5NOyywlQE5pVfK
 cf7h/TPryC0ivSEQu/2r0TI1zbz9gRThfI2ZbbquwMhSw4TleJF7bj2NfwdK9ovQOjuR
 7lUtTyypKsXvdDzW1uyNRcsl7Jo4UceYtNEbxCmf9Z0BDkiu2Lnk+05JgL+8sF7FJOOk
 2E7b6MaM10AXAyUElQsRZEGDuDmrF5zMeAS1VRmC/11RIdndo4UW4pN2m1G2dqqDuGQo
 yUPg==
X-Gm-Message-State: AOAM53339iUiXdRez7HWrEsvXZhOaoMcs39Zi2dupDOEofXOFfLMQ00g
 1bmTngJAZHrf1MSe0FO54KMOOaHd6K1lHA==
X-Google-Smtp-Source: ABdhPJxcxW0yyJD8BIFPR7kKK3NlXe5z6gUhkGv8VOME2RSAgkFjsA2tW4yOw7Blmma5+kxCo8G3IQ==
X-Received: by 2002:a17:90b:4d82:: with SMTP id
 oj2mr1500652pjb.202.1644397881421; 
 Wed, 09 Feb 2022 01:11:21 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
 by smtp.googlemail.com with ESMTPSA id v2sm5270643pjt.55.2022.02.09.01.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 01:11:20 -0800 (PST)
From: Zhengxun <zhengxunli.mxic@gmail.com>
To: miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org
Cc: zhengxunli@mxic.com.tw,
	Zhengxun <zhengxunli.mxic@gmail.com>
Subject: [PATCH v2 3/4] mtd: spinand: Add support continuous read operation
Date: Wed,  9 Feb 2022 17:10:21 +0800
Message-Id: <20220209091022.30155-4-zhengxunli.mxic@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220209091022.30155-1-zhengxunli.mxic@gmail.com>
References: <20220209091022.30155-1-zhengxunli.mxic@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_011122_055189_5BA1FDFF 
X-CRM114-Status: GOOD (  27.51  )
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

The continuous read operation including: firstly, starting
with the page read command and the 1st page data will be
read into the cache after the read latency tRD. Secondly,
Issuing the Read From Cache commands (03h/0Bh/3Bh/6Bh/BBh/EBh)
to read out the data from cache continuously. After all the
data is read out, the host should pull CS# high to terminate
this continuous read operation and wait tRST for the NAND
device resets read operation.

The continuous read usuage is enable by read mutiple page
(at least larger than 1 page size) and the column address is
don't care in this operation, since the data output for each
page will always start from byte 0 and a full page data should
be read out for each page.

On the other hand, since the continuous read mode can only read
the entire page of data and cannot read the oob data, the dynamic
change mode is added to enable continuous read mode and disable
continuous read mode in spinand_mtd_continuous_read to avoid
writing and erasing operation is abnormal.

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

Signed-off-by: Zhengxun <zhengxunli.mxic@gmail.com>
---
 drivers/mtd/nand/spi/core.c | 97 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 380411feab6c..990836fff924 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -383,7 +383,10 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 	u16 column = 0;
 	ssize_t ret;
 
-	if (req->datalen) {
+	if (spinand->use_continuous_read) {
+		buf = req->databuf.in;
+		nbytes = req->datalen;
+	} else if (req->datalen) {
 		buf = spinand->databuf;
 		nbytes = nanddev_page_size(nand);
 		column = 0;
@@ -412,6 +415,9 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 		buf += ret;
 	}
 
+	if (spinand->use_continuous_read)
+		return 0;
+
 	if (req->datalen)
 		memcpy(req->databuf.in, spinand->databuf + req->dataoffs,
 		       req->datalen);
@@ -640,6 +646,81 @@ static int spinand_write_page(struct spinand_device *spinand,
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
+	 * Since the continuous read mode can only read the entire page of data
+	 * and cannot read the oob data, therefore, only ECC-Free SPI-NAND support
+	 * continuous read mode now.
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
@@ -656,6 +737,19 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 
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
+		goto continuous_read_finish;
+	}
+
 	nanddev_io_for_each_page(nand, NAND_PAGE_READ, from, ops, &iter) {
 		if (disable_ecc)
 			iter.req.mode = MTD_OPS_RAW;
@@ -678,6 +772,7 @@ static int spinand_mtd_read(struct mtd_info *mtd, loff_t from,
 		ops->oobretlen += iter.req.ooblen;
 	}
 
+continuous_read_finish:
 	mutex_unlock(&spinand->lock);
 
 	if (ecc_failed && !ret)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
