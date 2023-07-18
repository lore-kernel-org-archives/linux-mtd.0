Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093CDEB64DA
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jul 2023 05:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MRFa1ScxZTiQ67d8Q9Dsoo6CgnZVCQq4peQ6F7urcu4=; b=pb/SYMl7EJr9vk
	rZ8s/NLdczkQkLUy7z8tOjPlwHFYnSr9CJuHMsJcXlzYhfDSyen8iS6KDqHjFYme4ub8O/XyAM6XS
	2Faq2CS9Z9i0JzQFLYBNmH2DJO3wEnvD8vBGEjyFE0Z/NPPcdeDYl2rzcULD6oaIF6E6bOvCIl+Ns
	qRN2aMa5EO5DxNBjlal936bWd2GF2ogaHp4t58195y6UCf8SNbGKcOCacXkWxZ/u9OKQS7d+txHXN
	mf4uhgzNy4iphKt9pFnZNKCnNFT8E/E9OCTJ9zskjGt7uNEfO0WYXxEOipBYnArGQaJnbsnAatnPU
	eAzLRCAknGTBi53VXtCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzth-005Me7-38;
	Wed, 19 Jul 2023 05:38:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLztf-005Mde-36
	for linux-mtd@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=MIg98QeotzlFKIUE1hpL5s/FiWR80QS6lSN9xynpoEQ=; b=EEKcG6Xc6toYwkow8BpLJcsXqp
	BZAFuczAywyrgzLSb9mWtvbxCaz9E7Nrfm4vGoNxgxjLxAAwt0YECjvUTBP76iNz6cPl4dNYY7oe6
	c3G2c/KVdXB6Sy6+JC7DHIQIjJ27o75WMgb9N4PNSnnCJCx9hgenxA9Q3G2pkZanWzaEFkQ70y0RN
	1ZMgBCgwvbSYHd+gARnwZ7aqwvdPWyHJmwi+8mAx7liohgMFqBqJYBboeXIQ67EaFoD+fI0p/S5aV
	/9rxulH6p4XJpQuEeeHLMt9SXHbFDett55kXuDYjaU1YJoMBicKv/PtMewSskfWWTROhXKr9/mig7
	lcYgzo4A==;
Received: from smtp2.axis.com ([195.60.68.18])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLk1o-00BWOY-1Z
	for linux-mtd@lists.infradead.org;
	Tue, 18 Jul 2023 12:42:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1689684128;
  x=1721220128;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=MIg98QeotzlFKIUE1hpL5s/FiWR80QS6lSN9xynpoEQ=;
  b=j4Ji5AVI/rzUflKaJe2MgzEc1lzWIlEC4UFOLlOG0FdvMXqr4oJF0pb1
   R0cmaf98Zxkyes8aaimTOVmEVDtNZtcCITX+Qe6GUORZYNOwK442VtgA4
   rg/l5j1E+Qf3Pl4oLsqm4f3oPhJon8IgPCEhqm7UoI4/PgxqbzdNONDGC
   bgijq8r+NizUxVFfdYoJt2jjGOqnUi+HMf+ypedOyVaQV/qX3Sqfrz19M
   Q18LdKJmocuM4qdnYyfvRHn8jU5g+b5tJo6LF8qVGcYffDQBtEcZtkyVG
   v5vdEzG5bXzflePjU70fckAUXbBfDe/yGZsBfoPQF/VHMWGZpU2AVcQ4U
   Q==;
From: Vincent Whitchurch <vincent.whitchurch@axis.com>
Date: Tue, 18 Jul 2023 14:41:45 +0200
Subject: [PATCH] ubifs: Fix memory leak of bud->log_hash
MIME-Version: 1.0
Message-ID: <20230718-ubifs-replay-auth-leak-v1-1-2dd2e00e6dc6@axis.com>
X-B4-Tracking: v=1; b=H4sIAIiItmQC/x3MTQ5AMBBA4avIrE2iGj91FbFomTIhSKtCxN01l
 t/ivQc8OSYPTfKAo5M9b2uESBPoJ72OhDxEQ57lMqtEjcGw9ehoX/SNOhwTLqRnVEaqwtRSqNJ
 CjHdHlq9/3Hbv+wEE8Ts0aAAAAA==
To: Richard Weinberger <richard@nod.at>
CC: Sascha Hauer <s.hauer@pengutronix.de>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@axis.com>, Vincent Whitchurch
	<vincent.whitchurch@axis.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_134208_984131_E0722C4B 
X-CRM114-Status: UNSURE (   9.74  )
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

Ensure that the allocated bud->log_hash (if any) is freed in all cases
when the bud itself is freed, to fix this leak caught by kmemleak:

 # keyctl add logon foo:bar data @s
 # echo clear > /sys/kernel/debug/kmemleak
 # mount -t ubifs /dev/ubi0_0 mnt -o auth_hash_name=sha256,auth_key=foo:bar
 # echo a > mnt/x
 # umount mnt
 # mount -t ubifs /dev/ubi0_0 mnt -o auth_hash_name=sha256,auth_key=foo:bar
 # umount mnt
 # sleep 5
 # echo scan > /sys/kernel/debug/kmemleak
 # echo scan > /sys/kernel/debug/kmemleak
 # cat /sys/kernel/debug/kmemleak
 unreferenced object 0xff... (size 128):
   comm "mount"
   backtrace:
     __kmalloc
     __ubifs_hash_get_desc+0x5d/0xe0 ubifs
     ubifs_replay_journal
     ubifs_mount
     ...

Fixes: da8ef65f9573 ("ubifs: Authenticate replayed journal")
Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
---
 fs/ubifs/super.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index 32cb14759796..0ef8c1f3d760 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -923,8 +923,10 @@ static void free_buds(struct ubifs_info *c)
 {
 	struct ubifs_bud *bud, *n;
 
-	rbtree_postorder_for_each_entry_safe(bud, n, &c->buds, rb)
+	rbtree_postorder_for_each_entry_safe(bud, n, &c->buds, rb) {
+		kfree(bud->log_hash);
 		kfree(bud);
+	}
 }
 
 /**
@@ -1193,6 +1195,7 @@ static void destroy_journal(struct ubifs_info *c)
 
 		bud = list_entry(c->old_buds.next, struct ubifs_bud, list);
 		list_del(&bud->list);
+		kfree(bud->log_hash);
 		kfree(bud);
 	}
 	ubifs_destroy_idx_gc(c);

---
base-commit: fdf0eaf11452d72945af31804e2a1048ee1b574c
change-id: 20230718-ubifs-replay-auth-leak-9b395b83196f

Best regards,
-- 
Vincent Whitchurch <vincent.whitchurch@axis.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
