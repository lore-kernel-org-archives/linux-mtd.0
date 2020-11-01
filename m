Return-Path: <SRS0=Psr0=EH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95AFC388F9
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 10:39:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B4012071A
	for <linux-mtd@archiver.kernel.org>; Sun,  1 Nov 2020 10:39:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S/nchSAM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwZghQSo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B4012071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bSKtCBBR5Gy9/W7x0fHope0p94xYjECuzEq6T5Rh4WQ=; b=S/nchSAM9S1RUBQK6OAXNKc/y
	HsJ+jWnvETrKWapb+XfsWgKi0LDKVZ3Byk5NQ4XJigV3+x4Y3AmM3AwU7o3nA6AxUNBEuDJt+Ovtj
	igbSC96VLOqj5VTWpQNs22nofkr4UL+aEP9+MGmTYz3T7rhU6xZm8w82ZwCwlUzc1MVV0FnSpFttI
	vs0GDMSSyJkcPwJCJBIZJG8VviEztmzTV4VWuvnWkoafB06CqPqdbZfAoMFzcUT/drlG6ykNYOAnB
	KlKqyvgtd7FH8gkSdYJ9d3TzfRGuNlzKqsUbcU4z/KO7pKnsazzPbJyu0O47yoQtbgwsbhUgt7zy7
	5vPyp4ocw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZAkx-0003Ov-4p; Sun, 01 Nov 2020 10:38:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZAku-0003O7-CD
 for linux-mtd@lists.infradead.org; Sun, 01 Nov 2020 10:38:37 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 61F502080A;
 Sun,  1 Nov 2020 10:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604227115;
 bh=kT4U+hpjwiXR7kNlPgarRqNhSt/kq7ZaLXhFmR2LbQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KwZghQSo6asyOSwAGcIuzY0UE8Ll7TcWerMF4HiY437wTMEeZMLuI4+ismHuP+O0B
 5sf5Bpkyc2MdV5C39/CcQGZpBrRfiKuj2XPnQFywZCi/nLoXJJFRlm0Dxn2xhbHTo9
 y1qhSdw37v3ZRWB6tH0DXiuEkOKdWX9SIyvhzzGE=
Date: Sun, 1 Nov 2020 11:39:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 4.19 0/5] backport some more fscrypt fixes to 4.19
Message-ID: <20201101103906.GA2689688@kroah.com>
References: <20201031220553.1085782-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201031220553.1085782-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_053836_490674_E2BBA7B0 
X-CRM114-Status: GOOD (  13.39  )
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
 linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sat, Oct 31, 2020 at 03:05:48PM -0700, Eric Biggers wrote:
> Backport some fscrypt fixes from upstream 5.2 to 4.19-stable.
> 
> This is needed to get 'kvm-xfstests -c ext4,f2fs,ubifs -g encrypt' to
> fully pass on 4.19-stable.  Before, generic/397 and generic/429 failed
> on UBIFS due to missing "fscrypt: fix race where ->lookup() marks
> plaintext dentry as ciphertext".
> 
> This also fixes some bugs that aren't yet covered by the xfstests.
> E.g., "fs, fscrypt: clear DCACHE_ENCRYPTED_NAME when unaliasing
> directory" fixes a bug that caused real-world problems on Chrome OS.
> 
> Some relatively straightforward adjustments were needed to the patches,
> mainly due to the refactoring of fscrypt.h that was done in 5.1.

All now queued up, thanks!

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
