Return-Path: <SRS0=eog2=KW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AA6C4707F
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 23:54:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 732AA61178
	for <linux-mtd@archiver.kernel.org>; Thu, 27 May 2021 23:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 732AA61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qUHT2YmU/RCHKPCO0Z/ZE4OopvigZiFC2KbELQD9+rM=; b=EGECLxd+S8Qcbg
	b5xGmIHRt4+ux8pnhB6NunycyekFnOSjRgAIan1Tsq5NRovyr/Z9B5N9uZbl7FWZNc2/dhb+owfus
	52zBAjNttaYhNqfN3mdJk4bgiO+lq47Q155Tqr7QgWHkvkVZcuvFTyqaQAaTu+rwaP/jvq0CRPpf4
	z9FMwjU8d8khuYcB0G4oayF6967wVQxZIdJ5dbYy+lP7Y4Qs2COsV+tYMrRoxXyQROnUgGnyTaeF7
	bTL6zGsBjHSLS12eXa18p8md0K/pO1h+peDMCBJWlbIN0TnWl7P8B3PY9I4VFZpoTFJse6rbVgZZe
	azcpCzsdDUZRsDOvJ6Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmPoX-00AMsQ-BW; Thu, 27 May 2021 23:53:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmPoU-00AMqe-3C
 for linux-mtd@lists.infradead.org; Thu, 27 May 2021 23:53:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C18A61178;
 Thu, 27 May 2021 23:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622159597;
 bh=unu2CwRiIklLEI2TXoBveyWjP3PNdHwKr8/qOcOwHz0=;
 h=From:To:Cc:Subject:Date:From;
 b=hkto4pcLDdjg2amAWXxT+C//4V+e6tlGib27nP72HTOxXnR12jea3mWhtLFQ4dm0E
 7gwn3yhQgn+Q9mY4pgnnWtM19dxKvdC+D3JFlgXKY/zQbcHieUH1I/os3kiQaWnWa8
 7StchJcisGJpEhNQxJQIlaL4KJC1m3VRSS7Ju1ZaDoe77Col5CYNf88ewi/OFQ5RKw
 7Yt6KfSlRbCNsUcDqAKmbR4xtASP6DXqsDDkYHSQCDHe3Giqjl6WSFc6N/76VUO+uy
 lYdSz5Vj1wzt8WHYuF05AytMP14o1V84uCWmMHAo1pYLmHfHcHGtrLFxeYcYzlanQI
 EH1Gc8b/jdHLw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
Subject: [PATCH] fscrypt: don't ignore minor_hash when hash is 0
Date: Thu, 27 May 2021 16:52:36 -0700
Message-Id: <20210527235236.2376556-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_165318_214364_470F799D 
X-CRM114-Status: GOOD (  14.08  )
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

From: Eric Biggers <ebiggers@google.com>

When initializing a no-key name, fscrypt_fname_disk_to_usr() sets the
minor_hash to 0 if the (major) hash is 0.

This doesn't make sense because 0 is a valid hash code, so we shouldn't
ignore the filesystem-provided minor_hash in that case.  Fix this by
removing the special case for 'hash == 0'.

This is an old bug that appears to have originated when the encryption
code in ext4 and f2fs was moved into fs/crypto/.  The original ext4 and
f2fs code passed the hash by pointer instead of by value.  So
'if (hash)' actually made sense then, as it was checking whether a
pointer was NULL.  But now the hashes are passed by value, and
filesystems just pass 0 for any hashes they don't have.  There is no
need to handle this any differently from the hashes actually being 0.

It is difficult to reproduce this bug, as it only made a difference in
the case where a filename's 32-bit major hash happened to be 0.
However, it probably had the largest chance of causing problems on
ubifs, since ubifs uses minor_hash to do lookups of no-key names, in
addition to using it as a readdir cookie.  ext4 only uses minor_hash as
a readdir cookie, and f2fs doesn't use minor_hash at all.

Fixes: 0b81d0779072 ("fs crypto: move per-file encryption from f2fs tree to fs/crypto")
Cc: <stable@vger.kernel.org> # v4.6+
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/fname.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/fs/crypto/fname.c b/fs/crypto/fname.c
index 6ca7d16593ff..d00455440d08 100644
--- a/fs/crypto/fname.c
+++ b/fs/crypto/fname.c
@@ -344,13 +344,9 @@ int fscrypt_fname_disk_to_usr(const struct inode *inode,
 		     offsetof(struct fscrypt_nokey_name, sha256));
 	BUILD_BUG_ON(BASE64_CHARS(FSCRYPT_NOKEY_NAME_MAX) > NAME_MAX);
 
-	if (hash) {
-		nokey_name.dirhash[0] = hash;
-		nokey_name.dirhash[1] = minor_hash;
-	} else {
-		nokey_name.dirhash[0] = 0;
-		nokey_name.dirhash[1] = 0;
-	}
+	nokey_name.dirhash[0] = hash;
+	nokey_name.dirhash[1] = minor_hash;
+
 	if (iname->len <= sizeof(nokey_name.bytes)) {
 		memcpy(nokey_name.bytes, iname->name, iname->len);
 		size = offsetof(struct fscrypt_nokey_name, bytes[iname->len]);

base-commit: c4681547bcce777daf576925a966ffa824edd09d
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
