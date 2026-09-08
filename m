Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75ACFC79FA1
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnEyWrk15lGABOAAWXkklLZ/9a1HrX5e9rNA/nRqVKY=; b=Bp0FBIyywQA6ZT
	FbqCTgZb/5ZOCYBM/jG+Xbtq0LsMaQWIIosS4gJ3JdLXrh1FIewZ3+1NnQ0P3+tM6ywmZ1EjGhN2S
	EteCn3+P5gywu4B0SkydN0zdxKgm/34479ceEHxJlb6pHNNVI7sE3pfVASVgIZOwzPrWHJX6ZUTAf
	XlqmVIsTRnYCb6PtEwYHlP3qJA5qcca9fzBLE7nkSiR59RxTqA3YZftwnk8evQhAi/Rh+hrUaAjaM
	VsQ/82aOgrYKNnqxMnDq3d0YljaLUBBi+S3B5NcIH4fag6eb1ryCNC1t0wUY+VGrHuB8isAYL8HcE
	OufUQ04ylrs7rBUF8VBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sw8-00000008kdR-36DN;
	Tue, 08 Sep 2026 10:20:20 +0000
Received: from out203-205-221-235.mail.qq.com ([203.205.221.235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3sw4-00000008kbx-0ZpE
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 10:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788862811; bh=NNIBVf5+fanw9UbPk8ctZ4bXJ3jQgINTT+ZsSM8Xfho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AH8yx60Cv1Q7BTEkUrKXipvKOCFbitVYCm0UOMw2pyyE0za00gaXS9xZ4JmeN51P0
	 ZCgz2+e6e1oBBD0k74uC9KerJo8fdZ7eQNS1Xgq3ckqO97G6ZX+EJjO4dHnVUsRco4
	 x2shf0qDmwpzXL8lEzpWsxdzT47Q//G1dJaFqx0g=
Received: from localhost.localdomain ([223.166.55.8])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 4FBB86CE; Tue, 08 Sep 2026 18:19:59 +0800
X-QQ-mid: xmsmtpt1788862799t8i3gumi7
Message-ID: <tencent_E818586423F2F16D98DEF1EC2723EE4A6308@qq.com>
X-QQ-XMAILINFO: Mfa2ogpi8We7usBzROBO8cDvatF2B7/FYhOERh51v+MCo3afLC2SM6TooGXfdZ
	 MwJ8GTBmElYTOQAq4Ul6LT2XaxGV6zUG/XVwCB5wycCxo74ZsrF9HOOOl6O7JhVdnc0vAhzk/rWC
	 HCRRuLg730nR2Tjlr7870PaRqG9xk1WtemYhWyiXjbIxr3g7M3z6ChNCSls8qNp3U/LPP94lJiFY
	 jQc1LFb5tTFNxlZPbciGNSXeWlViWMqNstyjBmQyKN0Rt8c68b3Dmhse/CETmGRuxgYL1ULBfnFB
	 WTJgjV3ACOu5P9bVT0AvqYUim3tpMk9zXyWUpluLfdMmTYh7aoRA34FiK5v7HpcRxXrOAd/VLp78
	 Ur1FQAtJihfnRw/oAcdzLHCxjtezK69E5UFFBU3RiQevrBzn9iSundDr2nPXpp47Nlgt6oJLidGx
	 7r3O7d8bbhs+m4cuNpFME65FAAVu8DF7DXoBg/EyB/yogKwYxAoMGWw2nlchJAvEUPFHcSKr1ZLk
	 c7m1s2Gq4OZJr4qSVpk6W2lGMsKakNUTK20SHxaNRePTHznn0QQK+D2yo+TIR3gwQmujyyYNFCwM
	 Xl382oFBXH7DjdfKiK23kfjLqkkGum0M4tR3O/9FneiytMeiJCYvrFv/jsonaUjR1V640/yAsiX3
	 5FA+HTcihjOEyUUeN15O3aPr+EottiS0W5UM2WC0Ex5KPvhXaqKkjpRuIrblDOZjuXf22GLXZG42
	 RpLWeb66YUW4l14af+8CYqaN9BDzClmCURY3lXRegUCfYyFoHRflMI6ZtiOTv7L1SNcL3gWB1uIK
	 CbzGXJCQoaikmBUfn6KM57PVx36YK3eJ80VLRSV1vroUJA5gb76FUIUq0HlmXtNdfAKeQ5F2NiEC
	 20Ae2mh21TRIzeIWk9QgG1UCuiMCy1LWWwMY3VWTqGmd3KHYZTe84DT11ESn33prUxA8TlvUztQC
	 9VBVZ5ng76U8qw3lXXB+u26RrTZRn+kxmeqNlOCN1bzyrnFZLwMUgas6KXcp1NL0ZeKMfDEltKte
	 0qZ6uErycWt3Z/gvwRIKpnSS4ZOI/vk+HhvCYmpq5r9JAtKGWw7qWgeFejB+w=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Zongzhen Feng <1768315307@qq.com>
To: miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	richard@nod.at,
	vigneshr@ti.com,
	Zongzhen Feng <1768315307@qq.com>
Subject: [PATCH v3] mtd: spinand: cache the last read page to avoid redundant SPI operations
Date: Tue,  8 Sep 2026 18:19:58 +0800
X-OQ-MSGID: <20260908101958.3311434-1-1768315307@qq.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
References: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_032016_502227_ADB383DB 
X-CRM114-Status: GOOD (  19.45  )
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

When squashfs reads files through mtdblock, the mtdblock layer
splits I/O into 512-byte sectors. For a 4K-page SPI NAND, this
means reading the same page 8 times (4096 / 512), generating 7x
redundant SPI read-from-cache operations. Each such operation
involves a full SPI bus transaction, significantly slowing down
boot time and file access.

Cache the last successfully read page in spinand_device to avoid
these redundant operations. When the same {target, eraseblock,
page} is requested consecutively, the data is served directly
from the bounce buffer (databuf) via memcpy, skipping the SPI
transaction entirely.

The cache is invalidated on write, erase, ECC errors, and when
the bounce buffer is overwritten by non-cacheable reads (RAW,
continuous, or OOB-only).

Signed-off-by: Zongzhen Feng <1768315307@qq.com>
---
v3:
- Invalidate cache when databuf is overwritten by a non-cacheable
  read (RAW, continuous, OOB-only) to prevent stale cache hits.
- Invalidate cache on uncorrectable ECC errors to prevent
  subsequent reads from bypassing ECC checks.

v2:
- Fix compilation error: req->disable_ecc -> req->mode != MTD_OPS_RAW
- Remove spurious indentation change
- Use real name instead of pseudonym
---
 drivers/mtd/nand/spi/core.c | 39 +++++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  9 +++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8bf9301f25e7..f545dd948604 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -560,6 +560,15 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 			       req->ooblen);
 	}
 
