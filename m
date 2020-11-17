Return-Path: <SRS0=l5Rv=EX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977DCC5519F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 18:36:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 256DC223C7
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2020 18:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NqRJE7v+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TDkYXN8C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 256DC223C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w+4V6mk6s7SaBY5Mpr9uJcyZBo8G7W01PPP0J/MfWYI=; b=NqRJE7v+uIVfZ5++joCs3e8Oq
	YSvvxMCgP904uJcUxVjxTKKYR1HaUhYJMy7sN0VR+WxiazkMJrUOJMCJYvcpB4qtoxGg0WcQicYvM
	BL11IBGh/Yko/9/5RzShEOECvcDJs+SlMSOJr1F4fedykBQoltYh21zPiVuRqek4LxrEqH8JoF5n+
	QK6yECqrQjZ9HWEOBvFTojxFmvSAFT53uOp8Vl57fRstDclPPOA7hoWLfd5JYqZIskS8k3btZglDm
	aWqOEso1aq1HMKS6ZtlrlpXiyNgrXJ6nG7sGczpblGPrbiDlN+quYTxgHhTtoZekN4VDVDyzp8LhP
	dehp+oHsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kf5pr-0002IX-Rh; Tue, 17 Nov 2020 18:36:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kf5pp-0002Hn-4F
 for linux-mtd@lists.infradead.org; Tue, 17 Nov 2020 18:36:09 +0000
Received: from sol.localdomain (172-10-235-113.lightspeed.sntcca.sbcglobal.net
 [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AA74F223C7;
 Tue, 17 Nov 2020 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605638168;
 bh=XFTKnyksOQF5hI0TvFTXOnV3KR3hpWlZi6TBqSIlN+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TDkYXN8CuXva+9OJ9b39gOkV0069pK+fKDahpqGUjsGcqRpFilPNA9fKO0pC028pt
 IoJRLdqRMCA9DRRLjwr7kUg0oPUfUKs6w/Tw2vuqqcgbZTDTUEyH/IIqd8BM2F1iwh
 QjPFKNx/xoX0SEq3VPRzU472078pyjJ1hcwl1m/U=
Date: Tue, 17 Nov 2020 10:36:06 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Daniel Rosenberg <drosen@google.com>
Subject: Re: [f2fs-dev] [PATCH v2 1/3] libfs: Add generic function for
 setting dentry_ops
Message-ID: <X7QYFm3QIYBhdI7V@sol.localdomain>
References: <20201117040315.28548-1-drosen@google.com>
 <20201117040315.28548-2-drosen@google.com>
 <X7QTkSyiMojM6T10@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X7QTkSyiMojM6T10@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201117_133609_274448_C0AAA4DD 
X-CRM114-Status: GOOD (  19.56  )
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Gabriel Krisman Bertazi <krisman@collabora.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ext4@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 17, 2020 at 10:16:49AM -0800, Eric Biggers wrote:
> 
> Here's a suggestion which I think explains it a lot better.  It's still possible
> I'm misunderstanding something, though, so please check it carefully:
> 
> /**
>  * generic_set_encrypted_ci_d_ops - helper for setting d_ops for given dentry
>  * @dentry:	dentry to set ops on
>  *
>  * Casefolded directories need d_hash and d_compare set, so that the dentries
>  * contained in them are handled case-insensitively.  Note that these operations
>  * are needed on the parent directory rather than on the dentries in it, and the
>  * casefolding flag can be enabled on an empty directory later but the
>  * dentry_operations can't be changed later.  As a result, if the filesystem has
>  * casefolding support enabled at all, we have to give all dentries the
>  * casefolding operations even if their inode doesn't have the casefolding flag
>  * currently (and thus the casefolding ops would be no-ops for now).
>  *
>  * Encryption works differently in that the only dentry operation it needs is
>  * d_revalidate, which it only needs on dentries that have the no-key name flag.
>  * The no-key flag can't be set "later", so we don't have to worry about that.
>  *
>  * Finally, to maximize compatibility with overlayfs (which isn't compatible
>  * with certain dentry operations) and to avoid taking an unnecessary
>  * performance hit, we use custom dentry_operations for each possible
>  * combination rather always installing all operations.
>  */

Last line in my suggestion has a typo: "rather" => "rather than".

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
