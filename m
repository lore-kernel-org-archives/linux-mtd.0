Return-Path: <SRS0=Go+8=B7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5E7C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Aug 2020 07:07:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 476AA20738
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Aug 2020 07:07:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CRVMI7zJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzg/U2i4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 476AA20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0TuNniDxtXuv8IlipcMXb1/XHctVdfHB/LjeKvdf800=; b=CRVMI7zJlN1qEHn+HHy5futn3O
	NH+Ku+9htYJANXv9A5jdeo2/VFqVoe/ZEHRPYikTrYdp0QygCqgDptjSAjKa/A675fz9b0hHfN2cv
	XYLqh78f5urCAVRiRWXU4I3u+XhwWGH2OhEjs3Na/DMoQVkplnqVffNv4H6mGSG+mHgCHmtbn9TRR
	FVbl0BFqV7p2lzjQYHJ2VcOVqdoAlkM8bms+w+v0Y/nebf+9bN45W8vPNFXKhLzAth5NUf0YEJoMi
	XXf5Xyo1ZZa4mcKYWsBTtz0dVkDTlngxER8mi18M0jG1ikQ+LWZnJNfY+pMZQGL2x0lkH5XtxC6zu
	IAqHtLBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k917a-0002bF-Mk; Fri, 21 Aug 2020 07:05:54 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k917U-0002Zd-Bi
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2020 07:05:49 +0000
Received: by mail-io1-xd41.google.com with SMTP id h4so786366ioe.5
 for <linux-mtd@lists.infradead.org>; Fri, 21 Aug 2020 00:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=45HTNE+kjKnW8wEngFX9xy7A5Sni9u8tAXo5tgjFKbc=;
 b=fzg/U2i4I7uzPE0e46T3VYIY5yXwu8LbUaHlrTGvjC/tFfiMbF5HwpEc8L3dNS/VMe
 Key4vgwQo4i+Zryqr73elVrqTZT44LVzNFBneIdynlgqxj7u43V3ZPWF8d2Vmi6IvH5Q
 q9h8isEbeFE2omd9XkTNDoELikh0+Esq55myBAJpu6aYg2U67kCzyqELt0PFzQb3OkDH
 4LhawxlfKNGlnDQs0RlCcekLx5oj2Gyug5xuCLWSc//0k9I0wusnG5sEDGQpNXJAzfKu
 hxRx9QsP23icqB63WpN4cWjbFn+HKvmNqrEsafAZezL9xfMvtW3C4r/Bh1eVeym7ePYj
 0nPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=45HTNE+kjKnW8wEngFX9xy7A5Sni9u8tAXo5tgjFKbc=;
 b=bWYiVUlZnxSyy3Hjdro9F5SCJ7B2xMdHIFautheSumFQGcKy0OZs/p1piQ96g1L0gG
 dpE1fyXNjx/qYurJfqdsMlif9EQahKPXvzSgDhnPF1+KMMYCbxn569BCYp+YnLLdXXvt
 RAK20lIBU8hK82125tnjQ58d2aAGzXpy7qFbSyBmDtXJeuZbxw28SmHRPQiPvVu+BrbH
 KyLuU9Fd1Um7YKxhHdIt5EFiqm9LOFUMr78MqppM+dnBd20RftQsxNJZVxJLIJwPAARn
 mixNFkk74ciQ+DGaZImzjyTQzjiv6QTCKL6yiw3dTYfu0FmRdYcKYLwDgiI4iIPtbqGs
 8huw==
X-Gm-Message-State: AOAM530UVZI3LCrU2UePOPXATDTdTeINRtSdktjbcp6EgmvSrIEm2tuU
 Q9Epg0Qc5zsnd8Voxe220wB3usea9hQ=
X-Google-Smtp-Source: ABdhPJydn7iUdZDS/GahCuVNQWnzTcKi76r5BqV1bRNJcHQUJc5DaBlNuqo7Axc8VCsVMqA/A7wjHA==
X-Received: by 2002:a02:e4a:: with SMTP id 71mr1340161jae.133.1597993544957;
 Fri, 21 Aug 2020 00:05:44 -0700 (PDT)
Received: from localhost.localdomain (x-128-101-215-112.reshalls.umn.edu.
 [128.101.215.112])
 by smtp.gmail.com with ESMTPSA id y14sm637225ilq.72.2020.08.21.00.05.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 00:05:44 -0700 (PDT)
From: James Bond <jameslouisebond@gmail.com>
To: jameslouisebond@gmail.com
Subject: [PATCH] mtd: ck804xrom: fix missing pci device put in error paths
Date: Fri, 21 Aug 2020 02:05:36 -0500
Message-Id: <20200821070537.30317-1-jameslouisebond@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_030548_430275_24F9FDE6 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Ryan Jackson <rjackson@lnxi.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

pci_dev_get increases the refcount of "pdev".
In the error paths, pci_dev_put should be called
to handle the "pdev" and decrease the corresponding refcount.

Fixes: 90afffc8bd79 ("[MTD] [MAPS] Support for BIOS flash chips on the nvidia ck804 southbridge")
Signed-off-by: James Bond <jameslouisebond@gmail.com>
---
 drivers/mtd/maps/ck804xrom.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/maps/ck804xrom.c b/drivers/mtd/maps/ck804xrom.c
index 460494212f6a..16af8b5ee653 100644
--- a/drivers/mtd/maps/ck804xrom.c
+++ b/drivers/mtd/maps/ck804xrom.c
@@ -195,6 +195,7 @@ static int __init ck804xrom_init_one(struct pci_dev *pdev,
 	if (!window->virt) {
 		printk(KERN_ERR MOD_NAME ": ioremap(%08lx, %08lx) failed\n",
 			window->phys, window->size);
+		pci_dev_put(pdev);
 		goto out;
 	}
 
@@ -222,6 +223,7 @@ static int __init ck804xrom_init_one(struct pci_dev *pdev,
 
 		if (!map) {
 			printk(KERN_ERR MOD_NAME ": kmalloc failed");
+			pci_dev_put(pdev);
 			goto out;
 		}
 		memset(map, 0, sizeof(*map));
@@ -295,6 +297,7 @@ static int __init ck804xrom_init_one(struct pci_dev *pdev,
 		if (mtd_device_register(map->mtd, NULL, 0)) {
 			map_destroy(map->mtd);
 			map->mtd = NULL;
+			pci_dev_put(pdev);
 			goto out;
 		}
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
