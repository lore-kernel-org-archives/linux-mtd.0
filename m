Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FF7C56201
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 23:29:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEE0F2100A
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 23:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1YWSvg3V";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xe5/qIrg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEE0F2100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TgskPsCRSgd7WbWIoIARdqugx5cJuQ9m5J0KYx3InMs=; b=1YWSvg3V2wjn8q1il3rl8DDVM
	6ctZgtCAUAxr54h+8F+Eh26yyCH1B69VGZY2uOEY6HzgN0e+r46Pw6IBWOwHfgrb5lf7lSeG080m0
	9YDViQ1XRbfMhNAo7frCIPr6JxHFjJMeJBaS49P+asXkjT/oSpPmVSLRLGnTqBlt4x3CRUtVNbctH
	6GCEPR5DVeXuX9h/CKB1rbbIVHeAF5ItzlStftCjXcudduyMPXeSFg3SByD/UwY0xt1iRhRkLO/Ep
	TOhAgCBqP3hGvtsRePZJKvxZmJGN35FpOc3a/npqFeXgkuq58fBVCMA39VwF3z1ubqcSNRt6bBauR
	q8i771Jfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khhjT-0005rl-2a; Tue, 24 Nov 2020 23:28:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khhjO-0005qc-0p
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 23:28:20 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 213DF2100A;
 Tue, 24 Nov 2020 23:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606260496;
 bh=Oo4Tlzm+6V2f+cAlPJ1FnNFARv4c7gmBZzibGJ+KTPA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xe5/qIrgFn//Ktx8T3FzD8iH+OmarHXR72XJec5aY3dKU9ct5j77kLudzv2sZf5oJ
 OGLz2xon5t1SKARHH1Shpa+fH+vE/ro2Dxh4IgiIiXhu9GMsszm9Js/C2MAv2yO0kf
 +eIj3mO0kFqZH0y5k2Aj81/VXm+rLTLYJc0plIV0=
Date: Tue, 24 Nov 2020 15:28:14 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: Re: [PATCH 0/5] fscrypt: prevent creating duplicate encrypted
 filenames
Message-ID: <X72XDv89kSPWCqTQ@sol.localdomain>
References: <20201118075609.120337-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118075609.120337-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_182818_158922_6CF06069 
X-CRM114-Status: GOOD (  20.55  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 11:56:04PM -0800, Eric Biggers wrote:
> This series fixes a longstanding race condition where a duplicate
> filename can be created in an encrypted directory if a syscall that
> creates a new filename (e.g. open() or mkdir()) races with the
> directory's encryption key being added.
> 
> To close this race, we need to prevent creating files if the dentry is
> still marked as a no-key name.  I.e. we need to fail the ->create() (or
> other operation that creates a new filename) if the key wasn't available
> when doing the dentry lookup earlier in the syscall, even if the key was
> concurrently added between the dentry lookup and ->create().
> 
> See patch 1 for a more detailed explanation.
> 
> Patch 1 introduces a helper function required for the fix.  Patches 2-4
> fix the bug on ext4, f2fs, and ubifs.  Patch 5 is a cleanup.
> 
> This fixes xfstest generic/595 on ubifs, but that test was hitting this
> bug only accidentally.  I've also written a new xfstest which reproduces
> this bug on both ext4 and ubifs.
> 
> Eric Biggers (5):
>   fscrypt: add fscrypt_is_nokey_name()
>   ext4: prevent creating duplicate encrypted filenames
>   f2fs: prevent creating duplicate encrypted filenames
>   ubifs: prevent creating duplicate encrypted filenames
>   fscrypt: remove unnecessary calls to fscrypt_require_key()
> 
>  fs/crypto/hooks.c       | 31 +++++++++++--------------------
>  fs/ext4/namei.c         |  3 +++
>  fs/f2fs/f2fs.h          |  2 ++
>  fs/ubifs/dir.c          | 17 +++++++++++++----
>  include/linux/fscrypt.h | 37 +++++++++++++++++++++++++++++++++++--
>  5 files changed, 64 insertions(+), 26 deletions(-)
> 
> 
> base-commit: 3ceb6543e9cf6ed87cc1fbc6f23ca2db903564cd

All applied to fscrypt.git#master for 5.11.

I'd still appreciate acks for ext4, f2fs, and ubifs though.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
