Return-Path: <SRS0=layW=YO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D19CA9EAF
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 19:34:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C1F8205ED
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2019 19:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uQbSHLtj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vESnDQab"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C1F8205ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=0QI8F8cqzPvzGC9RTZvi8kFIS/PEHarV/IcE2PRTU/Q=; b=uQb
	SHLtj0d5asFvVRvljJh8TbhWNb79G8z1UQNNkSsRaeOgse7sJtol63x8KvvpBiZp90xB1v1v+/nV/
	+h3dsOr2aixeDKzBCHzu7IS63TkTz1A+AMDKL3+qimntndh1nD65T+MUz4pt+Brxq0s+UCoaxVjJa
	oxxJlH98ui1qBY53mHHLqfvXeD2swIFQn31weKAYqSEOBf/M/9JKVquJj/zl/aliud9mggYBvaTcW
	oeLw/Hcf+FTQ1uFXvEdffu9IlkDIYDJmyUuCTUzetj1BsVroYaCeRwq8csW58dvnz8f4inu2nl4Zb
	eiUc0QgGVX4/HbIMfv4DIlx6tODp2Jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMdRL-0007Jb-Dq; Mon, 21 Oct 2019 19:34:03 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMdRJ-0007Iq-4E
 for linux-mtd@lists.infradead.org; Mon, 21 Oct 2019 19:34:02 +0000
Received: by mail-wr1-x444.google.com with SMTP id q13so10332669wrs.12
 for <linux-mtd@lists.infradead.org>; Mon, 21 Oct 2019 12:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5WndJUXXgXPHwhCLRr7+0pwnLZl+9kPbswD/C+BOyJg=;
 b=vESnDQabBipv8xjPoc+wa2ekTjGtmzxFa4h6bCF3qeMKKFfZeqXR4+nvEHRA0fFcSR
 IJQUqHM4+kKmbaxbkL91blNgMn7VdxdRCJPaslroCFq6gdNvHasjYj9xlJFRlmmQcMSD
 +aerwVR89midy5FIYroHDoufpZsTi+pJ95BB2dMJidfzs5ZhJllBhkHii6DT1C5X3hxD
 bb0JfJwsvxLjTJfxbF2uYUCH73ZyON4IokveiL1tCoGjLTabJDxX3/DxYpKfB7DVyjBM
 IYDhULdiPp2gnyz54wgU6nbdHUPcMqmvC8r8LCTX/die87VBjodMjERvyZ9MKOYWFlTg
 pJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5WndJUXXgXPHwhCLRr7+0pwnLZl+9kPbswD/C+BOyJg=;
 b=G039K/3YJZR9TQN7udyMBciGZp7XsJqycQojB0SfEUATkxGiseFTJD42LWC2SCsi8p
 I0PhdkqgEReUfAbPeiNHo+gNY12QX2Aht3rUdl277c78m/wS7uE+qXoUsn4BI1bEA3CA
 N2nzpZ1sjqIhTsfJBNmkuqkrTz4DORwGxXDdXArD0GERFwg8qS48y7RucA5HhyAq1KsI
 CxKDSQlpxL2h06hdm74AGMOwf1cuLvAbEXCi5y+IYZ2vBQUXP+e0oWcYUSPv0pC1c22D
 mQkq++/M956zW77zlBmtEJpP0XZ9UHg2RBKy+wpV55aAyZa+j9wLv+GkpiLSUJ1WTEBK
 Zx+g==
X-Gm-Message-State: APjAAAW/H1wzWHeJdmzK9xtGm5ATo7o3j2QDtCF5tfqu27tRhSFr1KuJ
 od/fhMy0xcqkZg2RCcliMkyXfX0m9Yg=
X-Google-Smtp-Source: APXvYqzS5vgQy/FpbUE4Fmk+Rt3w4YTqGQCYR/5WDy7njSYsMCPb0vmcAPYauVMXqpLPNZsg0LNACw==
X-Received: by 2002:a05:6000:1051:: with SMTP id
 c17mr20608149wrx.124.1571686438805; 
 Mon, 21 Oct 2019 12:33:58 -0700 (PDT)
Received: from mail.broadcom.com ([192.19.231.250])
 by smtp.gmail.com with ESMTPSA id 79sm24394580wmb.7.2019.10.21.12.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 12:33:58 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: set mtd partition panic write flag
Date: Mon, 21 Oct 2019 15:32:52 -0400
Message-Id: <20191021193343.41320-1-kdasu.kdev@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_123401_213636_76A6BFC4 
X-CRM114-Status: GOOD (  10.46  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, bcm-kernel-feedback-list@broadcom.com,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Check mtd panic write flag and set the mtd partition panic
write flag so that low level drivers can use it to take
required action to ensure oops data gets written to assigned
mtd partition.

Fixes: 9f897bfdd8 ("mtd: Add flag to indicate panic_write")
Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
 drivers/mtd/mtdpart.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 7328c066c5ba..b4f6479abeda 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -159,6 +159,10 @@ static int part_panic_write(struct mtd_info *mtd, loff_t to, size_t len,
 		size_t *retlen, const u_char *buf)
 {
 	struct mtd_part *part = mtd_to_part(mtd);
+
+	if (mtd->oops_panic_write)
+		part->parent->oops_panic_write = true;
+
 	return part->parent->_panic_write(part->parent, to + part->offset, len,
 					  retlen, buf);
 }
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
