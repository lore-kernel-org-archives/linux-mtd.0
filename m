Return-Path: <SRS0=odZH=R7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66715C43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 14:19:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 360B12075E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 14:19:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YK33D9Zd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R242xSv+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 360B12075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GMDi6PwOVwdQkrbbnCEQIbsTwCbultAppGmtlolAduo=; b=YK33D9ZdSUa+/s80ybiYITibfr
	4o9rsp2xujHTQXinHCVVnw36YEjW1d0d5d6dJInJPdNV77w+dEnuIu4MAsZBDj5amQjQi+fDMOPUq
	EFJrpYURGEBY8h5Dm9BHdT2B7LJVryX84N73FWpJKreBENqKp5O28/BHN9rFqt8/U9vD3u/3XQxad
	7JlCEvDMP2m0FpRa+niYYJ3gyz3cDXhpQn2nDqDugqVhosxgVoDzdqttFmC1D8XR60VKB71ZbwMCl
	0OwGSX4y29JPF+i6onCjr/7IqzJ9hWi7LOTzzLOp24vkIrxlVF/YHOkN5ugZhprX8yCvgPIFJc1mD
	741TTxpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9VsT-0002Hq-T9; Thu, 28 Mar 2019 14:19:33 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9VsB-0001sx-T0
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 14:19:17 +0000
Received: by mail-wm1-x342.google.com with SMTP id v14so4246067wmf.2
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2019 07:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=18PdCS+h0jg7d2YDUbKu9gpKAStep0UWRuYUhQxXlf8=;
 b=R242xSv+rkHubKrj0+YfknL8bhjZTfilbT18zrhLhqimSb9HP7hICt9nAQwyoAsqNd
 6KGqdlV01kkv+OqdbWjqlN5MUN7x+qGjfkTvz8g17eY+JJjgul35dY6KdUHQwted4bNZ
 o3+VlJ+dmuGvrj5mozY0R5D5zYWT2RE3hDbF3NimcJb8qSnUMu2mGpD1QhfmWGI05QvI
 byOgZc7+rZctpYXtXZPPZmlQ+R/7lsQtJPQrwnOeStZQyYwJzqeJ2GpsD8xuJCSBBD+A
 rH6zkBdYWO7gg/VzbvyDqTbJ7Du/BwegYlbKD+XUJkAM4ObLKClX6m66/Dp4eHSygfO1
 tItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=18PdCS+h0jg7d2YDUbKu9gpKAStep0UWRuYUhQxXlf8=;
 b=ZaqfWX2v1xO0tsV6IY2aK44xuBVjahI1mcDXrfqH/0ncpPlrIriKCn4CKKV0VwZlmv
 CqaO/AC96iPYamoUNjhNdTwMLt9Mo3GEiraPBj/0X1H3hJZMieKil6PHvXMl7hYXXpwe
 ow8g3FSZjvS6Kevehq6AhfXyN0Sm0hfYzMzfALbGj5RGMmr74mKEZxCvHEFREK8WBvqe
 n6fET65ID7DQFcD2YS421uXzFofxYeAXn+8kRBQAWBi8hvrH5lnZzwWCJjMb9cdH8rkg
 W6jwkP+KMvATDNlv6CaibM9FOt/FdBKLAZDSkBz/sspr0Y9pno8Td9KTcBaGT8Qgxx2A
 xEyQ==
X-Gm-Message-State: APjAAAW5A6rZ+KBzhdUdHIe3mn/JZfXd45vCprepKAgR80E8QiZBKQIZ
 29trFld2HjcNL7S26EKbxGg=
X-Google-Smtp-Source: APXvYqyeTHuU4hN36Ngd2KFZvSiV+v8cH5kVdYDrNxNsXG7OxgHORgRrirYXAtLLKzRtB3HNq99xAQ==
X-Received: by 2002:a1c:b702:: with SMTP id h2mr161980wmf.94.1553782754164;
 Thu, 28 Mar 2019 07:19:14 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
 by smtp.gmail.com with ESMTPSA id t2sm51802879wra.9.2019.03.28.07.19.12
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 07:19:13 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH V2 2/5] mtd: bcm63xxpart: add of_match_table support
Date: Thu, 28 Mar 2019 15:19:07 +0100
Message-Id: <20190328141910.5723-3-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190328141910.5723-1-jonas.gorski@gmail.com>
References: <20190328141910.5723-1-jonas.gorski@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_071915_976605_FDF681E3 
X-CRM114-Status: GOOD (  17.63  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add of_match_table support to allow using bcm63xxpart as a full flash
layout parser from device tree.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/bcm63xxpart.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/bcm63xxpart.c b/drivers/mtd/bcm63xxpart.c
index 41d1d3149c61..f639b4c960f0 100644
--- a/drivers/mtd/bcm63xxpart.c
+++ b/drivers/mtd/bcm63xxpart.c
@@ -34,6 +34,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of.h>
 
 #define BCM963XX_CFE_BLOCK_SIZE		SZ_64K	/* always at least 64KiB */
 
@@ -311,9 +312,16 @@ static int bcm63xx_parse_cfe_partitions(struct mtd_info *master,
 	return ret;
 };
 
+static const struct of_device_id parse_bcm63xx_cfe_match_table[] = {
+	{ .compatible = "brcm,bcm963xx-cfe-nor-partitions" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, parse_bcm63xx_cfe_match_table);
+
 static struct mtd_part_parser bcm63xx_cfe_parser = {
 	.parse_fn = bcm63xx_parse_cfe_partitions,
 	.name = "bcm63xxpart",
+	.of_match_table = parse_bcm63xx_cfe_match_table,
 };
 module_mtd_part_parser(bcm63xx_cfe_parser);
 
-- 
2.13.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
