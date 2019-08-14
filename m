Return-Path: <SRS0=SIcx=WK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3583CC32753
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 12:19:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AA7B206C1
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 12:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D+LYsEkS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AA7B206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ikrb18oGr69gpRWUf7qNR/3oN36kqyIcW5gH7oVg0PE=; b=D+LYsEkSfXfe6G
	ftqL/7lnmxuRKSz8eGYxbxz2LonVxNHDtQ94zn8yc12HHwYLbmlIW6XGkyteQrnf3/P1/RbvuK/f9
	UZ1Gc9aAgXzUFKiWo/bu9Hov/XfA/6KPmTltrNKCHTr6plEGFo9U2ZHhi+1KZGE08cR2fe+52j2t/
	4tYq567QDc13V8Wr93lv2wvqKoDaT/NNaqBeGQSK6Auz9caBiIWtdDqzu7eth7qRE3vE7uh28+3sh
	yfkhuiCTXy4KjbRpk+Ffllq2j2sjHGsd8HHBqtG6vpyKjkAKVlmk2Z3YZLNQ2aEelxT7R9UBDHa2J
	AekxnD1F1WJhYXDvKu0g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxsFY-0001MR-L5; Wed, 14 Aug 2019 12:19:32 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxsEy-0000bh-Sp
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2019 12:18:58 +0000
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hxsEp-0005kC-Ef; Wed, 14 Aug 2019 14:18:47 +0200
Received: from sha by dude.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hxsEm-00081V-Mj; Wed, 14 Aug 2019 14:18:44 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-fsdevel@vger.kernel.org
Subject: [PATCH 03/11] fs: move __get_super() out of loop
Date: Wed, 14 Aug 2019 14:18:26 +0200
Message-Id: <20190814121834.13983-4-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814121834.13983-1-s.hauer@pengutronix.de>
References: <20190814121834.13983-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_051856_974382_147DF156 
X-CRM114-Status: GOOD (  11.95  )
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
Cc: Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

__get_super_thawed() calls __get_super() multiple times. I can't see a case
where __get_super() would return another valid superblock when called
again, so move the call to __get_super() out of the loop. This is done in
preparation for the next patch.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/super.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/fs/super.c b/fs/super.c
index 5960578a4076..f85d1ea194ae 100644
--- a/fs/super.c
+++ b/fs/super.c
@@ -786,17 +786,26 @@ EXPORT_SYMBOL(get_super);
 static struct super_block *__get_super_thawed(struct block_device *bdev,
 					      bool excl)
 {
+	struct super_block *s = __get_super(bdev, excl);
+	if (!s)
+		return NULL;
+
 	while (1) {
-		struct super_block *s = __get_super(bdev, excl);
-		if (!s || s->s_writers.frozen == SB_UNFROZEN)
+		if (s->s_writers.frozen == SB_UNFROZEN)
 			return s;
+
 		if (!excl)
 			up_read(&s->s_umount);
 		else
 			up_write(&s->s_umount);
+
 		wait_event(s->s_writers.wait_unfrozen,
 			   s->s_writers.frozen == SB_UNFROZEN);
-		put_super(s);
+
+		if (!excl)
+			down_read(&sb->s_umount);
+		else
+			down_write(&sb->s_umount);
 	}
 }
 
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
