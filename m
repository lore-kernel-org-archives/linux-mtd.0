Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 853EBC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 23:43:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BAFC2100A
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 23:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kuI5fiPb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0O9/cSvw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BAFC2100A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SD984A8lLxBLoG6RS6Dq1r+yFOSmM1Aao+CrlJtafhc=; b=kuI5fiPbrYJUkly6rL6VQbK3M
	bGZVfkMSP+c0/q3IjVgDmx6xog4+2hN4V6ictsDWDSlzCM9/aFLm4AR+plJ3doJTy9S3wNv50GT7e
	qQz9l9NxJ2BEPHL/vpZyXtC+EXztEpwVkmPjImRPq7g95FOpswqH4k0qNmtO38stOs6N/iGsnWqsU
	98p8+yvpK2OmCKA9DyGXZYNQED+sr7MzTcjnB6loxePlVBtfLPy6gKVDqxuPYadPyrNTpewRpQzT8
	zKMke7lMx3GDtX0n4/vUb/M22bvw9BctC3d1YDsIUGMJfyuo9K+3ZO4/xLK/By0CjV/d7OadMo0pp
	blpv93ONw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khhx7-0006xd-Cg; Tue, 24 Nov 2020 23:42:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khhx4-0006wx-Gr
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 23:42:27 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 608562100A;
 Tue, 24 Nov 2020 23:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606261345;
 bh=KAJWl0OBsGQqeiLErWrRxDNjM1Wbv9mxXjghZ+pYMxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0O9/cSvw5+fLkdPBEZCzDs8Laf2SY6KdYW3Z/6HYrcr0IJ6EeqKAisLs5uEM4ePpC
 crUJACZMk75/hZFUxitjd2eP47PoB0h7bABvIHcn2y18fIf8Eptke/KsuCFhDtWdoQ
 bTUOA7zCF+KCeWdQdkrLvT0i9pe/CQyz18SUBjUw=
Date: Tue, 24 Nov 2020 15:42:22 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Subject: Re: [PATCH] fscrypt: simplify master key locking
Message-ID: <X72aXth+cz3k7uvD@sol.localdomain>
References: <20201117032626.320275-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201117032626.320275-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_184226_708520_08D1D419 
X-CRM114-Status: GOOD (  17.44  )
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
Cc: linux-ext4@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Nov 16, 2020 at 07:26:26PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The stated reasons for separating fscrypt_master_key::mk_secret_sem from
> the standard semaphore contained in every 'struct key' no longer apply.
> 
> First, due to commit a992b20cd4ee ("fscrypt: add
> fscrypt_prepare_new_inode() and fscrypt_set_context()"),
> fscrypt_get_encryption_info() is no longer called from within a
> filesystem transaction.
> 
> Second, due to commit d3ec10aa9581 ("KEYS: Don't write out to userspace
> while holding key semaphore"), the semaphore for the "keyring" key type
> no longer ranks above page faults.
> 
> That leaves performance as the only possible reason to keep the separate
> mk_secret_sem.  Specifically, having mk_secret_sem reduces the
> contention between setup_file_encryption_key() and
> FS_IOC_{ADD,REMOVE}_ENCRYPTION_KEY.  However, these ioctls aren't
> executed often, so this doesn't seem to be worth the extra complexity.
> 
> Therefore, simplify the locking design by just using key->sem instead of
> mk_secret_sem.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/crypto/fscrypt_private.h | 19 ++++++-------------
>  fs/crypto/hooks.c           |  8 +++++---
>  fs/crypto/keyring.c         |  8 +-------
>  fs/crypto/keysetup.c        | 20 +++++++++-----------
>  4 files changed, 21 insertions(+), 34 deletions(-)

Applied to fscrypt.git#master for 5.11.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
