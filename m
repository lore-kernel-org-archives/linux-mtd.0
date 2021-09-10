Return-Path: <SRS0=TiF7=OA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947E1C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Sep 2021 12:01:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51ECF60555
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Sep 2021 12:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 51ECF60555
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9LmbSZY/p4Wi2MZkDtdR7Ux1mFLZqvuv2MDT+W6lyZs=; b=l+oaMOYR8DZupM
	yvcW8xDj13Wcm55vJUxXahMsXRBLvxuMsbBifrJnSW+fQ3mpIrIXCF89IA+vyfigtFTLUhY+KO+Cx
	Ld4LmN36WPx6UmK7Pr2A/acdeE/Nx3anm/bWCDSWhqgU7srz9FMEIvlLbo59Dw0kdeYQ3D3fuDvhN
	HlKKKx6JoBXzotQHh+wPKJbEhUrMrUU27/Y6nYT1uQG5NgTZ3YhiDgFkO5k0WWfle4Kd0ryIpTkpV
	Rqzkpy/3bRSjAsem72yyczOg9UWzduCpjrpyKhYO+h+3nA1+DKYT3FgSYU9BVCOBr6BAz7Hp+TP6u
	E0bnnuebTitzFb0GBLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOfCv-00CfNq-Ul; Fri, 10 Sep 2021 12:00:37 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOfCs-00CfN1-Ik
 for linux-mtd@lists.infradead.org; Fri, 10 Sep 2021 12:00:36 +0000
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id EDC3340198; 
 Fri, 10 Sep 2021 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631275224;
 bh=uBCGG54tKUGFtWWVoZuFFm7JRT/gA4rrE2H2EHpPDZM=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=J5EuyL/+CWw5L3xaTcyKxzjcidpwr2fZ//FyZmkpXGM4QRjUzfd5Cd+v6ijB2oY/8
 5V7fHOT8IlhuCwVd/B6OCu1bhpeXsRx1u06zukuQNBYWWxUk+DjKtOKTtUMLR1Mvst
 vVbf/EEzI4P2nUV4KZa0ct3221BvcyHLjKdWnagzcZbZNKR8NvAdany7pEgvCM0YMA
 vm7dBvCPlHzlara0D/O4ksvtARSgARcjqMh/QK/uuQMgrPE3cBVW4vZMcPmRPn8NxC
 PFuFsFzUYr+gJhKWQTm42JLCZ6Klyo/Qywdvq1NzJm7KO84EEXdvZ8MzU4TTFzs4pa
 cRWXy3SG6MgeA==
From: Colin King <colin.king@canonical.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: mtdswap: Remove redundant assignment of pointer eb
Date: Fri, 10 Sep 2021 13:00:23 +0100
Message-Id: <20210910120023.46308-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_050034_797584_A5EE9C26 
X-CRM114-Status: GOOD (  11.34  )
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

From: Colin Ian King <colin.king@canonical.com>

The pointer eb is being assigned a value that is never read, it is
being updated later on. The assignment is redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/mtd/mtdswap.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/mtdswap.c b/drivers/mtd/mtdswap.c
index 7e309270ddd4..e86b04bc1d6b 100644
--- a/drivers/mtd/mtdswap.c
+++ b/drivers/mtd/mtdswap.c
@@ -716,7 +716,6 @@ static int mtdswap_move_block(struct mtdswap_dev *d, unsigned int oldblock,
 		return ret;
 	}
 
-	eb = d->eb_data + *newblock / d->pages_per_eblk;
 	d->page_data[page] = *newblock;
 	d->revmap[oldblock] = PAGE_UNDEF;
 	eb = d->eb_data + oldblock / d->pages_per_eblk;
-- 
2.32.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
