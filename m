Return-Path: <SRS0=SIcx=WK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9478CC433FF
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 22:36:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 676A82064A
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Aug 2019 22:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="keE9wfr/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HZrWel2T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 676A82064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kRTVQdeqBhgNY+XF3Iiuub4Y5QZwCAGIZ4vNO3QIPKc=; b=keE9wfr/oPlK/W
	9BOVt7etayGQKY6Pj4w0zTgWtxb3+QvBY+EFxnlFhSF++PlOTK93nX5uckPmfqy1Om969OFfMMNrx
	VOjBn5o93DRNcTptp3Q8+vP2wWtex49KoYFQKbtmVP7kxATievYyVLCIGF4uYL9/3ySmwzMP6TfNN
	zTHgLZOYECIfYXIT9Xec1RPociPvjZz74cK/OmV1DlU54EhFaYXBS7+dTaObYqeBiEY8i0Uqzqyon
	DjaLdWla980C++qMyx8lQkhsB6QsVMhiDUe5uif2GD91qSq3VaotRF3o6UyApkBnpUk6s4dV9jwQ8
	Vf/qXO2gg/63pzP3u8yA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hy1rw-0006PU-CH; Wed, 14 Aug 2019 22:35:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hy1rt-0006Ix-VO
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2019 22:35:47 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 081B12064A;
 Wed, 14 Aug 2019 22:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565822145;
 bh=l8Slk/c9NCmIURt4vJ515GO1o+OGPytEBQ6mmXfsoCc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HZrWel2TOGlxa/OLzSgK6FZYkC9k5fmPXmA7SczQPr/nZXF5fhlrN12mEtzuphrKx
 naClhxqMHYFXy1R/MsRWN561L+U0nJMj+RQmokWi+/oM+CwhuEESn4oiXIYXhBuZnf
 2ZHVbx8JH1SSewjdXfJj0RGtoca3cSvPVjunHj9Y=
Date: Wed, 14 Aug 2019 15:35:43 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Theodore Y. Ts'o" <tytso@mit.edu>
Subject: Re: [PATCH v8 10/20] fscrypt: add FS_IOC_REMOVE_ENCRYPTION_KEY ioctl
Message-ID: <20190814223542.GE101319@gmail.com>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-crypto@vger.kernel.org, keyrings@vger.kernel.org,
 linux-api@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Paul Crowley <paulcrowley@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20190805162521.90882-1-ebiggers@kernel.org>
 <20190805162521.90882-11-ebiggers@kernel.org>
 <20190813000644.GH28705@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190813000644.GH28705@mit.edu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_153546_055980_E65713FF 
X-CRM114-Status: GOOD (  17.80  )
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
Cc: Satya Tangirala <satyat@google.com>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Aug 12, 2019 at 08:06:44PM -0400, Theodore Y. Ts'o wrote:
> > +		/* Some inodes still reference this key; try to evict them. */
> > +		if (try_to_lock_encrypted_files(sb, mk) != 0)
> > +			status_flags |=
> > +				FSCRYPT_KEY_REMOVAL_STATUS_FLAG_FILES_BUSY;
> > +	}
> 
> try_to_lock_encrypted_files() can return other errors besides -EBUSY;
> in particular sync_filesystem() can return other errors, such as -EIO
> or -EFSCORUPTED.  In that case, I think we're better off returning the
> relevant status code back to the user.  We will have already wiped the
> master key, but this situation will only happen in exceptional
> conditions (e.g., user has ejected the sdcard, etc.), so it's not
> worth it to try to undo the master key wipe to try to restore things
> to the pre-ioctl execution state.
> 
> So I think we should capture the return code from
> try_to_lock_encrypted_files, and if it is EBUSY, we can set FILES_BUSY
> flag and return success.  Otherwise, we should return the error.
> 
> If you agree, please fix that up and then feel free to add:
> 
> Reviewed-by: Theodore Ts'o <tytso@mit.edu>
> 
> 						- Ted

Yes, that makes sense.  I've made the following change to this patch:

diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 9901593051424b..c3423f0edc7014 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -479,6 +479,7 @@ int fscrypt_ioctl_remove_key(struct file *filp, void __user *_uarg)
 	struct key *key;
 	struct fscrypt_master_key *mk;
 	u32 status_flags = 0;
+	int err;
 	bool dead;
 
 	if (copy_from_user(&arg, uarg, sizeof(arg)))
@@ -514,11 +515,15 @@ int fscrypt_ioctl_remove_key(struct file *filp, void __user *_uarg)
 		 * key object is free to be removed from the keyring.
 		 */
 		key_invalidate(key);
+		err = 0;
 	} else {
 		/* Some inodes still reference this key; try to evict them. */
-		if (try_to_lock_encrypted_files(sb, mk) != 0)
+		err = try_to_lock_encrypted_files(sb, mk);
+		if (err == -EBUSY) {
 			status_flags |=
 				FSCRYPT_KEY_REMOVAL_STATUS_FLAG_FILES_BUSY;
+			err = 0;
+		}
 	}
 	/*
 	 * We return 0 if we successfully did something: wiped the secret, or
@@ -527,7 +532,9 @@ int fscrypt_ioctl_remove_key(struct file *filp, void __user *_uarg)
 	 * including all files locked.
 	 */
 	key_put(key);
-	return put_user(status_flags, &uarg->removal_status_flags);
+	if (err == 0)
+		err = put_user(status_flags, &uarg->removal_status_flags);
+	return err;
 }
 EXPORT_SYMBOL_GPL(fscrypt_ioctl_remove_key);
 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
