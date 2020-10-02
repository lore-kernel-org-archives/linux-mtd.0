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
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1037C4727D
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 05:20:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DEE820874
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 05:20:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OsVnD33N";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GvDhrh4k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DEE820874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=18EjKgQ4+Rf6Y7w7fVm2U4wei3b7CtF7C3oy0aJWGAY=; b=OsVnD33NViY/xWb8NBKTHZCZm
	WTxn7abiHL/qMQQWhwXix3zSD/FsEXKECpgIUd7IAhRXFYjAFZ9zsD3GAhWDklpra7RQGiBMUod0K
	ErE53tfD66X6joAoiGo4/u+mi3FypSM1ZAr1r8uQwfT12vincf3SEykxzqGVmp5EMX4mnod91d7hc
	WJ8IlkKVaRRA1wqLMYj+80hk7YDbEBHH7C4EaEVQforvMtv2jzERLp6zXo8U/KFBv/Uk/qny2RLpX
	OW17LwLdELmwFT3xmUuXjBsF3GZPGBfj1Bte0lSXO0tuMxt9TYX+n+iRoWFORDJr3okGPFgJ7c5ts
	pFsyuyLeA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kODTF-0004tT-3x; Fri, 02 Oct 2020 05:19:05 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kODT8-0004rR-HD
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2020 05:18:59 +0000
Received: by mail-pf1-x441.google.com with SMTP id d6so451087pfn.9
 for <linux-mtd@lists.infradead.org>; Thu, 01 Oct 2020 22:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=paQeMns5oqDQQkilLQdqu2fO9TDVm8Z6oGEwa/5oYC0=;
 b=GvDhrh4kiuthNPauPgE9qq9KHn/9h8LoCYtfyNeUjjKFmi18rNcvZk5mpqd+iOCcqA
 CoZiSwxlXkyYTmxIyvpMvKw1ON8wCKmR6zdRkFJuND4pmbcRoA1hT2LXClW8MO1Slm8l
 0NWXrggV+54eSbDVkgUhNmSFVlXalhSDN1rC0g4/wqpPOxkg9nkOhkXEjd6UpkkmNYp1
 YF7eDIbei5R+TDfVVMGHfneQ8awpYsRFLC6KCbGv3AwvQ/YsuBrtru/qxHYIBaLePq/6
 4rFBmFmooWhp7W1iflBimnQVVUTRYL91Hm61oZZ2iz3r6NpnjDNO7ib6Iw+I6JKIRXWs
 UWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=paQeMns5oqDQQkilLQdqu2fO9TDVm8Z6oGEwa/5oYC0=;
 b=avlHVNACmi1G1wGxOhq12tfTPqnEckPghYWdpZVwVNlwad85mXHuQXc8m19EgHyGvU
 H6kMKbgHperW/oZDlJHGTff9BzIu23ueNhRwjYnVKgBx7b/bFPQFT4BBPrOPMml1CTPY
 dE5qBwHgGW3lAtBQdYiZoSj5u8kDAGdWL8AsN2x55K7AuTwUIi4ZQlI/xW6iKWiZ6Q0C
 oNGL5F2pECIzBBeE530nSTDX7JeohJ1AaY207by3bEhT/iRp0EYN8w3uJKRsWzvz5gM0
 tmt4pBrggzUxSZreEAl3gTyQk5JXuqRlg4njN5fNKy/CUFFez61TjoBvH0UpM4c09q5l
 Dvpg==
X-Gm-Message-State: AOAM532HXxRw/tV4vrJGDd7osvb8zXLxU1FFWPg58tE1ljbnTudjGxEc
 s3BXROO6lZ4fJ562k2sbLfOmhZ9F87X99g==
X-Google-Smtp-Source: ABdhPJwSpxEm3J98HWE65RMAW5rm65X5Mrh6StgqeTpVcY2lScOmZ4JRvbiiAJeRkdYhwREHiqwhWw==
X-Received: by 2002:a62:7895:0:b029:152:2640:644f with SMTP id
 t143-20020a6278950000b02901522640644fmr658184pfc.67.1601615935895; 
 Thu, 01 Oct 2020 22:18:55 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id s66sm380773pfc.159.2020.10.01.22.18.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 22:18:55 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH 1/4] mtd: spi-nor: sfdp: Fix wrong erase type bitmask for
 overlaid region
Date: Fri,  2 Oct 2020 14:17:59 +0900
Message-Id: <fd90c40d5b626a1319a78fc2bcee79a8871d4d57.1601612872.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
References: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_011858_582367_17916D68 
X-CRM114-Status: GOOD (  14.37  )
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

At the time spi_nor_region_check_overlay() is called, the erase types are
sorted in ascending order of erase size. The 'erase_type' should be masked
with 'BIT(erase[i].idx)' instead of 'BIT(i)'. 

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/sfdp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
index e2a43d39eb5f..5332345b3cb8 100644
--- a/drivers/mtd/spi-nor/sfdp.c
+++ b/drivers/mtd/spi-nor/sfdp.c
@@ -760,7 +760,7 @@ spi_nor_region_check_overlay(struct spi_nor_erase_region *region,
 	int i;
 
 	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
-		if (!(erase_type & BIT(i)))
+		if (!(erase[i].size && erase_type & BIT(erase[i].idx)))
 			continue;
 		if (region->size & erase[i].size_mask) {
 			spi_nor_region_mark_overlay(region);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
