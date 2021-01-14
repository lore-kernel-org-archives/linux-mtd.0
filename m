Return-Path: <SRS0=+zBv=GR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1C0C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jan 2021 21:31:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82A2A23977
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jan 2021 21:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82A2A23977
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=311hbh10yIEFinauAyJSKWrA6t36ruskTU2HY66wx6o=; b=DxussS8EmGuM7JdYqMfzcQ/y5f
	0x/AimdmN469ygy/91VvxgL8GqxCy+61FCxYYWLcdAj3Zf0MbM1bxXBdO1J+uybfkxXfBPGAr18N7
	vrCf+whsinGIcBhQkUOCl5vWgjttNc8qdezIVevzsoTJ5WzN6jfl3x6o9ssYP8ZOqKzyjTeFOqRm4
	InGdAciY601+5DMI2W7Q72B1VldGRewMY9ML1fBKzHMM930vQ1E63K1O6yEFoYXDZLTygC2Met2Jn
	5TllXlOEi26N3OSeZk8EvT+ALBQSfF4e/k8A7bPgvA0huiL0FoG1DEQtvMWEYw6sQ2vwprjWl0D5Y
	hqrYaI3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0ACL-0006eT-6H; Thu, 14 Jan 2021 21:30:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0ACI-0006dd-Pi
 for linux-mtd@lists.infradead.org; Thu, 14 Jan 2021 21:30:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35C8523977;
 Thu, 14 Jan 2021 21:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610659825;
 bh=h8P7pkHW9enuPNWSJCLbaVlV9uAnMB00zjxhwDU+PqA=;
 h=From:To:Cc:Subject:Date:From;
 b=tQNkbEvxLFPw5FoBp/nUfgnpQeUHoD7rTUMpGX7Qz11m6B6KVT4ZSqjk54iobrWyF
 6V9HTeFO4i8XBoUCIjF9fRGXt4Pae9tWLguMcMBakFEtp+PNYUtgeCok0oCuOtEbqH
 zndAFzox6Wg30xzRxG7i+m/ivNfs5iCgjiRkUeHVTDAyGN+pOu24/szSjoqRbxEKvW
 Eecl2SFrbo2Bolr8F1huq89l938kE1tk5GleGaf3liMDcXYh+duSQ2A4K/q/6jItUB
 kwYWGN2WZTcbgrwxNyCM1L4FeQvpqDq/1XXexXWnNw/fOTuvcXfmoMuzPzgQFBvkqo
 GGjz+RBMtaTWQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Richard Weinberger <richard@nod.at>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Eric Biggers <ebiggers@google.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ubifs: replay: Fix high stack usage, again
Date: Thu, 14 Jan 2021 22:30:11 +0100
Message-Id: <20210114213020.4108485-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_163026_933551_3AD8B177 
X-CRM114-Status: GOOD (  11.82  )
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
Cc: Wang Hai <wanghai38@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Arnd Bergmann <arnd@arndb.de>

An earlier commit moved out some functions to not be inlined by gcc, but
after some other rework to remove one of those, clang started inlining
the other one and ran into the same problem as gcc did before:

fs/ubifs/replay.c:1174:5: error: stack frame size of 1152 bytes in function 'ubifs_replay_journal' [-Werror,-Wframe-larger-than=]

Mark the function as noinline_for_stack to ensure it doesn't happen
again.

Fixes: f80df3851246 ("ubifs: use crypto_shash_tfm_digest()")
Fixes: eb66eff6636d ("ubifs: replay: Fix high stack usage")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 fs/ubifs/replay.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
index 79801c9a5b87..0f8a6a16421b 100644
--- a/fs/ubifs/replay.c
+++ b/fs/ubifs/replay.c
@@ -559,7 +559,9 @@ static int is_last_bud(struct ubifs_info *c, struct ubifs_bud *bud)
 }
 
 /* authenticate_sleb_hash is split out for stack usage */
-static int authenticate_sleb_hash(struct ubifs_info *c, struct shash_desc *log_hash, u8 *hash)
+static int noinline_for_stack
+authenticate_sleb_hash(struct ubifs_info *c,
+		       struct shash_desc *log_hash, u8 *hash)
 {
 	SHASH_DESC_ON_STACK(hash_desc, c->hash_tfm);
 
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
