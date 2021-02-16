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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32743C433E0
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 21:27:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB99064D99
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 21:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB99064D99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6q96H9HheIyIkNgZ6pk5OJHXsKCL/3Zx3sHAWlBELhM=; b=01MnkMDFzEBJgeJMOWtFs2qqI
	qjC+L61pQ0Ja+MJcy+K1kz/ZBLUQWezY9WxjZf3u0BKnysnbsqK8W3ys48KgDN6cmzE8TMHXljBif
	0z3v0bfIK+nZTfdBa6gSRd1TYbBTNvFMEy9B1rZPSx2QbSj9S8s8r2BDmWKgBU0Y81f28d8mqjLpq
	s+bhjIQvhUJDGW7WS62ASatZ/QoW7UckHH9elcAqYxr7rrVDZjq7LF+Q7f231TukqiRY99Z5/5XEX
	+Kj325sH/zbQOTp3+PB1lsGYLPEsKPEiELz46jETTAqsh0PUq20Q3O9x/5dgRyNEq7vHZQ8DXZH+w
	VNtggju/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC7s6-0004Y7-6P; Tue, 16 Feb 2021 21:27:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC7s4-0004XV-8m
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 21:27:01 +0000
Received: by mail-wr1-x431.google.com with SMTP id v14so15051455wro.7
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 13:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gTKUWEdr7X7gHT2/c0rh/4HOUp41ym8Za7G+Wwf9Lwk=;
 b=H7N31piULCOG4p3kVh8VEIuac2d288j8dXkSoYRRVRXCpfTrJ8LSuVH+sv+wqjaRgm
 JKmEI0x7hme53FbBwsJ52shL93m6Ne341jtSUlUD78GDni7Yt8ZGmjJjdGzQIhSewRw/
 bG23eubM2pktJY/ePOXFOTat5SoALpSnW8rCvhfYtPUyYPZRvxDUrKl3gEoUy7bnQQWK
 GQKctLHu31M9ygX5YwaNu4I4tOnAYTdpbLFZo67bPV3HseTrTo5Lx8Afc8DsbSYqojAv
 MBHc1aWsiiXz6Uwty36AEG9Xi6AYFEJWoVeHOymKpN6LvFG6UWD1pdfH5Kk2cwOYFoV6
 Ft2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gTKUWEdr7X7gHT2/c0rh/4HOUp41ym8Za7G+Wwf9Lwk=;
 b=dUjc3b0J1K/4BmTzOOJagwRRXQWFHhYqrEGvHTB/oCwz269twIKIqcjkcOCfe+SRIZ
 v5KN8M6SnwIw5o9g5ABD8aF16mV3WXHYJ2x6bIpVFyYlWXfxrxhArBarJA+uqnfy/LqT
 lFgYwinkRXlrALySCeeiMCY7nxmhINR273lECkKDeJ+8XSXptTwZz/m4k4NcvgfaTWJy
 IahHhbgzM8cJqR612RRky4JilvMNl0U4qYZS5JX86FGJ1YS2NP2/Cd0dyAtIHLfi+2jD
 kjtKfzPKWMY974h10ryrK34w57m5sOqpmMTO9siWOyFKLGz1ubDgMKGq2ofR5VjAC7le
 1bmA==
X-Gm-Message-State: AOAM530TYGzMlmCtvwO5qF8qA+q0sgQ0EDpKKhiPtSZ/Sng1mmmfB0SO
 jfMXuSebxdVIUK5MSbYhwcc=
X-Google-Smtp-Source: ABdhPJywo7VmsW32KITYWmVvyUWc2zBCwLyTACvX3mOy6RmpF6iQNI6DbIv8VsnZrxqhev97rJHmBw==
X-Received: by 2002:adf:edc8:: with SMTP id v8mr25548852wro.330.1613510817997; 
 Tue, 16 Feb 2021 13:26:57 -0800 (PST)
Received: from Ansuel-xps.localdomain
 (host-87-6-252-11.retail.telecomitalia.it. [87.6.252.11])
 by smtp.googlemail.com with ESMTPSA id s14sm7132182wmj.23.2021.02.16.13.26.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 13:26:57 -0800 (PST)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: [PATCH v2 1/3] mtd: partitions: ofpart: skip subnodes parse with
 compatible
Date: Tue, 16 Feb 2021 22:26:26 +0100
Message-Id: <20210216212638.28382-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210216212638.28382-1-ansuelsmth@gmail.com>
References: <20210216212638.28382-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_162700_331945_FD76F791 
X-CRM114-Status: GOOD (  14.75  )
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
