Return-Path: <SRS0=H3wt=AH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440C4C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 12:09:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9633206A1
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Jun 2020 12:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pS6BJdPL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9633206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UpfKKlCWeLhYvNhK7PO4LV8a2jG1Lh3oFqN796wmHJU=; b=pS6BJdPLVGjm93S/WlqAWECoR
	mm4nKLjVo9qAoDa1riyeTD71qrRAg5PLOoWHrWfTFiD8GAqODv/8B7EAkvwjiKAQ44KP2LKPE3/A/
	S/w+F2eHk1uRGWYh5qY6PuQkrqFtuXbNOqf7mM3NpPRO8VfptULbPt/hW3gCnSE2rfOFPh6S99qwe
	CXnwX0dxuxnjpJU2rWyRFZYM3wyeTOXQaJGgNoPRwsYNQ87rncPypEi4ioSK6qODy+XVujlec/ltQ
	igBbr9JYJ1NhUfRL6toGW1lUpCtj2ZUd2coRWcrNcn7zwYw6P8FkoDWQptNPXW3wq49armQqL+LE8
	aw3WjLn0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jon9L-0005A2-OX; Fri, 26 Jun 2020 12:08:07 +0000
Received: from galois.linutronix.de ([193.142.43.55])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jomXh-0003h2-9b
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2020 11:29:31 +0000
Received: from torbenh by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <torbenh@linutronix.de>)
 id 1jomXe-0001jC-7L; Fri, 26 Jun 2020 13:29:10 +0200
From: Torben Hohn <torben.hohn@linutronix.de>
To: richard@nod.at
Subject: [PATCH v2 4/4] ubifs: prevent remounting rw when no hmac key was given
Date: Fri, 26 Jun 2020 13:29:07 +0200
Message-Id: <20200626112907.13201-5-torben.hohn@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200626112907.13201-1-torben.hohn@linutronix.de>
References: <20200625155927.28430-1-torben.hohn@linutronix.de>
 <20200626112907.13201-1-torben.hohn@linutronix.de>
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
Cc: bigeasy@linutronix.de, linux-mtd@lists.infradead.org, tglx@linutronix.de,
 s.hauer@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

After adding readonly hmac-less authentication support,
prevent remounting the filesystem in rw mode, when
the hmac is not available.

Signed-off-by: Torben Hohn <torben.hohn@linutronix.de>
---
 fs/ubifs/super.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b41ca9ee5763..62bdef8f1ddf 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -1996,6 +1996,10 @@ static int ubifs_remount_fs(struct super_block *sb, int *flags, char *data)
 			ubifs_msg(c, "cannot re-mount R/W - UBI volume is R/O");
 			return -EROFS;
 		}
+		if (ubifs_authenticated(c) && !c->hash_tfm) {
+			ubifs_msg(c, "cannot re-mount R/W due to missing hmac key, for authentication");
+			return -EROFS;
+		}
 		err = ubifs_remount_rw(c);
 		if (err)
 			return err;
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
