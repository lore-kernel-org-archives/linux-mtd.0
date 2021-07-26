Return-Path: <SRS0=DmD4=MS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8F1C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jul 2021 03:59:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E84960E78
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Jul 2021 03:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9E84960E78
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B15325hNiXmEuwNlEfCPgMBhu0d2XJHxvqvwrJcAxhc=; b=uhFHZ2pbAe/N/J
	EY89wx1TdnP+lN/7DWO8vD17N2EYkgBvZyNu4S43qASIOM5r46FRezP2GXWiBYEIH0Z3vt3pnjvDv
	WG+246g4w7BeIHlJeshOPdMRXbepERCgY5Jo5iaNtF9zEwL0N+yTfaMjhdsDmlM5BHSQFH4f+qlpK
	zGXxfItwQbuPSjgK1RnQKjGLKzeQZpytaI0oXZV8eH1HIyz66udx7r44ptosThaXJTxwsp0v2tdZt
	TVEBrGSGZClBT5E8dvgmTC4GjokTR3MxuQRO6fW2t1T32JBQJWovB3o2qfyTjPnbwtCBLH1UNBQ1H
	V596uiPQhbTs3ayDY3NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7rlH-009Vpu-1J; Mon, 26 Jul 2021 03:58:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7rlE-009VoS-CA
 for linux-mtd@lists.infradead.org; Mon, 26 Jul 2021 03:58:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4FA6960EB2;
 Mon, 26 Jul 2021 03:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627271915;
 bh=WPLxji5Fu3Q2Q6hrxcLMN8a8q3esfgs4pl4CERub5YQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qgmYCrRdhNjrVPAoHCovW00SjzclRfqwwr+TF3YR2+VJF1OfgIcpNJhkK4eByklBX
 1XsJZZP4DbXkPdxsLdLYxA0F0+DFSdkn+q82TKancpVQOq8njTx5CMjF365UH0jLct
 +XR0U8gxeOY8AKCfFMl8mQ4vk8iUZzr5EkvUdRyExEMjbU5Ihr5JHoZbSbzkOIcn1x
 KnYkutj0MPTAemKe1UU4n1kFuON6bpcSgNOo/rQL9qTHaQ9hC4omSBP1szv45dUwzW
 D9kauqkb7x7Q6cQlBmkD77q96XTWfchBYyNXTSZkExEq3gQ9n9Bt7ND2MMha2wKIni
 Y6XgTywBxx92g==
Date: Sun, 25 Jul 2021 20:58:34 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/5] fscrypt: report correct st_size for encrypted symlinks
Message-ID: <YP4y6izInCXVJMup@sol.localdomain>
References: <20210702065350.209646-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210702065350.209646-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210725_205836_472765_C977367A 
X-CRM114-Status: GOOD (  13.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jul 01, 2021 at 11:53:45PM -0700, Eric Biggers wrote:
> This series makes the stat() family of syscalls start reporting the
> correct size for encrypted symlinks.
> 
> See patch 1 for a detailed explanation of the problem and solution.
> 
> Patch 1 adds a helper function that computes the correct size for an
> encrypted symlink.  Patches 2-4 make the filesystems with fscrypt
> support use it, and patch 5 updates the documentation.
> 
> This series applies to mainline commit 3dbdb38e2869.
> 
> Eric Biggers (5):
>   fscrypt: add fscrypt_symlink_getattr() for computing st_size
>   ext4: report correct st_size for encrypted symlinks
>   f2fs: report correct st_size for encrypted symlinks
>   ubifs: report correct st_size for encrypted symlinks
>   fscrypt: remove mention of symlink st_size quirk from documentation
> 
>  Documentation/filesystems/fscrypt.rst |  5 ---
>  fs/crypto/hooks.c                     | 44 +++++++++++++++++++++++++++
>  fs/ext4/symlink.c                     | 12 +++++++-
>  fs/f2fs/namei.c                       | 12 +++++++-
>  fs/ubifs/file.c                       | 13 +++++++-
>  include/linux/fscrypt.h               |  7 +++++
>  6 files changed, 85 insertions(+), 8 deletions(-)
> 
> 
> base-commit: 3dbdb38e286903ec220aaf1fb29a8d94297da246

All applied to fscrypt.git#master for 5.15.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
