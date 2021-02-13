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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77956C433DB
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:48:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2892164E3C
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Feb 2021 16:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2892164E3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cUKQn0POFk+ZVebz58TTjZUmbPjhAd4TQMzMnWyCU8A=; b=Ak9c4PPP+nrXsnsUQN7bkYBqb
	rN3kZzU7awrn/W95ktm9ronbscnHsDmKxAuwQiMUVsvBdRRp5+xVR75xpKg4pTOmKzOxSDnoJ5Xye
	dIKhSvw5Y8JRJGs/VPcPf1FYXqtfa0tmbgCEDVGA+VIA+uxd6BHyuTQGJ2sBneseiCZlp/BTIH5hJ
	qr7wYsF2AhinaNN8P5Z0861yOT05HH1zNrjPdp93i2V/FgBXobTfV19aLNObxOMQjHEJ8k85Ph96V
	GRqryOjq1ZuY5BUTiIeTuexwEeYijaG0Anm6rm9TPOcvBB8SsEO+M+aK5yfHZiU6QPkkwsFGk0I1h
	oSpItzlyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lAy52-00051N-Ik; Sat, 13 Feb 2021 16:47:36 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lAy4x-0004z3-SL
 for linux-mtd@lists.infradead.org; Sat, 13 Feb 2021 16:47:32 +0000
Received: by mail-pf1-x435.google.com with SMTP id t29so1535702pfg.11
 for <linux-mtd@lists.infradead.org>; Sat, 13 Feb 2021 08:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e7rP+FiAvuVb6aK9LL07jkn9OaioHOHo8nBGBg3+txw=;
 b=mNFhmTwyUc2LCO/jLz4SaMP2Lj2ABopQxgAwfIrVpDr7ndHmpqbupyk0y8Ahz83e0k
 hwisM0BEE8oUXameZ/D6f+ktGAxGtk8UCggPTECgGPwNwbTVkytI10+IKvsjKYickdQF
 /dp3ye20oHb6uI1XUKthUDCVLf5+V6iXpSJKx3UfqWfREShgMgqUyt1w8nTMNi98ckFT
 ny25Vk5XZ0EZV53H3CrmEJ0syxtGg8dcl/lBNe57qFvEInN+XoxjyPOwP6gSb9SLTKET
 DU0Egd1hHuetj2drWItSaNkLoUj+aVI+OZ921ZxcOUHMIBVtLFNu27T11ZypD8KBSqgi
 IpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e7rP+FiAvuVb6aK9LL07jkn9OaioHOHo8nBGBg3+txw=;
 b=Y6iH7/zO7wsRARXoIrTqxxffeJuMdm4O3UfiJq8SvoJW0TUxsXIrFihPvpKGfCRZqd
 gJFl2F//aOD7jWH8beTbLh/DVm3Hn67a/GP8F8j9LCbDAz96BmAA2KYbzZ322nU1ugS4
 7MWh7+NpJ7VyU122UDtUycA7c804+CDMLFy9aecaUD7cBac0PUjdVmK8bjfC5eChApGm
 G9W7d60xk1cZCsqviT+YrL2XQ/juvqtEsjXnuLGJsYLt8yrh75Utt50PFfELtx7GiYyx
 RdrSdHaB8Yo/UkbCevjgk6IUa8DP9KsTPR4D17hSQALgXAEfcsnmhNPZZQnbA1Rb51Yu
 wBJA==
X-Gm-Message-State: AOAM532ydnih35yB51bhFZ7VabT5z4MOeO7+JZenSy8Dr/2DLf9+lYSX
 8BDa+/2E3lwFsMPOd24NswT37Wc/Eo8plg==
X-Google-Smtp-Source: ABdhPJys5U/r0NwIzKRqe04a4gYr7Upl62J62lKvLdFaYPu5ekQOAMLBTpazgZp0tykehiIzuaWKIQ==
X-Received: by 2002:a62:6382:0:b029:1d2:46ed:d813 with SMTP id
 x124-20020a6263820000b02901d246edd813mr7819089pfb.44.1613234849948; 
 Sat, 13 Feb 2021 08:47:29 -0800 (PST)
Received: from localhost (185.212.56.4.16clouds.com. [185.212.56.4])
 by smtp.gmail.com with ESMTPSA id 9sm12484844pfw.48.2021.02.13.08.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Feb 2021 08:47:29 -0800 (PST)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 nixiaoming@huawei.com
Subject: [PATCH mtd/next 8/8] mtd: rfd_ftl: Use module_mtd_blktrans to
 register driver
Date: Sun, 14 Feb 2021 00:46:00 +0800
Message-Id: <20210213164600.409061-9-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210213164600.409061-1-zhengdejin5@gmail.com>
References: <20210213164600.409061-1-zhengdejin5@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210213_114731_962938_F11FD2C2 
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
 drivers/mtd/rfd_ftl.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/mtd/rfd_ftl.c b/drivers/mtd/rfd_ftl.c
index 3d1df82fa105..cce3bf6f99b4 100644
--- a/drivers/mtd/rfd_ftl.c
+++ b/drivers/mtd/rfd_ftl.c
@@ -794,18 +794,7 @@ static struct mtd_blktrans_ops rfd_ftl_tr = {
 	.owner		= THIS_MODULE,
 };
 
-static int __init init_rfd_ftl(void)
-{
-	return register_mtd_blktrans(&rfd_ftl_tr);
-}
-
-static void __exit cleanup_rfd_ftl(void)
-{
-	deregister_mtd_blktrans(&rfd_ftl_tr);
-}
-
-module_init(init_rfd_ftl);
-module_exit(cleanup_rfd_ftl);
+module_mtd_blktrans(rfd_ftl_tr);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Sean Young <sean@mess.org>");
-- 
2.25.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
