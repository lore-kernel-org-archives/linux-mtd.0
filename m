Return-Path: <SRS0=Irml=M2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B787C43216
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Aug 2021 11:35:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3008610A2
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Aug 2021 11:35:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D3008610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cdjrlc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ho9t+3VraFrGWuvfd2nLqR1Whhd6vFSwmGdcOtKFOp4=; b=okLYK+33i6fM1m
	fwjpJk5zXUHmv/zJlWJuHBbzC2j9MbErM9AIuB6gYB9XfKahFh5Z7znc+eKdz/KBj4P+Ss5XqEQBB
	FAdozLxxYLA0mzA34QgNgB1YYe609XbXg5NlUvTXvPPpO/mvJYpjmYYDCDUyKj0jsVb2MdBrNIyOJ
	fJR+wqSPQfyc1GYJi3p9BYn9g9ot1PnOR0ll2OqqAVoPtAKz0gNMEBTLm6Vz8fh61jlhA4WPU3KZZ
	w+VNP6a2x4qefWepWWBwv094SCGDB4+tE+CtH9UTkQAVMkH22jaXoDxLcs922YABXZ0aJKJ3+55FB
	o/1+xRL2N+Hw7bhLfFJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAsgk-002HZt-Ls; Tue, 03 Aug 2021 11:34:26 +0000
Received: from smtpbg126.qq.com ([106.55.201.22] helo=smtpbg587.qq.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAsg5-002H7f-PP; Tue, 03 Aug 2021 11:33:50 +0000
X-QQ-mid: bizesmtp31t1627990388t2abq2ne
Received: from localhost.localdomain (unknown [125.69.40.136])
 by esmtp6.qq.com (ESMTP) with 
 id ; Tue, 03 Aug 2021 19:33:06 +0800 (CST)
X-QQ-SSF: 01000000002000B0C000B00A0000000
X-QQ-FEAT: Z5h1lUobohN49qzZbbMeBpA+48lSsb2ie4jDewwC0Q6haqCO/fLnfwdbC9xzI
 JEmROSAQGCWXXHPSE04hn1piq0qxYpJzfnLewb4U6sLoWpsqtGt7xK17JPKEPZZhQsmzABY
 s6Ug0sXiZcimD/QRJ2feu5vEyGcrz6OtGjCbZqzrgWt/pXwQF7ZxsbnPKHTOYuR5V9eL9Xn
 9PkGoOHO8HSEsAn2wEubqSUgTFZgVenjOqsc/fEz7UK3SoT15bxGAn6b6M8TMB6z7Eofbuz
 jQ8+/lSgmc/3GuiIN8pjGCgpRcGasr2z5C2yviYANQsVjHiGdxuux4SzgjSriBMc88iw==
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: miquel.raynal@bootlin.com
Cc: liang.yang@amlogic.com, vigneshr@ti.com, narmstrong@baylibre.com,
 khilman@baylibre.com, richard@nod.at, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jason Wang <wangborong@cdjrlc.com>
Subject: [PATCH] mtd: rawnand: remove never changed ret variable
Date: Tue,  3 Aug 2021 19:33:00 +0800
Message-Id: <20210803113300.24230-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybgspam:qybgspam2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_043346_196298_3FE4ED8C 
X-CRM114-Status: GOOD (  10.69  )
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

The ret variable used for returning value in the function
`meson_nfc_rw_cmd_prepare_and_execute` is never change after initialising.
Therefore, we can remove it safely and return 0 at the end of the function.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 817bddccb775..ac3be92872d0 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -580,7 +580,7 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
 	u32 *addrs = nfc->cmdfifo.rw.addrs;
 	u32 cs = nfc->param.chip_select;
 	u32 cmd0, cmd_num, row_start;
-	int ret = 0, i;
+	int i;
 
 	cmd_num = sizeof(struct nand_rw_cmd) / sizeof(int);
 
@@ -620,7 +620,7 @@ static int meson_nfc_rw_cmd_prepare_and_execute(struct nand_chip *nand,
 		meson_nfc_cmd_idle(nfc, nfc->timing.tadl);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int meson_nfc_write_page_sub(struct nand_chip *nand,
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
