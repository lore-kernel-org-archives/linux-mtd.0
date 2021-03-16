Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1A89C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 08:53:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B89E65006
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 08:53:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B89E65006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GFR9yZwg1Px1uCNj68Uk8m481qFrriETOVYPiVCXYr0=; b=Xxseklqt7+LUzTaVNNswD7hKD
	lAUz8yq+lmQRkmZGhnpD0seFfqTdpANI3Hij4T9zCfsHacRug78A8IrZQlfENsxsNhrsWRM4l1KoK
	jhSDF9dbeSTmD2g6TyEfkRP0iG43I5qPcfnQOi7TfvkkcqkLxaw5q+BZnGE4ukagd/pR8XKuh0Bcu
	c5J+LG22Wv2B/u+GnckD4fnglP5jPs2lIyWwEHUZWf7abDo8WyTQNJdKi7XBEfFdb0V6v8ePuoBst
	QqSpg9kUEA8uMdKEdV0phi7XM7KMfWABIya0HyseeWQE6Kst2vj9nl6T/swioy8IUI8SNZbA66d+1
	U5OaQ8HBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM5Rc-000AFB-14; Tue, 16 Mar 2021 08:52:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM5RJ-000ACv-Cy; Tue, 16 Mar 2021 08:52:37 +0000
X-UUID: 944148dc4e04401c8b9ebf3774fe233d-20210316
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=5twma9nZUqzFNTrgL8ss8uTYHUYGExcxhLK1aMu7FfY=; 
 b=QneUGezdweL/mrSVlhhDExRB8BNSQQg841yUIaro5zsL45D1YCaYXc3Ico0INFmqNgx1APHYJ5euFY7iTH7HiKDS9U3ivBlJ8PkR2Kqtz5JD+ZSeuOX33FKiY6wTWysmg3Xchx9JB5at9Hl7iThgbYqTedmer50LG8B6GuPx82M=;
X-UUID: 944148dc4e04401c8b9ebf3774fe233d-20210316
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1324742831; Tue, 16 Mar 2021 00:52:20 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 01:52:19 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 16:52:17 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 16 Mar 2021 16:52:17 +0800
From: <guochun.mao@mediatek.com>
To: Richard Weinberger <richard@nod.at>
CC: Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>, Guochun Mao <guochun.mao@mediatek.com>
Subject: [PATCH v1 1/1] ubifs: only check replay with inode type to judge if
 inode linked
Date: Tue, 16 Mar 2021 16:52:14 +0800
Message-ID: <20210316085214.25024-2-guochun.mao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210316085214.25024-1-guochun.mao@mediatek.com>
References: <20210316085214.25024-1-guochun.mao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_085234_355323_AD481CB5 
X-CRM114-Status: GOOD (  13.20  )
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

From: Guochun Mao <guochun.mao@mediatek.com>

Conside the following case, it just write a big file into flash,
when complete writing, delete the file, and then power off promptly.
Next time power on, we'll get a replay list like:
...
LEB 1105:211344 len 4144 deletion 0 sqnum 428783 key type 1 inode 80
LEB 15:233544 len 160 deletion 1 sqnum 428785 key type 0 inode 80
LEB 1105:215488 len 4144 deletion 0 sqnum 428787 key type 1 inode 80
...
In the replay list, data nodes' deletion are 0, and the inode node's
deletion is 1. In current logic, the file's dentry will be removed,
but inode and the flash space it occupied will be reserved.
User will see that much free space been disappeared.

We only need to check the deletion value of the following inode type
node of the replay entry.

Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
---
 fs/ubifs/replay.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 0f8a6a16421b..1929ec63a0cb 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -223,7 +223,8 @@ static bool inode_still_linked(struct ubifs_info *c, struct replay_entry *rino)
 	 */
 	list_for_each_entry_reverse(r, &c->replay_list, list) {
 		ubifs_assert(c, r->sqnum >= rino->sqnum);
-		if (key_inum(c, &r->key) == key_inum(c, &rino->key))
+		if (key_inum(c, &r->key) == key_inum(c, &rino->key) &&
+		    key_type(c, &r->key) == UBIFS_INO_KEY)
 			return r->deletion == 0;
 
 	}
-- 
2.18.0
______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
