Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1652606A337
	for <linux-mtd@archiver.kernel.org>; Sun, 15 Nov 2026 07:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gSdnVjKK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yjWSoPpF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=XYwyvxb++Zr/P7/XNCCpLc/qCVx9gVSIfyBzvh31kS0=; b=gSdnVjKKOCziy/LbbLlTegmHOA
	o7U1DEIGUoW5v3EWL+Vl0oXflRqCh3jsXUm6lDNtMJrWfDQJprdojpLABuRbBvcBCsW26rUjDGjA/
	7OkNs/8nECxRw0i7NBkFzj9HFN1vypL9KYoDo45w9FEHXmEjABRtNFwTbUI3QpRo50U2i5NbWw0RF
	s7Ny4zBrO5xEC5GcVuMqhLtKkQGCiYwGYsIARbkbRe6aFL3PLpuQZOHekpT8a+muqqL46qp3H3hZK
	OEjUCIaF5cAHgfdV1q26obsH16j1R8s8LfG13GlDplolKbKTklhcX9IJ6Vs1EiaCAFIjFTBNMCkOX
	MZE0/8/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUXI-0000000HA47-2oQv;
	Sun, 15 Nov 2026 07:20:24 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSUXE-0000000HA3k-0hrK
	for linux-mtd@lists.infradead.org;
	Sun, 15 Nov 2026 07:20:23 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1259244b3a.0
        for <linux-mtd@lists.infradead.org>; Sat, 14 Nov 2026 23:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727219; x=1795332019; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KroQIiuPpq62ASZ4V9uK0JJ0eFDYvcn9D+kvCdldZig=;
        b=yjWSoPpFaPQr2JoeJzgkQV52m7fRWWSYTjOOjnaRjRfD262vRK5kuH8CGBiK/8bWVD
         WLfc2MER0T0zTo7DRMoDe+TPCsXI+NIXEZ8jWtgjGE6/TOyYC8V6DuM9E9SgzDzXtS0g
         PC5NIU1FEVI9FvEL9xDxi1ruV6EviBTAnDFlWhU/0Eu2Ynoy4Iq6mOPHC5F36nmY60KT
         STxcCulDo7z3w5MvqXqi7+HwiZ0si+o7AghBdrTS9fbOwUQsg+BxFy315BmHdm2qk5KP
         FE+m70S1sZjfLY4NP3ttualQymHy1VglT0/xQ18l/pJRcfzP7WOmR+LOqbzgypuM7MeE
         mg5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727219; x=1795332019;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KroQIiuPpq62ASZ4V9uK0JJ0eFDYvcn9D+kvCdldZig=;
        b=evxm6sx2b7I+LWaXGIF4Hg+iaWGi9TGwW8NkxOeUmtUftLVOQJAui3LsMb4QKmFg5g
         uVMG7bJlcdp5l8mwqL3jL6gbSH+VJVXn9u6H6CbaGf/6Wxx5Q9tgVjKuwCfGk3ZAShL6
         NagsQFp1TQReU45tgIcQPszd/J9UqXMqlTNvj13NYWEJ9NrcB/S1ObIbbh8V1mzGQHc4
         nOsLdgLodKbw9bhHDOvY63eIe6P5W6ZJZofb/AmTdBLWCtw67WPzZpThNiKm0QRH1XES
         HKMWZVzZ9XZcaLlVwjj9sB24NVXKNUU8k3I+wsjQdG5GiT7bMSFKpLvuDetxx/oNWrJz
         hGeA==
X-Gm-Message-State: APuU4Z8ZpNnc+Ll0iRtKB+NFH5gPt7lfllAZIis5j/NjhPwP6L+IhdZn
	5grQDQwx2Hb1KRW1CQ9NJmTrNfLOpZtHDLh7UMveZy3e08yoUWrZea6C
