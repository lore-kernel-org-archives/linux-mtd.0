Return-Path: <SRS0=FcEh=EP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCC48C2D0A3
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 22:51:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73D0C206CB
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2020 22:51:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T3wGr7EM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="x/RoupRN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73D0C206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oxTe5Cz/71OUiU84EG2TWIidXif9b3LSXURe5TTu2BM=; b=T3wGr7EM+GatZrbxQl/ATfeGW
	3+ZJwS0L0LQCAXmOsza9NygB2PNvot26Y9u0zRGxbCLgbZfkmsQQ5C4H4fGLipNIfhO1DWtVWZ6Hk
	nueVjXx9bd/y66NZjc2ZaumfsPMaABUvNmY9qs39smeM8ihAg0eB3eviLwV1q1zVIFrNUhFfyp2Xr
	+FLCClHS4JyLqv33O5B8MGCE/2eL9FWAfTptC88TrXLpmvARTfLPzN/cpRpviWh3lZ/FLxjs760tN
	SPboHZNvpC3aDDc/lUiLzg6qVqLqefZoNlfjq8r7OR4wC0eSQYBG50wve/YQ0QHG4BMXlymvdPa0O
	2G3L5ZMrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcFzj-0002pm-47; Mon, 09 Nov 2020 22:50:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcFzh-0002ot-Cs
 for linux-mtd@lists.infradead.org; Mon, 09 Nov 2020 22:50:38 +0000
Received: from gmail.com (unknown [104.132.1.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28674206C0;
 Mon,  9 Nov 2020 22:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604962234;
 bh=3zCrnmiSy4pI28U8wV8PlYqpeE16yEzdnAVoONyzohs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=x/RoupRNbJK1Pi4mHAwErVHXP/WENGRJgQMMxq9le7k+nzQ6OMr3Ik9Tg6nhy36C1
 yFvZiu/Ji96oaWBRhoIDdUt+aBI3y0PNOh3QbRN0uliX4vy/xne5YwHqkCQB5XM4I4
 qxla2lpMXWy+XbxUgITCAREeyY8g3BQp6Zc+EBOk=
Date: Mon, 9 Nov 2020 14:50:32 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH 0/5] Add support for Encryption and Casefolding in F2FS
Message-ID: <20201109225032.GA2652236@gmail.com>
References: <20200923010151.69506-1-drosen@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200923010151.69506-1-drosen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_175037_544553_762AC524 
X-CRM114-Status: GOOD (  18.51  )
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
Cc: kernel-team@android.com, "Theodore Y . Ts'o" <tytso@mit.edu>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Sep 23, 2020 at 01:01:46AM +0000, Daniel Rosenberg wrote:
> These patches are on top of the f2fs dev branch
> 
> F2FS currently supports casefolding and encryption, but not at
> the same time. These patches aim to rectify that. In a later follow up,
> this will be added for Ext4 as well. I've included one ext4 patch from
> the previous set since it isn't in the f2fs branch, but is needed for the
> fscrypt changes.
> 
> The f2fs-tools changes have already been applied.
> 
> Since both fscrypt and casefolding require their own dentry operations,
> I've moved the responsibility of setting the dentry operations from fscrypt
> to the filesystems and provided helper functions that should work for most
> cases.
> 
> These are a follow-up to the previously sent patch set
> "[PATCH v12 0/4] Prepare for upcoming Casefolding/Encryption patches"
> 
> Daniel Rosenberg (5):
>   ext4: Use generic casefolding support
>   fscrypt: Export fscrypt_d_revalidate
>   libfs: Add generic function for setting dentry_ops
>   fscrypt: Have filesystems handle their d_ops
>   f2fs: Handle casefolding with Encryption

Daniel, can you resend this for 5.11, with all remaining comments addressed?
The first two patches made 5.10, but the others didn't.

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
