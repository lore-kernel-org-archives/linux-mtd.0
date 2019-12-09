Return-Path: <SRS0=S0OG=Z7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0F1C43603
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 21:04:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45000205C9
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 21:04:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="r1FdJ5FK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X46QNUSA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45000205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+88vx1+hr+l74TQuyEXzBQJOM9OO+d3wv3AVF/2pGM=; b=r1FdJ5FKTu21p+
	u1sUJmaROgxZnhX5qW4nZM6+zL6AeABdUUBk2C8veCqgopMIgJk532wLZiGsKJ59L1cX3UIYcDHgn
	B0GvmeYBrrSGu/54ATt8LEFhrBPjGY6aZleYrdC+Og25OobFDlc1UfOAnmtXTrfgM5EtfQ0ziHzZW
	V0v5yvrvi0tOFuj2PpHimLxd8nbwEEPPtTXojpE42VP4Zux9gmaeRVGk5QWKrU4RscB/ohYtuAsEs
	GKuXNkJQJpVHfob8fTvDfcyr7bk+46Ct/JATIVeKnLN7y+NiEaxvrwyiOBz74m4W3dRej2JlfqQgs
	r35szmDMnYpne7aRor9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieQCi-00065x-Rw; Mon, 09 Dec 2019 21:04:28 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieQCf-00065J-Rb
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 21:04:27 +0000
Received: by mail-ot1-x342.google.com with SMTP id i15so13527608oto.7
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2019 13:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pGb2jQwRPhzwodYrTfgDTOY1jH/OdtdmucALKLbjZgQ=;
 b=X46QNUSAMf2aCBnyDWqbXjy0zSk83BHGnvoyov1rRrVk0vQXrGHufQbP1NI6RddmLr
 onKh01djZe3Nz5hWeNNXiJU3tVDJQmg362U3b8N2PNJpU6mAayyHlqD/yLfwh6TOgdO6
 yCdOY26RKfJzZOJS+y1szy9KKmDv5YH5zVHEI8+3V4LxgLSepewO4gSGHZBW2r0uuXBW
 XtCxVg2LKHSaXBR+OaKMf4fISAV4uY6cOQwNAL0sFMhBAzSmnrW+GEhVGL35o5lmzxpb
 h7RB9cCnyBxaU2zbzFwtFHXj/cqlM3FQdL6//vhmqqQHcy8aAcDlPW669BzbGHl3O4hK
 /y3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pGb2jQwRPhzwodYrTfgDTOY1jH/OdtdmucALKLbjZgQ=;
 b=gBHhjsL+cnye3PIPy6knwikoyacuv5ZnCKL79k3jWV+gyhF7rk/iJ0OoCyh+/fWnC1
 HvnYVw9ehIeCQdR3Q0OT+nnd6Z32C7gBdT20Of5OM7pp4CXxuRq1jZ2rr+cOM+2SEpFJ
 BFVQCu/vIj4QKGnas/ZDle4I6pnW9A7NdflF45WuQq7GB5rmwIpuvlHYy7AIUMXu1k8+
 BChUjUmSqA4j4xc0RUydk2Y2cJNENXBOYnX9jHLVAKGN+FoRRliXTD2ZNT9/4kr3bnXj
 rGcdlI+GuP6CMvH5416ZUaikMSF23vmi+WKCFN0X1gRHTWH1mmY3QYrD0Qrpe+irL/tL
 NmAA==
X-Gm-Message-State: APjAAAU1MXNCaso40x9zWmSYmunbCfaDRsSN3rkjrW28c5Ky1yS6PYH4
 fZFmuzx7b3e7z1+gUp5guxpqtbn2tZY=
X-Google-Smtp-Source: APXvYqy1kxOeUTOltHpl9zsNhkVn6zALXx1nG5J+7EfQ1UHlBkS4TV07pDkLNQ/6tQo0iDTasnP04Q==
X-Received: by 2002:a9d:798e:: with SMTP id h14mr22513469otm.257.1575925464850; 
 Mon, 09 Dec 2019 13:04:24 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id b206sm464959oif.30.2019.12.09.13.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 13:04:24 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2] mtd: onenand_base: Adjust indentation in
 onenand_read_ops_nolock
