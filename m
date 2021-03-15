Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1ECEC433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 06:53:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CBBE64E3F
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 06:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CBBE64E3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rmz8dXIf2gzlhp8efKeJQYZSsvEtKfMquega6VGFxiU=; b=HDLlo+0L0Gnvs/8F79nsE8ZHm
	5QdMVlKDv1FoLhOBvpV2NR++9dtPKQGE9QEokeliLOp+kIOK/sBOeIQgYGlviG90lY7h4xLUVETOr
	ocVz8wABsCUXgEIaNWtAlsOtlBhm8XbfE345rSo3ik8wG7AgwYtOPuUpFP2JgwlI0VMIkw+FM0NHn
	OlIyzZRT65UYLYtpJKDZdPQZSa0OYUsKedMfuaDdmfrzMMy4eFBiEq1iJwMOBJz3fqar8hm0fevS0
	00194MQ0Q/hzorjQV4zAktQt0KF+t/ut3jfqMyimgKAlnRgM+4SgqMwjyNB6YnxcHrE2dXrAV09ql
	UPwUgkXOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLh6O-00F5Yf-8Z; Mon, 15 Mar 2021 06:53:20 +0000
Received: from smtprelay0088.hostedemail.com ([216.40.44.88]
 helo=smtprelay.hostedemail.com)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLh6G-00F5Xv-7s
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 06:53:14 +0000
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id A885B363F;
 Mon, 15 Mar 2021 06:53:07 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: town30_2b099872772b
X-Filterd-Recvd-Size: 3821
Received: from [192.168.1.159] (unknown [47.151.137.21])
 (Authenticated sender: joe@perches.com)
 by omf07.hostedemail.com (Postfix) with ESMTPA;
 Mon, 15 Mar 2021 06:53:06 +0000 (UTC)
Message-ID: <5723fabcc03455ee6624a7d223186e5fad2bf2e9.camel@perches.com>
Subject: Re: [PATCH v2 5/5] mtd: spi-nor: swp: Drop 'else' after 'return'
From: Joe Perches <joe@perches.com>
To: Pratyush Yadav <p.yadav@ti.com>, Tudor Ambarus
 <tudor.ambarus@microchip.com>
Cc: vigneshr@ti.com, michael@walle.cc, linux-mtd@lists.infradead.org, 
 miquel.raynal@bootlin.com, richard@nod.at, linux-kernel@vger.kernel.org
Date: Sun, 14 Mar 2021 23:53:04 -0700
In-Reply-To: <20210308062821.wn4uqfxcg6vo3gcb@ti.com>
References: <20210306095002.22983-1-tudor.ambarus@microchip.com>
 <20210306095002.22983-6-tudor.ambarus@microchip.com>
 <20210308062821.wn4uqfxcg6vo3gcb@ti.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_065312_864507_D8B51A56 
X-CRM114-Status: GOOD (  15.56  )
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

On Mon, 2021-03-08 at 11:58 +0530, Pratyush Yadav wrote:
> On 06/03/21 11:50AM, Tudor Ambarus wrote:
> > else is not generally useful after a break or return.
> > 
> > Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> Reviewed-by: Pratyush Yadav <p.yadav@ti.com>
> 

I don't think this improves the code.

Generally, checkpatch is a stupid little script.

This code uses a form like:
	if (foo)
		return bar;
	else
		return baz;

which checkpatch recognizes as OK and so checkpatch does not
emit any warning message, but this code just adds comments
before each return which confuses checkpatch.

I think better would be to change the code to use temporaries
and convert the functions to bool.

Something like:
---
 drivers/mtd/spi-nor/core.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0522304f52fa..e174a2f1d621 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1798,36 +1798,41 @@ static void spi_nor_get_locked_range_sr(struct spi_nor *nor, u8 sr, loff_t *ofs,
 }
 
 /*
- * Return 1 if the entire region is locked (if @locked is true) or unlocked (if
- * @locked is false); 0 otherwise
+ * Return true if the entire region is locked
+ * (if @locked is true) or unlocked (if @locked is false); false otherwise
  */
-static int spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
+static bool spi_nor_check_lock_status_sr(struct spi_nor *nor, loff_t ofs,
 					uint64_t len, u8 sr, bool locked)
 {
 	loff_t lock_offs;
 	uint64_t lock_len;
+	uint64_t lock_max;
+	uint64_t ofs_max;
 
 	if (!len)
-		return 1;
+		return true;
 
 	spi_nor_get_locked_range_sr(nor, sr, &lock_offs, &lock_len);
 
+	lock_max = lock_offs + lock_len;
+	ofs_max = ofs + len;
+
 	if (locked)
 		/* Requested range is a sub-range of locked range */
-		return (ofs + len <= lock_offs + lock_len) && (ofs >= lock_offs);
+		return (ofs_max <= lock_max) && (ofs >= lock_offs);
 	else
 		/* Requested range does not overlap with locked range */
-		return (ofs >= lock_offs + lock_len) || (ofs + len <= lock_offs);
+		return (ofs >= lock_max) || (ofs_max <= lock_offs);
 }
 
-static int spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
-				u8 sr)
+static bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
+				 u8 sr)
 {
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, true);
 }
 
-static int spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
-				  u8 sr)
+static bool spi_nor_is_unlocked_sr(struct spi_nor *nor, loff_t ofs, uint64_t len,
+				   u8 sr)
 {
 	return spi_nor_check_lock_status_sr(nor, ofs, len, sr, false);
 }



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
