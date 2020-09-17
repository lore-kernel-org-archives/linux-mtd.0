Return-Path: <SRS0=eAl4=C2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA711C43461
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83CA02078D
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2020 15:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t28WRLL4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ab937xav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83CA02078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9CNArXNEKIHxP0G5HzAWCdGbAlBkwXtZAwXl8Ygp6no=; b=t28WRLL4fd+gukjQF2hK5b31W
	ZwqwI0LVnYOgj/MwZPBSSaHXVB4gKvqTjymR0Qg/wFMoKzyCxmWAyEu5CiqgPU8CV1oQKtQ4H6rA+
	ofUnSf6XyEJM7PxwiulO+zS5ooo7y1AyOwmSK7cYjtHAJPf0TnnLprhx0wotSXpvjQl53UFlAzq2j
	yuZ9NyBuc11mgoxc7EhBnvpY3hOAcv+9WP3uFwARMNsGSoBGrDZGuWICIL56WNPBwxp89r6T3nHx0
	2GF3sb0eFTw3Ge7tfV34VQGMntyTFoTwqhgAUQJXz4Lc4vKPcz5TS0t05qHyU9xszuzyIdidelAc6
	Y8KJfmfZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIva9-0000vy-Vm; Thu, 17 Sep 2020 15:12:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIvYm-0008W2-LC; Thu, 17 Sep 2020 15:10:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7bp7tBDREj0/quRwoGKFhcM4IA6X+ak+6znUWRbIy7w=; b=Ab937xavvtVmodPI2thUSGdAlk
 XIba4t3pVWHQS6GXPdgChNV++4m2pWszb+TrwGgDuHl9lLSuinZjp2hFDRXec+62BpUjm82laGwbh
 JN/W0bXPQaaE0Q5jmTXDfMNCxo+N33xx38Z5TH1Ekmq6LWsMu3AaAKlJNv2F36kXaJ1bzo4y69HPF
 L+XH8pTHAvL0tRdG4imOcEeu6JMtw6zPlA/0bm/X/VAPExraituJ0c+ceD9lLq4MB6OiwXHjnFLZM
 JeoXS++sD/pEEDMkBpD7WdUDOHe1HIUOdAEJpCDDg19BRjFTtuPDBSOja8O+dcKYbSjRiBIs5WHms
 Nj8/IOiw==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kIvYl-0001Qv-Jz; Thu, 17 Sep 2020 15:10:55 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 13/13] vboxsf: Tell the VFS that readpage was synchronous
Date: Thu, 17 Sep 2020 16:10:50 +0100
Message-Id: <20200917151050.5363-14-willy@infradead.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200917151050.5363-1-willy@infradead.org>
References: <20200917151050.5363-1-willy@infradead.org>
MIME-Version: 1.0
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
Cc: linux-cifs@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 ecryptfs@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, v9fs-developer@lists.sourceforge.net,
 ceph-devel@vger.kernel.org, linux-afs@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The vboxsf inline data readpage implementation was already synchronous,
so use AOP_UPDATED_PAGE to avoid cycling the page lock.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/vboxsf/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/vboxsf/file.c b/fs/vboxsf/file.c
index c4ab5996d97a..c2a144e5cb5a 100644
--- a/fs/vboxsf/file.c
+++ b/fs/vboxsf/file.c
@@ -228,6 +228,8 @@ static int vboxsf_readpage(struct file *file, struct page *page)
 	}
 
 	kunmap(page);
+	if (!err)
+		return AOP_UPDATED_PAGE;
 	unlock_page(page);
 	return err;
 }
-- 
2.28.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
