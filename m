Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8B9C6FA99
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 13:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=95NRR6mDqtKsBCoeMLvsXqBcX1Vvr6QSYLTt7ja1lHg=; b=RV4Ps5L2TNMaRi
	+7tr7YTv2gADjyBJ1ZhEcQ2RldVxJSgZ4c6A32UZX8PUNjTxD1eVT8f5/PJD54KkDLxGlz4d3T9Tn
	seu5YFi4G47GaR/C75Sc/CiZB4Ds+01WqZ0px/Jhn3zM8vWALzNpMO2tjnlbie3Klzvzdg7NWkrlT
	YafZLb9BNpYi78Frvch3ZbCmuvODJtLGpV6MF61cmsyghi2GvifkKSkZFaJn6J2GIdjM+sJHb9vCn
	ZuoWP0FW+0OD06nWIP6A5Dw38MehWqIAZh8g2HXa/NUhcuvpXX2/eeIP6gdubOaSs5kVchjCnOCZL
	V0B7GElUIiacKwcrtXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZB9n-00CxeX-Gk; Mon, 06 Mar 2023 13:45:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZB9a-00Cxbd-Qz
	for linux-mtd@bombadil.infradead.org; Mon, 06 Mar 2023 13:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3jggkbUJ5OxlpR1kYN/iXcmteZ/OMssiGsaodrVJEL4=; b=EFxvHkyP06HKNN9MUOVqgZzCuE
	yEGlMtiGRQwvoeq658LrSKecwWod/jiQzlE88NWkt0MqlQJE617CFExWf6EqSj7SY87/O8OzOgT0F
	UriX7IRtFocwwsgBkBoO3f07vDsqMMV7iIykeIgKUO/HC91f1QX/pekJ9k4qh/43VR+3Dovhao7Hb
	PnI15effBmHw9hIc9SoQca7ScKf1bclDEDG/J9GcgrZk5gtrYm4A5pmGbBQzjdDV+3csXWtYyyD3P
	cS894quD+1HAdWYYVM1IFg31vcCjGCFzAk4aVN3jzODjrY2odDELwhw+NqqUDKDWHA28TqE1GAot+
	hLAYpltQ==;
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZAQ3-00Gg38-2u
	for linux-mtd@lists.infradead.org;
	Mon, 06 Mar 2023 12:58:26 +0000
Received: from mwalle01.kontron.local. (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 6DDAC164C;
	Mon,  6 Mar 2023 13:58:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678107499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3jggkbUJ5OxlpR1kYN/iXcmteZ/OMssiGsaodrVJEL4=;
	b=hXJNDQSoSWkg00rCZBI4b8JalYiJb2rgm3Okc+AJ/JdLMTlY8vz0QWVssJdvq951+qV6Kw
	WrO55vXSj6jQh2g3EybN6mYt8/nuRlCPRwcBGC6zlAdXOAdyrU54J9j5T4+NKKvXee83x6
	WTZq+NJ6iHRVZEmu341ddw/jmRCxG6iSSZX3xh0cOKohRVi/aStX9Nv9kVDki4Zel8B7+j
	eZsy2kee3/pGOwVVfu6d9UMlNgAM8zqiOTDF01qNzHkSZTrs+ftCoEgTUvsB/uKpyiQHkE
	77+rCVi4vAvi7glMGN/hJpybw7s3BSS6wf+CiLffcdTAjKX/NHtyXdreWNQvWQ==
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <michael@walle.cc>,
	stable@vger.kernel.org
Subject: [PATCH 3/4] mtd: core: fix error path for nvmem provider
Date: Mon,  6 Mar 2023 13:58:04 +0100
Message-Id: <20230306125805.678668-3-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230306125805.678668-1-michael@walle.cc>
References: <20230306125805.678668-1-michael@walle.cc>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_125824_300102_6DD2EBBA 
X-CRM114-Status: GOOD (  12.84  )
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

If mtd_otp_nvmem_add() fails, the partitions won't be removed
because there is simply no call to del_mtd_partitions().
Unfortunately, add_mtd_partitions() will print all partitions to
the kernel console. If mtd_otp_nvmem_add() returns -EPROBE_DEFER
this would print the partitions multiple times to the kernel
console. Instead move mtd_otp_nvmem_add() to the beginning of the
function.

Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/mtd/mtdcore.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 4a19e69fb77b..d6675bf03557 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1022,10 +1022,14 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 
 	mtd_set_dev_defaults(mtd);
 
+	ret = mtd_otp_nvmem_add(mtd);
+	if (ret)
+		goto out;
+
 	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
 		ret = add_mtd_device(mtd);
 		if (ret)
-			return ret;
+			goto out;
 	}
 
 	/* Prefer parsed partitions over driver-provided fallback */
@@ -1060,9 +1064,12 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		register_reboot_notifier(&mtd->reboot_notifier);
 	}
 
-	ret = mtd_otp_nvmem_add(mtd);
-
 out:
+	if (ret) {
+		nvmem_unregister(mtd->otp_user_nvmem);
+		nvmem_unregister(mtd->otp_factory_nvmem);
+	}
+
 	if (ret && device_is_registered(&mtd->dev))
 		del_mtd_device(mtd);
 
-- 
2.30.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
