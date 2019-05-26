Return-Path: <SRS0=EZ/G=T2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5519CC282E3
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:39:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF9920815
	for <linux-mtd@archiver.kernel.org>; Sun, 26 May 2019 15:39:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HvFdRxT/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XWmKGnA3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AF9920815
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Pt3nX+pNk1YOiID8QMyqNztgDGmKD33ZD9Wf0R1WGa0=; b=HvFdRxT/DmxskMT15J2e7pxxRI
	NNGpsSBcGin96dJ9KyPMWxOwff6jTLK6arsmC1+gyPb4gk4BDazuSiadTCXu02tjJqsecCg6ArOW5
	R9k816dtVVVD76SUo7s0JkA4Q+HnGnjx3yznN4dr5vVlllTzcZ+ZO6T5u2YI381vg5EGCiyFgzM5l
	wIIeRNyCMcZrw2wwChzj+UKi5iGsSaZF2te+LIL0FXFJCahzGvhX30NzXEsTRwySJXKC7m4qqQQyw
	pptOfqYzosROVtHhnGSsGTF55jAEnWYd1JFQnQSoRMdA2zSn45xC96OZdhsGvywamBqqG/mYEdhi/
	ypzAnVMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUvFO-0007zR-TM; Sun, 26 May 2019 15:39:42 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUvF7-0007cd-Ez
 for linux-mtd@lists.infradead.org; Sun, 26 May 2019 15:39:27 +0000
Received: by mail-pf1-x444.google.com with SMTP id z26so8097501pfg.6
 for <linux-mtd@lists.infradead.org>; Sun, 26 May 2019 08:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=owLH0YAN5wwaPeNW+Ig/zlOnrszlhR8RwT7WykXqfMU=;
 b=XWmKGnA36pctyzMQCALIolBiKKfJk9nyserF+irpPRY0u01c5psYrH4Hj4in5khw7w
 Xakne5hxgbQKiAZcBo6pLa8Q75UhJJvhIwM2bKpHSgrx7UknCSkwnI+AenncXXdG7J1k
 Lf+h0kpgwIBkj4KMRqHazfZ79u064FmmDK6xUVOg/EsS0V0xBKJYKJLTEtjGd4XkjXor
 Uy9RAXBgWoF7Kucyv7EJySAZwYJv/GXRVdr9HZxFeU7AVmjYw8rtrcJKmfCDANJFidKH
 fF6KfBDfTJ92OM01Pl/2GIUrx7mfKm6JIzrnmdXWdWhb2F7aJfMsZ5pyzJfgkm0zMQJC
 65Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=owLH0YAN5wwaPeNW+Ig/zlOnrszlhR8RwT7WykXqfMU=;
 b=oKT5A+SOiZSP62cd0gvtwV5GprHCit8Y9Qk8w9zBpj0aC88VdDQImy/F+Nx9FUHqga
 S27FjJF6lRCo4NVAdjWYmFSQLl1Jk6rhVS6QluF2CZRGFxUPE7zIYORZdbiAp924VuFJ
 JyhHnluW7OuI/e5RsOWRfjjjik0O+Nhnq+hsSpjNXAjhby3yTF593f3xkrmItZpk8LUG
 w51ln88tTmtaLmgGmqpu6224IRXvAGdHS5lDUMn1Z46idvxE/m/w2sYu+pxdDBgl6OYn
 /tuGbxRLavT/YA3hswrmr2FoHmzdL1/ogqK73iXC03Yn2v7vYg9dlAt5x8VNRScewvE+
 ijQA==
X-Gm-Message-State: APjAAAURadTZNBXxzgFk6t618TLq2ACGxl1q/rPJCXdhpXm1xPXumLG0
 ygjIfgUWPaHtGdGyPpqMSjI=
X-Google-Smtp-Source: APXvYqw5eJEYtC6whJ/n4kC2SjfHrI5fZUAUSzglV5j7uyRCAYpuzX0GxO/B+VGL2a9mZZqinNP6aw==
X-Received: by 2002:a65:5684:: with SMTP id v4mr120746259pgs.160.1558885164533; 
 Sun, 26 May 2019 08:39:24 -0700 (PDT)
