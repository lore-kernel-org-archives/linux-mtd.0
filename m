Return-Path: <SRS0=8wrd=WZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE22DC3A5A1
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 00:50:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0BAC215EA
	for <linux-mtd@archiver.kernel.org>; Thu, 29 Aug 2019 00:50:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oQ1QEpdC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="d5plNcg8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0BAC215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oMaksx4pYTrcGaT+LmLF0UBj3NVqAfjfwCuIG84Q80s=; b=oQ1QEpdCIgSOOQ
	zp4Gl4QobfbkYXxM5qFwGcnO1zfxfltNI2xkH6Ar2hnZdg/shutLemQq7QDRCx/6eJQf1g28sq8z7
	AArPp0PhnBKOn1NWQxoMwDJRpF8TG8Wfudt4mJfiYiLw2dtPNZT4rwZBatdps+W/i4apnk2oXozmm
	+j1OFuJwJFCj1WMaW8xH4jGt7Vu2lRYRGGX3nNVsiTc4oBl9S9c/8QMvHgBVxTMGfMwWTdtUoe0mD
	R0lEPhCnOCGgtBderWib7B/w6zHnxH27QRXCpwZWWbRzAJnB2y6ZklpEHGhbzNh82jc1tF+Wdd8Hv
	avGKroHARwSZcxWOJGhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i38dv-000866-W5; Thu, 29 Aug 2019 00:50:27 +0000
Received: from gateway36.websitewelcome.com ([192.185.198.13])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i38ds-0007jL-WB
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2019 00:50:26 +0000
Received: from cm12.websitewelcome.com (cm12.websitewelcome.com [100.42.49.8])
 by gateway36.websitewelcome.com (Postfix) with ESMTP id CE24B400C7C54
 for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2019 19:16:05 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id 38dgijO0viQer38dgi2qgH; Wed, 28 Aug 2019 19:50:12 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
 Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R0JxrP8NyO1yZfaW9U4QUfRp14vcog+lDIYpXStsrMg=; b=d5plNcg8eo4N9I+2/S6cdvxdoL
 yiW2rpvKEPVtq8NCVhw+53ThouZ1xozijBX2dPtX6vAViBkwnNxNOMujvSDkGAhE91Xc0bE94BDwC
 F//KavazcY9XE+R99KcwS3BVR5sHpe9LCuTX2g7bgEN72ZhxA27+HU0umEQgOyScxMq2vl4K2kA4X
 URgJCeN7Trg/R4RWXhHlo2XMj11O/9P0Ur6UVAVT1urHU+Wujp2hgWVy0uiPSbAr0594U/U3J5jGe
 CcGT9gZQ+eRoPGa+pAWc5v6DCSbOPps95AJMx5xrsbUBS3ccF2sqbwvlzqanuGwK/k46xqIf22E+P
 KOnh8GFg==;
Received: from [189.152.216.116] (port=56370 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.92)
 (envelope-from <gustavo@embeddedor.com>)
 id 1i38de-003ypw-Aa; Wed, 28 Aug 2019 19:50:10 -0500
Date: Wed, 28 Aug 2019 19:50:09 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Richard Weinberger <richard@nod.at>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Subject: [PATCH] ubifs: super: Use struct_size() helper
Message-ID: <20190829005009.GA5895@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.152.216.116
X-Source-L: No
X-Exim-ID: 1i38de-003ypw-Aa
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.152.216.116]:56370
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190828_175025_082872_3C757CBE 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

One of the more common cases of allocation size calculations is finding
the size of a structure that has a zero-sized array at the end, along
with memory for some number of elements for that array. For example:

struct ubifs_znode {
	...
        struct ubifs_zbranch zbranch[];
};

Make use of the struct_size() helper instead of an open-coded version
in order to avoid any potential type mistakes.

So, replace the following form:

sizeof(struct ubifs_znode) + c->fanout * sizeof(struct ubifs_zbranch)

with:

struct_size(c->cnext, zbranch, c->fanout)

This code was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 fs/ubifs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 2706f13e3eb9..ca86489048c8 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -661,8 +661,7 @@ static int init_constants_sb(struct ubifs_info *c)
 	long long tmp64;
 
 	c->main_bytes = (long long)c->main_lebs * c->leb_size;
-	c->max_znode_sz = sizeof(struct ubifs_znode) +
-				c->fanout * sizeof(struct ubifs_zbranch);
+	c->max_znode_sz = struct_size(c->cnext, zbranch, c->fanout);
 
 	tmp = ubifs_idx_node_sz(c, 1);
 	c->ranges[UBIFS_IDX_NODE].min_len = tmp;
-- 
2.23.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
