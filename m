Return-Path: <SRS0=loyI=C7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB47C2D0E2
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 11:30:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FE1F221EB
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Sep 2020 11:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RIG4TgpO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TPVYvWlD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FE1F221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mnW3oBZ2mYiaFeYbTTBqyM242l9HPcWk4FKhaSJ6NGA=; b=RIG4TgpOjOviAc0dVICXjGB7y
	xEfvV/63sFanvUfqZ0eaQ/+Uti0poGWAY5hBeo2oeyqRvYaLCCD/0WUZ6ObrML5QQSx8SPrREAABN
	CGujbh3VtZloIooXlgfuV1hMwrfvLIVyxyNEIiEgmp/bqkz6kijhEAPAfeBh7VzEj7H8K5IU6+dLM
	2ieVFHBKYrq40jOhOrcSoVy67Jq/WqPQGaNkv2F6SE/ohNWeLEttmZmuPHw7G6X0af9SnRRj205dN
	JClWBoJFilndz1SWy4QpBoaN2wlxGV3TR9mJPVcz1pme6HHwcWhdAalWpYfqRPTiP/T+McK1/rsfw
	ktFtMaLag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKgUZ-0005Ve-Ol; Tue, 22 Sep 2020 11:29:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKgUX-0005Uc-42
 for linux-mtd@lists.infradead.org; Tue, 22 Sep 2020 11:29:50 +0000
Received: from tleilax.poochiereds.net
 (68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAA4C23600;
 Tue, 22 Sep 2020 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600774187;
 bh=Rtabf4pcHe8DkWlrQYiZax+IoE7elEphUCXD07p8Kv8=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=TPVYvWlDl1nk+c/kNwxb4OaJKxHSZNcKrEYanb7OZHJvzfNLZ0TIQ57LGZSs4g/oo
 O/3hYdyIcAupQB0Fevm3j0VJCAFLwy4mkQOJFoDvqTEz5rlRrzPMEc8mdMpmWp3m2r
 qZfC5SE8JLVtwzT0a38q9VlsacraVJ8dJUmL6c5g=
Message-ID: <da7f608e01cd8725d8da668f1c4a847b29b9de68.camel@kernel.org>
Subject: Re: [PATCH v3 00/13] fscrypt: improve file creation flow
From: Jeff Layton <jlayton@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org
Date: Tue, 22 Sep 2020 07:29:45 -0400
In-Reply-To: <20200921223509.GB844@sol.localdomain>
References: <20200917041136.178600-1-ebiggers@kernel.org>
 <20200921223509.GB844@sol.localdomain>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_072949_335894_AC01161E 
X-CRM114-Status: GOOD (  29.45  )
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
Cc: ceph-devel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, Daniel Rosenberg <drosen@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-21 at 15:35 -0700, Eric Biggers wrote:
> On Wed, Sep 16, 2020 at 09:11:23PM -0700, Eric Biggers wrote:
> > Hello,
> > 
> > This series reworks the implementation of creating new encrypted files
> > by introducing new helper functions that allow filesystems to set up the
> > inodes' keys earlier, prior to taking too many filesystem locks.
> > 
> > This fixes deadlocks that are possible during memory reclaim because
> > fscrypt_get_encryption_info() isn't GFP_NOFS-safe, yet it's called
> > during an ext4 transaction or under f2fs_lock_op().  It also fixes a
> > similar deadlock where f2fs can try to recursively lock a page when the
> > test_dummy_encryption mount option is in use.
> > 
> > It also solves an ordering problem that the ceph support for fscrypt
> > will have.  For more details about this ordering problem, see the
> > discussion on Jeff Layton's RFC patchsets for ceph fscrypt support
> > (v1: https://lkml.kernel.org/linux-fscrypt/20200821182813.52570-1-jlayton@kernel.org/T/#u
> >  v2: https://lkml.kernel.org/linux-fscrypt/20200904160537.76663-1-jlayton@kernel.org/T/#u
> >  v3: https://lkml.kernel.org/linux-fscrypt/20200914191707.380444-1-jlayton@kernel.org/T/#u)
> > Note that v3 of the ceph patchset is based on v2 of this patchset.
> > 
> > Patch 1 adds the above-mentioned new helper functions.  Patches 2-5
> > convert ext4, f2fs, and ubifs to use them, and patches 6-9 clean up a
> > few things afterwards.
> > 
> > Finally, patches 10-13 change the implementation of
> > test_dummy_encryption to no longer set up an encryption key for
> > unencrypted directories, which was confusing and was causing problems.
> > 
> > This patchset applies to the master branch of
> > https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git.
> > It can also be retrieved from tag "fscrypt-file-creation-v3" of
> > https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git.
> > 
> > I'm looking to apply this for 5.10; reviews are greatly appreciated!
> > 
> > Changed v2 => v3:
> >   - Added patch that changes fscrypt_set_test_dummy_encryption() to take
> >     a 'const char *'.  (Needed by ceph.)
> >   - Fixed bug where fscrypt_prepare_new_inode() succeeded even if the
> >     new inode's key couldn't be set up.
> >   - Fixed bug where fscrypt_prepare_new_inode() wouldn't derive the
> >     dirhash key for new casefolded directories.
> >   - Made warning messages account for i_ino possibly being 0 now.
> > 
> > Changed v1 => v2:
> >   - Added mention of another deadlock this fixes.
> >   - Added patches to improve the test_dummy_encryption implementation.
> >   - Dropped an ext4 cleanup patch that can be done separately later.
> >   - Lots of small cleanups, and a couple small fixes.
> > 
> > Eric Biggers (13):
> >   fscrypt: add fscrypt_prepare_new_inode() and fscrypt_set_context()
> >   ext4: factor out ext4_xattr_credits_for_new_inode()
> >   ext4: use fscrypt_prepare_new_inode() and fscrypt_set_context()
> >   f2fs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
> >   ubifs: use fscrypt_prepare_new_inode() and fscrypt_set_context()
> >   fscrypt: adjust logging for in-creation inodes
> >   fscrypt: remove fscrypt_inherit_context()
> >   fscrypt: require that fscrypt_encrypt_symlink() already has key
> >   fscrypt: stop pretending that key setup is nofs-safe
> >   fscrypt: make "#define fscrypt_policy" user-only
> >   fscrypt: move fscrypt_prepare_symlink() out-of-line
> >   fscrypt: handle test_dummy_encryption in more logical way
> >   fscrypt: make fscrypt_set_test_dummy_encryption() take a 'const char
> >     *'
> 
> All applied to fscrypt.git#master for 5.10.
> 
> I'd still really appreciate more reviews and acks, though.
> 

You can add this to all of the fscrypt: patches. I've tested this under
the ceph patchset and it seems to do the right thing:

Acked-by: Jeff Layton <jlayton@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
