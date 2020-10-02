Return-Path: <SRS0=/HUW=DJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ABE6C4363D
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 05:19:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8881A206C3
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 05:19:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gAmGT2Vp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PYOS/XHc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8881A206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Si6oCTKK9q7Oa1OyjSXIR9TWYmWWWKgtFAUZ8xpb0/o=; b=gAmGT2Vpg/FMTOZr4s38Zgs0x
	F2GX0SzP1JPO1upF01enXYXpluXRDKP6VoDwr8N9ox7/tgJT5wsDRloj3ZETdW1gbA9hQprRvqF2O
	GrWqdcBVRdansvfreaKj3mckoeSBCLuju3Sp6BghTJPCdbB2e/le/SyU4L7sG9RcabBIPgHWOB2u3
	GVW9vNbIkOK8eR2NuttOOjTOPvWxksMoZRIorG1cD0TgJfO++yJleMz+O/0s4xoxZpYMKxScucSX8
	4dc/xf6PE75OaElWsNlmVWnLA+gjJiq2IgVx9ckpxFr9+qO4lyAgAg83xgXz+5KmjgZNv+Vpo6IuM
	iCM38faMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kODTK-0004uf-0Q; Fri, 02 Oct 2020 05:19:10 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kODTG-0004tI-A8
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2020 05:19:07 +0000
Received: by mail-pj1-x1041.google.com with SMTP id t7so156454pjd.3
 for <linux-mtd@lists.infradead.org>; Thu, 01 Oct 2020 22:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3/zj3dNti5YvADXKYc6YTzZCqNgun3fyg1tX6KTQn3o=;
 b=PYOS/XHcmIEeXR+29OOfYNVQxHUoz/xfKz3mPktHE0DnT92mOpN2V5vZ0+o2aW2Mdy
 tzZUpyQQW7qVGEMtwGlS+r0ghaw8ebeitR6SarjtdXKXmSCJfsAs9gTeBi4f+UiQt0xv
 Xflzts2F+8be83W5eh9Cmi3T290OyMCM7B0TsQ03WR8+uBN9fxnXPPi3psc+0sPproYb
 oiBt5/1fLWKevqMzyZcu1xQw6uOVviPExvtoLn1z/O/1R87Cisk4JZIQR/a9CVpmwRgE
 E8/yAa88rFs2Q6um0Q8TS4bD71udUhyDgV2aBU3xwrpDd5fjQf89cSS0Zgn6fV2kukhn
 nz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3/zj3dNti5YvADXKYc6YTzZCqNgun3fyg1tX6KTQn3o=;
 b=j74nR6iV4HZd8qY3qyclnVKY+aK9f1msnvMtRhKlqJ/Q7awFrcJCVbczu/pcuUbmSB
 kX8uwcLMjmw6pHvIVelvWzqHSNl/wKuALZDUt6b/D4OFo9qCQab00rCpATW/gvgmS7bR
 mahdtGWqoiXOdTz3hpZNgJYTWcxRdoqL1QxCkWnbjkPvbtDrw2eQRhhh2TyE83MX8+Js
 i9pa7VtUCYUOIA1YmCCWvSM6dzfYNKbk6qf9ycCsVOnx63PvIXXJDipXIZ9xDheEPLvn
 CDAdqJASkPG9A/VIQFc0ZNuKGkF9mBwdXBosjIbF1fCUdqo7rJOWymjGkc7auL05/bSd
 vb4g==
X-Gm-Message-State: AOAM5335cyjiN5R+FXGEVLQPOciibQJywRWijXekBrvGl7aNj5tdQdCo
 gi98E3QgC7UiXhycMUrEstYbY5UBd6Jcgg==
X-Google-Smtp-Source: ABdhPJxYHk0afXyZh6nRKmQBV6vaFFxKQBXyeCZblmmpHXBqpGz7JDuTlvTmMF8mJbxtWiMgFlFZ/g==
X-Received: by 2002:a17:90a:6a0e:: with SMTP id
 t14mr862389pjj.97.1601615943348; 
 Thu, 01 Oct 2020 22:19:03 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id s66sm380773pfc.159.2020.10.01.22.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 22:19:02 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH 4/4] mtd: spi-nor: core: Add erase size check for erase
 command initialization
Date: Fri,  2 Oct 2020 14:18:02 +0900
Message-Id: <13d47e8d8991b8a7fd8cc7b9e2a5319c56df35cc.1601612872.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
References: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_011906_422636_7DBC3E74 
X-CRM114-Status: GOOD (  13.31  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 Bacem.Daassi@infineon.com, tkuw584924@gmail.com, miquel.raynal@bootlin.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>

Even if erase type is same as previous region, erase size can be different
if the previous region is overlaid region. Since 'region->size' is assigned
to 'cmd->size' for overlaid region, comparing 'erase->size' and 'cmd->size'
can detect previous overlaid region.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index c7d5c86905fa..a560e8ce13cd 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1364,6 +1364,7 @@ static int spi_nor_init_erase_cmd_list(struct spi_nor *nor,
 			goto destroy_erase_cmd_list;
 
 		if (prev_erase != erase ||
+		    erase->size != cmd->size ||
 		    region->offset & SNOR_OVERLAID_REGION) {
 			cmd = spi_nor_init_erase_cmd(region, erase);
 			if (IS_ERR(cmd)) {
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
