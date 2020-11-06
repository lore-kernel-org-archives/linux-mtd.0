Return-Path: <SRS0=gQDT=EM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E294C2D0A3
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:39:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A3FF20B80
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2020 21:39:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QHMCZfpE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zCmBXWoZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A3FF20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RlXXchyRQEZZcaZqSiooFaDc8K98hvNj5TPVnE7Pr3g=; b=QHMCZfpEW+LrrfeQnBxcnaSxa
	m7C+IuMX4tXiI85mmGNgL7LHKHmkTWhKSp4KCX5o2xjcIpwLjbymfJbPIPHLbQgWvfnzarfFXO38f
	YUXe+nM3jJoOu94t4YjC8iCpYXY6cZ+7R2bFX8i6Q321+42xMiYrfJ/RCRoE5AOFXLSoL02aK1HcO
	EZlCR14f8rlXd/H2VigGtqqhbdzN4LyoQPPdAE38dppIRdeWKSRTh+Z8OQV7JvVBREis5trd1Thyo
	HA6gCoyb9wScypaiiH7iuLkFdJosEy+dokht00iOIhru/KHJNhSB6VONdmQ+FrQIH4SJs8FJCzQWA
	oi4ajJBIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kb9R4-00034X-4v; Fri, 06 Nov 2020 21:38:18 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kb9Q3-0002bv-Mk
 for linux-mtd@lists.infradead.org; Fri, 06 Nov 2020 21:37:21 +0000
Received: by mail-wr1-x442.google.com with SMTP id w1so2768825wrm.4
 for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2020 13:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWKR6uPZUpsHw9fLiQN+tCUhIOQtuUG869jNO4i86ZY=;
 b=zCmBXWoZlo8vnNneonA3NxVse4nc66IFq3VJno4tNAO9re9sUKd3L+Z0guEB98fPy8
 FXZetQdRlCWWl9rFiJQ3R+KeyJRs6Q/Z2dderjA8IfoAJGeW8LLrqnCaqhU596rbt3y7
 +c/KIIa7L7NTs39+FFknisOw843ETmBr/7dgtFzQUcRFxtSbbCdGVu4zKXJcO0ZycnNq
 M8ZcObc29z8SeR5e2m9PZajksMspnAxoA1waBuVq8MxsOiykte5wSO4cAJyOvldrxnIT
 sFFWlVHie1kacdJh4CN/bktqpiBcbAO5QTQEeoQULugFILLEPeoG8UJ32hbXOWqSnI/j
 fsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWKR6uPZUpsHw9fLiQN+tCUhIOQtuUG869jNO4i86ZY=;
 b=ukgvsgOb9ii7+shDBeR6WW4ymMuh0yNWR6SVayOgbTlnYT8K8CQKvmn7U1RnCwjIBW
 GyU5DZUgq7cZqhMNdL4JhRQGYzdgQDHY7mJU+gzZtrP/7yBJxWzyKi9RDV/J9H+OcN6J
 lHv52D7FIcygo+3FfcqgJsTCbWplCVEwT3xnoEzVfHLFdeXaMiAuiqB1TaOER+z8b3OE
 YNv8R7/l6UETuvLa7ptDx0ga5SnyEUQwmjPLMsJg0fMUDJ7+QQw9USyTOPmolXW9Qdvs
 JD5YLzeVZbcrLMzUI3oTLje7wNcrJFrMGA1626452dNVrJWWm1tmD6MASpy6MX1lNHvT
 dEzg==
X-Gm-Message-State: AOAM533RQE/kbLiFNFau55dM1zg2R+JnRJlnlZIvZbHGxm4V0n7tNqLc
 +JNy1EBAhMMOVL2cu1gCrnymXA==
X-Google-Smtp-Source: ABdhPJweVRaOimv0frmutNHY+oLFUNaM/mHyKdwpisa5upsBks7KcYIHwklqCW0McKts/tHL+IxIfA==
X-Received: by 2002:adf:ec47:: with SMTP id w7mr4705484wrn.253.1604698634708; 
 Fri, 06 Nov 2020 13:37:14 -0800 (PST)
Received: from dell.default ([91.110.221.236])
 by smtp.gmail.com with ESMTPSA id d16sm3984942wrw.17.2020.11.06.13.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 13:37:14 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 11/23] mtd: ubi: eba: Fix a couple of misdocumentation
 issues
Date: Fri,  6 Nov 2020 21:36:43 +0000
Message-Id: <20201106213655.1838861-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106213655.1838861-1-lee.jones@linaro.org>
References: <20201106213655.1838861-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_163715_818229_DD76FD3A 
X-CRM114-Status: GOOD (  15.70  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Fixes the following W=1 kernel build warning(s):

 drivers/mtd/ubi/eba.c:1304: warning: Function parameter or member 'vidb' not described in 'ubi_eba_copy_leb'
 drivers/mtd/ubi/eba.c:1304: warning: Excess function parameter 'vid_hdr' description in 'ubi_eba_copy_leb'
 drivers/mtd/ubi/eba.c:1483: warning: Function parameter or member 'ai' not described in 'print_rsvd_warning'

Cc: Richard Weinberger <richard@nod.at>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/ubi/eba.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
index 0edecfdbd01f3..892494c8cb7c7 100644
--- a/drivers/mtd/ubi/eba.c
+++ b/drivers/mtd/ubi/eba.c
@@ -1290,7 +1290,7 @@ static int is_error_sane(int err)
  * @ubi: UBI device description object
  * @from: physical eraseblock number from where to copy
  * @to: physical eraseblock number where to copy
- * @vid_hdr: VID header of the @from physical eraseblock
+ * @vidb: data structure from where the VID header is derived
  *
  * This function copies logical eraseblock from physical eraseblock @from to
  * physical eraseblock @to. The @vid_hdr buffer may be changed by this
@@ -1463,6 +1463,7 @@ int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
 /**
  * print_rsvd_warning - warn about not having enough reserved PEBs.
  * @ubi: UBI device description object
+ * @ai: UBI attach info object
  *
  * This is a helper function for 'ubi_eba_init()' which is called when UBI
  * cannot reserve enough PEBs for bad block handling. This function makes a
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
