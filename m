Return-Path: <SRS0=Kb5f=GC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD865C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Dec 2020 15:38:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D6A7207A6
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Dec 2020 15:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D6A7207A6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:From:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=oV2SD0K+QRm7StthEfYj4LJUvhNepm37OS22HhC84Cw=; b=b77eJm2pevWjpFNCN1C64u4MC
	NzN1wiv+A+YwEROVWJw3ASVtNWWbrUNsU38NU2Vl840Fgt4WAy6i+50kYafXoG3XzQRTcnK1UBiyc
	4jmvIwqHMYe7YmI3pfyvtT91FM0cAkwAGQzMfErW88cT7AF16o9FZocPNHts2JAqv6Sd6vnC/08iV
	8SOTE1smBPSVRJvo1e4dh5xzCM+XFasloyslGLqbbtMBAJW9cr4RIy+Co/gUEhbrofmTO12G6OHCE
	30d5vrzB4/OvMpvT68/U/AMMqfzwRV2Ajum9dpXGUnetW/1qhG4qRZn4rls8QZBFq1mvN0IjMP01L
	nZOzTVMXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kudYF-0003ZN-QG; Wed, 30 Dec 2020 15:38:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kudYC-0003YX-LO
 for linux-mtd@lists.infradead.org; Wed, 30 Dec 2020 15:38:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 690722222A;
 Wed, 30 Dec 2020 15:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1609342692;
 bh=DeYkeLHRQrYTnig0CPXfmOEKsjNpUaMtwtSg5yYEOWc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=mYuqYmpdmcOvEM6CJtU/GkojTKn4tx+c6KZz8KAkMBYT9s37RknNGbhd2XKwBZX4t
 z479ddQq0XvpF5yxf2ipFFhTnTw6Wix0UjpGvGBx1wD62gHMuc3hajfNY4TdIodNFR
 DFJu46ynLyd81Gbv1ah4LtpkcAvmm/ugYQ8kwKEc=
Subject: Patch "ubifs: prevent creating duplicate encrypted filenames" has
 been added to the 5.4-stable tree
To: ebiggers@google.com, ebiggers@kernel.org, gregkh@linuxfoundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
From: <gregkh@linuxfoundation.org>
Date: Wed, 30 Dec 2020 16:39:12 +0100
In-Reply-To: <20201228185433.61129-5-ebiggers@kernel.org>
Message-ID: <160934275221825@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201230_103812_934711_7A061130 
X-CRM114-Status: GOOD (  14.72  )
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

    ubifs: prevent creating duplicate encrypted filenames

to the 5.4-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     ubifs-prevent-creating-duplicate-encrypted-filenames.patch
and it can be found in the queue-5.4 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From foo@baz Wed Dec 30 04:37:58 PM CET 2020
From: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 28 Dec 2020 10:54:33 -0800
Subject: ubifs: prevent creating duplicate encrypted filenames
To: stable@vger.kernel.org
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org
Message-ID: <20201228185433.61129-5-ebiggers@kernel.org>

From: Eric Biggers <ebiggers@google.com>

commit 76786a0f083473de31678bdb259a3d4167cf756d upstream.

As described in "fscrypt: add fscrypt_is_nokey_name()", it's possible to
create a duplicate filename in an encrypted directory by creating a file
concurrently with adding the directory's encryption key.

Fix this bug on ubifs by rejecting no-key dentries in ubifs_create(),
ubifs_mkdir(), ubifs_mknod(), and ubifs_symlink().

Note that ubifs doesn't actually report the duplicate filenames from
readdir, but rather it seems to replace the original dentry with a new
one (which is still wrong, just a different effect from ext4).

On ubifs, this fixes xfstest generic/595 as well as the new xfstest I
wrote specifically for this bug.

Fixes: f4f61d2cc6d8 ("ubifs: Implement encrypted filenames")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20201118075609.120337-5-ebiggers@kernel.org
Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/ubifs/dir.c |   17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

--- a/fs/ubifs/dir.c
+++ b/fs/ubifs/dir.c
@@ -278,6 +278,15 @@ done:
 	return d_splice_alias(inode, dentry);
 }
 
+static int ubifs_prepare_create(struct inode *dir, struct dentry *dentry,
+				struct fscrypt_name *nm)
+{
+	if (fscrypt_is_nokey_name(dentry))
+		return -ENOKEY;
+
+	return fscrypt_setup_filename(dir, &dentry->d_name, 0, nm);
+}
+
 static int ubifs_create(struct inode *dir, struct dentry *dentry, umode_t mode,
 			bool excl)
 {
@@ -301,7 +310,7 @@ static int ubifs_create(struct inode *di
 	if (err)
 		return err;
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	err = ubifs_prepare_create(dir, dentry, &nm);
 	if (err)
 		goto out_budg;
 
@@ -961,7 +970,7 @@ static int ubifs_mkdir(struct inode *dir
 	if (err)
 		return err;
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	err = ubifs_prepare_create(dir, dentry, &nm);
 	if (err)
 		goto out_budg;
 
@@ -1046,7 +1055,7 @@ static int ubifs_mknod(struct inode *dir
 		return err;
 	}
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	err = ubifs_prepare_create(dir, dentry, &nm);
 	if (err) {
 		kfree(dev);
 		goto out_budg;
@@ -1130,7 +1139,7 @@ static int ubifs_symlink(struct inode *d
 	if (err)
 		return err;
 
-	err = fscrypt_setup_filename(dir, &dentry->d_name, 0, &nm);
+	err = ubifs_prepare_create(dir, dentry, &nm);
 	if (err)
 		goto out_budg;
 


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-5.4/fscrypt-remove-kernel-internal-constants-from-uapi-header.patch
queue-5.4/fscrypt-add-fscrypt_is_nokey_name.patch
queue-5.4/ext4-prevent-creating-duplicate-encrypted-filenames.patch
queue-5.4/ubifs-prevent-creating-duplicate-encrypted-filenames.patch
queue-5.4/f2fs-prevent-creating-duplicate-encrypted-filenames.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
