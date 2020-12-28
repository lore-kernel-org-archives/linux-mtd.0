Return-Path: <SRS0=5rSU=GA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C498C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 19:14:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C54C6229EF
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Dec 2020 19:14:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C54C6229EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u95Z8bSvIVUCuug4PBXOKTF1gQB4CYKoYbQ343lnu00=; b=t3PUeJ3c7bXPfk3hQZctRWSfG
	/QiX0AhSWnE9XP2lF7ynu4TnNJFD0b/z4cxAaCU4SUBiH4Xm3ZN35KOH3Obz969rtW3VhaYfhp/9c
	ulApb1EwT24TJPFVstZww9qT9z7FNlkek3o20SJiMo1BAUCl8YGYmmT6k5Uoq92ZOK3rUwI+zwQwI
	sVlAxoSJHKqfbAryEQmrDp6Sv6L9rVvuI/sZ219hhVobc5RMGbL37dx5ww5BG8XCcqciKtXOmOo4a
	7VC0XcjabFJBrgNTCRFohhmWTJ7bHlA7ZfhCTQsnTaEtsp+FcjJpJAeaR6GNchKCx3kOKqzzWDUfP
	YQzkG3ZUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktxxM-00016A-Ra; Mon, 28 Dec 2020 19:13:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktxxF-00013C-Kw
 for linux-mtd@lists.infradead.org; Mon, 28 Dec 2020 19:13:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DC1C322B2A;
 Mon, 28 Dec 2020 19:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609182797;
 bh=wcDIzfW0TdVWW8ZUcFxkhA+O3mFdLmRyWJlQxT4S1QI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bAQNUpGKbUC6XgijBxKuQ6fLblzIjwttUoUazHLtwrmvyRAc/Hp21PThkFceo2oND
 +20rouDAMTnb8+gPYw32tirqHwpl3Trft2e5ZG0gVJkOImuAdAkPKdMuxaKEVvzoQm
 8od/01VOrXkJqs3NmQuHziqvc8o5IVveuM//bYZRclslEfElrjsTe7NX/6K9O2R9ud
 RPjixOFxq4uHlp3ZDFYPaEDRV2f5+gzHb5j82nO0p0ezNlQYr40a86s5ZeVk9oIWxi
 Pbj7E9prte/MgEp1mkzEDRYpcjCnfd6/Wc287+/VJezxQ6sKGj3VcSH8uHMtx3G5LU
 WYCR6iIAZSi3A==
From: Eric Biggers <ebiggers@kernel.org>
To: stable@vger.kernel.org
Subject: [PATCH 4.19 2/4] ext4: prevent creating duplicate encrypted filenames
Date: Mon, 28 Dec 2020 11:12:09 -0800
Message-Id: <20201228191211.138300-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228191211.138300-1-ebiggers@kernel.org>
References: <20201228191211.138300-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_141317_778863_4C16C8F7 
X-CRM114-Status: GOOD (  10.61  )
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
index 4191552880bd7..3c238006870d3 100644
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@ -2106,6 +2106,9 @@ static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
 	if (!dentry->d_name.len)
 		return -EINVAL;
 
+	if (fscrypt_is_nokey_name(dentry))
+		return -ENOKEY;
+
 	retval = ext4_fname_setup_filename(dir, &dentry->d_name, 0, &fname);
 	if (retval)
 		return retval;
-- 
2.29.2


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
