Return-Path: <SRS0=Kb5f=GC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947B2C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Dec 2020 15:38:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57C7421D1B
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Dec 2020 15:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57C7421D1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=T+BJfXzK4J0C9zq338Bhwe+nTi4Rf7YjxqQaFVaF/LY=; b=CiMwiWHrhzb5hCHyWtZvAks99
	Nurt9SbXusUbs7xtry+sdW4dxAUORMKLHc6YiDe/6msy46Jb3f0WxndyBbNeJxebz8FYeI0E/T0qJ
	FzEEEkCPELLOp1IENrgcoSieZX3/ZtuODhJ9mk4ABc9miGU0in2dKEamj9C4JiPR+DGkKUDAWCxas
	yc++FwQg6YAD9IlO5HL0f2xoXnCSFGjsDphjQp1JzyiR86FonT2VE58X0j5JvQd1Tt8ZNakSDoHdA
	5cOPlBjDHWRA3SFgsuGwLxAWs45FxFxT6fw6f9mOd4ofvBQJTbUM4gD0f5y5gj8pQV+C05JgCCruq
	86sWuZfxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kudY1-0003We-Rr; Wed, 30 Dec 2020 15:38:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kudXz-0003WG-2a
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2020 15:37:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C4978207A6;
 Wed, 30 Dec 2020 15:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609342678;
 bh=y+eqjl3sQKL2umSb7bz421DpsNdcAFRKYL1BLs54UtU=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=Qghe72AEB4JnPhcM7hrHJm3m1sm22SnAY3Qf2JDh80+P567UuasRg76FxkZ80IK/m
 oj2HsxjF/WbABpvWq9jek2x8xBIiN0Nsk9CvTYM5HpRafOKMX8SWwOP7ry7Jgoem+s
 +tkFzI94SClYFDs8hsfER8L1aoXoomJnd7mjLHuY=
Subject: Patch "f2fs: prevent creating duplicate encrypted filenames" has been
 added to the 5.4-stable tree
To: ebiggers@google.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
From: <gregkh@linuxfoundation.org>
Date: Wed, 30 Dec 2020 16:39:11 +0100
In-Reply-To: <20201228185433.61129-4-ebiggers@kernel.org>
Message-ID: <160934275115840@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_103759_187753_2A72903D 
X-CRM114-Status: GOOD (  13.24  )
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


This is a note to let you know that I've just added the patch titled

    f2fs: prevent creating duplicate encrypted filenames

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     f2fs-prevent-creating-duplicate-encrypted-filenames.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Wed Dec 30 04:37:58 PM CET 2020
From: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 28 Dec 2020 10:54:32 -0800
Subject: f2fs: prevent creating duplicate encrypted filenames
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Message-ID: <20201228185433.61129-4-ebiggers@kernel.org>

From: Eric Biggers <ebiggers@google.com>

commit bfc2b7e8518999003a61f91c1deb5e88ed77b07d upstream.

As described in "fscrypt: add fscrypt_is_nokey_name()", it's possible to
create a duplicate filename in an encrypted directory by creating a file
concurrently with adding the directory's encryption key.

Fix this bug on f2fs by rejecting no-key dentries in f2fs_add_link().

Note that the weird check for the current task in f2fs_do_add_link()
seems to make this bug difficult to reproduce on f2fs.

Fixes: 9ea97163c6da ("f2fs crypto: add filename encryption for f2fs_add_link")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20201118075609.120337-4-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/f2fs/f2fs.h |    2 ++
 1 file changed, 2 insertions(+)

--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2998,6 +2998,8 @@ bool f2fs_empty_dir(struct inode *dir);
 
 static inline int f2fs_add_link(struct dentry *dentry, struct inode *inode)
 {
+	if (fscrypt_is_nokey_name(dentry))
+		return -ENOKEY;
 	return f2fs_do_add_link(d_inode(dentry->d_parent), &dentry->d_name,
 				inode, inode->i_ino, inode->i_mode);
 }


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-5.4/fscrypt-remove-kernel-internal-constants-from-uapi-header.patch
queue-5.4/fscrypt-add-fscrypt_is_nokey_name.patch
queue-5.4/ext4-prevent-creating-duplicate-encrypted-filenames.patch
queue-5.4/ubifs-prevent-creating-duplicate-encrypted-filenames.patch
queue-5.4/f2fs-prevent-creating-duplicate-encrypted-filenames.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
