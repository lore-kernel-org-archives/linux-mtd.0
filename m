Return-Path: <SRS0=c8/f=WB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B3B3C0650F
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 19:05:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2337205F4
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2019 19:05:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AXj8RaUj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t52fk0c5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D2337205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ByNzrx0we+rAEQzHX6YBLzxA9j9B5G5XOLS1SoSGgxw=; b=AXj8RaUjW7KmlciZd8LFMPdnnL
	2M8ja2weYqSvwLR+3DCuPf2bzut3hJAppzg/y6iRzO0xq7ZgmH0fUC46CBJuR6d2CT6MI5ZkhYAOv
	wxZZzxM0PuAc4YyNZCllYyyioeelkIlidWLfXr1c/f6Jv9nUCtCP19x7HrjGjkIrGqMBkMa2XvzOs
	OSA9zyjsTtaAxiRVfbesvxVS+gsfkXfASSauw9N81X4px7ikCyn6qnqMFLjZBMt+UsgpxfiK8ahph
	D8u3LvWDB+XH5zYxmY8+UV7itFMf3ApF5HPgQMVabCA7EWNbs5Xp3Ed5fKiF7+4DrizIagT/u0lAD
	UT9FEJVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1huiHu-0004gM-KR; Mon, 05 Aug 2019 19:04:54 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1huiGw-0003V2-P1
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2019 19:03:56 +0000
Received: by mail-pl1-x642.google.com with SMTP id 4so29821193pld.10
 for <linux-mtd@lists.infradead.org>; Mon, 05 Aug 2019 12:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=/wIfmpJc+lrLBU41ssmvQaxrMuK7qfo270mQwLKYj4M=;
 b=t52fk0c5sAToUzsksVA7421DxgQxBMlNQseaSyUOqrZIiLp481ZhfsxPiuHPxHvMyt
 Kbh2Yi8IoEDOWsZ3e4xe2CNqJLIFK4e2X1G2g1heqsMcKT2DuJvSQnEdEK8TKZ3KbxY4
 +GdUictmuxoe3exq81BnTxxySQiQzOXq8TzQTQiHefp63oOUlfxphSOUPW3APwubnrBf
 TIRmBhHSG+L2mm9Bu5as7T6nF2bqwTsRHcYM0AfJnh2eXlATESfsoSzw0J+YfAp30HqN
 50hksuCb2q9HkAo80Cd5tDsrE6W7VICm/hqxgDJgaxsNGKrTpzGJcqrHxixgqF/Ca7Kv
 Q5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=/wIfmpJc+lrLBU41ssmvQaxrMuK7qfo270mQwLKYj4M=;
 b=pVoIC0m7bMtoI3hAb/kod59jDmLbP9zTJOHCT8jaNweO6Wj88bq8xp5PjAcskpEIpF
 H+TeNOCZsDh9hxtj9x6fqxqj3/qVgpzHuHMNa+AX4ot/KBqIsCVz+2dOIvDjt2HGWwCe
 bIizSj+QHEhKHX5SicwAgWz6uyMdshQZQBHpWjV4kYh6hJWHebpyLPIbu/Uv21mAAxcg
 qDeZQio24AtfeStTVtlJOwkSmPik15S2qhQN1C9U7XSawn8Py+3cKzNQwR90uybKpQhH
 zb8oRBLNFtq9/MQdZ0Gr4RZErHA3uI4ajraFN1j36alFgCtAiAO6CAM9EQnqwDNzZ/9Z
 7NGw==
X-Gm-Message-State: APjAAAXfQ87tkd8RZJnDDItYR3cJIQS5r1JL2Dn3g1cjMLwyTkROxaME
 eYoo3ibaTdWikaGjXnYEcipgZVbW
X-Google-Smtp-Source: APXvYqxNQmBl20b4PKQBmzSJ/XX8HT0RUEtC67FVcuv/8kU+dS6zgSYyJ6XJfMxXc5Rv95gyMC4S9A==
X-Received: by 2002:a17:902:a409:: with SMTP id
 p9mr147209387plq.218.1565031834146; 
 Mon, 05 Aug 2019 12:03:54 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id q198sm88045579pfq.155.2019.08.05.12.03.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 12:03:53 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v8 6/9] mtd: cfi_cmdset_0002: Split write-to-buffer-reset
 sequence
Date: Tue,  6 Aug 2019 04:03:23 +0900
Message-Id: <20190805190326.28772-7-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190805190326.28772-1-ikegami.t@gmail.com>
References: <20190805190326.28772-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190805_120354_828059_72EC2FC4 
X-CRM114-Status: GOOD (  16.73  )
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
Cc: Tokunori Ikegami <ikegami.t@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Fabio Bettoni <fbettoni@gmail.com>,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Just refactor to split the sequence from do_write_buffer().

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
Changes since v7:
Rebased on top of polling status register support in master.

Changes since v6:
- Removed the tag of Koen Vandeputte as same with the v7 1/9 patch.

Changes since v5:
- Rebased on top of Liu Jian's fixes in master.
- Change the email address of Tokunori Ikegami to ikegami.t@gmail.com.

Changes since v4:
- None.

Changes since v3:
- Just change the email address of Tokunori Ikegami to ikegami_to@yahoo.co.jp.

Changes since v2:
- None.

Changes since v1:
- Add the patch.

 drivers/mtd/chips/cfi_cmdset_0002.c | 38 +++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index dea63842dec9..7abd844bd702 100644
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1918,6 +1918,27 @@ static int cfi_amdstd_write_words(struct mtd_info *mtd, loff_t to, size_t len,
 	return 0;
 }
 
+static void __xipram do_write_buffer_reset(struct map_info *map,
+					   struct flchip *chip,
+					   struct cfi_private *cfi)
+{
+	/*
+	 * Recovery from write-buffer programming failures requires
+	 * the write-to-buffer-reset sequence.  Since the last part
+	 * of the sequence also works as a normal reset, we can run
+	 * the same commands regardless of why we are here.
+	 * See e.g.
+	 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
+	 */
+	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
+			 cfi->device_type, NULL);
+
+	/* FIXME - should have reset delay before continuing */
+}
 
 /*
  * FIXME: interleaved mode not tested, and probably not supported!
@@ -2024,23 +2045,8 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 	}
 
 	if (ret) {
-		/*
-		 * Recovery from write-buffer programming failures requires
-		 * the write-to-buffer-reset sequence.  Since the last part
-		 * of the sequence also works as a normal reset, we can run
-		 * the same commands regardless of why we are here.
-		 * See e.g.
-		 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
-		 */
 		cfi_check_err_status(map, chip, adr);
-		cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
-				 cfi->device_type, NULL);
-		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
-				 cfi->device_type, NULL);
-		cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
-				 cfi->device_type, NULL);
-		/* FIXME - should have reset delay before continuing */
-
+		do_write_buffer_reset(map, chip, cfi);
 		pr_err("MTD %s(): software timeout, address:0x%.8lx.\n",
 		       __func__, adr);
 	}
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
