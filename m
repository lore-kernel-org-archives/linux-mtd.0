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
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9CEC43381
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 14:19:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA72B2075E
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Mar 2019 14:19:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S5WKM0Uq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eejvCUol"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA72B2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YBUAlDJ5Jyn+o7p92DEo3QborwfAk0r72OhxVKgP840=; b=S5WKM0Uq14SV5gWzfPP+kG/tES
	I1wB/dNfMbsaFqA2NAEIVq+gEmZKVm9dq8C9IUJBMoGpH+a6cQ7yQvhJFkDMaqmzdnFBMdvuyJJeV
	mwBk2YsYdDMsF5OY1BEm3BRSnk43752QSHM0BSYabRKOO+lYkVkhJjeWXbzjTvQeNaungzGtNsEv+
	s2+29q8PY+MnlkTC26Lc8RHRa4B8pq7/j9Z6SMccZtLWAoK8RTkftnJNcBQ0g3MQuEWHTJoimI6tP
	4HTgb7h0ZGMqhQvMALtthLhM5loxMPtJ8d9dGmykPada7QA91UVua8E29Jtqj5miO5wZmcuRgu+GQ
	pXofTTfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9Vsn-0002hG-6z; Thu, 28 Mar 2019 14:19:53 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9VsF-0001vl-P9
 for linux-mtd@lists.infradead.org; Thu, 28 Mar 2019 14:19:25 +0000
Received: by mail-wm1-x341.google.com with SMTP id n25so1473848wmk.4
 for <linux-mtd@lists.infradead.org>; Thu, 28 Mar 2019 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=5SDmaay2PipicUYSZvHglq+HG44PekQJ0piwteiL9L0=;
 b=eejvCUolEysHGqzH8de5mqsot14FOnHV6FOzGR/b97GQ1j19aui7unMT/aP6uKDp5u
 L87rtTxdr2TDbnNXJEGjWVFPWBlUw9L4SzmbWjGT+M36gQKu6IttCTp573TCRagw6Ghj
 xWdbqf6xEnjWThgSoKiH5FrihFdrS9iA2fxjYCujEZCLjmHIYdtGHJGhM35uPmflkPjK
 rKhxhNX0PBRkD9N6g9H1bbnBmlv+sPYK5/LmMaPw15IGov8p5N80xJaedlhlrXhb+4ev
 NA9rmLnDi6hd75snjBzeGWhgLKYPHffvuHXXWLd+OWtOYd54dYtyGugKSQt+mN9WNdVh
 eN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=5SDmaay2PipicUYSZvHglq+HG44PekQJ0piwteiL9L0=;
 b=oY0opIJPMIHP33JEcHjRG05TiJWOC7+gyabaJPZK5LmaAiOjRVPEel57WkN22nAZsU
 DhHAo0KSz694mbvf6TU4OrGturw6915opg8eHrWtCoRSUPk4RVGf1JRJcBeGxdG6totB
 Y5wbi/af+8OBmA2ErGPAY1l5zod0vmcmzZw7euColQx97Z+JLG5muq/rpbbWjFHfDW1y
 JVlXoVgI0woj5PM+JFANkHE3aTeSwaonnmdHWwjIeePNMf005qNkhBJIBLyWZTdFXbpA
 JTsc4ytk9CbRR6hbqTL+XwYnnoB5FeAJ4l1eZs6jJyoTbFZEjwlJBn2syLSvchA3tKIB
 yjPw==
X-Gm-Message-State: APjAAAVrDNcLlBpRXoH97yHkT7hBuaIVgoKt5iyHv3WPYt3zY+MZaQ2L
 DOPjIUdSZs6go2d75zhUWUk=
X-Google-Smtp-Source: APXvYqw3064co9Xwn6q2uRwBFf+tRlmYmV6nGwG5EfVRz48DXRUZ9f14iDxVaBgHK3/IkBCubSsFHA==
X-Received: by 2002:a7b:c382:: with SMTP id s2mr177301wmj.56.1553782758255;
 Thu, 28 Mar 2019 07:19:18 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
 by smtp.gmail.com with ESMTPSA id t2sm51802879wra.9.2019.03.28.07.19.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 28 Mar 2019 07:19:17 -0700 (PDT)
From: Jonas Gorski <jonas.gorski@gmail.com>
To: devicetree@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: [PATCH V2 5/5] mtd: parser_imagetag: add of_match_table support
Date: Thu, 28 Mar 2019 15:19:10 +0100
Message-Id: <20190328141910.5723-6-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20190328141910.5723-1-jonas.gorski@gmail.com>
References: <20190328141910.5723-1-jonas.gorski@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190328_071920_369975_A1AB806F 
X-CRM114-Status: GOOD (  17.73  )
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

Allow matching the imagetag parser for fixed partitions defined in the
device tree.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
 drivers/mtd/parsers/parser_imagetag.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mtd/parsers/parser_imagetag.c b/drivers/mtd/parsers/parser_imagetag.c
index 74b66d009b5c..9537c183a3be 100644
--- a/drivers/mtd/parsers/parser_imagetag.c
+++ b/drivers/mtd/parsers/parser_imagetag.c
@@ -24,6 +24,7 @@
 #include <linux/vmalloc.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of.h>
 
 /* Ensure strings read from flash structs are null terminated */
 #define STR_NULL_TERMINATE(x) \
@@ -200,9 +201,16 @@ static int bcm963xx_parse_imagetag_partitions(struct mtd_info *master,
 	return nrparts;
 }
 
+static const struct of_device_id parse_bcm963xx_imagetag_match_table[] = {
+	{ .compatible = "brcm,bcm963xx-imagetag" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, parse_bcm963xx_imagetag_match_table);
+
 static struct mtd_part_parser bcm963xx_imagetag_parser = {
 	.parse_fn = bcm963xx_parse_imagetag_partitions,
 	.name = "bcm963xx-imagetag",
+	.of_match_table = parse_bcm963xx_imagetag_match_table,
 };
 module_mtd_part_parser(bcm963xx_imagetag_parser);
 
-- 
2.13.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
