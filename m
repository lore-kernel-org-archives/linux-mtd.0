Return-Path: <SRS0=5rSU=GA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D54C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 18:56:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C08E221F8
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 18:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C08E221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vq7fTphX3tuKB+kMkV4vuxxQrJ6zP0ykQEvL/NhCJ9M=; b=xVRiqtiTMGwzed0ywvs6RQNW1
	lVbPuGDyjk2b7WBDglf58cRhTgbY4b81KcFPdwKqijpox2P/KQPqDXTIf+yBnWp7Afe9MAWbQ4pfR
	yZBTrpMPtYHSU+Hlp+Df1x77Yfd+FLyMkZoiADsr/jRu3+gn9jo7yURIJZB3kQVfF3IHwJ+DlYEMX
	96wjS6cNHUX0oloep5WAozJMoaFQfWdbyQkvv60GG2U04YlpSMDxvaNzO+xPWsU6yD51PMaeY+55v
	UTAqbPnevfZut4MN5i3ZAvfKU+8JBBb1XnOwoDpNZYSXha7SWc6t7IvriFJtSZqStWQPW9LwXRdSY
	hM2FIly0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktxgD-0007I6-4x; Mon, 28 Dec 2020 18:55:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktxg6-0007Fk-Mx
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2020 18:55:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D183A22AAD;
 Mon, 28 Dec 2020 18:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609181729;
 bh=Qv8XPvD4Whz8DkvwGwAf7mmtYtvGPNNWzNeowimMGrM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=k0LLBzMoZ0aHGfOBsg3ITTIW0dgo1gTH+nM+OngQXse5z6gWy3lvNwUyvKs6g+p9M
 WRElB9XR6KPx8r9J9nxTkurn05YA7qHcQ8c89ve1zpJp3m1+uT89+1x2bueSLqkNHh
 3HR9gG6QzcO36mQf1mr1IToFU2ia1oxP6TB107pAeDSlI+9XNgChm5GGD0xvh/uIYP
 5Cv8F1LqjQZ3fb4/NkaXYU9ekLU9g7lHPVkOVRgpEDP+A6Y0ATp2yUuULup5HwyMG5
 4/fQRDmYSPSMECifsZACf/4Fp0VnZXeIUJsGi86UuidY7mBk5IlZQhBtlsqlzYp5w0
 GF1YPOknLE9nA==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Subject: [PATCH 5.4 2/4] ext4: prevent creating duplicate encrypted filenames
Date: Mon, 28 Dec 2020 10:54:31 -0800
Message-Id: <20201228185433.61129-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228185433.61129-1-ebiggers@kernel.org>
References: <20201228185433.61129-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_135534_867197_D848C7C7 
X-CRM114-Status: GOOD (  10.56  )
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

commit 75d18cd1868c2aee43553723872c35d7908f240f upstream.

As described in "fscrypt: add fscrypt_is_nokey_name()", it's possible to
create a duplicate filename in an encrypted directory by creating a file
concurrently with adding the directory's encryption key.

Fix this bug on ext4 by rejecting no-key dentries in ext4_add_entry().

Note that the duplicate check in ext4_find_dest_de() sometimes prevented
this bug.  However in many cases it didn't, since ext4_find_dest_de()
doesn't examine every dentry.

Fixes: 4461471107b7 ("ext4 crypto: enable filename encryption")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20201118075609.120337-3-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/ext4/namei.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/ext4/namei.c b/fs/ext4/namei.c
index 36a81b57012a5..59038e361337c 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -2192,6 +2192,9 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
 	if (!dentry->d_name.len)
 		return -EINVAL;
 
+	if (fscrypt_is_nokey_name(dentry))
+		return -ENOKEY;
+
 #ifdef CONFIG_UNICODE
 	if (ext4_has_strict_mode(sbi) && IS_CASEFOLDED(dir) &&
 	    sbi->s_encoding && utf8_validate(sbi->s_encoding, &dentry->d_name))
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
