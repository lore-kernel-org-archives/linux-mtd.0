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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC0C3C43603
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 20:50:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99C972068E
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2019 20:50:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pyVL+yFB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KewqzZ67"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99C972068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YniSLaE47oVwVBW62IiDlMIVkw8fu+bWyfXIwmmAYPU=; b=pyVL+yFB4qP1vY
	dL1KN44LnWin0HxbEvU1QFiieSWnoYGq4x8YPmtJBvvJwMXetIgTFkdRsT3pZVlyoscssz7XzwiTl
	QUc5pOGlcLq5kWBZtx4vIzSo+/w7FqwQMwXBkHIWEgokPmyeFHpAA5/t4aY2d1/Of+HPMg4I6Xb8w
	bDOmsjqyGFl1L0SNENj1TWelC4YqXEhWNapoKZf4OOOtlOp4h61Mje+26N/VgOE0a6D+mDooRs/N1
	nc0NJyfUR7RzlAxuLf7ORIuip3sOqTd16m6lYzYgSXe4PcsJuqUgpUi23nm8g7aVyKy3aAZI8ymb6
	4UTuwggcSdPpPwywRpmg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iePz3-0000uP-Ep; Mon, 09 Dec 2019 20:50:21 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iePz0-0000ta-4b
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2019 20:50:19 +0000
Received: by mail-ot1-x342.google.com with SMTP id i15so13489821oto.7
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2019 12:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0z9b/fkZig/G7onSfzc2Xau8/wqkpIlIH1o9ziXfO0=;
 b=KewqzZ67eCJA9rsLegJPup+LEo0UaO8XtrPvGuu19iDVHzUu1NLEt49+HiTE2qqDAi
 Qgs1RhtYHm4QDykQec0Zr66/Q4Btt5fbLgPZMVuM4wJIT5BBI/drs/AV+vzFLi6/WJef
 x1D75rymK5cMsZ918vJFmzmjIv8XyTDXiO6eaEVNMQHf47qt1mlIngtj4UJ6CKywyefd
 MgwAQ/YNkUtC0sx5g+06Au7iKg6f5ZGYovmfUtqqXlV9yJrHrIWwoOztZzmn9ncSp+0/
 yjIVMx8iZTcdJRyxYzlxqt/iuW4eO3hPyy7h5R9pzkdBeQ4Z31tsMOEnCpB2eVWbkl29
 t7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0z9b/fkZig/G7onSfzc2Xau8/wqkpIlIH1o9ziXfO0=;
 b=mgBWwqE9EgRyeufRaawYkDS80b8FyFzKMX9Z3QjHvYBu/V896C5RLAYtWUpOiMHwr/
 ydomotpVQvEIyIxbXhrRV/f+O+dBdCwm7PCOVnEta04EOYrr7dfcrKaUtUHrtfLABpQm
 3WDNtFMAYXhzTlKDgnU+VWqNKN1GKaNZqz9q17DgOXuzvaAnhNvcI8tL3NlaXuYqgU5Y
 dHnUxg1tKjwh7n357cWxQ/67gb8s8TYvSUofR2FfHb1TqMVmZIg1Zpegcx2AwerEcWZQ
 qMOlBHbJcfEwQmaATI9F1x0UWjVQpyc3PE+AVpELe+7EVo9e06D8mLzUlRCZyCRo3WBl
 kGmA==
X-Gm-Message-State: APjAAAVd6VQC4dugeu/cPluhyuwm9s7fC5DyxkFTc5DEfzPiXRE+hVlv
 lZhVIsTw2fxkHPtmXW2pbDU=
X-Google-Smtp-Source: APXvYqwcs6FBEhf12NatET7C92kg8e/a6i0Gd/Cl4K8D9L5c4Ksvjlg5tApvV70N2s9qDrj9rwG8bQ==
X-Received: by 2002:a05:6830:20cf:: with SMTP id
 z15mr23195602otq.277.1575924615824; 
 Mon, 09 Dec 2019 12:50:15 -0800 (PST)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id f3sm389396oto.57.2019.12.09.12.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 12:50:15 -0800 (PST)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH] mtd: onenand_base: Adjust indentation in
 onenand_read_ops_nolock
Date: Mon,  9 Dec 2019 13:50:10 -0700
Message-Id: <20191209205010.4115-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_125018_201676_85113C44 
X-CRM114-Status: GOOD (  15.04  )
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
 drivers/mtd/nand/onenand/onenand_base.c | 64 ++++++++++++-------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/nand/onenand/onenand_base.c b/drivers/mtd/nand/onenand/onenand_base.c
index 77bd32a683e1..c84ac749d70e 100644
--- a/drivers/mtd/nand/onenand/onenand_base.c
+++ b/drivers/mtd/nand/onenand/onenand_base.c
@@ -1266,26 +1266,26 @@ static int onenand_read_ops_nolock(struct mtd_info *mtd, loff_t from,
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
