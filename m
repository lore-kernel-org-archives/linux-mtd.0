Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D03C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 08:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ETgQGQYuXqle4pl9J4SCIdhh17iHjOFSqPL6n5VsNuw=; b=Kfr09QiqwHWsNn
	SX9D0DaBUsbkDAeASfzUHA9dFyyk6VM2g7KhU2vwmby7U/04LXqj3KgIY0v77gDeS5BqX/pRmszou
	zOY5DpcBA8iPPS8pOB/cccC6J4PwbS/N+TTlav6Q+g424Uy/VWHDjufEBoLCNzNGu+SHc6av4IA9L
	B2J91vguis3GjEQMY+YoDpmCeFKEooIsVIry4zB4oLMRaSjHTcE2G7nEv0x+mIPEqUyrx8c/Fukpm
	qEWQ19jlveO8IKH9efb2HNKPqbNVp2b35LM84FLv2UlUDPVXTWmebsW8YRMAj4qLk4dAeDnXhLpQP
	chbHDyLiKABXX2vjGLtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1OSM-00DGZE-6z; Wed, 15 Jun 2022 08:32:54 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1OSJ-00DGWs-Gd
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2022 08:32:52 +0000
Received: by mail-lj1-x232.google.com with SMTP id d18so12439808ljc.4
        for <linux-mtd@lists.infradead.org>; Wed, 15 Jun 2022 01:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JDvsaDbUO3a5wwulXonuEwPj+8gTSub+NsD4SF4rOG4=;
        b=XyZ2Ob8r1nRSFz5xmyuczn6gdDLAf1bZndB9ZNr9EItgNohGpwMDKOZ8AfvyhLaTlE
         SM9ZFFCdwWWHzsSC9mBWpPRpYQuj4BRV/MLW7yWpp2Gb9KoaqzsxcfoyWN+QSa93EYSW
         eMYZLlNu6euNZzIPWyPP7uchIHBZgCVNS9jUurty16ABSp06hli0wgl50BA3yKUKKIDp
         QE2/xNvSLhMItyu2/lx0a3MITW6FU1sM/cHAy/nblvUQXrGZtPbWOcsiBA7iejoPbBHH
         K49rRI9K9xTK8PpOrhGs/NKBKig0anjBHnhjWOALipQ4f+r2XrpsILpUTALPOI+gZVuD
         fqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JDvsaDbUO3a5wwulXonuEwPj+8gTSub+NsD4SF4rOG4=;
        b=sRFV/zwEfaJxsMRQFIk/zhbczC9PWcjPogyYvq8fdyguaHDm5Y7Z+mOIqsc1kye5/W
         OjSz5UlTXBHGaRCfDNWisPixmDRUoeYvWDXLm3accZ+LGGU0xZNup0XFXiShkNcje8Y7
         S/zFWQri1oSQct3OMYercGMiyhIEa0SQL6hE0H81MP271jsbInUiXlAiIZs2bdCBZ11g
         iNq9MBYkIyt6VYU1IwftyZaxuFNyHjrvVPBOt4WnYNg70qhMnusq6+WLRmWTI4O9x7As
         alUjNUmzHROXnHzMWij5ccY7LI+DW4WC7oHm4kXli1cXpkK7p4USbvFnIYjPfja1R5uR
         FJIA==
X-Gm-Message-State: AJIora99t8ICridyiciWGPxUJBQtrfbeqCe+1PcGhLGgrOmOtMi5yN/j
	qw0fLl1O2Cp1b4fRhvkMYwcMhNLB3eE=
X-Google-Smtp-Source: AGRyM1uPeKjRIQ6zp2WYCHCUCe2vAwPC+18sRk0BnIRcdsrgVItEcmcVJV25DvcuB0MEQ3ItdZcV6A==
X-Received: by 2002:a2e:5c86:0:b0:255:7cc7:c904 with SMTP id q128-20020a2e5c86000000b002557cc7c904mr4546926ljb.437.1655281965666;
        Wed, 15 Jun 2022 01:32:45 -0700 (PDT)
Received: from ProDesk.local (dyn-13-cust157.netit.se. [85.89.70.157])
        by smtp.gmail.com with ESMTPSA id t9-20020ac24c09000000b00478772eb18esm1713211lfq.92.2022.06.15.01.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 01:32:45 -0700 (PDT)
From: Alexander Vickberg <wickbergster@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Alexander Vickberg <wickbergster@gmail.com>
Subject: [PATCH] mtd: parsers: ofpart: allow 0xff size cells to denote 'rest-of-flash'
Date: Wed, 15 Jun 2022 10:27:41 +0200
Message-Id: <20220615082741.1081313-1-wickbergster@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_013251_596898_BE1B69E8 
X-CRM114-Status: GOOD (  10.81  )
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

In cmdlinepart it's possible to use '-' as partition size to denote rest of
available flash size. This patch brings this functionality to ofpart. If all
size cells are set to all 0xff's ofpart will use rest of available flash size.

Signed-off-by: Alexander Vickberg <wickbergster@gmail.com>
---
 drivers/mtd/parsers/ofpart_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/parsers/ofpart_core.c b/drivers/mtd/parsers/ofpart_core.c
index 192190c42fc8..33372ba018d8 100644
--- a/drivers/mtd/parsers/ofpart_core.c
+++ b/drivers/mtd/parsers/ofpart_core.c
@@ -133,6 +133,9 @@ static int parse_fixed_partitions(struct mtd_info *master,
 		parts[i].size = of_read_number(reg + a_cells, s_cells);
 		parts[i].of_node = pp;
 
+		if (!memchr_inv(reg + a_cells, 0xff, s_cells<<2))
+			parts[i].size = master->size - parts[i].offset;
+
 		partname = of_get_property(pp, "label", &len);
 		if (!partname)
 			partname = of_get_property(pp, "name", &len);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
