Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B21C282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 12:30:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3281121019
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 12:30:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hhni57H1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="OlR8F5nh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3281121019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qWyAfF+ARACNCNglXLQZFObMilSOE+gUwD02cNO7xzE=; b=hhni57H16kSAen
	IsqFu0WVgWzTLP3W04g8PdnQ31c5yfoAT/MssYqY85EII2NX2pg/AmnUsnken2CZwULjYBjKxaIUP
	7y8sNSfOASLvWpQKBEyn+AeRPmSvICqD6n1pHZ0u1xOrwXKmAfRwcc41XIpmihVQ4le4sKE4vOXAi
	IaQsunNCIgZo7ScXZnDs//GRINIJ6pSd59gUAdPA6ons3ZGB8IU8Hbh7rX6DaM9btO5eWa3H+RR8V
	bSp15rWUYOzi1Yd4dk3FuvvTA6SVyjLonjG65bW0JAoCLktifB1vNoRJyJu1V+HbHb77OCJFuCbKB
	y0F/h7GOqOUQ59vP97yw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmHfO-00032g-SA; Wed, 23 Jan 2019 12:30:02 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmHes-0002Ua-AK
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 12:29:34 +0000
Received: by mail-lf1-x143.google.com with SMTP id a16so1447658lfg.3
 for <linux-mtd@lists.infradead.org>; Wed, 23 Jan 2019 04:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gewc66hFqAnao5dd8IKaoQ3SMy6KoSmYwlwea0wjupY=;
 b=OlR8F5nhf9UQHz8Zts326lK6wlQM+UrU81CANhFqqCOmL1LoVefKUOPJHX3/EHkgjH
 +lTFzGu8nCy58/aDcJ9nzvw6pgDDi1+ScMYnijYSP1ylPbyCiIWSRhywfMII1Z++ebV0
 C+04bM2lRG9HPCrO12z6sNc6yteTmAW+rdOxc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gewc66hFqAnao5dd8IKaoQ3SMy6KoSmYwlwea0wjupY=;
 b=kX50CDU5yZjk6dVfEfYMr3r+7q7lVPNKNvUggJDPMBmJqKN+jIdwFICoQrcMu/TYBB
 aa/g4sF4xNhm2Ypd1qtqIi0vuL3myT70Kwa9xNqzVtqMWCXyT/oR6c7ESWjD/P1uQx27
 NMIepE9fPrUB1mtHSQH6468u0++ODuYv7G1UGYMldXRd8+mAecWwy9tKULoStUq/O+Y5
 LXA0DBs9HZusYK12dYtEM90XBSAaa2uUt3bT1vR+WPyu6ES+UlRiv5gHqGIp2VHbqimV
 wX5U1i0RvWshUaT3UIe4oWpa5j4PkY8yL3w+/zDkVkDbNe+8JQhLu6NI6xtOhFrZTgbY
 mRQw==
X-Gm-Message-State: AJcUuke2rkE8QSPRUMLeU+VN/xghxpBXrKYN4AO0UKHZNIVgHd42GeuZ
 PA5PgMvIOXBer2AtxynZi0+8/Q==
X-Google-Smtp-Source: ALg8bN5kc1L5cZetP0fIXgo0eAOD+tVSNB8ryfCRQ8iZ1tWaubNUq/0WPxTvhKH9h6cZu9aEIf6J/g==
X-Received: by 2002:a19:4402:: with SMTP id r2mr1638604lfa.111.1548246567925; 
 Wed, 23 Jan 2019 04:29:27 -0800 (PST)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id q2sm475935lfa.63.2019.01.23.04.29.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 23 Jan 2019 04:29:26 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mtd: partitions: Add OF support to AFS partitions
Date: Wed, 23 Jan 2019 13:29:10 +0100
Message-Id: <20190123122910.19024-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190123122910.19024-1-linus.walleij@linaro.org>
References: <20190123122910.19024-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_042931_387573_A7F9F35C 
X-CRM114-Status: GOOD (  15.21  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This adds device tree support for AFS partitioning.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mtd/parsers/afs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/mtd/parsers/afs.c b/drivers/mtd/parsers/afs.c
index d61b7edfc938..3679e1d22595 100644
--- a/drivers/mtd/parsers/afs.c
+++ b/drivers/mtd/parsers/afs.c
@@ -255,9 +255,16 @@ static int parse_afs_partitions(struct mtd_info *mtd,
 	return idx ? idx : ret;
 }
 
+static const struct of_device_id mtd_parser_afs_of_match_table[] = {
+	{ .compatible = "arm,arm-firmware-suite" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtd_parser_afs_of_match_table);
+
 static struct mtd_part_parser afs_parser = {
 	.parse_fn = parse_afs_partitions,
 	.name = "afs",
+	.of_match_table = mtd_parser_afs_of_match_table,
 };
 module_mtd_part_parser(afs_parser);
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
