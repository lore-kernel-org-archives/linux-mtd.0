Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFE63C433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 04:16:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3306E610E7
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 04:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3306E610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yZ5FhG/hXvXAfxZ7YG6Q612XNvZuxkGWWxbNZ6enDdk=; b=RtPVDWx3IpPxdxLnJaNZ84EMK
	aKlVEWPE8xpumaHlDMsggzgsefyrskNdjBwR7H+Sz7tIyZSigcUs6VyH9W3NhNSRD3LHjkvVPMAhL
	4hp9axPJ1rAG0Ck1kYi9mb5pdib2d/s++SEwg/hsjyYgsq19QEAXWcpJB4Rm4FfYnrMCw4lFwwOw7
	f1975UMuV5sdJ/us59EEF1Rt8oyfkw3enfgLS5UrBkzKDrYbezlviqZ8CHxrTDpu4z5/Q2MEXJ1VK
	nhsbb/QXjRAAeINJck2+sk/mNQk9xRvv9ZRWnoV0/6M6BohYqXdPvqSerI+NFBKQw9tIo28ML3hyS
	c0kuGHbVQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le8xD-000BQd-ET; Wed, 05 May 2021 04:16:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le8ww-000BP6-T1
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 04:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=jn4Pll+UieCKYgPHuXaqIsrSXL51vnoPQZAPG5ivrZY=; b=M9f9BSjJEXT7aCHj5xLaNCgj/N
 vkPlNTu+xCmdZLt9N57WO6zh6HgcJPsQ5Gjep0XzkaPTc6LcQbj1aqQZZvkFcFr1Fzmuh6OjpjvR5
 PA82o4txBAlVuUb8RaqXIqgGNhY3lLJ/2aSnvwEbEEyxO6U3Nv/9xnouNxdOGk3CQpB5gDiUtsdER
 dCsqDt+lMmVZwRMFdx9Bl2Fsaow5cUyag6shveF1c3MNR9+hwpWKbWlYXnOI3dSUv8kAeRkZ9xHyI
 yiH3wm7s7i99ymmd0lARlBTfrqekDfeuWmz4/XAsFk7ZUpmvgq1M7l8OCfUKeGhEI9CIa16LE5edG
 Jawinu+w==;
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le8wu-004Rw7-Hr
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 04:15:49 +0000
Received: by mail-ua1-x92b.google.com with SMTP id n61so170374uan.2
 for <linux-mtd@lists.infradead.org>; Tue, 04 May 2021 21:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jn4Pll+UieCKYgPHuXaqIsrSXL51vnoPQZAPG5ivrZY=;
 b=Oz96V8LMpbhaypf5NRtIuJobOn7gkQcLXUctbyD1NPbaJyvIv88nZ8Ho0oxxwK0Tt1
 MlTzH5adem6dA2XgK7ztM+LZiLkt87vddlkF2Ly9w2J9TayIFAWjDF/2T04dV1xc/dg+
 8ttGENGb06v2i/lyhFqwDWUFVilUXvQlpPeQOsdpxcRyqEbI+GbRcVNUzLld1rr7mrz6
 R/KmThcoddW4E9xAnZcP+WCyw8JmNPGIonHfjKaWmLvyEhn8Ym5vfnmqQEh/qz3b1fwa
 UHldM11FcSf4OWFDRo21Ddo84FcNd8Yglz2Kf3SnJr84u5XHDpPFtuHgKXfYPp/3LSUY
 qo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jn4Pll+UieCKYgPHuXaqIsrSXL51vnoPQZAPG5ivrZY=;
 b=GMrRCb05u6h9SKagei4JEKBNx+cQfCelVDpeC/XS3sGw6DvdKTo2NfeQXzRkFumaDk
 KmZRZVjVJmp2bf1E5xc6mhgIzuHhdnMOCESqpg93DZXUfOZN7UEL76aPaByf7FRAOUkn
 dZdjjLHohn41ZPOaO7EuQKoofRx97gnc5Lud24IJq9ej0N9pWLgRHH9k81MT+2lV88gC
 uQicwHbOiKq8PXYOZ2pG5Uh3WbSqveI2Ct/tOB5mp1aOfQTa4O4Sux4eXrCBeckW0WpQ
 BksoBDME8YHsx3bFQV2xaNFug2Njk6EeVrxfytdU0lb1ys+QVwaXqCVgclYxMrVTdfTd
 HTFA==
X-Gm-Message-State: AOAM532YOpVRsgxz0ceISTC8MS2Zb3dc/j2mHP/Rx9NxPHgK1IplySRC
 Ea4vQ/iNommUdbzgOTqt2Dg=
X-Google-Smtp-Source: ABdhPJxQ45ym8s6zQ8rHr4Mxf1hvsYhIymmkb8rT1yaBoDMNU4+sI6Baa9zDV7rSoNrG8rU//z0b8w==
X-Received: by 2002:a9f:35ef:: with SMTP id u44mr5987507uad.90.1620188146699; 
 Tue, 04 May 2021 21:15:46 -0700 (PDT)
Received: from localhost.localdomain ([65.48.163.91])
 by smtp.gmail.com with ESMTPSA id x18sm687246uao.19.2021.05.04.21.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 21:15:46 -0700 (PDT)
From: Sean Gloumeau <sajgloumeau@gmail.com>
To: Jiri Kosina <trivial@kernel.org>
Cc: kbingham@kernel.org, David Woodhouse <dwmw2@infradead.org>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Rasesh Mody <rmody@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Gloumeau <sajgloumeau@protonmail.com>,
 Sean Gloumeau <sajgloumeau@gmail.com>
Subject: [PATCH 1/3] Fix spelling error from "eleminate" to "eliminate"
Date: Wed,  5 May 2021 00:15:39 -0400
Message-Id: <21caf628a8aeec21ea9d3f06c95f712a7e7ce7fa.1620185393.git.sajgloumeau@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620185393.git.sajgloumeau@gmail.com>
References: <cover.1620185393.git.sajgloumeau@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_211548_609208_A450B660 
X-CRM114-Status: GOOD (  12.64  )
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

Spelling error "eleminate" amended to "eliminate".

Signed-off-by: Sean Gloumeau <sajgloumeau@gmail.com>
---
 drivers/net/ethernet/brocade/bna/bnad.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/brocade/bna/bnad.c b/drivers/net/ethernet/brocade/bna/bnad.c
index 7e4e831d720f..ba47777d9cff 100644
--- a/drivers/net/ethernet/brocade/bna/bnad.c
+++ b/drivers/net/ethernet/brocade/bna/bnad.c
@@ -1764,7 +1764,7 @@ bnad_dim_timeout(struct timer_list *t)
 		}
 	}
 
-	/* Check for BNAD_CF_DIM_ENABLED, does not eleminate a race */
+	/* Check for BNAD_CF_DIM_ENABLED, does not eliminate a race */
 	if (test_bit(BNAD_RF_DIM_TIMER_RUNNING, &bnad->run_flags))
 		mod_timer(&bnad->dim_timer,
 			  jiffies + msecs_to_jiffies(BNAD_DIM_TIMER_FREQ));
-- 
2.31.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