Received: from localhost.localdomain (M106072039032.v4.enabler.ne.jp.
 [106.72.39.32])
 by smtp.gmail.com with ESMTPSA id o2sm863129pgm.51.2019.05.26.08.39.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 26 May 2019 08:39:24 -0700 (PDT)
From: Tokunori Ikegami <ikegami.t@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v6 02/11] mtd: cfi_cmdset_0002: Remove goto statement from
 do_write_buffer()
Date: Mon, 27 May 2019 00:38:55 +0900
Message-Id: <20190526153904.28871-3-ikegami.t@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190526153904.28871-1-ikegami.t@gmail.com>
References: <20190526153904.28871-1-ikegami.t@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190526_083925_504712_D2FE6937 
X-CRM114-Status: GOOD (  16.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
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

For a maintainability by reducing the goto statement remove it from
do_write_buffer().

Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
Cc: Fabio Bettoni <fbettoni@gmail.com>
Co: Hauke Mehrtens <hauke@hauke-m.de>
Co: Koen Vandeputte <koen.vandeputte@ncentric.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: linux-mtd@lists.infradead.org
---
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
- Split the patch v1 3/3.

 drivers/mtd/chips/cfi_cmdset_0002.c | 46 +++++++++++++++++++------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/mtd/chips/cfi_cmdset_0002.c b/drivers/mtd/chips/cfi_cmdset_0002.c
index 348b54820e4c..ca41f47c00c1 100755
--- a/drivers/mtd/chips/cfi_cmdset_0002.c
+++ b/drivers/mtd/chips/cfi_cmdset_0002.c
@@ -1887,40 +1887,42 @@ static int __xipram do_write_buffer(struct map_info *map, struct flchip *chip,
 		 * We check "time_after" and "!chip_good" before checking "chip_good" to avoid
 		 * the failure due to scheduling.
 		 */
-		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum))
+		if (time_after(jiffies, timeo) && !chip_good(map, adr, datum)) {
+			ret = -EIO;
 			break;
+		}
 
 		if (chip_good(map, adr, datum)) {
 			xip_enable(map, chip, adr);
-			goto op_done;
+			break;
 		}
 
 		/* Latency issues. Drop the lock, wait a while and retry */
 		UDELAY(map, chip, adr, 1);
 	}
 
-	/*
-	 * Recovery from write-buffer programming failures requires
-	 * the write-to-buffer-reset sequence.  Since the last part
-	 * of the sequence also works as a normal reset, we can run
-	 * the same commands regardless of why we are here.
-	 * See e.g.
-	 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
-	 */
-	cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
-			 cfi->device_type, NULL);
-	cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
-			 cfi->device_type, NULL);
-	xip_enable(map, chip, adr);
-	/* FIXME - should have reset delay before continuing */
+	if (ret) {
+		/*
+		 * Recovery from write-buffer programming failures requires
+		 * the write-to-buffer-reset sequence.  Since the last part
+		 * of the sequence also works as a normal reset, we can run
+		 * the same commands regardless of why we are here.
+		 * See e.g.
+		 * http://www.spansion.com/Support/Application%20Notes/MirrorBit_Write_Buffer_Prog_Page_Buffer_Read_AN.pdf
+		 */
+		cfi_send_gen_cmd(0xAA, cfi->addr_unlock1, chip->start, map, cfi,
+				 cfi->device_type, NULL);
+		cfi_send_gen_cmd(0x55, cfi->addr_unlock2, chip->start, map, cfi,
+				 cfi->device_type, NULL);
+		cfi_send_gen_cmd(0xF0, cfi->addr_unlock1, chip->start, map, cfi,
+				 cfi->device_type, NULL);
+		xip_enable(map, chip, adr);
+		/* FIXME - should have reset delay before continuing */
 
-	printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
-	       __func__, adr);
+		printk(KERN_WARNING "MTD %s(): software timeout, address:0x%.8lx.\n",
+		       __func__, adr);
+	}
 
-	ret = -EIO;
- op_done:
 	chip->state = FL_READY;
 	DISABLE_VPP(map);
 	put_chip(map, chip, adr);
-- 
2.11.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
