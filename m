Return-Path: <SRS0=zJhW=IB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 784BFC433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:14:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01FF064F07
	for <linux-mtd@archiver.kernel.org>; Wed,  3 Mar 2021 16:14:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01FF064F07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/rKNpbrLoD1Cw0iCafyxQQbXMvQ0QW3zKWcsOq2srhA=; b=TyJAMoxdjI9FMoLjAEUoB3ZPj
	j1aQyLkpy00fLqrub2VWzhQ1iNgiw5m4LmQiYPteYpsc2cs1ErE+dVkvikkACfV6+znLCHp8HkKE6
	FnqWuwg9884JZWnHmf6wmGm2i+h4ntsMfLRi5oybtNkS/OmUnCXhXn4OuKackl/HDIEMyvkX2+VTV
	w/HdH0i+9CfbHKcxhicK7X+OE2ucbXPEI/2K+nUSjXlv1ZRhSDfZyDDY3d3ShGjPCxbBRalW+jyrL
	dZJBgohkV7N/xTRHSGf+Yi6rwG6YCMMIW32+/dIS3VKYMKZ7L5MIv6u20ntLPdqiAuPc2Vs+wUeT+
	olg0WgG0Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHU8Q-005YZE-Nu; Wed, 03 Mar 2021 16:14:02 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSp7-005Doo-B5
 for linux-mtd@desiato.infradead.org; Wed, 03 Mar 2021 14:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=m7oz8g4qBib/YKo3cyWxkyrFd1RmlxMZFfZ1/Uas0RU=; b=qvXBziu9mziQaMRqMamqGzxuIC
 jZElaNZ7HvYqfr9ZYlhhODcPBEmlwa6jt/fjX0NjiThITxV8h1iqHdHfQcogchCffTVYsWIpaApzk
 WQkSmhyZE70mevCeZQypCO7uGCaaJmlVLNxUNtGWJbaUK7ulEMPZChaUiDQEreQwez8oQPfFLEIv0
 UzHvhFqLJiBo1/KU19IZ7UgnBhB2vEkBBhEu09JIuJsmv4vRjr5YT6XaR2+oR8kJIOwpg6cja8TUM
 G4fvcAAQlXx8yLgKa9e+lz+Ej5Ag0r7anUK94eGE48Jk+k+hbLbeSOvRHNP5e/i1cw45VwVy11zMM
 bb7E8Zgg==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH55X-00HBJH-7s
 for linux-mtd@lists.infradead.org; Tue, 02 Mar 2021 13:29:25 +0000
Received: by mail-pl1-x630.google.com with SMTP id c16so2561994ply.0
 for <linux-mtd@lists.infradead.org>; Tue, 02 Mar 2021 05:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m7oz8g4qBib/YKo3cyWxkyrFd1RmlxMZFfZ1/Uas0RU=;
 b=yACFu5QX1bnGgYUH4FBE0uTtamgfft1DFQ7l1w0A4JJ5ZhVafDNQDrhomC7sqsSj5z
 78TbMpBE0sRpryLTnlzIrpvCQL108o8rYSbzd/zIWut1l+Krqq/RrAcRNQXNHYnjrE/U
 MV/zx9mafCzEnTr1i7V/vHFywoRVk68kT+pZoruldys620xohe+eHVI4HVUsx1NItCKW
 fUU5TP684i75vAao3HY2VoG+ebEcmQWIjftRiOMSrMgf3XpTk3/43Z9ss4z6mD40kydk
 9Uva377Dgkz0nh9JURq8fP5xo19ETK3TFXFxReul0wyTdRd8xNl2n/LhNDweZG2z8AHj
 5bwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m7oz8g4qBib/YKo3cyWxkyrFd1RmlxMZFfZ1/Uas0RU=;
 b=B0mx8jwwY9thmoGS1W71aWuFfl1mbghT4o1eLAsKAM753V3n26lMrCtskIkYqrnVDc
 iCppamMoVJ0/dXE7gwdW7gJK63YZOh6QgG5DyeTQnMJ8/L/hW9SRHmWgWAkAcYh9vnKZ
 dbnhxW6T/GsB8WLjGso3EScw6ZyCJn2ezp5F/2fpUUGDP9IjstYNtjCoauova12eGdqt
 aTalSHG7Btqn6iM8itnBDLepYD8otSRMMJoB3f7D7haKdQffZ+3+d4PGe6uyk22TrZbS
 OFNiyUzFyMLIKSl1uWM7d4vHHa9sB9Jppr45ojqnSL87OOth38xvnxQahms3CvcIlw92
 ldGA==
X-Gm-Message-State: AOAM532zhZ3bDrUFVV0YVc2eDmopSGhuws7JU9LkrBFzKQH6tny8OO6G
 lEhaXWe8xJE8mk1DqpoVrUZZ
X-Google-Smtp-Source: ABdhPJxsZ1SDOQ37H4yNVcYg4KGLYNp4XCJ/VhPwDSwRAJMYPm0N8sKUxQ/KrP+t6cdjsSQoNed4Jw==
X-Received: by 2002:a17:90a:a794:: with SMTP id
 f20mr4264897pjq.185.1614691696400; 
 Tue, 02 Mar 2021 05:28:16 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.74])
 by smtp.gmail.com with ESMTPSA id w1sm13027454pgs.15.2021.03.02.05.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:28:15 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 Daniele.Palmas@telit.com, bjorn.andersson@linaro.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/2] mtd: Handle possible -EPROBE_DEFER from
 parse_mtd_partitions()
Date: Tue,  2 Mar 2021 18:57:56 +0530
Message-Id: <20210302132757.225395-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
References: <20210302132757.225395-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_132925_691796_AEC9E7CD 
X-CRM114-Status: GOOD (  15.85  )
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

There are chances that the parse_mtd_partitions() function will return
-EPROBE_DEFER in mtd_device_parse_register(). This might happen when
the dependency is not available for the parser. For instance, on SDX55
the MTD_QCOMSMEM_PARTS parser depends on the QCOM_SMEM driver to parse
the partitions defined in the shared memory region. With the current
flow, the error returned from parse_mtd_partitions() will be discarded
in favor of trying to add the fallback partition.

This will prevent the driver to end up in probe deferred pool and the
partitions won't be parsed even after the QCOM_SMEM driver is available.

Fix this issue by bailing out of mtd_device_parse_register() when
-EPROBE_DEFER error is returned from parse_mtd_partitions() function and
propagate the error code to the driver core for probing later.

Fixes: 5ac67ce36cfe ("mtd: move code adding (registering) partitions to the parse_mtd_partitions()")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/mtdcore.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 2d6423d89a17..d97ddc65b5d4 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -820,6 +820,9 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 
 	/* Prefer parsed partitions over driver-provided fallback */
 	ret = parse_mtd_partitions(mtd, types, parser_data);
+	if (ret == -EPROBE_DEFER)
+		goto out;
+
 	if (ret > 0)
 		ret = 0;
 	else if (nr_parts)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