X-Gm-Gg: AYBFou1W4yHBYvZ6DnJ0HOeF9covqBRH14odLgiXmk6AKTmHY/zdWDwl673PqCqW5Dl
	pIar12zwZiCJB1IcMutWmvujyvjw46xu+X7fTevFyV9FqU7T8u3u5uhgpOGy1dyL3HGxwnwxdqm
	FmRfVKtG7QYpuAq1gazgaXIZD3E6ckwjJsvH7FeEyxzm0qyA2PY2Hbtexn3f+gjs+5vR/dinTqG
	EfsKbjqrifvKle2S1mh/h4z6D9zneluwxaGpdQEHMxgZO9ew7GGuCG4Eqel2TsiKJV3YJz4zlmx
	xLOilaXJyGpoTmcxBPe6eEzrSq03j84kNt+ue2MKDzUBXZ24G0BfgHMxazM5Q3lg9jTPXeN9SO/
	lHLzLc7cLL043iMAOk2a4pcRge22lINZ/FKlxPQ4JZ+EXZYph4sYsWGtUW8tiVc1AAbrQrKJjp8
	AwKd1vXMZStDICDXrUS1pg2XN6FdNkgqjJtomf794er7ZFQcWlbFlw6G+D4u5OcrWoqX8gmG+k3
	42F1gYOIjbMi+RHGCHpeupZO4/D44qZwTlTs88Z3xBsUmJLrJs9j0UZ656jwcKqao7Te0uAQbku
	SPnYeHOTwqXUqe38YiqcNe8NGUE1Lx5RiC1nWVHYywKSLjSPPUJvlWZNMcaxssk0GtdkAef1hk9
	pfdTHscenEuQPkOgCaRc9u66bMJjG
X-Received: by 2002:a05:6a20:9c14:b0:3dd:a197:735a with SMTP id adf61e73a8af0-3f7a95f0de0mr6394154637.51.1794727218625;
        Sat, 14 Nov 2026 23:20:18 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:b6e2::6a87])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-8bed2055031sm2720925b3a.39.2026.11.14.23.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:20:18 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 15 Nov 2026 15:20:01 +0800
Subject: [PATCH] mtd: nand: qpic_common: fix BAM transaction memory leak
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-nandc_unalloc-v1-1-65d849fa9998@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA04oYr2KiISJ6NOkVESLQXx7
 k3r8i3+PyFyEI7wzE4I/JYoqyZgngHNTic24pPBFrZCxNKoU0/9oW5ZVjJ1ibap6gcNzkNqtsC
 jfP6/trsdj+HFtP8mcF1f13DbU3EAAAA=
X-Change-ID: 20261115-nandc_unalloc-85129684cbad
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794727213; l=1169;
 i=ustc.gu@gmail.com; s=20261030; h=from:subject:message-id;
 bh=p0lMH4v4LyjSNh9wsFd3M/eshEtUTxninjjrG0SXaRc=;
 b=kCkyCuIAfbccVQxaiV/0aW6/6Kz2ZnKPh3J18rFcPaTifQsbmHvX1rXBFKKbD0YWTWQg1gd/x
 ydvwxHE9/QVBVspNoQGKWMCE6+qY40SWmt9bI5rIFAG5X+VAB8+pvgd
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjDJtbnSeysEBjmOfNYqYUUDS6g7Tfov9W5oGngTBfo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_232020_220529_D589F0BB 
X-CRM114-Status: UNSURE (   9.01  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

qcom_nandc_alloc() allocates the BAM transaction, but
qcom_nandc_unalloc() does not free it. This leaks the transaction on
controller removal and probe failures after successful allocation.

Release it in qcom_nandc_unalloc().

Fixes: fdf3ee5c6e52 ("mtd: nand: Add qpic_common API file")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-ba3b41c6-9de2-42b9-8205-67454e0229f6
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/mtd/nand/qpic_common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index e97043b866d2..0f81303ae8b6 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -657,6 +657,8 @@ void qcom_nandc_unalloc(struct qcom_nand_controller *nandc)
 
 		if (nandc->cmd_chan)
 			dma_release_channel(nandc->cmd_chan);
+
+		qcom_free_bam_transaction(nandc);
 	} else {
 		if (nandc->chan)
 			dma_release_channel(nandc->chan);

---
base-commit: 793807ca13bf3072fc6d16ce6d90e9ab9beff2a5
change-id: 20261115-nandc_unalloc-85129684cbad

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
