Return-Path: <SRS0=/mLJ=U3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4069AC4321A
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 02:48:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A842086D
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jun 2019 02:48:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LldnrXw/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXUsk7BH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11A842086D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DisTcoQyM8vftxvXiY9Th9JxC+Muw3om2/3PQVLEb2o=; b=Lld
	nrXw/ocs5ooIZ3BVdKVT6z1xgeuc72x0haqAdBSGdOELrZz6pFuwEGoOq6YE423dXUmGizVpoC19A
	5olcIXIq3SB+itcRb1eqqHSPuxHF7YIW8Uzguv+OT6fd9GikDqqWmM2RZ3uUrPxtcjwaYK6dzXeq5
	e0er26sBqQTrdHyDymr7SIeAsm/yTiQVDnXlj63XXhstlEpmPCee6mi0+AwkRgdqauq0QJum4lkoH
	mFEvvWUM4Z6lbNPXb5gkKFZnw61j/6RMcE7n41TKoIMdu1L5VAfLSDJlS9Ah1wI6pe55kqCHJ2DjM
	TY5iGpjW+GwJXZpP0+W7NUkw3azVI6A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hggw4-0000G6-Vt; Fri, 28 Jun 2019 02:48:25 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hggw2-0000FB-Ay
 for linux-mtd@lists.infradead.org; Fri, 28 Jun 2019 02:48:23 +0000
Received: by mail-pg1-x544.google.com with SMTP id 25so1900725pgy.4
 for <linux-mtd@lists.infradead.org>; Thu, 27 Jun 2019 19:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rbEYaNHREF7ILO8RRtmtvzlf2nFn3SyNQ4zDhV4ZIpU=;
 b=cXUsk7BHAAfEVytNrzbRMTTG4qVyMNRVSl+DrUV9V3TCuzZWX3xZ4YeirpHRbwVcpm
 Rn5bqs3PxJsL7UeHjFN+/WFjSEGisWQQI0tTLV7Kj7cwtD1cQn7kB5IdCFvhH648lUQj
 bjDmy1p2PHFWbbTmLiUdHJ7JYVhVW11jyIq2vwHBURj0xL28wk0n+O2fCC4Wqsv+M50u
 Rx2XhUX9ulKzQvuUs0f8feHOl+dr/E72IB4pT5MYyV1z33OE6igRhdCBSENW9P1RwUBf
 09s3PImIxR3WVMGdDFmuiwYa9Ce/cSqKjNP3LzJLI4fsYppVKnqdBICpCby6xgIQQBwN
 PnLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rbEYaNHREF7ILO8RRtmtvzlf2nFn3SyNQ4zDhV4ZIpU=;
 b=TjuywxUP1tYXQKyajvBCKiDhVnn5i5a4MXme50ErHpiFHYVsqeDaYjLSDi8M8x4YZo
 5B3W3uqTg+wnET5Bie+YHqrD6IkrQhRGEj6v5I6HlWfdUmXQjyJXWJE3tCyAlSUdlrqF
 LqsYPqvoaN+KRrJBK6O7jxXHsnlKLHVpVOZJBJqa7Q2cPYoPtF/MUpNer9D8wwcp+XOI
 n3tqKqwU9GBXwjtnQgx3g1X4gvARybXPhwN/KgBVdbQm3wv8IvTf54ZdJxPIFP47oDg2
 02tk4fi/Cv/dmMVjN9u94fYoowxy1NPnpFC1P628WM1Mr/KXG2auJxaKIHlPNXUra6D9
 TEzA==
X-Gm-Message-State: APjAAAV4CNuQNRoeQZtT5OxTunkELLsTzyW4B4p+cQ/4KoeSulk2c3QC
 A1hm9q6a/pLnZrdFJwKgpnM=
X-Google-Smtp-Source: APXvYqyL2BSk1/B6CxNzvp6a0kmRsoEyOhjwRgO0mLmLEFYVVmbnWhj10DWx9yPVJWrNGPu1UtSwjA==
X-Received: by 2002:a63:e90b:: with SMTP id i11mr7002772pgh.351.1561690101460; 
 Thu, 27 Jun 2019 19:48:21 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id i123sm446277pfe.147.2019.06.27.19.48.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 19:48:21 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH v2 14/27] mtd: nand: use kzalloc instead of kmalloc and memset
Date: Fri, 28 Jun 2019 10:48:13 +0800
Message-Id: <20190628024814.15527-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190627_194822_374554_D312BAB6 
X-CRM114-Status: GOOD (  14.39  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Fuqian Huang <huangfq.daxian@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Allison Randal <allison@lohutok.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Replace kmalloc followed by a memset with kzalloc.

There is a recommendation to use zeroing allocator
rather than allocator followed by memset with 0 in
./scripts/coccinelle/api/alloc/zalloc-simple.cocci

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 drivers/mtd/nand/raw/nand_bch.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/nand_bch.c b/drivers/mtd/nand/raw/nand_bch.c
index 55aa4c1cd414..17527310c3a1 100644
--- a/drivers/mtd/nand/raw/nand_bch.c
+++ b/drivers/mtd/nand/raw/nand_bch.c
@@ -170,7 +170,7 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 		goto fail;
 	}
 
-	nbc->eccmask = kmalloc(eccbytes, GFP_KERNEL);
+	nbc->eccmask = kzalloc(eccbytes, GFP_KERNEL);
 	nbc->errloc = kmalloc_array(t, sizeof(*nbc->errloc), GFP_KERNEL);
 	if (!nbc->eccmask || !nbc->errloc)
 		goto fail;
@@ -182,7 +182,6 @@ struct nand_bch_control *nand_bch_init(struct mtd_info *mtd)
 		goto fail;
 
 	memset(erased_page, 0xff, eccsize);
-	memset(nbc->eccmask, 0, eccbytes);
 	encode_bch(nbc->bch, erased_page, eccsize, nbc->eccmask);
 	kfree(erased_page);
 
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
