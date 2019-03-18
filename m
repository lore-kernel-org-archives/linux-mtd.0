Return-Path: <SRS0=8m+b=RV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,FSL_HELO_FAKE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D89CC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 20:29:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A4F52173C
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 20:29:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uh2JgkId";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fxbp2Kwe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A4F52173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=exhMfRMtL4iORuEGxpCY8BjSikWlg2Qvtvlf/IPyv9U=; b=uh2JgkIdJCb4tJ
	mXn9joxd3RaeeudVCbHXSJKb3vPCoLHxC/njlsFVaQXy7qMJdHcZZ29qN6COOtnvPtSEGIyYmZjYl
	6WIcKeWWwh9DPkIsfgT4flU6KkMWWVx54yoZy02AuLngonFFKw33DaeSjiGMJrMUVGlWRW1OszHgD
	tSAAWfNypkHrP5wn4HE59ZLgEM2LXaJCxV7jYTdx3ZMiq0B46A6Zh+zE53dYXjB5nJhH9tkyfewfN
	h5miExlWJJsjNDqauLtZSqlN71ITnz22caXB2mdpIhlcnXpk73QJm8Q8Mjye+PsO9kN+tBtr4iigX
	SXSCKNx2b1Sr7z+PuWxQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5ytQ-0001gZ-RQ; Mon, 18 Mar 2019 20:29:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5ytL-0001gE-OK
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2019 20:29:53 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E37A920989;
 Mon, 18 Mar 2019 20:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1552940991;
 bh=Dmlphi4l2Zt8PpWEbiCl/F8vnpJiqjDGGWh6hUHbQAI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Fxbp2Kwe3a6Swg9eL/xrLwuumd8A1jQ6Isry5uEYNr2P5uIBIBN0hk8d9GjbY0Ncm
 jRqJ1byWxZ2qUjfGfiUQmx8hcINS5kM0w5rVGpGVIhq0ds5dzOAJukx6HcCnknpcN5
 NAJugmFI1r43MVUBjOOQOQFd7ZhfNPt6li1OPUzQ=
Date: Mon, 18 Mar 2019 13:29:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 1/5] fscrypt: clean up and improve dentry revalidation
Message-ID: <20190318202948.GD194307@gmail.com>
References: <20190317200444.5967-1-ebiggers@kernel.org>
 <20190317200444.5967-2-ebiggers@kernel.org>
 <20190317203822.GH2217@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190317203822.GH2217@ZenIV.linux.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_132951_810643_500A97CE 
X-CRM114-Status: GOOD (  10.71  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Gao Xiang <gaoxiang25@huawei.com>, linux-unionfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Sarthak Kukreti <sarthakkukreti@chromium.org>,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Sun, Mar 17, 2019 at 08:38:22PM +0000, Al Viro wrote:
> On Sun, Mar 17, 2019 at 01:04:40PM -0700, Eric Biggers wrote:
> > +	/*
> > +	 * Ciphertext name; valid if the directory's key is still unavailable.
> > +	 *
> > +	 * Note: since fscrypt forbids rename() on ciphertext names, it should
> > +	 * be safe to access ->d_parent directly here.
> 
> No, it is not.  Again, d_splice_alias() on buggered fs image picking a reference
> to your subdirectory when doing a lookup elsewhere.  It can relocate the
> damn thing, without rename() being allowed for _anything_.

You're talking about directory hard links, right?  E.g. if there's a directory
with two links a/dir and b/dir, and fscrypt_d_revalidate() is running on 'dir'
via a lookup in a/, it could be the case that b/dir is being concurrently looked
up.  Then the concurrent d_splice_alias() will move the whole dentry tree rooted
at 'dir' from a/ to b/ in the dcache.  Okay, it looks like you're right; I'll
update my comment to clarify that dget_parent() is still needed...

- Eric

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
