Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CFD3CFA466
	for <linux-mtd@archiver.kernel.org>; Mon, 24 Nov 2025 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LXompapGgJqlgztPtnbk4Kq5decLp7nonMgcnhs2MHY=; b=l1YRHdP9bh61HK
	7U3LXwYOyGOaYAd/FCRkZl4NoGJCM430mh63CTF/ZO2jUDa+dc6MsXnejBeopVgWmbncQ5yngSpfl
	rpLkBF0NkzRledgEAxgF5xwwmJqyBA76/ENoqGSn/qqSemDP7Odzk7Q//0f9JFzh1NKU0T7k7QcNf
	TINOj8j0DS9+AbWbIoIVKE5jSAPcxe0gXhyo6RwRzXZdE5VoqPrM2uCWG5Btjloe404xnvgljgvHh
	2ml7ays5ml62bMr9tAMPFzWN7rKeBIYco8f+NNs2WQNMP9nA6owIZb+7uUKnSRFEcrRa6IqTg3OSv
	kNJRtuE1FslxQaav2iKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVjn-0000000BeiL-0DLW;
	Mon, 24 Nov 2025 12:32:11 +0000
Received: from out-176.mta1.migadu.com ([2001:41d0:203:375::b0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNVjj-0000000Beh2-3PWY
	for linux-mtd@lists.infradead.org;
	Mon, 24 Nov 2025 12:32:09 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763987512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MLSZNldwgwAJgO4ow/F8lmFXKT8zgPXKVwBcmHGAptA=;
	b=t5/xCkWpbiTX/7HlIjkn3pv2NuGbTk/HoqlluJZgTTgYRPhj094PQhFAujpGmZv0Gs6AyP
	dH+km6FrR7WBMLL3WKenKbzXf8iT9EyaEeRnBuoPFZ6SGZDLMyHDzRK3AFD5eAhx/gRfec
	4RCpLmxcDv+q0FmmUVTdnw3HTHs8Kkg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mtd: sm_ftl: Fix typo in comment in sm_read_lba
Date: Mon, 24 Nov 2025 13:31:25 +0100
Message-ID: <20251124123124.4201-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_043208_489495_75C413E2 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
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

s/is/if/

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/mtd/sm_ftl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/sm_ftl.c b/drivers/mtd/sm_ftl.c
index abc7b186353f..2666bb3e7175 100644
--- a/drivers/mtd/sm_ftl.c
+++ b/drivers/mtd/sm_ftl.c
@@ -157,7 +157,7 @@ static int sm_read_lba(struct sm_oob *oob)
 	if (!memcmp(oob, erased_pattern, SM_OOB_SIZE))
 		return -1;
 
-	/* Now check is both copies of the LBA differ too much */
+	/* Now check if both copies of the LBA differ too much */
 	lba_test = *(uint16_t *)oob->lba_copy1 ^ *(uint16_t*)oob->lba_copy2;
 	if (lba_test && !is_power_of_2(lba_test))
 		return -2;
-- 
Thorsten Blum
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
