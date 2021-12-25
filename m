Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D42DC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Dec 2021 10:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JiIDv+i7hjGGmRPs2LPQqrz4Dvzid2ficqCGzuvZChU=; b=ni9ZmOYuml8Qgr
	L4aJeNqD71zmOtx7HygGB0p4RXbl3R6qHuNb0bVGXBpuyRYWYt3v7Olm7WY1k6SVlA4mMDDF0Knuh
	/YZ96wKoFhYXTE048yzJZ3k0WK+XmLOhMZSfeN3uyxtRbkuM+M1Inr7yeAi6RCn+3Qd+mlyD9Dgll
	iOwkTX5Ffm9EeLpl1Ab13nZ/TRbY4vXMGT7Qe3OZTqnSmVwL0zYErEnWlIaDCEE/9UU95jN/7pN+E
	8DnXGiAzluBshf+p2x0MVF4OzSgcS3I7uMLStXYYO1Ti97kBs7Ggjh0AIjT7VrhVO3iLf23jjBfwM
	hwN01VP61iA+QobDZvSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n13xV-00Eo9q-Gf; Sat, 25 Dec 2021 10:07:25 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n13xT-00Eo8w-5c
 for linux-mtd@lists.infradead.org; Sat, 25 Dec 2021 10:07:24 +0000
Received: by mail-pj1-x102d.google.com with SMTP id
 a11-20020a17090a854b00b001b11aae38d6so10193878pjw.2
 for <linux-mtd@lists.infradead.org>; Sat, 25 Dec 2021 02:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O9EkSjwtanl4h/6dqWkpPDfN+8wa52ZJjrk+N+tOFDk=;
 b=LIvultUljIeIEDCwfyUeC9ZxcK4r4ihapXkVzthi+ypU5ptO5QWUDhgHs4FkzJgNKL
 jrv94HN9GLtbi80Nw6s4H3Jl3mxwJy+jYZHo8cdfSRQuLQEQOOaNo2LCQNwtjr2Kz5i6
 3fqUcIOuU16sQg26a0a86+zJoueJg6omADEwJlVnwY1GWTZ5NgGwzXFLLycT84B6UFgc
 SiJP66rT91aj811WE9og4oP/FspsgWyxhK/mTsGCAiisTgwxfELM9Ugxjdg2H/rrz3mE
 psjBoUVLa6yxri16HlR60ACt0DWhDpDKO21fobmJWergUmwhajUDxofium3tes25YZtt
 /S2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O9EkSjwtanl4h/6dqWkpPDfN+8wa52ZJjrk+N+tOFDk=;
 b=lC37EicDuYF3JWgEsNeXbAal3h60fXVo5ToUI8mRCrjUL4K8Rar3w16lnM+/7IJR1w
 IYQ4OuWUxqC2IuIoRs4Sf9oik8QzbHB61lhvP3zmoySQAhWUhQFrApS23IdKBaHOVTxg
 YhZHw09jFAarhxhPTxmVR/vNh4kU+02sEI58SBRkPP4kQMZ/qM97kdebf5420pDx4bD2
 NjlSrZHlv6cpM7OPM7LuWotk+pyuICwbGzfku1yT7fzYCnsyCZFg8HfC/wMr+bOlL+U9
 RhI58sxiVEsJwp2RnYYijG2xY8Hyk55JXFVF4jBthtyXwgJbNmy7+renkIg+Bs70UYhy
 kK1g==
X-Gm-Message-State: AOAM530D31kgIz6PDXI2uKqc9aC2pjfPr/yJNUo8XHHjvMnh7TOnnBdS
 0QdBFZvtMaFst8sSI0/Qn/E=
X-Google-Smtp-Source: ABdhPJxPpzuT3Qt/FGxXpjPuJv1e/C8B9y7Ch3+8RuzC8bsRMj2lcMx7n0yQGO40Na/L4KX1+qatxA==
X-Received: by 2002:a17:90a:7001:: with SMTP id
 f1mr11999286pjk.70.1640426838912; 
 Sat, 25 Dec 2021 02:07:18 -0800 (PST)
Received: from localhost.localdomain (1-34-229-86.hinet-ip.hinet.net.
 [1.34.229.86])
 by smtp.gmail.com with ESMTPSA id b9sm11840982pfm.127.2021.12.25.02.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 02:07:18 -0800 (PST)
From: s921975628@gmail.com
To: richard@nod.at,
	vigneshr@ti.com,
	miquel.raynal@bootlin.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 RinHizakura <s921975628@gmail.com>
Subject: [PATCH 3/3] mtd: rawnand: nandsim: Add NS_PAGE_BYTE_SHIFT macro to
 replace the repeat pattern
Date: Sat, 25 Dec 2021 18:07:13 +0800
Message-Id: <20211225100713.119089-1-s921975628@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211225_020723_268621_87F6AE77 
X-CRM114-Status: GOOD (  14.46  )
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

From: RinHizakura <s921975628@gmail.com>

