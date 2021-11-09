Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A673FC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:18:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65030611AF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 08:18:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65030611AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyiIyvvaIucD5rlhjkHrPmmqGXsmXw1IqC9SUr1sNL8=; b=hatOkNyda8IJt6
	f+a/wddDeCa6q+3TZl7qFhYgaky69AKyE0jw0KviBEMMC25Dd89jnTLoZsJXByyGzMR9kj1O9dTU4
	9ZtxnNlToHD+De2UnL0PAvbysnK0G+rOsGvRYabOGoheZ4x3Wkl9HNNujsovEEMLt8BlJfWkPcpNl
	20gBMLOPKpdVZAr+sjVJY7Wd1fIaWugRiLKdhUaFT/By6HFemwDDqdJJYQMc1P0RB7/HmhQTqu6Sg
	nNbR86j1XNl0m2SWXBe+d4U0+t/nbiRpoYaUX4sHIOa2XJIK68gOOXW3/kcOV4nT3mW3dinBArNLI
	jhriejWNsY3Pk8Y/72kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMKj-000xOi-2s; Tue, 09 Nov 2021 08:18:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkMKd-000xN0-Gi
 for linux-mtd@lists.infradead.org; Tue, 09 Nov 2021 08:18:16 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so1625479wmz.2
 for <linux-mtd@lists.infradead.org>; Tue, 09 Nov 2021 00:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5dVXpCTzCFlYzdQbeW4S2Yh6RgxNGbAVKiBMgmJgIi4=;
 b=et68jY9zVGoK2NjBJO8wQLIwjoBgQdgXn5ZGsl03yf4afhalTN2Rklosiq2fpfuNTk
 wnufa+RbxOYL1dh75Cxf5h6nDr51/xOABdLxjHkd6RL82lPPMiXv4ByuDGpG/5z0F0/p
 RxAnzF8mrmQG4chW7oJ4Azyf5XOdPpnEOyXYVRWl+ZDb2/OqDGJqeq+ZbSIPjJgiqcTg
 rIU8tj6v8X3k1z5zHFGkqYd3LY8ehEqXtZatZdYswYav0aR3R09KS/PQMgo6s/jGE2xI
 H1WDuPS5cJa4q8iEmivR5A0fUZSnUkd5dF/lhvLxjO9tRQCAp8J1u1O0nTRLe4Jlrs9u
 cEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5dVXpCTzCFlYzdQbeW4S2Yh6RgxNGbAVKiBMgmJgIi4=;
 b=MmEq+UhoNvrtTw/AnXpCE3GWKZzhGpc01/kpjp1dTvE6O5k3sIIvpxGJKGCKb2VTlV
 Wj1jjxE0sFCs/tja1UVV4UoIC4OTdzVjsqttT4nxQsQgRyTCg+GICazv7fjEb9o52gNU
 TwdtzHlmGdZ7tES8BK5Ua9NopgcTCsbP21x1l7++xd3f4Km5nRUFW9Vr7DD8PF74aqwi
 sJo+EVTCcJL5B8TXmULTA2ESSnV3BF4vAXDpnW5lU3Gu3my2ySy5jKa6sUa7jXbFuUlc
 OZpetsxgK3kL2+Zm6BdE+XuPY2v6Vwei5w44nKHeYL7PSK9aoeuBKFQLO41yr1YXAegn
 U8pg==
X-Gm-Message-State: AOAM532XPR1s8Pq+rvnzMhy6nWp5/7Ov/SQAUwyU0Lj+O3XJJiuTLxvh
 cm3K4nP2J/xiMMxPZzKmd/djHxYJAPGCkSPR
X-Google-Smtp-Source: ABdhPJyR/DcdEseFDBpTuZGypjDRXrDrvUfOoCShBbaJHZQ17WmKFHJHpZ8mzsjYN/l8cKfzootTqg==
X-Received: by 2002:a05:600c:3b0a:: with SMTP id
 m10mr5033854wms.130.1636445893962; 
 Tue, 09 Nov 2021 00:18:13 -0800 (PST)
Received: from thor.lan ([213.205.241.131])
 by smtp.gmail.com with ESMTPSA id n184sm1714028wme.2.2021.11.09.00.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 00:18:13 -0800 (PST)
From: Frederic Germain <frederic.germain@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Frederic Germain <frederic.germain@gmail.com>
Subject: [PATCH 1/4] .gitignore: add new ubiscan utility
Date: Tue,  9 Nov 2021 08:17:48 +0000
Message-Id: <20211109081751.480718-2-frederic.germain@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109081751.480718-1-frederic.germain@gmail.com>
References: <20211109081751.480718-1-frederic.germain@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_001815_574329_9246D9E4 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

Signed-off-by: Frederic Germain <frederic.germain@gmail.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 1644ef0..8c51ee5 100644
--- a/.gitignore
+++ b/.gitignore
@@ -100,6 +100,7 @@ ubinize
 ubirename
 ubirmvol
 ubirsvol
+ubiscan
 ubiupdatevol
 volrefcnt
 mtdlib_test
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
