Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D003DC79F82
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Sep 2026 03:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NBgFNNtDX0Y9cXGy50PX3FZt0vSOozW9yNZGTs91b2U=; b=Yusn9ah0/Swg0w
	ZYURUyKTqf6mDFIE9suh5pJMnRpy5xMFEw8l/a7rRncsERT73HkKKmP+13h/cipn5K52l+grEFUqc
	e/Cuug5AQokCgPyoDEJY7eM/tnRlUnj2gYr9fux8FjhhDw6c1unyoNa9nVn1BIfTaZ5aQ5+mWWWl+
	qsnr6nMLgUYm+0AVjdGDQDx/CTI4mkMH8jpZJSMpLV1xbqHmc+pCZXfZmhhHQvWVLLLOvGbJVvyF1
	r8PGy4zZZht4Z1D4nG91FMLhdEkrm5s6+MNAMx+PIhkQys+y5qRRRL3Om/QMmEW9qXw99feskFP3t
	SyYsJvbLOe8gTZa1or2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3mTJ-00000007yL1-0i9a;
	Tue, 08 Sep 2026 03:26:09 +0000
Received: from out203-205-221-221.mail.qq.com ([203.205.221.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3mT5-00000007yKM-32zl
	for linux-mtd@lists.infradead.org;
	Tue, 08 Sep 2026 03:26:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1788837949; bh=RQhosnyt6aERtesI5svtuDxWAhd8P12cd7CiHkOvBTU=;
	h=From:To:Cc:Subject:Date;
	b=pg6K0tRVnCw3yPA7Yskb9BeB/0IiS6xrCmxlpJIVxTyWxWAkH+3oY7M3AWk4az//m
	 SC/l+HoFZWNZaUrT/67Jrmd/UMMceiitocSG8KmBDLOzUWKfXdsqAKdItneJmSc5sS
	 vSUOItENTXGBZVmlnJi97Cg3Xjh/Z/osysYEwxR4=
Received: from localhost.localdomain ([223.166.55.8])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 66039CB1; Tue, 08 Sep 2026 11:25:32 +0800
X-QQ-mid: xmsmtpt1788837932t51o31uiw
Message-ID: <tencent_4C47F17C98F6F164274CEE84638558D62308@qq.com>
X-QQ-XMAILINFO: NHWsITUsYMGeIo9jtsaxRfEhMDZ0EUQn/MHOxKkLfED+rUDknmzcqdqV8w2CBD
	 8KRpHtmF05mGbRPpz/84e+3Pvep1R2QyUacznuwc3lIxe8ecMmkLLkzzVD59ij8TZ6X5npd1uUqO
	 D/WZaIY3ewl99tElBQZ7l69rz+9GmC3qxxsTAi4COHmp9CeGUtDIIOJLG9s/hZvA5ZOzRaF0CoeN
	 BnGkVfrDUA84FBDhuq61ZhiWkPwYZP07uE7ru5g+TBhxNDtzsE/zFKdM/q+YETM73c35nkmHK1ba
	 FO6QaXF4Ks++E4kpHZUpno+NF9Yfx6uLO8GGgW87fpy4AmWSwW+chD6qswqummClUmVXGok22nGa
	 yeShV6uEdvYSMjHaDH237xZ82GThtyN8jJkYtYWuDP13cwbAzDX1pa6siKHVTsUeV67ONkajm1jM
	 AkV74pOsGhh+lRFmku8XbzNsgasVmoYpx6lKroN3EzFXo6zn5n/EpPyHJHPi/VhWJofJXf5SuECP
	 xbKu5wzaEvq3NcaYb/xDQkUqvJgXPlcPYllkEmecqQlguW8A0lKZ7pwOKXsV3soMOVTw7ZI8eH7w
	 c8C69XBmDBXp1/zVCFFD2HWRdVdZm47Wf3sFX1SwdynL+SinHMnPwyagSdqJZn7kL6QYj2N8Jdaz
	 gDCrL2S3AOEg3iA3d/mzseMVTKeruM6OBuWT/ydqb9DozRyhSQTw0/yQP9Kiq1srcG7fh2hcWTwA
	 uhPRrDwh+cCFrNV2HC4+WLW/+anBmJkinWLmtHa6Kz9T/fZSnfLj1MSTwSReFrBJ+DO9hzxRcEf9
	 ihDtPDsrAmjZ06edpD/9bieklsOVWvq+YcKthMf2UmA0uU9pUy7BdsOkJwtnCg66TnWerEqzuldL
	 24N7zGzVbIoviwnZtG28ss8ej3oU8gPsxwl7Pn/GHnn4EgABXSghG8iUrNLfZWxcraTD2THvXrBo
	 bcPi77auJ6QkJJgs22hSiJ6kA6wVFq9I07Q7CNAsYyQHy1vQDYxAFpxOvoZGRi4CPtbmC1DyfWMD
	 9Cdvkn4qxLjwocQ5RPKoL1FpM9z57o9W6Uu1vIsWxu0ShUPHyk/hcpCcd5HAE=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: fzz <1768315307@qq.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongzhen Feng <1768315307@qq.com>
Subject: [PATCH v2] mtd: spinand: cache the last read page to avoid redundant SPI operations
Date: Tue,  8 Sep 2026 11:25:30 +0800
X-OQ-MSGID: <20260908032530.3309746-1-1768315307@qq.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_202557_961673_F952C64F 
X-CRM114-Status: GOOD (  17.42  )
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

From: Zongzhen Feng <1768315307@qq.com>

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

The cache is invalidated on write and erase operations. RAW reads,
OOB reads, and continuous reads are excluded from caching to
maintain correctness.

Signed-off-by: Zongzhen Feng <1768315307@qq.com>
---
v2: fix build error (use req->mode != MTD_OPS_RAW instead of
    req->disable_ecc), fix whitespace noise, use real name
---
 drivers/mtd/nand/spi/core.c | 34 ++++++++++++++++++++++++++++++++++
 include/linux/mtd/spinand.h |  9 +++++++++
 2 files changed, 43 insertions(+)

diff --git a/drivers/mtd/nand/spi/core.c b/drivers/mtd/nand/spi/core.c
index 8bf9301f25e7..21bc29ae62b8 100644
--- a/drivers/mtd/nand/spi/core.c
+++ b/drivers/mtd/nand/spi/core.c
@@ -560,6 +560,13 @@ static int spinand_read_from_cache_op(struct spinand_device *spinand,
 			       req->ooblen);
 	}
 
+	if (req->datalen && !req->continuous && req->mode != MTD_OPS_RAW) {
+		spinand->cur_target_cache = req->pos.target;
+		spinand->cur_block_cache = req->pos.eraseblock;
+		spinand->cur_page_cache = req->pos.page;
+		spinand->cache_valid = true;
+	}
+
 	return 0;
 }
 
@@ -833,6 +840,20 @@ static int spinand_mtd_regular_page_read(struct mtd_info *mtd, loff_t from,
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
@@ -1064,6 +1085,12 @@ static int spinand_mtd_write(struct mtd_info *mtd, loff_t to,
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
@@ -1188,6 +1215,11 @@ static int spinand_erase(struct nand_device *nand, const struct nand_pos *pos)
 	if (!ret && (status & STATUS_ERASE_FAILED))
 		ret = -EIO;
 
+	if (!ret && spinand->cache_valid &&
+	    spinand->cur_target_cache == pos->target &&
+	    spinand->cur_block_cache == pos->eraseblock)
+		spinand->cache_valid = false;
+
 	return ret;
 }
 
@@ -2025,6 +2057,7 @@ static void spinand_cleanup(struct spinand_device *spinand)
 	nanddev_ecc_engine_cleanup(nand);
 	nanddev_cleanup(nand);
 	spinand_manufacturer_cleanup(spinand);
+	spinand->cache_valid = false;
 	kfree(spinand->databuf);
 	kfree(spinand->scratchbuf);
 }
@@ -2044,6 +2077,7 @@ static int spinand_probe(struct spi_mem *mem)
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
