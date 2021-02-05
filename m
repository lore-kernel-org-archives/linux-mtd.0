Return-Path: <SRS0=fkbb=HH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD59FC433DB
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 12:43:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DCB364FCE
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Feb 2021 12:43:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DCB364FCE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/jAEMMFW0bnsfSMZpFz0FIPF/mDac3JezR0eerD0RUk=; b=BENLmu6Ab26EeIVwIHqpaMtqN5
	w8UFHUDHxYu8xalSwaOZCqtGwJcsei7Y3Le4a0o/EzaMV+zdnRW0BNwknLaGBYfeN5TxBB6U37HzI
	P5AiRJzHTteW/zM0ZsbUS4s/XmOISFoeEb4yZUS7HrddYj6maUnTcVbjIfkt2jLjCEYz9+G9EbaeM
	O+CWSjDriuzxXeiuAt9ChO2K8vrs0Cn17L8+V9F3A8acLDC8dxNzgyxndbE2dSQyciUGwPVpkoNL0
	h6M3GsGzvzwr99R3yZULXPFw5u2BD8YrlcCKJOFRkSYfFlBzOxiMFNWTqCmrtkkItr136QILWApdt
	mv/6Yleg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l80RA-00055C-Vb; Fri, 05 Feb 2021 12:42:13 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l80R8-00054U-Nt
 for linux-mtd@lists.infradead.org; Fri, 05 Feb 2021 12:42:11 +0000
Received: by mail-qt1-x82a.google.com with SMTP id w20so4835822qta.0
 for <linux-mtd@lists.infradead.org>; Fri, 05 Feb 2021 04:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RPdHT5qVHokClqjxnwYMrxKV50moL7VSDU0O/jdeoaM=;
 b=Ee4TP4KLDZtCOIEMr7sg+xigoPSBTMO8gdcbWQaPa/4sXRQLdyWbeAa7U8rm859lql
 ghD7WI1nbWZ1rE88ZgKUamr7g408Uhpn9Rmeb4hKq0r0Lk6s8i30g3I8spN/cq+1e2Ii
 +OrJ1nil3LkoFC+ceNPQOoYxCAfn4kCMlW8etKOgscUIQkgurNQ1Aabbgy/b/gSuPw4E
 kVgbb4Lf2Eszg3psct6P4D8oZVOVwQcnn5Y+mCmzP/u2DN66YGVDpN/yKATXvPHMnABM
 qnVscY/td9dfN8TOmNeDOfae2iNqfEq57j/4NMZjQFvGnKkRkX2MXHc9JOuZlkp9fKpZ
 7Z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RPdHT5qVHokClqjxnwYMrxKV50moL7VSDU0O/jdeoaM=;
 b=r31OXkvBo8ck/zAyJDXGQu6RVK+XFw6x4ZsUAVkXG/cep/seR02GuKvVgoauHyQa9T
 UWL+rFEjmysSmynaXw6IwdWEwlfff+M7aTZqqaPQ9HiNOUODOJAMrWYxrjGj19AEDDvj
 GlqMlIaqAAN0G57qniedqqu5OjLd+aFUzR8a3mEzEYs5oIbHIYDOsQCtn8SYdozG0/dC
 njkqaRhD238LxEZMAVOSTRvWKPQ89lx3aF9d1BcFjDaYj6GNP5QKJjFJsBdKIltiimd8
 A4uKxeeIR3yhbEo2XNWz0qePMbamHrJvrsXROs5OeQ+SOyfnDQXJzDHiqKgJmyzMQw4A
 zoiQ==
X-Gm-Message-State: AOAM531gomjDU9WuPgHxXwUwLfaghdzpGP28io40CpJTBlOYHf3qFPhc
 HAXExh0d/4rGtglwHdLxs7Q=
X-Google-Smtp-Source: ABdhPJzz+lA92PzR/BQJBWs1XArV7VCGbWoxtkaMAi0Y15HQWmKCcBZdL4w2fKOmuJYjFvbsZS9/6w==
X-Received: by 2002:a05:622a:20c:: with SMTP id
 b12mr4095432qtx.208.1612528927867; 
 Fri, 05 Feb 2021 04:42:07 -0800 (PST)
Received: from localhost.localdomain ([138.199.10.106])
 by smtp.gmail.com with ESMTPSA id y68sm8385707qkb.132.2021.02.05.04.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 04:42:07 -0800 (PST)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drivers: mtd: Better word replace a not so good word in the
 file mtd_blkdevs.c
Date: Fri,  5 Feb 2021 18:11:51 +0530
Message-Id: <20210205124151.1386271-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_074210_803453_6C96F591 
X-CRM114-Status: GOOD (  12.16  )
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
Cc: rdunlap@infradead.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



s/fucking/invite/


Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 drivers/mtd/mtd_blkdevs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_blkdevs.c b/drivers/mtd/mtd_blkdevs.c
index fb8e12d590a1..756a0995e474 100644
--- a/drivers/mtd/mtd_blkdevs.c
+++ b/drivers/mtd/mtd_blkdevs.c
@@ -523,7 +523,7 @@ int register_mtd_blktrans(struct mtd_blktrans_ops *tr)
 	int ret;

 	/* Register the notifier if/when the first device type is
-	   registered, to prevent the link/init ordering from fucking
+	   registered, to prevent the link/init ordering from invite
 	   us over. */
 	if (!blktrans_notifier.list.next)
 		register_mtd_user(&blktrans_notifier);
--
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
