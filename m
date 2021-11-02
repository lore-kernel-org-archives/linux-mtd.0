Return-Path: <SRS0=5hwZ=PV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 256D4C433F5
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 17:26:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E899861051
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Nov 2021 17:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E899861051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=O7wisWBjQ+hIZfJDmkVyIDEne5X0vaXAe9InpC5cAYk=; b=yip1Mu/bAdE0jU
	4lSZrIZeGsaIpvuvG/kaNRlwg4P/41LRPUqv+90FcgfUovFdOHrbWrrMVIzpxzNTJ08NSIr5NbxAO
	2ZYImnebKAWZGnywthnb/P0ii6pGIBGmJBaCGY7dwePu4MLuotZzv0OrIMX6hld9u5P2y0GQLdLqM
	j4aZcXVQACyoAgdH3S7W5VDKRXYiwBs9qpgsFqWGJbnVeRNpHW9dydd7ftKP6EytZwbPeP07CJ8DV
	DOZFx++xxDqkrssmTQ51JoFBC+qDnevcZv/55ePZm30q+w6wbwIfM6SlVTo7z+NMC15SCMBJXsBfo
	ZPBZw30Baic8JEz+u8bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhxY4-002Ugn-89; Tue, 02 Nov 2021 17:26:12 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhxY1-002UgO-WC
 for linux-mtd@lists.infradead.org; Tue, 02 Nov 2021 17:26:11 +0000
Received: by mail-ed1-x52b.google.com with SMTP id m14so402366edd.0
 for <linux-mtd@lists.infradead.org>; Tue, 02 Nov 2021 10:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1OdaxtB4LssE4g+n1VNEzexPIrO9OAMoPZzNOdCXvKY=;
 b=D1hjG4k2rBHwrOqHw0wA0eXdXQDI2BQN6griH4YjxUHpAPZa4lOBz1Z8h8MV6iAF91
 QIt0/fjNJVY4YJs/xgIzw9Ra/yCn9aB9fkEaDmTeR73Xs7YGi7v5KF0veLVLoIva203S
 EYxZ+/yQXnrko3WCHSbQodZaLqvn4DibqUvrBrydUQYvOIWXz1SZEvtUBu9tFOauIRsr
 0IeOe43PsOOz7F8z65/f+nsvqYDx8T5BZ4a9SQGlFvmpjxbElqC+QVVCh0y2SoEMmY/H
 vOpLLVrqnQdodcC/nmDCMluDiLBqrvtOwPqdlyjs+ciQjTtXiGL1lx5SChibTEp1hzq/
 V1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1OdaxtB4LssE4g+n1VNEzexPIrO9OAMoPZzNOdCXvKY=;
 b=LcW3wmN3lYp3R/gfnHRUjFjv8IR2xVTcJTliIpbxtRl7XqQkdA1JMbMtJnmPbedcxI
 Rp8zbgoa2ZfD1oVLoNoKI+JiIcjKpwac2d9u9qtgjgUHiYYq90AMM0ertnnX1ApanWs/
 K06njuwpYIresU3eep8l95skXRufuj/ChRPEeueIv0i40lB+v8FRJCPw+00wYgKhfa59
 5Uvump/R5VRjqLGklpmDIW2WxmSFx8Z5KISLc/lKnBQG2jKBYcaN0/i9nJbkhrzRrOZi
 ndjchqqEgxPMQOSQst1zelZi/k2taZurYnOi9XD5ymIIto18t4RRxMdZx7eiHZEEZCUU
 vWAA==
X-Gm-Message-State: AOAM530N89NqgY9GlXJf8VdbXNhFLXmCqW5Havv02zJfWjZBXeLAEE52
 E8OLvM42La52QuxsRPfiQwQ=
X-Google-Smtp-Source: ABdhPJxBNZe6+SXory3SW2EaJ0Q55CqSM6F40MCnVFQf5Lm6LwbjSvgWVKf8lR5vxNCMHV6MjEMaJA==
X-Received: by 2002:aa7:cc96:: with SMTP id p22mr52797018edt.91.1635873967737; 
 Tue, 02 Nov 2021 10:26:07 -0700 (PDT)
Received: from md2k7s8c.fritz.box ([2a02:810d:9040:4c1f:e0b6:d0e7:64d2:f3a0])
 by smtp.gmail.com with ESMTPSA id
 ho17sm2954008ejc.111.2021.11.02.10.26.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 10:26:07 -0700 (PDT)
From: Andreas Oetken <ennoerlangen@gmail.com>
X-Google-Original-From: Andreas Oetken <andreas.oetken@siemens-energy.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Andreas Oetken <ennoerlangen@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Andreas Oetken <andreas.oetken@siemens-energy.com>, stable@vger.kernel.org
Subject: [PATCH v3] drivers: mtd: Fixed breaking list in __mtd_del_partition.
Date: Tue,  2 Nov 2021 18:26:04 +0100
Message-Id: <20211102172604.2921065-1-andreas.oetken@siemens-energy.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_102610_076384_C95F3AF5 
X-CRM114-Status: GOOD (  13.46  )
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

Not the child partition should be removed from the partition list
but the partition itself. Otherwise the partition list gets broken
and any subsequent remove operations leads to a kernel panic.

Fixes: 46b5889cc2c5 ("mtd: implement proper partition handling")
Signed-off-by: Andreas Oetken <andreas.oetken@siemens-energy.com>
Cc: stable@vger.kernel.org
---
 drivers/mtd/mtdpart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 95d47422bbf20..5725818fa199f 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -313,7 +313,7 @@ static int __mtd_del_partition(struct mtd_info *mtd)
 	if (err)
 		return err;
 
-	list_del(&child->part.node);
+	list_del(&mtd->part.node);
 	free_partition(mtd);
 
 	return 0;
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
