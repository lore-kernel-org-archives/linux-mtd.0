Return-Path: <SRS0=RcjP=YD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFB9C10F14
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2019 08:40:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB0DB2190F
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2019 08:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nYTYABsR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrP7wzKo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB0DB2190F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=fV7kiJ0ZjmMPuS0k2JG4RsiAiHzdnqZXUcJel4D0NZw=; b=nYT
	YABsRSAqyS/cs0a1loYKVWBQRHZLJ7HhR3HNcEXEkf2z97bPOrB+KKpBgIn5TpSH5ffKw2HWEz93y
	qcfz4agbadsrpHDmBZOmt8ugJkReBKT94tdYN8YMt42b9A3/Yo9hYp3Ocsh2Z7CWKN1Wvz/nKyGQQ
	ES6XERbFETo98nBOjQ/52JuOWCoCPajBI0bpZGJPaRIDsIhvthQi8GnAvbtryyMDjZ31KTHGEKyM5
	QjCnPyElE/Nj/OhptzpOn3yV8TPlYmHN+QTnD/H1dyfJGC5sI/9thi1SHzCeevZNjd49EgYWrmyAp
	v/0raugp/Jbsmfm9wE7/EO19sWdOCfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iIU0B-0000J8-R9; Thu, 10 Oct 2019 08:40:51 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iIU07-0000IC-IY
 for linux-mtd@lists.infradead.org; Thu, 10 Oct 2019 08:40:49 +0000
Received: by mail-pf1-x443.google.com with SMTP id q7so3425998pfh.8
 for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2019 01:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=VOH0FG/wfv4tTtRAMaFH4XaR+zS/VbCyArBPqtL3IdA=;
 b=jrP7wzKomFVFwg1M3qS+BWJWMnb6EndUxHO0g/Ys4jaJiN8HHwR1OagZQcNJq45ykC
 oN9yLuOPcz4JGLJ+LL9XiSU3D5YKaB8zwV2OGQZ6ckUwNtPn5h8+i91R4wCjS1vEkNU3
 AlyOo/W5Id9eFaBVKI6cpovRtfW8KsELBRvJzZGOuNyyneDeZU7gXaMSsUzm17lzTAwq
 MHYVr/DKnGWnRHfEteLgoYNpOw+JcvP3HspDEfaTL0aGUEe1rj0aaJGp13moAFbSWlD0
 +hBRdZLIWMZ2LQXPK/ysZiPBceVfIh6kUEOekDyAPBjavydFhox8dOrt+urqPMimHtdU
 phuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=VOH0FG/wfv4tTtRAMaFH4XaR+zS/VbCyArBPqtL3IdA=;
 b=q8qazricl4QAHxQyZoTaoVS8kyo3n7ynVEmQCun8OyIX7eQTlCHLI2Rv7zmiorc5ss
 i12q9oIdGjxnNVGzIuCMdCrj5fytcHcBMljmVTkUnRjuuxwHT7Xsvq6GRUnyOW147KLs
 C7h7zfduhULNIBlsBrfNzC+3cQEDtPCdwoQVU9DO/sL3Alm+M/4m7d7spOPG/a6mnVTK
 T6KJyL0Yo8lqOTk9FIsacA7u91olNkK1vLnHBqv45XZ0jeIBfWpcknDVS7rpIs1Th3+R
 nlqjiqQ4SyZxKovXdoWNWMUuk9+rrklR2lnVXT5zVaqPCeYmulLKZTyW9BtdJn8vAvCP
 TBDQ==
X-Gm-Message-State: APjAAAXKXOZTxVMyrDdYiB284sO0+KuCYHFZgk5daBhe03Hxw1xXr0Ky
 PCSsa+i1cIDhHG9cWIz1VwE=
X-Google-Smtp-Source: APXvYqzWarJ2ujAQfqmDQjlMQl1mMnKaKFzOZ6j2Mt7ttxZUv1tC3Ny6E0t3uffmQx9lwP3WTp4xIQ==
X-Received: by 2002:a63:cd47:: with SMTP id a7mr9363852pgj.29.1570696846951;
 Thu, 10 Oct 2019 01:40:46 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id s1sm4772495pjs.31.2019.10.10.01.40.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 10 Oct 2019 01:40:46 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH v2] mtd: maps: l440gx: Avoid printing address to dmesg
Date: Thu, 10 Oct 2019 16:40:19 +0800
Message-Id: <20191010084019.5190-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191010_014047_805081_424F3782 
X-CRM114-Status: GOOD (  14.04  )
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
 linux-kernel@vger.kernel.org, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Fuqian Huang <huangfq.daxian@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Avoid printing the address of l440gx_map.virt every time l440gx init.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/mtd/maps/l440gx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/maps/l440gx.c b/drivers/mtd/maps/l440gx.c
index 876f12f40018..ebe37edc8e88 100644
--- a/drivers/mtd/maps/l440gx.c
+++ b/drivers/mtd/maps/l440gx.c
@@ -86,7 +86,7 @@ static int __init init_l440gx(void)
 		return -ENOMEM;
 	}
 	simple_map_init(&l440gx_map);
-	printk(KERN_NOTICE "window_addr = 0x%08lx\n", (unsigned long)l440gx_map.virt);
+	printk(KERN_DEBUG "window_addr = 0x%08lx\n", (unsigned long)l440gx_map.virt);
 
 	/* Setup the pm iobase resource
 	 * This code should move into some kind of generic bridge
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