+	if (req->datalen && !req->continuous && req->mode != MTD_OPS_RAW) {
+		spinand->cur_target_cache = req->pos.target;
+		spinand->cur_block_cache = req->pos.eraseblock;
+		spinand->cur_page_cache = req->pos.page;
+		spinand->cache_valid = true;
+	} else if (req->datalen) {
+		spinand->cache_valid = false;
+	}
+
 	return 0;
 }
 
@@ -833,6 +842,20 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
 		if (disable_ecc)
 			iter.req.mode = MTD_OPS_RAW;
 
+		if (spinand->cache_valid && !disable_ecc &&
+		    !iter.req.ooblen &&
+		    iter.req.pos.target == spinand->cur_target_cache &&
+		    iter.req.pos.eraseblock == spinand->cur_block_cache &&
+		    iter.req.pos.page == spinand->cur_page_cache) {
+			if (iter.req.datalen)
+				memcpy(iter.req.databuf.in,
+				       spinand->databuf + iter.req.dataoffs,
+				       iter.req.datalen);
+			ops->retlen += iter.req.datalen;
+			ops->oobretlen += iter.req.ooblen;
+			continue;
+		}
+
 		ret = spinand_select_target(spinand, iter.req.pos.target);
 		if (ret)
 			break;
@@ -842,6 +865,9 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
 		if (ret < 0 && ret != -EBADMSG)
 			break;
 
+		if (ret == -EBADMSG)
+			spinand->cache_valid = false;
+
 		if (ret == -EBADMSG && spinand->set_read_retry) {
 			if (spinand->read_retries && (++retry_mode <= spinand->read_retries)) {
 				ret = spinand->set_read_retry(spinand, retry_mode);
@@ -1064,6 +1090,12 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
 		if (ret)
 			break;
 
+		if (spinand->cache_valid &&
+		    iter.req.pos.target == spinand->cur_target_cache &&
+		    iter.req.pos.eraseblock == spinand->cur_block_cache &&
+		    iter.req.pos.page == spinand->cur_page_cache)
+			spinand->cache_valid = false;
+
 		ret = spinand_write_page(spinand, &iter.req);
 		if (ret)
 			break;
@@ -1188,6 +1220,11 @@ static int spinand_erase(struct nand_device *nand, const struct nand_pos *pos)
 	if (!ret && (status & STATUS_ERASE_FAILED))
 		ret = -EIO;
 
+	if (!ret && spinand->cache_valid &&
+	    spinand->cur_target_cache == pos->target &&
+	    spinand->cur_block_cache == pos->eraseblock)
+		spinand->cache_valid = false;
+
 	return ret;
 }
 
@@ -2025,6 +2062,7 @@ static void spinand_cleanup(struct spinand_device *spinand)
 	nanddev_ecc_engine_cleanup(nand);
 	nanddev_cleanup(nand);
 	spinand_manufacturer_cleanup(spinand);
+	spinand->cache_valid = false;
 	kfree(spinand->databuf);
 	kfree(spinand->scratchbuf);
 }
@@ -2044,6 +2082,7 @@ static int spinand_probe(struct spi_mem *mem)
 	spi_mem_set_drvdata(mem, spinand);
 	spinand_set_of_node(spinand, mem->spi->dev.of_node);
 	mutex_init(&spinand->lock);
+	spinand->cache_valid = false;
 	mtd = spinand_to_mtd(spinand);
 	mtd->dev.parent = &mem->spi->dev;
 
diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
index 5f4c00ae72a7..887ef6d34a41 100644
--- a/include/linux/mtd/spinand.h
+++ b/include/linux/mtd/spinand.h
@@ -757,6 +757,10 @@ struct spinand_mem_ops {
  *		   a command addressing a page or an eraseblock embedded in
  *		   this die. Only required if your chip exposes several dies
  * @cur_target: currently selected target/die
+ * @cur_target_cache: target of the cached page
+ * @cur_block_cache: eraseblock of the cached page
+ * @cur_page_cache: page number of the cached page
+ * @cache_valid: whether the cached page is valid
  * @eccinfo: on-die ECC information
  * @cfg_cache: config register cache. One entry per die
  * @databuf: bounce buffer for data
@@ -798,6 +802,11 @@ struct spinand_device {
 			     unsigned int target);
 	unsigned int cur_target;
 
+	unsigned int cur_target_cache;
+	unsigned int cur_block_cache;
+	unsigned int cur_page_cache;
+	bool cache_valid;
+
 	struct spinand_ecc_info eccinfo;
 
 	u8 *cfg_cache;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
