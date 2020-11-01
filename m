Return-Path: <SRS0=Psr0=EH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA14CC2D0A3
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 10:39:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B33B2072C
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 10:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k+StY+0U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2lWiw1mX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B33B2072C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=RevOHbvpkpbxmnuIhjEwIlrRtc4Ku+mLNn3EXFF16y0=; b=k+StY+0UsHpxx8dGNepNdat8C
	7h4OHYgbBTAbx63X62INeryoAst0pej5/PMKb15opgJQXalEWqNidMJbC02YpmMVkGHYVZHJs28kQ
	yyriWOO91LY+/5b7bYy2c/OHLiHTvjjRTEiRg5F/QB5ANkJYocaMOeZtajxr+KQL7zH+e/OSFpNay
	GBzAgCgUHP9O6kBrYvq8E+N/V3hOo4mzMZqIsmkWsDEApwQedvFXOu/mkoFVTcE1XNEgDGZkFTRlF
	8RJ9NJpQpEHl3sjyLcvPYHPjBflrKu2pN6sNp8Unq0dDQemSIStfqE+qIaWDfQ8JrEgpKHtL7WfPy
	UwKV67wfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZAkz-0003Pd-Rk; Sun, 01 Nov 2020 10:38:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZAks-0003NY-0Y
 for linux-mtd@lists.infradead.org; Sun, 01 Nov 2020 10:38:39 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE9B32084C;
 Sun,  1 Nov 2020 10:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604227113;
 bh=GurUq4W2huofrU6jLCvJXLA6jIU5fQdCFuhJS993u6E=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=2lWiw1mXJ0SoS9dgV9xDlVrZ8eDEvpwXalYswfzWJXPSY0p3zwVK0W0ZP9FmrPdLD
 xo0RocQoOywk9q7FfV2I7+/NtOB/5NE/MKQXCMv+K8/zekAlTs5uMM0S3+f4H0KulY
 09NvbtBVE67vUyWYTIrjAuLs+Fd36lNMCPphN9L8=
Subject: Patch "fscrypt: only set dentry_operations on ciphertext dentries"
 has been added to the 4.19-stable tree
To: ebiggers@google.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 tytso@mit.edu
From: <gregkh@linuxfoundation.org>
Date: Sun, 01 Nov 2020 11:39:03 +0100
In-Reply-To: <20201031220553.1085782-5-ebiggers@kernel.org>
Message-ID: <16042271439860@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_053834_253978_BC83CA64 
X-CRM114-Status: GOOD (  15.59  )
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

    fscrypt: only set dentry_operations on ciphertext dentries

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     fscrypt-only-set-dentry_operations-on-ciphertext-dentries.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Sun Nov  1 11:35:18 AM CET 2020
From: Eric Biggers <ebiggers@kernel.org>
Date: Sat, 31 Oct 2020 15:05:52 -0700
Subject: fscrypt: only set dentry_operations on ciphertext dentries
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org, Theodore Ts'o <tytso@mit.edu>
Message-ID: <20201031220553.1085782-5-ebiggers@kernel.org>

From: Eric Biggers <ebiggers@google.com>

commit d456a33f041af4b54f3ce495a86d00c246165032 upstream.

Plaintext dentries are always valid, so only set fscrypt_d_ops on
ciphertext dentries.

Besides marginally improved performance, this allows overlayfs to use an
fscrypt-encrypted upperdir, provided that all the following are true:

    (1) The fscrypt encryption key is placed in the keyring before
	mounting overlayfs, and remains while the overlayfs is mounted.

    (2) The overlayfs workdir uses the same encryption policy.

    (3) No dentries for the ciphertext names of subdirectories have been
	created in the upperdir or workdir yet.  (Since otherwise
	d_splice_alias() will reuse the old dentry with ->d_op set.)

One potential use case is using an ephemeral encryption key to encrypt
all files created or changed by a container, so that they can be
securely erased ("crypto-shredded") after the container stops.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/crypto/hooks.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -115,9 +115,8 @@ int __fscrypt_prepare_lookup(struct inod
 		spin_lock(&dentry->d_lock);
 		dentry->d_flags |= DCACHE_ENCRYPTED_NAME;
 		spin_unlock(&dentry->d_lock);
+		d_set_d_op(dentry, &fscrypt_d_ops);
 	}
-
-	d_set_d_op(dentry, &fscrypt_d_ops);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(__fscrypt_prepare_lookup);


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-4.19/fscrypt-only-set-dentry_operations-on-ciphertext-dentries.patch
queue-4.19/fscrypt-clean-up-and-improve-dentry-revalidation.patch
queue-4.19/fscrypt-fix-race-allowing-rename-and-link-of-ciphertext-dentries.patch
queue-4.19/fs-fscrypt-clear-dcache_encrypted_name-when-unaliasing-directory.patch
queue-4.19/fscrypt-fix-race-where-lookup-marks-plaintext-dentry-as-ciphertext.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
