Return-Path: <SRS0=A4L3=E4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CC1C56201
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 04:56:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF98A2078D
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Nov 2020 04:56:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0GLWT22V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF98A2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0OqlC4rzbVsnpmFVB+DrhsafRsjaCjf6Q+RclP/kdAo=; b=0GLWT22Vcmf0zttWvZ4FI66Hm
	QOAK1JCBpCivmYk+JzyYzxqOxd15GTyFj7JVazsmbxkYVXzZzVcuxwhr45119YsxN7jQWm7mxR/0F
	l18EZgG6qsSDmy5v0HGLK5CsQDPdgXKDUH0MSoXwQ4GRSKswx8W8D8+ECJi/jdEh/iWS/7BLjzS+C
	kFMyqk4blrFdjyFOoJsWfThrmTbAYOMCqMmiPXLAXplir54CtVvf3jxZPD+FELU34ElKoucTVojzU
	YIPXwP4hbEFlkr0O+XJcFYRTsPMySmaeX+Oh/aFP84pA5f5y+5aJKv3nuzvC+wZSfkwGZf3EK44lo
	l6OSgkkfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kghPd-0003Om-NX; Sun, 22 Nov 2020 04:55:45 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kghPa-0003Nx-JF
 for linux-mtd@lists.infradead.org; Sun, 22 Nov 2020 04:55:43 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: krisman) with ESMTPSA id 8363F1F45BFE
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [PATCH v4 1/3] libfs: Add generic function for setting dentry_ops
Organization: Collabora
References: <20201119060904.463807-1-drosen@google.com>
 <20201119060904.463807-2-drosen@google.com>
Date: Sat, 21 Nov 2020 23:55:37 -0500
In-Reply-To: <20201119060904.463807-2-drosen@google.com> (Daniel Rosenberg's
 message of "Thu, 19 Nov 2020 06:09:02 +0000")
Message-ID: <87tutij8hi.fsf@collabora.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201121_235542_766528_08613A26 
X-CRM114-Status: GOOD (  13.87  )
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Eric Biggers <ebiggers@google.com>,
 Richard Weinberger <richard@nod.at>, Chao Yu <chao@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Daniel Rosenberg <drosen@google.com> writes:

> This adds a function to set dentry operations at lookup time that will
> work for both encrypted filenames and casefolded filenames.
>
> A filesystem that supports both features simultaneously can use this
> function during lookup preparations to set up its dentry operations once
> fscrypt no longer does that itself.
>
> Currently the casefolding dentry operation are always set if the
> filesystem defines an encoding because the features is toggleable on
> empty directories. Unlike in the encryption case, the dentry operations
> used come from the parent. Since we don't know what set of functions
> we'll eventually need, and cannot change them later, we enable the
> casefolding operations if the filesystem supports them at all.
>
> By splitting out the various cases, we support as few dentry operations
> as we can get away with, maximizing compatibility with overlayfs, which
> will not function if a filesystem supports certain dentry_operations.
>
> Signed-off-by: Daniel Rosenberg <drosen@google.com>
> Reviewed-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Gabriel Krisman Bertazi <krisman@collabora.com>

-- 
Gabriel Krisman Bertazi

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
