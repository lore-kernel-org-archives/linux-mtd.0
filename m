Return-Path: <SRS0=76BL=HP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9BBC433E9
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B68164E43
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:47:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B68164E43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=x69DYZ6L/iVukOPuPjqLuycoIKK0le19730o6E2i38g=; b=3LJ82f9ocFOlbClOlWlOWs8Op
	SQmPu3KjMQcNW61X67TK7kqX7BPua6YQQ1x6wJNEVnga2HaAEYnNAJXPxE6SmEv/HrK0Apl79M+Tj
	oj2k8ok15Jw3Vsij/guhRtWHNMSfoxhPx8KQ95vrBwEf/oFQOyut+6aQchr1IrC77dhOHrdgXTzjj
	v1inVuKY2OaXsMWuquijQCZ6x1nYCdi2rfjBwHUOb7Apkb3XCidW9YjO7LVZzmjCqyzAqAHhDfwdf
	ApBziOzKRpDo3EIUqghpJEsZMUCsSqpuB5MwzWkgNrHrxYY7Wezdn1atVVJw1sC0UEuJEQc8xE/fI
	vNy/NtQsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAy4M-0004p3-14; Sat, 13 Feb 2021 16:46:54 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAy4J-0004og-S6
 for linux-mtd@lists.infradead.org; Sat, 13 Feb 2021 16:46:52 +0000
Received: by mail-pg1-x52d.google.com with SMTP id t25so1702780pga.2
 for <linux-mtd@lists.infradead.org>; Sat, 13 Feb 2021 08:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R7Pvgb3akR3Oq4fua7s4G8xA2ZE29AxfWMgMKg+V6GQ=;
 b=ZGN8haYxxgwvXkuOWjI8pHScUM7pnodbWPESjdZ5MhNOHbXT2kBpH3YQLdzGtqXJcJ
 eEbg0iFQa3toEhPD33NKIFkZtK5IA4rnnhH/SUslhYJAFpNWlu6puvRKH28iWLN6HLxT
 9OcH63HsANP8GuZJxk52x0PcS1kIa/ra2zB92OIH2w8VTyEX2eyLweJPS49P/hMSRyP/
 37BVlXQFTInv2bu1HWrV/mvBOGRk1iYoTl/TdcnV/IOQSsMkSfZB41o+4IzF7po6+58e
 73XFnlgMNTGesyVZnm5kPVA+ZjCffRjvVvbqjnefcNmvgmYq31WuZ5RssPTUoo0xfBpp
 hEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R7Pvgb3akR3Oq4fua7s4G8xA2ZE29AxfWMgMKg+V6GQ=;
 b=iyhK5L8ghOrQwDvDB8vmKSxmM7+G3sMsqZw5aGieCg8vUkxzxZl4FtOy94Dx/em7Y8
 IAG9GlyWYC5bNDVmNBJW/BnLr2JDVBuS+l/r8jjTwg/V0EAyX7gMSjgUf9wuE4jynNP6
 vCX8GV+GQ5rAXWN6DFs4vm4CC635Oh1fjDFYjJs/ERyoLNhYxyz/SA6ewaVTsYDmuvfc
 fx1/j2zADVJZI4w1pgsM/qxYRGIf+o4tIB8yXxA2qXyj7YHBTE8PG9BRDQKPWwIV5qPs
 XaTKoZIHoQrXsJslMIN8h+fEh2OXszI1szFfZvf/JAa4rWBM3jwvsUdX9cpNvVLV0oYi
 N1mA==
X-Gm-Message-State: AOAM532FW4/zGR32SE59TKINJyBcyj3q6nln7CQ5rhf4DqJPkskgOQnN
 FUBPC1uNAbibu3Zs9h5iBTo=
X-Google-Smtp-Source: ABdhPJzKq+D3FGV/FEbvngLXiMiR9yRKLox0BW9HT3xzNMV4L2F6UdYgyRqi3Jq/hit+diSLceldsg==
X-Received: by 2002:a65:60d1:: with SMTP id r17mr8228072pgv.210.1613234809820; 
 Sat, 13 Feb 2021 08:46:49 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
 by smtp.gmail.com with ESMTPSA id y2sm11309320pjw.36.2021.02.13.08.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 08:46:49 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 nixiaoming@huawei.com
Subject: [PATCH mtd/next 2/8] mtd: ftl: Use module_mtd_blktrans to register
 driver
Date: Sun, 14 Feb 2021 00:45:54 +0800
Message-Id: <20210213164600.409061-3-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210213164600.409061-1-zhengdejin5@gmail.com>
References: <20210213164600.409061-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_114651_944464_FAE604C8 
X-CRM114-Status: GOOD (  11.50  )
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
Cc: Dejin Zheng <zhengdejin5@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Removing some boilerplate by using module_mtd_blktrans instead of calling
register and unregister in the otherwise empty init/exit functions.

Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
 drivers/mtd/ftl.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/mtd/ftl.c b/drivers/mtd/ftl.c
index 2578f27914ef..9b33c082179d 100644
--- a/drivers/mtd/ftl.c
+++ b/drivers/mtd/ftl.c
@@ -1056,19 +1056,7 @@ static struct mtd_blktrans_ops ftl_tr = {
 	.owner		= THIS_MODULE,
 };
 
-static int __init init_ftl(void)
-{
-	return register_mtd_blktrans(&ftl_tr);
-}
-
-static void __exit cleanup_ftl(void)
-{
-	deregister_mtd_blktrans(&ftl_tr);
-}
-
-module_init(init_ftl);
-module_exit(cleanup_ftl);
-
+module_mtd_blktrans(ftl_tr);
 
 MODULE_LICENSE("Dual MPL/GPL");
 MODULE_AUTHOR("David Hinds <dahinds@users.sourceforge.net>");
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
