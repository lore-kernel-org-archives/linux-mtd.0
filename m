Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C7ABC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 26 May 2022 11:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J1ErF0giE+qENTH6FsUqS5WGsJpUEIpQ6wBmEnBfebc=; b=qZVCvPtJIIyEhI
	8+SeGC5e0zWeuWp2jrCoc3IsDFNc91mtVbhzxDVn1bck/p7ZJEvmEyeU4DP9hS5Xlt65SpdShJm55
	g+An/oGwvP4vaKsEB+meTvdP32kJJOslGq25gdF3GSx1x9wpexcjcfiYd57qwZ8dIlb6EO7fpMXE1
	GLPKw8CVb3HI8yW24yyCVqxsDEMnMxrfZPSCmJj5gktYdTUC7LG/vdOryIssNjZe0ft2Gf1kzyoFe
	o69+FhghFuQPbtNxF1Ksr6SKtxKWebtfQvXDImfmPiOkj4vUIabu16Zxqm5yhtzmE0Q2EyJZbK4bE
	EKzs/SrE+hzpJhzP0Cdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuBKe-00EVuM-TU; Thu, 26 May 2022 11:07:08 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuBKb-00EVtG-Pj
	for linux-mtd@lists.infradead.org; Thu, 26 May 2022 11:07:07 +0000
Received: by mail-pl1-x62b.google.com with SMTP id n8so1177179plh.1
        for <linux-mtd@lists.infradead.org>; Thu, 26 May 2022 04:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MMgVyRNdqqfbP3WwHBRXWSmLvrhAi/fRvJMgjDc3EOs=;
        b=JUKixnG9osJLbrycPGbSnT+N81UGY6Om9yFrZkK298rRD+ziLyU5fBqF/tl5JjXrh3
         ujQZ1VYslTSoJ78snxNoP3DMgms5+6iyOX2SjwVycyvyHrMex1rddouJYR+NtK4gN4RR
         25yFQHpVU6eyS/S0vVtTaskvki/rqLz1mP9wdE9OPAAyJwD/n7/oTq/NT1zus/UcECmH
         Flvr5tCcVe8JKst5KCnQABSkysWfDNTxBAr+bqYQsK5fDiRjG0Qu3VzA7Dd92vDyI7Nh
         jwxP+hOtfLPJroIimVfQ0FdKUPROM2HoaLmJD5m44z15TMR11HuD8Bij8JQbAgx/nV+y
         NhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MMgVyRNdqqfbP3WwHBRXWSmLvrhAi/fRvJMgjDc3EOs=;
        b=QDbQT3uWcvTVa0y8vu22dwboP7yXxWP6ajEbDRwsbhfDeAVjI+gfgebuaFsjXGPHvK
         CweGoReMbMZbNr3tcz4gKFZ4xlaD793ZPiX0ykRKTMp4GSCFKZFaFQTQLEAgOqITtipG
         of+gBtV7dQXu/XHap9bd2zWntFZScgXJZGi39HWE0HU9x0N0VCJATYS4GZ03UAs38cMI
         u2tcv707sfGDQOIP8DUJ54zBRR1R1O6fbzD3MO5HldA7hi/5T7iIaH+9tmCx1PZn1clQ
         gGW8rHSwCINv0jm3xYqsprKJagIXf05rQoYahpcrbISyyzcLiBZtvFkMGRLFpoMlp+su
         Z/tw==
X-Gm-Message-State: AOAM531lo/DXEBKnZd2S3JidYQFwOzBUsRA8/8bWumiy377X9pdFjsQs
	Rp1rTNgiGjhGyy7Hra/7WAq++KoiKohXi2RL
X-Google-Smtp-Source: ABdhPJxq1svgl05DLs/x1l9IlKIfOMe4cFnuhjOgcTIzfFBewCLkZetUcsTBcTMyxWBlNMczcquHOg==
X-Received: by 2002:a17:90b:3849:b0:1dc:b686:34e2 with SMTP id nl9-20020a17090b384900b001dcb68634e2mr2086847pjb.164.1653563224928;
        Thu, 26 May 2022 04:07:04 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id j11-20020aa7928b000000b0050dc7628133sm1254993pfa.13.2022.05.26.04.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 04:07:04 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miaoqian Lin <linmq006@gmail.com>,
	Corentin Labbe <clabbe@baylibre.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: partitions: Fix refcount leak in parse_redboot_of
Date: Thu, 26 May 2022 15:06:49 +0400
Message-Id: <20220526110652.64849-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_040705_895312_357A27AE 
X-CRM114-Status: GOOD (  10.76  )
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

of_get_child_by_name() returns a node pointer with refcount
incremented, we should use of_node_put() on it when not need anymore.
Add missing of_node_put() to avoid refcount leak.

Fixes: 237960880960 ("mtd: partitions: redboot: seek fis-index-block in the right node")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/mtd/parsers/redboot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/parsers/redboot.c b/drivers/mtd/parsers/redboot.c
index feb44a573d44..a16b42a88581 100644
--- a/drivers/mtd/parsers/redboot.c
+++ b/drivers/mtd/parsers/redboot.c
@@ -58,6 +58,7 @@ static void parse_redboot_of(struct mtd_info *master)
 		return;
 
 	ret = of_property_read_u32(npart, "fis-index-block", &dirblock);
+	of_node_put(npart);
 	if (ret)
 		return;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