Date: Mon,  9 Dec 2019 14:03:29 -0700
Message-Id: <20191209210328.18866-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209205010.4115-1-natechancellor@gmail.com>
References: <20191209205010.4115-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_130425_920106_E836DAC2 
X-CRM114-Status: GOOD (  17.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 linux-mtd@lists.infradead.org, Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Clang warns:

../drivers/mtd/nand/onenand/onenand_base.c:1269:3: warning: misleading
indentation; statement is not part of the previous 'if'
[-Wmisleading-indentation]
        while (!ret) {
        ^
../drivers/mtd/nand/onenand/onenand_base.c:1266:2: note: previous
statement is here
        if (column + thislen > writesize)
        ^
1 warning generated.

This warning occurs because there is a space before the tab of the while
loop. There are spaces at the beginning of a lot of the lines in this
block, remove them so that the indentation is consistent with the Linux
kernel coding style and clang no longer warns.

Fixes: a8de85d55700 ("[MTD] OneNAND: Implement read-while-load")
Link: https://github.com/ClangBuiltLinux/linux/issues/794
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2:

* Clean up the block before the one that warns, which was added as part
  of the fixes commit (Nick). 

 drivers/mtd/nand/onenand/onenand_base.c | 80 ++++++++++++-------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
index 77bd32a683e1..13c69eb021a6 100644
--- a/drivers/mtd/nand/onenand/onenand_base.c
+++ b/drivers/mtd/nand/onenand/onenand_base.c
@@ -1248,44 +1248,44 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 
 	stats = mtd->ecc_stats;
 
- 	/* Read-while-load method */
+	/* Read-while-load method */
 
- 	/* Do first load to bufferRAM */
- 	if (read < len) {
- 		if (!onenand_check_bufferram(mtd, from)) {
+	/* Do first load to bufferRAM */
+	if (read < len) {
+		if (!onenand_check_bufferram(mtd, from)) {
 			this->command(mtd, ONENAND_CMD_READ, from, writesize);
- 			ret = this->wait(mtd, FL_READING);
- 			onenand_update_bufferram(mtd, from, !ret);
+			ret = this->wait(mtd, FL_READING);
+			onenand_update_bufferram(mtd, from, !ret);
 			if (mtd_is_eccerr(ret))
 				ret = 0;
- 		}
- 	}
+		}
+	}
 
 	thislen = min_t(int, writesize, len - read);
 	column = from & (writesize - 1);
 	if (column + thislen > writesize)
 		thislen = writesize - column;
 
- 	while (!ret) {
- 		/* If there is more to load then start next load */
- 		from += thislen;
- 		if (read + thislen < len) {
+	while (!ret) {
+		/* If there is more to load then start next load */
+		from += thislen;
+		if (read + thislen < len) {
 			this->command(mtd, ONENAND_CMD_READ, from, writesize);
- 			/*
- 			 * Chip boundary handling in DDP
- 			 * Now we issued chip 1 read and pointed chip 1
+			/*
+			 * Chip boundary handling in DDP
+			 * Now we issued chip 1 read and pointed chip 1
 			 * bufferram so we have to point chip 0 bufferram.
- 			 */
- 			if (ONENAND_IS_DDP(this) &&
- 			    unlikely(from == (this->chipsize >> 1))) {
- 				this->write_word(ONENAND_DDP_CHIP0, this->base + ONENAND_REG_START_ADDRESS2);
- 				boundary = 1;
- 			} else
- 				boundary = 0;
- 			ONENAND_SET_PREV_BUFFERRAM(this);
- 		}
- 		/* While load is going, read from last bufferRAM */
- 		this->read_bufferram(mtd, ONENAND_DATARAM, buf, column, thislen);
+			 */
+			if (ONENAND_IS_DDP(this) &&
+			    unlikely(from == (this->chipsize >> 1))) {
+				this->write_word(ONENAND_DDP_CHIP0, this->base + ONENAND_REG_START_ADDRESS2);
+				boundary = 1;
+			} else
+				boundary = 0;
+			ONENAND_SET_PREV_BUFFERRAM(this);
+		}
+		/* While load is going, read from last bufferRAM */
+		this->read_bufferram(mtd, ONENAND_DATARAM, buf, column, thislen);
 
 		/* Read oob area if needed */
 		if (oobbuf) {
@@ -1302,23 +1302,23 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 		}
 
  		/* See if we are done */
- 		read += thislen;
- 		if (read == len)
- 			break;
- 		/* Set up for next read from bufferRAM */
- 		if (unlikely(boundary))
- 			this->write_word(ONENAND_DDP_CHIP1, this->base + ONENAND_REG_START_ADDRESS2);
- 		ONENAND_SET_NEXT_BUFFERRAM(this);
- 		buf += thislen;
+		read += thislen;
+		if (read == len)
+			break;
+		/* Set up for next read from bufferRAM */
+		if (unlikely(boundary))
+			this->write_word(ONENAND_DDP_CHIP1, this->base + ONENAND_REG_START_ADDRESS2);
+		ONENAND_SET_NEXT_BUFFERRAM(this);
+		buf += thislen;
 		thislen = min_t(int, writesize, len - read);
- 		column = 0;
- 		cond_resched();
- 		/* Now wait for load */
- 		ret = this->wait(mtd, FL_READING);
- 		onenand_update_bufferram(mtd, from, !ret);
+		column = 0;
+		cond_resched();
+		/* Now wait for load */
+		ret = this->wait(mtd, FL_READING);
+		onenand_update_bufferram(mtd, from, !ret);
 		if (mtd_is_eccerr(ret))
 			ret = 0;
- 	}
+	}
 
 	/*
 	 * Return success, if no ECC failures, else -EBADMSG
-- 
2.24.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
