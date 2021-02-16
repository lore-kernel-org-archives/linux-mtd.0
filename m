Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF95C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 19:57:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F6D564E79
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 19:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F6D564E79
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6q96H9HheIyIkNgZ6pk5OJHXsKCL/3Zx3sHAWlBELhM=; b=QDD7gCp/bXw238y5WwJwFRC+W
	pwi/vGpLDrAkrDWedmI4HdKnuBoiixW1eICIg5hL7IyzRjmfRPa+fbmDyO80QF3QwV4pkxlF1xGMt
	+26A1Y30Eb8/HhREwe62eQ9CWWyeLm6wbY2TDM/Q4CWyCNgefMNPjeV6KfSum/UKpr5FsCoXr+Ez7
	TjVWVSNSy/wAAj8A4T52bGbIGOZwsMfVqKEF7mjnRWszLoGDomg1s6HmAI+oSxd/UkPQbgW/9MwA3
	hNRZ6qC3vZBVSU0frRfTipF3P7RcJa3gJC/BJ/3aUAdiLacg5C41Scf2eXqrJuY0k9wUc0wR8nl+v
	SUVfVbYQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC6SZ-0006Vn-77; Tue, 16 Feb 2021 19:56:35 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC6SX-0006VP-5J
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 19:56:33 +0000
Received: by mail-ej1-x629.google.com with SMTP id i23so12305683ejg.10
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 11:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gTKUWEdr7X7gHT2/c0rh/4HOUp41ym8Za7G+Wwf9Lwk=;
 b=jzGuKPTMZQWNehBBdJksfFwA4UOge6d9q760lIxNyncm7nBdfugSgxT1Keg1HPzAGd
 JLTkJogzs3pxn3/srZQRlM9pKm51nUl1kC4rxUo5QDMbTY5n3zVLepdEOytL2FUre2Oq
 ojgUAT6EOzqAFDUj3t+wJcw536Kuqg0NisJaSSSsLq+H/LMKkUpR3X5NmJ79Gh5VCXx2
 000XzNjAt7yUQ+q/cwGySF6KRhgbUZyPDQ7tGfPHLfnWkpnVsWwlossT9gjdsMktQD3H
 SCL5QVA+TqcmyT8SzfQ+cd8c1ANJv/41oqptoBynUPMcsX1gzKIyiRrs0LS0IbH24o2P
 uUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gTKUWEdr7X7gHT2/c0rh/4HOUp41ym8Za7G+Wwf9Lwk=;
 b=AiPZnZnFkErtKXLXgc0AfvCuRbErMF/ypTIh52tj+MQqFouPhOilNqtLf/ZKqrP0Fe
 IqmDWYfTK3HXGpi79Mw/Sxffy4lT9GRiqF3HenTFNXQS2RZkB1RidPWHlyNrNijPo50E
 aV8sFicQNFhb3miJbezKfVfcgu7vAoVL4H4+54AONu6gN+GBVBt1AKPO1XbcJmBeUYkL
 Nke+v8VvfVuBLismAaer7wPrnPq6AsrqXXDn4m/B5E8WO1fKbgrOCcewL1gfaLeBquG4
 Iidan1pRTonocagX8gGg4PzUzgtiDyXnvdb6I1aAAQAU961hAy3f5QjiCyciwKGbhUky
 q31w==
X-Gm-Message-State: AOAM531qT03GjxOc2eEfTox8rQ8qTHsVaqQl9IPwsxB0+IaET3ee+Tqq
 3xYgoNW03HgmGVkUGMstxxs=
X-Google-Smtp-Source: ABdhPJzK70XRIZgLLT7o/B2o/FVR+4gONsXyljCh7z9pr7UcUcn/7nBvSDLpE9BN9tCvYHYZsl0Ihg==
X-Received: by 2002:a17:906:c1c1:: with SMTP id
 bw1mr22551444ejb.86.1613505391883; 
 Tue, 16 Feb 2021 11:56:31 -0800 (PST)
Received: from Ansuel-xps.localdomain
 (host-87-6-252-11.retail.telecomitalia.it. [87.6.252.11])
 by smtp.googlemail.com with ESMTPSA id rh22sm963332ejb.105.2021.02.16.11.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 11:56:31 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/3] mtd: partitions: ofpart: skip subnodes parse with
 compatible
Date: Tue, 16 Feb 2021 20:56:09 +0100
Message-Id: <20210216195618.27959-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216195618.27959-1-ansuelsmth@gmail.com>
References: <20210216195618.27959-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_145633_243274_79333B72 
X-CRM114-Status: GOOD (  14.25  )
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
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Ansuel Smith <ansuelsmth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

If a partitions structure is not used, parse direct subnodes as
fixed-partitions only if a compatible is not found or is of type
fixed-partition. A parser can be used directly on the subnode and
subnodes should not be parsed as fixed-partitions by default.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/parsers/ofpart.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/mtd/parsers/ofpart.c b/drivers/mtd/parsers/ofpart.c
index daf507c123e6..4b363dd0311c 100644
--- a/drivers/mtd/parsers/ofpart.c
+++ b/drivers/mtd/parsers/ofpart.c
@@ -50,6 +50,11 @@ static int parse_fixed_partitions(struct mtd_info *master,
 			 master->name, mtd_node);
 		ofpart_node = mtd_node;
 		dedicated = false;
+
+		/* Skip parsing direct subnodes if a compatible is found and is not fixed-partitions */
+		if (node_has_compatible(ofpart_node) &&
+		    !of_device_is_compatible(ofpart_node, "fixed-partitions"))
+			return 0;
 	} else if (!of_device_is_compatible(ofpart_node, "fixed-partitions")) {
 		/* The 'partitions' subnode might be used by another parser */
 		return 0;
-- 
2.30.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