The (ns->regs.column + ns->regs.off) pattern repeats a lot which
represents the byte shift in next page to access. We can replace it
with a macro to improve the readability.

Signed-off-by: RinHizakura <s921975628@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 2ef6bddf0..24beade95 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -201,6 +201,9 @@ MODULE_PARM_DESC(bch,		 "Enable BCH ecc and set how many bits should "
 /* Calculate the OOB offset in flash RAM image by (row, column) address */
 #define NS_RAW_OFFSET_OOB(ns) (NS_RAW_OFFSET(ns) + ns->geom.pgsz)
 
+/* Calculate the byte shift in the next page to access */
+#define NS_PAGE_BYTE_SHIFT(ns) ((ns)->regs.column + (ns)->regs.off)
+
 /* After a command is input, the simulator goes to one of the following states */
 #define STATE_CMD_READ0        0x00000001 /* read data from the beginning of page */
 #define STATE_CMD_READ1        0x00000002 /* read data from the second half of page */
@@ -1382,7 +1385,7 @@ static inline union ns_mem *NS_GET_PAGE(struct nandsim *ns)
  */
 static inline u_char *NS_PAGE_BYTE_OFF(struct nandsim *ns)
 {
-	return NS_GET_PAGE(ns)->byte + ns->regs.column + ns->regs.off;
+	return NS_GET_PAGE(ns)->byte + NS_PAGE_BYTE_SHIFT(ns);
 }
 
 static int ns_do_read_error(struct nandsim *ns, int num)
@@ -1408,7 +1411,7 @@ static void ns_do_bit_flips(struct nandsim *ns, int num)
 			ns->buf.byte[pos / 8] ^= (1 << (pos % 8));
 			NS_WARN("read_page: flipping bit %d in page %d "
 				"reading from %d ecc: corrected=%u failed=%u\n",
-				pos, ns->regs.row, ns->regs.column + ns->regs.off,
+				pos, ns->regs.row, NS_PAGE_BYTE_SHIFT(ns),
 				nsmtd->ecc_stats.corrected, nsmtd->ecc_stats.failed);
 		}
 	}
@@ -1430,7 +1433,7 @@ static void ns_read_page(struct nandsim *ns, int num)
 			ssize_t tx;
 
 			NS_DBG("read_page: page %d written, reading from %d\n",
-				ns->regs.row, ns->regs.column + ns->regs.off);
+				ns->regs.row, NS_PAGE_BYTE_SHIFT(ns));
 			if (ns_do_read_error(ns, num))
 				return;
 			pos = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
@@ -1451,7 +1454,7 @@ static void ns_read_page(struct nandsim *ns, int num)
 		memset(ns->buf.byte, 0xFF, num);
 	} else {
 		NS_DBG("read_page: page %d allocated, reading from %d\n",
-			ns->regs.row, ns->regs.column + ns->regs.off);
+			ns->regs.row, NS_PAGE_BYTE_SHIFT(ns));
 		if (ns_do_read_error(ns, num))
 			return;
 		memcpy(ns->buf.byte, NS_PAGE_BYTE_OFF(ns), num);
@@ -1502,7 +1505,7 @@ static int ns_prog_page(struct nandsim *ns, int num)
 		int all;
 
 		NS_DBG("prog_page: writing page %d\n", ns->regs.row);
-		pg_off = ns->file_buf + ns->regs.column + ns->regs.off;
+		pg_off = ns->file_buf + NS_PAGE_BYTE_SHIFT(ns);
 		off = (loff_t)NS_RAW_OFFSET(ns) + ns->regs.off;
 		if (!test_bit(ns->regs.row, ns->pages_written)) {
 			all = 1;
@@ -1591,7 +1594,7 @@ static int ns_do_state_action(struct nandsim *ns, uint32_t action)
 			NS_ERR("do_state_action: column number is too large\n");
 			break;
 		}
-		num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
+		num = ns->geom.pgszoob - NS_PAGE_BYTE_SHIFT(ns);
 		ns_read_page(ns, num);
 
 		NS_DBG("do_state_action: (ACTION_CPY:) copy %d bytes to int buf, raw offset %d\n",
@@ -1659,7 +1662,7 @@ static int ns_do_state_action(struct nandsim *ns, uint32_t action)
 			return -1;
 		}
 
-		num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
+		num = ns->geom.pgszoob - NS_PAGE_BYTE_SHIFT(ns);
 		if (num != ns->regs.count) {
 			NS_ERR("do_state_action: too few bytes were input (%d instead of %d)\n",
 					ns->regs.count, num);
@@ -1803,7 +1806,7 @@ static void ns_switch_state(struct nandsim *ns)
 		switch (NS_STATE(ns->state)) {
 			case STATE_DATAIN:
 			case STATE_DATAOUT:
-				ns->regs.num = ns->geom.pgszoob - ns->regs.off - ns->regs.column;
+				ns->regs.num = ns->geom.pgszoob - NS_PAGE_BYTE_SHIFT(ns);
 				break;
 
 			case STATE_DATAOUT_ID:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
