Return-Path: <SRS0=UEO3=YJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C96FA372A
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 10:04:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA4F220650
	for <linux-mtd@archiver.kernel.org>; Wed, 16 Oct 2019 10:04:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AekXQ3mR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA4F220650
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=codethink.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e47PWjFParsnzLV9D2nHmi5wuss+IispYYXnRoeL0gM=; b=AekXQ3mRyquBmo
	fdl+kjMJbZCJgHqo2GcXCt/8lxf2rwwQm95MgmxlDPfDHD510Il6wCZdNvbcmK+hQYC5LG3eZDoU9
	3CFoqL0QwbQdnEtR56AQxZw9IxKD5B2EPujMIQx0xMPlr8fVKuD0KraS1HJuvlX4JgcvA+Zy30Ury
	IRJiNFJlwNV/sHw9/O5toqKuOaEw7GaSGmvP8bbqsZcDgXG6NM6pRIe/x1ayHbs0BmR+0btved+xi
	8+1TYbHcjxa9CxsJfPgixFwjLZAEqT+Y8zjwdn7bqW+2LLsZmos3udNIETbKdHViojPYGMWpAZdEf
	c13JAeO/DIhRQdJuUcRQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKgAK-0005d6-OB; Wed, 16 Oct 2019 10:04:24 +0000
Received: from imap1.codethink.co.uk ([176.9.8.82])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKgAH-0005ca-1I
 for linux-mtd@lists.infradead.org; Wed, 16 Oct 2019 10:04:22 +0000
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
 by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
 id 1iKgA8-0002jl-As; Wed, 16 Oct 2019 11:04:12 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
 (envelope-from <ben@rainbowdash.codethink.co.uk>)
 id 1iKgA7-0004VB-RR; Wed, 16 Oct 2019 11:04:11 +0100
From: "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To: linux-kernel@lists.codethink.co.uk
Subject: [PATCH] ubifs: force prandom result to __le32
Date: Wed, 16 Oct 2019 11:04:09 +0100
Message-Id: <20191016100409.17262-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_030421_224721_19C7B4A4 
X-CRM114-Status: GOOD (  12.30  )
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
Cc: Artem Bityutskiy <dedekind1@gmail.com>, Richard Weinberger <richard@nod.at>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 "Ben Dooks \(Codethink\)" <ben.dooks@codethink.co.uk>,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

In set_dent_cookie() the result of prandom_u32() is
assinged to an __le32 type. Make this a forced conversion
to remove the following sparse warning:

fs/ubifs/journal.c:506:30: warning: incorrect type in assignment (different base types)
fs/ubifs/journal.c:506:30:    expected restricted __le32 [usertype] cookie
fs/ubifs/journal.c:506:30:    got unsigned int

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Richard Weinberger <richard@nod.at>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 fs/ubifs/journal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 4fd9683b8245..d6136f7c1cfc 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -503,7 +503,7 @@ static void mark_inode_clean(struct ubifs_info *c, struct ubifs_inode *ui)
 static void set_dent_cookie(struct ubifs_info *c, struct ubifs_dent_node *dent)
 {
 	if (c->double_hash)
-		dent->cookie = prandom_u32();
+		dent->cookie = (__force __le32) prandom_u32();
 	else
 		dent->cookie = 0;
 }
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
