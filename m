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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC47CC4363D
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 05:20:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FC74206C3
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2020 05:20:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RJGEoMPU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tB903S9d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8FC74206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IS72uJgcCwKWJY8fO9Q5lBzBBEBWuc30JuX4mzChcr4=; b=RJGEoMPUISK72sTEhvHF6Nf24
	vAxmtDlXOIVNEBAt8qDa40ca5pTVymbJiioDS5jyq11LSwbp81OVCrSdTzum5SfefwaDzj9lXoHSF
	PZ97Y7kWd90GjzSNKamySxmUdpz05IjXMI3sfZ8g6APCmQqY0sU65Ke2BsvjTi9qg9JPAVdjSWmsj
	TLRR7t5/lhn+Zz37qC4VqjKHM6tn4G2iErDf1OhWOUQj0Cf+ICxnhHfjYb71Im5+c6FYPiVeqgOZT
	Eag7h6jl07kS+MHgoLjkFJcvwivI1dJwNSy3D0J25kpz5q3b+uJUvBpfyJ0IDdfbpMp9etIeje9i5
	4KQl7NmwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kODTI-0004uL-MQ; Fri, 02 Oct 2020 05:19:08 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kODTD-0004su-4q
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2020 05:19:04 +0000
Received: by mail-pg1-x542.google.com with SMTP id q18so88551pgk.7
 for <linux-mtd@lists.infradead.org>; Thu, 01 Oct 2020 22:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4E3IS7TggbFV7hmwrBoh7Uq8+hUtMQHnOwBge5NYzyI=;
 b=tB903S9dfsbluBdP8Xip8/YqYUZdbh0qPkcVIZ/YSfJksNIEq3qVLgrTV+v/Y1YkDc
 Xzq01zemu2h6WSxGrPLo1UJTmt5s79PDH08jPMo6VFNs5h/mTwjtkuf0Sp2BEUGND12p
 61FALDlC9HdU41SwnpLmSqAQsaM3VWoKOqwNSKhQycHe9h35iFZJKBZCMx26xLhdtzqd
 V8SX2KHj7CjFIdiOO0UnzeoW3GqU9UmGT4bW3597iU2y4QWpPAU67Su3IUebSbzIPQDA
 /H49JjNBBnslb2OMaJBjYvZl14ixp3oabaZc49uYefkqGIuEavuPL8oh820QR6wE4AsF
 b2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4E3IS7TggbFV7hmwrBoh7Uq8+hUtMQHnOwBge5NYzyI=;
 b=XFYsIBsKVZYTcikSmguGsQub0rMlyQ2R+7TLaQfmJgYO5PveekpTZ7OhtkTX5hpeAC
 ErphDxRYguScVNmBZDF4xP8vo+nuTGtyBJRlTXe2cUXfoxzKWiIui1NSYZD2l35oiW68
 8oFkF4RcxDgQasVWshcG+9G25KSNcqGsLoy9hBmeuFQWuAPiMv/cD31bsi1tHHemszYh
 1aqDAjh5k8kF0BdBuoHAaKuKO9QEXZe+Y50SCb4fE747nSRhJQUkIsa39E9w7dMZ2gIy
 YA0p9PqLlTLVkkvmd8HHH/WrfYOKNM5cW0sMVQgnVDUhp6rttzdaocEmuXosBMClNtHX
 IOLA==
X-Gm-Message-State: AOAM533u2InEuQbg4lmM3EtknFNNf4EL8XxYUfii/lY5K6MbBbMVvPYt
 Zhmg4YmL2gvO0up3CahZ2f4aqk72hBP+yA==
X-Google-Smtp-Source: ABdhPJzdQBX8CnE5VO7GhrZCTacAtEpUi6VgO+qwwKpuA9ydCIT/8t8zGlfPTJfQVdQLdCRAQlgP+w==
X-Received: by 2002:a62:52ce:0:b029:13e:50c8:499b with SMTP id
 g197-20020a6252ce0000b029013e50c8499bmr805421pfb.14.1601615940852; 
 Thu, 01 Oct 2020 22:19:00 -0700 (PDT)
Received: from ISCNPF1JZGWX.infineon.com
 (zz20174137476F6254EB.userreverse.dion.ne.jp. [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id s66sm380773pfc.159.2020.10.01.22.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 22:19:00 -0700 (PDT)
From: tkuw584924@gmail.com
X-Google-Original-From: Takahiro.Kuwano@infineon.com
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/4] mtd: spi-nor: core: Fix erase type discovery for overlaid
 region
Date: Fri,  2 Oct 2020 14:18:01 +0900
Message-Id: <fa5d8b944a5cca488ac54ba37c95e775ac2deb34.1601612872.git.Takahiro.Kuwano@infineon.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
References: <cover.1601612872.git.Takahiro.Kuwano@infineon.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_011903_213414_0E5E8D3D 
X-CRM114-Status: GOOD (  12.88  )
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

For overlaid regions, 'region->size' is assined to 'cmd->size' later in
spi_nor_init_erase_cmd() so 'erase->size' can be greater than 'len'.

Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
---
 drivers/mtd/spi-nor/core.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 0369d98b2d12..c7d5c86905fa 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -1212,14 +1212,15 @@ spi_nor_find_best_erase_type(const struct spi_nor_erase_map *map,
 
 		erase = &map->erase_type[i];
 
+		/* Alignment is not mandatory for overlaid regions */
+		if (region->offset & SNOR_OVERLAID_REGION &&
+		    region->size <= len)
+			return erase;
+
 		/* Don't erase more than what the user has asked for. */
 		if (erase->size > len)
 			continue;
 
-		/* Alignment is not mandatory for overlaid regions */
-		if (region->offset & SNOR_OVERLAID_REGION)
-			return erase;
-
 		spi_nor_div_by_erase_size(erase, addr, &rem);
 		if (rem)
 			continue;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
