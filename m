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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFFF1C43603
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 21:48:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71083205C9
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 21:48:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XMFvrfiv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkPhOsRf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71083205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OHWlWJBqtnz+5rE0U9G+6TSKqEZQFhnBN+IYpyLHoaE=; b=XMFvrfivUUdIA0
	1ZwJ9opevXuhs4FLOq+TFltofaxBM9mA/PFGi0Mk6/+bOECmOkloRSRruBju14OpL57UDyHNlVCmR
	UJbV8fOLmaTg+ScfFEfkUJzAw6PxT+KPO1nH6NMbEmG5RTVoaOuCQMuyelJ8lkA9+CRkyJwBGcYx+
	aKApynS+cLdFS811ah06vKm8bmAPeY2mzqYWGJrgMrgdv28kd5chH/LRs57H0ONL2dsdKQqKpZ6RT
	Y5v/3HTe/6nRvwh1hB1GZ+P2x3eO+QkdONHjpCj5yurWRjQ26ZV/Tswx2WfBayhxhOq0hzykWvCWJ
	/KWZPIIN6F+mTTy1M5fQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieQsf-0004m7-UX; Mon, 09 Dec 2019 21:47:49 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieQq4-0000xo-NL
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 21:45:10 +0000
Received: by mail-ot1-x341.google.com with SMTP id i15so13630641oto.7
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2019 13:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ER5XOmpfTbyA77VZ0mW/V+9R8ytRWk1qGHF5rdwU7So=;
 b=OkPhOsRfdqcG7yIBu/Vxs7LM4zdcAq2xGCHoNVMFrpG8RA/x57P9Nk91e6XPNtYeu0
 yDLoILlRLTckXgD3qIBvjEmg9h/L2cnI/7MS87MiMg+eKQumXK8XiQayMtfVsydRrxSf
 yQ8GfSJz6U1IVCsjGVj5In76A4ET/ZM7F23H/mHd+t4YDtKLMZXNmpA9dhfF82OUH31t
 j1156+QLTqu5x6kD/xkDX9GT4B4xXtM7PUm8qgmfNRFXrKupcA26mgfdA82s2yr1cOpy
 WRpSmo7QTP4EmuL9OdAnLEek3XxeUtID/DxtXojmKEWYfyffb9G9oeYdS6rqNmcDSiSx
 CKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ER5XOmpfTbyA77VZ0mW/V+9R8ytRWk1qGHF5rdwU7So=;
 b=Lqtn6YFNAlkc0zavylXBHa4zyydxEoSCdmbSULBIU9XPHBwmaYN8iRlo+Yu8OIFbDy
 LwZwnm5TLwXz4lLISKQ1J7f/BxMT31PsYNIrwUFlAhxyVGTfgpFtCPRWydA+qPatjGfo
 RQSuwPDNJVZ+02f1NjP/8b8YCSoKDyKjxT+VeciKsSDmO5Z8llnqy+6xzzapd1fk9w7S
 9Q9rf676FGQPtXhv1Jy8IfopvAbSVLniCE1vXUsxWoNUAv4tHAeq6e/j1Z/Ckn9DoTOM
 +L5gLRfmOhGeVcB3MrdEaU1PYCCO2eZc+22I7D4C2R2c5HZjp4yWq6d/j8iMBIg5FNxX
 IIng==
X-Gm-Message-State: APjAAAVEJa85u8wJofk1Vr/QgEY3FN7omLMpTMB/yDCO7ROWc6D5Fqve
 lB2HBd9TKANo/wi/vto790U=
X-Google-Smtp-Source: APXvYqwY43CbS3Sb8mZuD3/Jw8lqjWbnbiMpng2baZgioTPwEu3ffo+xD2GO+SEDxlxfOGQeHXrzAg==
X-Received: by 2002:a9d:366:: with SMTP id 93mr1778892otv.183.1575927907211;
 Mon, 09 Dec 2019 13:45:07 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id t80sm533904oih.23.2019.12.09.13.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 13:45:06 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3] mtd: onenand_base: Adjust indentation in
 onenand_read_ops_nolock
Date: Mon,  9 Dec 2019 14:44:23 -0700
Message-Id: <20191209214422.53661-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209210328.18866-1-natechancellor@gmail.com>
References: <20191209210328.18866-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_134508_874887_FE0D5E8E 
X-CRM114-Status: GOOD (  17.30  )
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

v2 -> v3:

* Fix one missed conversion (Nick).

 drivers/mtd/nand/onenand/onenand_base.c | 82 ++++++++++++-------------
 1 file changed, 41 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
index 77bd32a683e1..9e81cd982dd3 100644
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
@@ -1301,24 +1301,24 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
 			oobcolumn = 0;
 		}
 
- 		/* See if we are done */
- 		read += thislen;
- 		if (read == len)
- 			break;
- 		/* Set up for next read from bufferRAM */
- 		if (unlikely(boundary))
- 			this->write_word(ONENAND_DDP_CHIP1, this->base + ONENAND_REG_START_ADDRESS2);
- 		ONENAND_SET_NEXT_BUFFERRAM(this);
- 		buf += thislen;
+		/* See if we are done */
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
