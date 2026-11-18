Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C0B606A31C
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2026 00:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jmLUGdZX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DjUc1tFl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hUYX98YVUCCcat3Wop4pvq9xHExl3epTUyKGZxrki1M=; b=jmLUGdZXzDsOIEkN4F9+rM7MsS
	2k6GQ0I9XJvrhdFJocqO19C8+rVzPzoADE2hiPdbElzHb7g5aCAyv+31xIrf9jngVrKn/bTIatdIt
	kZ4ykyQHNpP1i6g+/n4VGhfWvdT6SsJZN3docDMhJ+bbGqrZIoyIZXTPUSfxL1JpeGaq4zky8cPWl
	2Uxc18LBshNjqRVz+dwpoxJRIEXChSr98W73oW/9pqdH3HzC3XAay89zRvNNE/+G9fQwnrl3rDJ/L
	l0NYmixVueqQ9Eu9ylVr1wMh3oyCLa3jr323dupWrBaAC4G8BNJ9YPhIe2GMpKxuohQmARU4oOujj
	cAUu6jIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTYS-00000007MH1-456S;
	Wed, 18 Nov 2026 00:29:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTTYS-00000007MGl-2Gp5
	for linux-mtd@lists.infradead.org;
	Wed, 18 Nov 2026 00:29:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EC4B43B61;
	Wed, 18 Nov 2026 00:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022E21F000C5;
	Wed, 18 Nov 2026 00:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794961780;
	bh=77Zc1u0jfwO76KAyX4WCIbvGbPpwLYaW9Jlo2sPynfo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DjUc1tFlOzVBzrYcXaPjCSi6i0uyhGfvMjsCTw9wPfX9BGKuTOeFjr1b832Vu99cL
	 jp1BV4nyinAEqqimy7fZ3LpEC9U9HrsuiZl4zXdDGhZEjU0pGYEuMeRxZzztktpi6q
	 bX+6Q1ORLsoxks9UnBx0uFWziaMGC8KVjKvEh/3U//qqUxdJBQZhUmmRmluFUXOvHQ
	 HFn1FgAgCYF4mRr7ugb3wKX4DI05/Fz90qvN+m30J68S4EgLui8QMRKNDQUhwn6QZK
	 J6gm4FTPnDAc81JqjeSjs68y2lDw0blFNZmXCX3DGNY+89wnlJhoAjg4q0cpCqxpc2
	 YyLnYFIi6dOUQ==
From: Thorsten Blum <blum@kernel.org>
To: David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Theodore Y. Ts'o" <tytso@mit.edu>
Cc: linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mtd@lists.infradead.org,
	linux-fscrypt@vger.kernel.org,
	Thorsten Blum <blum@kernel.org>
Subject: [PATCH 1/4] fscrypt: Add FSTR() helper macro
Date: Wed, 18 Nov 2026 01:28:47 +0100
Message-ID: <20261118002845.574426-7-blum@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002845.574426-6-blum@kernel.org>
References: <20261118002845.574426-6-blum@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=730; i=blum@kernel.org; h=from:subject; bh=9TS87tFQrJmJ2L6d5vREcb1e62JHLVxiiKSkN7PY/9U=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFl/Ptq5/b51/ZGu2+FIucCFP+qZ/J50hR/m2B2qoMu2f p3ujtL9HaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjARFRGG/4msy3fns51NOsx7 JpD/+k3J0ki2ju+qS+9b8detfVXCacXwV+7Ggvu/J2UIOnB823+jQsTzhqtj3f5yNef1Fs+E9l5 34gQA
X-Developer-Key: i=blum@kernel.org; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Similar to QSTR(), add FSTR() to initialize struct fscrypt_str from a
NUL-terminated string without specifying its length.

Signed-off-by: Thorsten Blum <blum@kernel.org>
---
 include/linux/fscrypt.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 28f2108e29f3..84d9147fda2f 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -50,6 +50,7 @@ struct fscrypt_name {
 };
 
 #define FSTR_INIT(n, l)		{ .name = n, .len = l }
+#define FSTR(n)			((struct fscrypt_str)FSTR_INIT(n, strlen(n)))
 #define FSTR_TO_QSTR(f)		QSTR_INIT((f)->name, (f)->len)
 #define fname_name(p)		((p)->disk_name.name)
 #define fname_len(p)		((p)->disk_name.len)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
