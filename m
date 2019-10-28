Return-Path: <SRS0=3akN=YV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5479DCA9EC0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 18:13:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 311E720862
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 18:13:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gj2QTN0p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aXOPdyC7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 311E720862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q0epYvEM8gjqpwJlQdM2//H5yOq5e0joXQmcXhyo7jc=; b=Gj2QTN0pVuuDfZ
	mvakNFGKplYCU3sLRiXh0u2TFJ1kXruJpXVO0CyglelhzcICFNSBVebLY7yXr9yHAwy9dFb6PMM/m
	x1CiEMnBl7md5etpel7vSHwC8i17o6PWIJB46QO+tx7lZzGmYXXXtp0CGv00hUCcseGqWnU3/r+fs
	FPObuWpxT+JgZ/wrnaAgOlfKio1UAkODdMzDKq49rMWxPlvUeI62QSr2cL+v3A+C8slEfBtdVK0QS
	TibP7g7M7/wa78blP2c65xmyHiKkVFU6ZrOqfaMfjDoCgqRhVucGEnR2AnbEEZBbanI8BpNPSXtVm
	Wkl1P7Apt5yKNDlOJyyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP9W2-0005n1-38; Mon, 28 Oct 2019 18:13:18 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP9Vy-0005mJ-Ru
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2019 18:13:17 +0000
Received: by mail-pf1-x444.google.com with SMTP id b128so7436451pfa.1
 for <linux-mtd@lists.infradead.org>; Mon, 28 Oct 2019 11:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=KooIewZwbvjOkWEaBdb5ogJ6e+TbvWJNeEYKOS8P4w0=;
 b=aXOPdyC7AweFFSfB2Js2hABhLVh569kDj2ZgxMqXyvHOioQ44WsxywP8Nq31GJ6cKv
 YUa5fMowMfM7tx0PM80F+R8UHmwYIQKqUE3grO68emWgJqvBb99ab3Ctd1d8hAFxcME2
 oER/fc54s77GQl3EKM+ZwgA/pJux/e2Z2KOd9119hrzSUIbsrFBs7ndjLvbQ4iSWhN0s
 dDcGwgVs491Pbv0m9/hJpBkU6yTXVPf/eELu2doKVz5UNWHQYh3nlbVpOjSYS4I6V1Tq
 HJPDbnBscNga+uPSi5aaQU73/uKcDNSw1erHBde1yMu7Qaijq6V+uwHCZnxJLjAtJm3w
 f07w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=KooIewZwbvjOkWEaBdb5ogJ6e+TbvWJNeEYKOS8P4w0=;
 b=k2VkjM9VA1TOGNH4xcDx1dEBmVjRQSsn0Jz0ZT+HWpNy3kqkuWjgqaQ+5UQp9daChn
 /ToaB+GsOgzoRVPf7d+0Mmt223ItnOtBeBdnSJiqHT+TTGYIeQ00WdzJ840LZ9L6+lc7
 sFQWhc/dbuVcUiEjotLJRqDmWDGxZkiIuDsaEAond88AJms6/V7Jr/iqBi0M4EPRzGus
 V+s7c8nbk3qMPxv/j8aUSl9lMSRMGgNXCXuXpAvlmQuF39OO0O2p7RI/lGLbwGnYdmv7
 yDf2ApaoJdwwIz+vaG22VnTR2+14yjnqSLwTn8hEhNcjtbWKVj78i2HSFd9jVTaQfaHi
 duEw==
X-Gm-Message-State: APjAAAWitSuFsbtY2QJZE9fgXi6rA8VYxWTv2ggU9mT/rT3lkpxExQdp
 V2MoCjFFVRkGy41t539n09M=
X-Google-Smtp-Source: APXvYqzHPPHColxTNgsQHdD5XILpojNAlx6D2TKkfWzX4v+PiR9dJvyKzns3v8vgG8I/ERhrikrQ0g==
X-Received: by 2002:a17:90a:2369:: with SMTP id
 f96mr664908pje.127.1572286393809; 
 Mon, 28 Oct 2019 11:13:13 -0700 (PDT)
Received: from saurav ([27.62.167.137])
 by smtp.gmail.com with ESMTPSA id g38sm17039156pgb.27.2019.10.28.11.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2019 11:13:13 -0700 (PDT)
Date: Mon, 28 Oct 2019 23:43:01 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: joern@lazybastard.org, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: devices: phram.c: Fix multiple kfree statement from
 phram_setup
Message-ID: <20191028181300.GA26250@saurav>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_111315_895310_866C9B15 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
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
Cc: saurav.girepunje@hotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Remove multiple kfree statement from phram_setup() in phram.c

Signed-off-by: Saurav Girepunje <saurav.girepunje@gmail.com>
---
 drivers/mtd/devices/phram.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index c467286ca007..38f95a1517ac 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -243,22 +243,22 @@ static int phram_setup(const char *val)
 
 	ret = parse_num64(&start, token[1]);
 	if (ret) {
-		kfree(name);
 		parse_err("illegal start address\n");
+		goto free_nam;
 	}
 
 	ret = parse_num64(&len, token[2]);
 	if (ret) {
-		kfree(name);
 		parse_err("illegal device length\n");
+		goto free_nam;
 	}
 
 	ret = register_device(name, start, len);
 	if (!ret)
 		pr_info("%s device: %#llx at %#llx\n", name, len, start);
-	else
-		kfree(name);
 
+free_nam:
+	kfree(name);
 	return ret;
 }
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
