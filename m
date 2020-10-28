Return-Path: <SRS0=0HiW=ED=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF177C4363A
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 09:50:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 279972469F
	for <linux-mtd@archiver.kernel.org>; Wed, 28 Oct 2020 09:50:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TY9z9vE+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJsa0z5k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 279972469F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AooJwTYzheB8XXTCGw5rIUSWGyzbI/CPNmUJZIAF//s=; b=TY9z9vE+z7GIQObmrauAyuzgrJ
	dAXZhZQBf5z2QE89UkiUYubccQxqiwg0T19BY8nom0ZdR8lYwQoLLS5khdqt6m3xDVLorA9xzUaBq
	oG5bCeNScofhA0gIz46YC9uGDzl2vuT0gRJSqmQiOXJBCoDZODhAJjeIcwqFupjDMWvnOPU6deHRS
	bQgNKPiVkgTJqynnvDY0LIhFTyLRIQdTyHwPa2Ju7fXa/bD7/YYN29D41Wnhz2ZU+nz4PoFsjZ2in
	KNnHFwrXL9MOirG1vod75+Grf7gdAi93Fg9/MOD7dYF94/T5zXM70ZSdDX0b5wUlLIB7ab7ii0G5p
	zpSGZZ9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXi5h-0006M0-9M; Wed, 28 Oct 2020 09:50:01 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXi5e-0006Ko-MP
 for linux-mtd@lists.infradead.org; Wed, 28 Oct 2020 09:49:59 +0000
Received: by mail-lj1-x244.google.com with SMTP id d24so5325180ljg.10
 for <linux-mtd@lists.infradead.org>; Wed, 28 Oct 2020 02:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ORjAmXFNbA8sjUlFAeqJzueYsTW6Da7gRCx6HUe+og8=;
 b=VJsa0z5kZ+s01cwlxvNqzmYyQKdorOOUaToPYYDqKANbp2Ri31yfVXz1lSNlTEB25+
 Lfu0KDVqFhw3PBM5wOzPwKGx2Lnl1uev1VI+Wzheo5AJ1lzVDIwlOOSAyAg21FjPsRA+
 rsP1WWd0nS6Hevk9XBV4V5YBgWEY75gFW6GXJF9JfD+7pIFu8cIYWSWIFLda86oZeTzW
 YexUGUFp7V5dLeolFplLq9AngpcethHLu7iqiCN0g9f2ibrd2PVtP4TjyypBMHy2PmS5
 xVXXrLjd+Vfy/Lk9z4aub0YE80RmkqCaHoz1ZpAn9ikGHcNICroUP+k6N79gVVRU5KWr
 bYmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ORjAmXFNbA8sjUlFAeqJzueYsTW6Da7gRCx6HUe+og8=;
 b=YyJiwd1qKmn0JbbTSEoUZqXW0LMqQEzbZq37aZOu63vpv1e/YmIs0qoEAnOOqg67MV
 bmt4pRVOytnZ19zlMCRtOSLIjbAth1unOKKQjbdjKS/ErmW3WFzRBRMXrItwa802AgKr
 rtre/j4XhzY+cdVCu84d1z/etDpE5ImwqV9gKGV0AmjCC6vuvppUDfIQeFKXjM2cq2AR
 AZ1DbEllJ9kJ0ulJRcVMbVJC+B4mFjTCc8PQNZ/0g58sZiKiL84exBPa+I7SmrqgTTAf
 MM735So4ngCP5tA5HMYMRx5DwpC2x1vXjPaYv1Qe8OyU4GWi0TTZRQinc5j0uCNZxJDj
 cGWQ==
X-Gm-Message-State: AOAM531W6AmJlGV2fDRoGQNGPZsj7kHquNtmjH7NCi0g7JImw/xMd8yc
 lvH9FINdhU4RA7CIT4SN9vZenXcuhLCtGaJb
X-Google-Smtp-Source: ABdhPJyhw7s1iIfdFLvwmXcYfeuO6SSJjXm13OAy+LQQDIyT9jZ2znoVS3kTBa+YjxSVN6rZtzqSAQ==
X-Received: by 2002:a2e:8709:: with SMTP id m9mr2696904lji.290.1603878596744; 
 Wed, 28 Oct 2020 02:49:56 -0700 (PDT)
Received: from saproj-LIN.yandex.net ([2a02:6b8:0:408:3648:edff:fe3b:1baa])
 by smtp.gmail.com with ESMTPSA id y15sm33091lfl.83.2020.10.28.02.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 02:49:56 -0700 (PDT)
From: Sergei Antonov <saproj@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: meson: fix meson_nfc_dma_buffer_release() arguments
Date: Wed, 28 Oct 2020 12:49:40 +0300
Message-Id: <20201028094940.11765-1-saproj@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_054958_761935_FA70CB16 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: liang.yang@amlogic.com, stable@vger.kernel.org, jianxin.pan@amlogic.com,
 miquel.raynal@bootlin.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Arguments 'infolen' and 'datalen' to meson_nfc_dma_buffer_release() were mixed up.

Fixes: 8fae856c53500 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
Cc: stable@vger.kernel.org
Signed-off-by: Sergei Antonov <saproj@gmail.com>
---
 drivers/mtd/nand/raw/meson_nand.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
index 48e6dac96be6..a76afea6ea77 100644
--- a/drivers/mtd/nand/raw/meson_nand.c
+++ b/drivers/mtd/nand/raw/meson_nand.c
@@ -510,7 +510,7 @@ static int meson_nfc_dma_buffer_setup(struct nand_chip *nand, void *databuf,
 }
 
 static void meson_nfc_dma_buffer_release(struct nand_chip *nand,
-					 int infolen, int datalen,
+					 int datalen, int infolen,
 					 enum dma_data_direction dir)
 {
 	struct meson_nfc *nfc = nand_get_controller_data(nand);
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
