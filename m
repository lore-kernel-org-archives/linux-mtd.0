Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFFCC4727D
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 22:36:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F98223A1B
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 22:36:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B0JJNvxJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yTm70EIF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F98223A1B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zcPrdUQF6o9ZC6Y2p7R1SwBt6sqVnlCi9FxtIHTx4Wg=; b=B0JJNvxJD0/+PIb+gxzGJMxjK
	ZpL/TYZhw96Vn2/ZWJTLBLq4fGHn+BszU3Eogp6RztcefaledHRqranb/vS6/WM7gvjLuB0H3SW7v
	1a7BhM5pSXHW7cMQrhB236GNk5eZpH/Ok+otst37VS4QD5ZRxyPq4f5dXOjBeNwbsQ1Uz/Gv1Yux0
	2sH7KeZObt6SN+9XJo47sRaHuM6E0vso+I+ymIKCW0UsPC43J6b64X1s02ljzPyO8jI5Ih/Dcg+EU
	cwMW1KOiPYmcgcRq5lfYebuxzry+7qCwzmpcVS3hbP36lKbwF8hxK2WzRxLL9e+dB/yb+J8iLfvXs
	3/sZm3U1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKUOy-0002Ec-95; Mon, 21 Sep 2020 22:35:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKUOv-0002Dx-6J
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 22:35:14 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50B7723600;
 Mon, 21 Sep 2020 22:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600727711;
 bh=eml0ZqP5g84PASceZDuidrzSEIkKG6QBTsGUERN/lCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=yTm70EIF5L3cDA738eksUTMnmt4IyGIEwR0FjKfgCY3qO+Bxw6G/cQ7u1zYFoqAMR
 2ajCEuRr3fytxtv6dKbYTg5ejEPpFaunk7/++NJaKPSMaFYZtYX3jiZTu32Ro07qia
 WqVkbphYB1ZVsnKvndp0U9eqMDe2cdQD0aq8Mejs=
Date: Mon, 21 Sep 2020 15:35:09 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: Re: [PATCH v3 00/13] fscrypt: improve file creation flow
Message-ID: <20200921223509.GB844@sol.localdomain>
References: <20200917041136.178600-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200917041136.178600-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_183513_352613_7EEF1DAB 
X-CRM114-Status: GOOD (  25.22  )
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
Cc: Daniel Rosenberg <drosen@google.com>, Jeff Layton <jlayton@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mtd@lists.infradead.org,
 ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Sep 16, 2020 at 09:11:23PM -0700, Eric Biggers wrote:
> Hello,
> 
> This series reworks the implementation of creating new encrypted files
> by introducing new helper functions that allow filesystems to set up the
> inodes' keys earlier, prior to taking too many filesystem locks.
> 
> This fixes deadlocks that are possible during memory reclaim because
> fscrypt_get_encryption_info() isn't GFP_NOFS-safe, yet it's called
> during an ext4 transaction or under f2fs_lock_op().  It also fixes a
> similar deadlock where f2fs can try to recursively lock a page when the
> test_dummy_encryption mount option is in use.
> 
> It also solves an ordering problem that the ceph support for fscrypt
> will have.  For more details about this ordering problem, see the
> discussion on Jeff Layton's RFC patchsets for ceph fscrypt support
> (v1: https://lkml.kernel.org/linux-fscrypt/20200821182813.52570-1-jlayton@kernel.org/T/#u
>  v2: https://lkml.kernel.org/linux-fscrypt/20200904160537.76663-1-jlayton@kernel.org/T/#u
>  v3: https://lkml.kernel.org/linux-fscrypt/20200914191707.380444-1-jlayton@kernel.org/T/#u)
> Note that v3 of the ceph patchset is based on v2 of this patchset.
> 
> Patch 1 adds the above-mentioned new helper functions.  Patches 2-5
> convert ext4, f2fs, and ubifs to use them, and patches 6-9 clean up a
> few things afterwards.
> 
> Finally, patches 10-13 change the implementation of
> test_dummy_encryption to no longer set up an encryption key for
> unencrypted directories, which was confusing and was causing problems.
> 
> This patchset applies to the master branch of
> https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git.
> It can also be retrieved from tag "fscrypt-file-creation-v3" of
> https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git.
> 
> I'm looking to apply this for 5.10; reviews are greatly appreciated!
> 
> Changed v2 => v3:
>   - Added patch that changes fscrypt_set_test_dummy_encryption() to take
>     a 'const char *'.  (Needed by ceph.)
>   - Fixed bug where fscrypt_prepare_new_inode() succeeded even if the
>     new inode's key couldn't be set up.
>   - Fixed bug where fscrypt_prepare_new_inode() wouldn't derive the
>     dirhash key for new casefolded directories.
>   - Made warning messages account for i_ino possibly being 0 now.
> 
> Changed v1 => v2:
>   - Added mention of another deadlock this fixes.
>   - Added patches to improve the test_dummy_encryption implementation.
>   - Dropped an ext4 cleanup patch that can be done separately later.
>   - Lots of small cleanups, and a couple small fixes.
> 
> Eric Biggers (13):
>   fscrypt: add fscrypt_prepare_new_inode() and fscrypt_set_context()
>   ext4: factor out ext4_xattr_credits_for_new_inode()
>   ext4: use fscrypt_prepare_new_inode() and fscrypt_set_context()
>   f2fs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
>   ubifs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
>   fscrypt: adjust logging for in-creation inodes
>   fscrypt: remove fscrypt_inherit_context()
>   fscrypt: require that fscrypt_encrypt_symlink() already has key
>   fscrypt: stop pretending that key setup is nofs-safe
>   fscrypt: make "#define fscrypt_policy" user-only
>   fscrypt: move fscrypt_prepare_symlink() out-of-line
>   fscrypt: handle test_dummy_encryption in more logical way
>   fscrypt: make fscrypt_set_test_dummy_encryption() take a 'const char
>     *'

All applied to fscrypt.git#master for 5.10.

I'd still really appreciate more reviews and acks, though.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
