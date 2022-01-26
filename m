Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F316C28CF5
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jan 2022 08:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Yi+oheg4khiz4a7qFsyN3bm01X3tYKbUvky7WxwDi9w=; b=MHD
	CfCwU7KvnPqHoT9mQEOj8q35oygOCrRevGdiyczV+UOEZaa3KFCBEXBGB9TqduSjpgdrLtbWFyrkW
	a6rZ/eL9Q0D9Yqv/2MyK8YTj4ofzDvgJELz3vPeI98bKBJQq2ObS7h7dRsrIiG1KNqmDz1gpzYNpF
	b7ko3kdIJLonqEiJTSiZfIMDDzzFco/o5PDrJVjDV6jFagYpQoU3FXIrmFw/9XLKnXuODLoodwsfs
	tY9wizENLMe73ataINySFBLQiCmGoBlGIJArwVdC8JglBDNrqwVm8gGvJZ0nMXkrppphIVqIOj8R0
	3dReT0gGi2R80Ma2AlZrQB+8BPDv3RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCe7c-00AotU-Ar; Wed, 26 Jan 2022 08:57:44 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCe7Z-00AosD-G8
 for linux-mtd@lists.infradead.org; Wed, 26 Jan 2022 08:57:42 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 c7-20020a25a2c7000000b00613e4dbaf97so42914122ybn.13
 for <linux-mtd@lists.infradead.org>; Wed, 26 Jan 2022 00:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=lwgxdYwkYYoV60lC8eOCPlgo4Kltdl+GrrvrUKoXqeE=;
 b=GCHZoL2KMYN56Bb9bArQotAcUIaGcFRa4jJ0xMUOzCWB9X1/MdLNz/kq9Eud0X6jQR
 OItIooe8ERGMPdHPWn3T2DvWBEBvVwttzLV9fJbfUp++vVxM2nsV9AQTeGPXR2vk/KP0
 VpBiTkPR9Vplkpa4chZkwDEk6Lpe53fthwT9JbX2Kbi7rZyl4BLiF5B08Ww2wv8Z2X3y
 XDx69Pt0QAjeonxrtPJu6R7M1Ca3PoSpoSK4+zQ4UPo4dIhDkdua0AkRIbIKQRq2NNAK
 Wb3griZiPsq3QsJ1CFiYegt1R43GczSoObqOUZ3xh8PDwR95RF6uMioikK2bJ213wfFG
 VVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=lwgxdYwkYYoV60lC8eOCPlgo4Kltdl+GrrvrUKoXqeE=;
 b=a+ClJxFDsk/Kc4r8ck57NAvFbC0mOeN5DPsIfmHWT9Mu8EOsN5tg+dLBns9LPAUdUR
 2R1Zt/KA5ab7bsOuYiwu9kQP21UuuJjR0IHdULwj+Rl81r+RFSe4PvP1YpJGILbH7Od+
 FTKj51zCZz8rJeCV+s+0Go16InmQHvS61tHLyUk+7cqvM5mIpjXjABtNw1UUgmMJKiQf
 pkvnC3LeJETMoWlJZH5urv1o6PbIc6SpdT0mTZs/3V6ZNO9lp4x4KdFpGZI34SWGsAed
 W4E4k6N2pbwzWwWDbZuS59wl2YtXBvAcxW6JX7H+HclmomajiB0gpRu957KUBK0vDD3D
 YprA==
X-Gm-Message-State: AOAM533v6dzShiHza65KHkI41robzOBQB2TjUdzd8ygxMQJEI3abw6yg
 PI2btugiswjSoqdatARzxW9xpylD/w==
X-Google-Smtp-Source: ABdhPJxcNL7P3y0SVGcvCOiZCO4BPDNhBNML9s720/dkl9zginGY5V7+nVvKQmx6XPU7EOLpV8e748k2fQ==
X-Received: from decot.svl.corp.google.com
 ([2620:15c:2c5:11:bb79:635d:80b2:3c02])
 (user=decot job=sendgmr) by 2002:a81:a89:0:b0:2ca:287c:6d32 with SMTP id
 00721157ae682-2ca287c6f7bmr6600087b3.471.1643187459021; Wed, 26 Jan 2022
 00:57:39 -0800 (PST)
Date: Wed, 26 Jan 2022 00:57:35 -0800
Message-Id: <20220126085735.575625-1-decot+git@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
Subject: [PATCH RFC v1 1/1] mtd_blkdevs: avoid soft lockups with some mtd/spi
 devices
From: David Decotigny <decot+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 David Decotigny <ddecotig@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_005741_572940_680F0D95 
X-CRM114-Status: GOOD (  10.96  )
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

From: David Decotigny <ddecotig@google.com>

With some spi devices, the heavy cpu usage due to polling the spi
registers may lead to netdev timeouts, RCU complaints, etc. This can
be acute in the absence of CONFIG_PREEMPT. This patch allows to give
enough breathing room to avoid those false positives.

Signed-off-by: David Decotigny <ddecotig@google.com>
---

I tested this on a 5.10 base (lockdep).

 drivers/mtd/mtd_blkdevs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index 243f28a3206b4..64d2b093f114b 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -158,6 +158,7 @@ static void mtd_blktrans_work(struct mtd_blktrans_dev *dev)
 		}
 
 		background_done = 0;
+		cond_resched();
 		spin_lock_irq(&dev->queue_lock);
 	}
 }
-- 
2.35.0.rc0.227.g00780c9af4-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
