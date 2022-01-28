Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54861C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jan 2022 22:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Lrg3KC3ps1x+IGsMmrtENp5EaxCHtgZ2aC4tDqQ8SJg=; b=QMx
	GB6DH60k4L5KLQUQhu9ENG9fyszWGMXHl3swFqPR1RCruWSOrSg2UVsHsZjGMwirVBU/DGzMXgOlm
	TmzMo9ekFqCgAf49gS0Q1ogM0Pq4z9eks61/Ag6sktnRo9iz7tNnMqLGkJIJTENVorS78CxDcqaSa
	dO7fhVvRi5KHrxcukCnfjQq0P/7Szhduc5z36irHQ0BoNUYqlUf5bR0IWxoTPKUNmgYYmMXiyDLKH
	ivahwlfHye1mTqlVIwt5owbVoxOkyFZ2w3RyTdoBRFM0A0RONMgyUcomAsuq4nQWfTk/97pw34FWG
	m9od5XoAKpgAtfq1mWRrJYoOdGI3jDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDZJy-003e03-Ge; Fri, 28 Jan 2022 22:02:18 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDZJw-003dzR-Lj
 for linux-mtd@lists.infradead.org; Fri, 28 Jan 2022 22:02:17 +0000
Received: by mail-pg1-x54a.google.com with SMTP id
 b9-20020a63e709000000b00362f44b02aeso4050923pgi.17
 for <linux-mtd@lists.infradead.org>; Fri, 28 Jan 2022 14:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=69G4sVrTM6Oebk85axmgqm6tVz3OwOvgPCpKMqCiPco=;
 b=r9CLrnZJeyMD+YWaJkb33H8XK0Rn3mXzmfuhYPQYh1mXy84qQbpTOTaatS4U5Egjbg
 DW/6TRosstDehWJ5fQzm7fZNEOv5pz9ozapCuK9mpifIQ9ERRCBfJHAhTbYrRl0dM7To
 x9qsvr6qHgfjzNKy0uDwy+PRB0+ZvKoTWYlsOI8EwJ8QQdRYHud+lBq3+iNhJL5Drrrs
 G71gK2hPwWBBtE03hteS058k8idPK4bmtqC7CxJdOyHnUBsjc2rCC1ZasKOC5OJe23zr
 3QO8/3orXoumYcJR3NyZPN9pbFZPc78w0F+s4nCZBjq/DelD2laPH2sa+++ZE/Gph8ax
 kbFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=69G4sVrTM6Oebk85axmgqm6tVz3OwOvgPCpKMqCiPco=;
 b=bTznIwwGCSs3f3/aHHEW1aGx9RuTlVH6UE3h0V5L4xDKdsQGyuW0R/ebahfJHOEFEs
 cbpUzJ/BZ+E+GUzSRuhVV7IP4NCuQZ5NoRuCUHvrq3oIlERAMEii/jk5p1P6Gj/af5hf
 tpcXHbKR9tEU4vwKdNfpr5zMZXZlw8QdS1RFz1yN3We78iCnnwJ34R+Nbq5PzpXJQQVe
 i8vuDAYUkVQOYyOL51VuG+OSu1PAwkXFbI5aowaAgsLgk6D3jnkk8YC6xowu++LDQOAO
 nKDeIAeZLR2gSu0xEuQi9YiOrGw803qnKCTR1DCgXy7Ay3SNoz/JXvW/zJYuDihmsCT8
 R5KQ==
X-Gm-Message-State: AOAM533B/o+0loYP+hwCXkMezj+/VF4boAMevHoxFg8KiZlmZOm6VuUW
 Bq5/T1DqwthMkq3Qs2nHmG1nVCy1Z1SE
X-Google-Smtp-Source: ABdhPJzk+NX1p5MORYml/JXQrYMcHyi1MKvCEYPbSjKfF+bc47ppwgtX0j9v2VNUKwlkUuQKDyP2zLPsK5z/
X-Received: from pigloo.svl.corp.google.com
 ([2620:15c:2c5:13:562d:d821:bf6:b545])
 (user=jmeurin job=sendgmr) by 2002:a63:e314:: with SMTP id
 f20mr8051217pgh.577.1643407333621; Fri, 28 Jan 2022 14:02:13 -0800 (PST)
Date: Fri, 28 Jan 2022 14:01:56 -0800
Message-Id: <20220128220156.4057446-1-jmeurin@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
Subject: [PATCH] Fix the size of the header read buffer.
From: Jean-Marc Eurin <jmeurin@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jean-Marc Eurin <jmeurin@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220128_140216_732553_05D453C9 
X-CRM114-Status: GOOD (  10.96  )
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

The read buffer size depends on the MTDOOPS_HEADER_SIZE.

Tested: Changed the header size, it doesn't panic, header is still
read/written correctly.

Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>
---
 drivers/mtd/mtdoops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdoops.c b/drivers/mtd/mtdoops.c
index 227df24387df..09a26747f490 100644
--- a/drivers/mtd/mtdoops.c
+++ b/drivers/mtd/mtdoops.c
@@ -223,7 +223,7 @@ static void find_next_position(struct mtdoops_context *cxt)
 {
 	struct mtd_info *mtd = cxt->mtd;
 	int ret, page, maxpos = 0;
-	u32 count[2], maxcount = 0xffffffff;
+	u32 count[MTDOOPS_HEADER_SIZE/sizeof(u32)], maxcount = 0xffffffff;
 	size_t retlen;
 
 	for (page = 0; page < cxt->oops_pages; page++) {
-- 
2.35.0.rc2.247.g8bbb082509-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
