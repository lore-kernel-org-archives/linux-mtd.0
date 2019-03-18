Return-Path: <SRS0=8m+b=RV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B459AC43381
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 21:27:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76A40213F2
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Mar 2019 21:27:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uV4aTSmI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76A40213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ZfpWNUIjL5HoWfiniEeMKZGUWxqxV9jVKhSimnEobk=; b=uV4aTSmIdlTdrf
	i0KUSUtGt1B2EdioKrpBxzsr4dcT9DfhVnIY+gDXqUn1Bcz6ZptaYEG4y3F2e5agXoEg06mx/kTKY
	3JVxRCRiANJGa1AFqMvvGZcqMkJPQ1yczbnCHAo2ahFOVFgZbV+DdMxGGWrvme/1h4oNvdP54ZmI5
	Iu0PHjcvJ3Gm3l3nGfPmlx3XFIJjOuoyeBgRP2L3OiCATKW9rY8amPU+tfQu6KiRV6EHQwSf5hdc5
	WHSw38NtXabWM3LZHeMeVPuISxsxrUhi7qIjoX8IUks+6LfBPubv9Wyb3cPIs0cnz+nInAREXmCkK
	P6pEo5b3GwVN9GXMjGsw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5znE-0003fl-Dj; Mon, 18 Mar 2019 21:27:36 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5znA-0003bs-Ro
 for linux-mtd@lists.infradead.org; Mon, 18 Mar 2019 21:27:34 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1h5zl4-000597-7o; Mon, 18 Mar 2019 21:25:22 +0000
Date: Mon, 18 Mar 2019 21:25:22 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH 1/5] fscrypt: clean up and improve dentry revalidation
Message-ID: <20190318212522.GI2217@ZenIV.linux.org.uk>
References: <20190317200444.5967-1-ebiggers@kernel.org>
 <20190317200444.5967-2-ebiggers@kernel.org>
 <20190317203822.GH2217@ZenIV.linux.org.uk>
 <20190318202948.GD194307@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190318202948.GD194307@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_142732_900551_E5BD422A 
X-CRM114-Status: GOOD (  10.54  )
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

On Mon, Mar 18, 2019 at 01:29:49PM -0700, Eric Biggers wrote:
> On Sun, Mar 17, 2019 at 08:38:22PM +0000, Al Viro wrote:
> > On Sun, Mar 17, 2019 at 01:04:40PM -0700, Eric Biggers wrote:
> > > +	/*
> > > +	 * Ciphertext name; valid if the directory's key is still unavailable.
> > > +	 *
> > > +	 * Note: since fscrypt forbids rename() on ciphertext names, it should
> > > +	 * be safe to access ->d_parent directly here.
> > 
> > No, it is not.  Again, d_splice_alias() on buggered fs image picking a reference
> > to your subdirectory when doing a lookup elsewhere.  It can relocate the
> > damn thing, without rename() being allowed for _anything_.
> 
> You're talking about directory hard links, right?

In case of corrupted fs image - yes; the same can happen if you have a network
filesystem with subdirectory moved around on server at the same time, but
there you'll need a lot more elaborate ->d_revalidate() anyway.

Directory hardlinks are certainly not allowed; however, we need the kernel
to survive when it runs into that kind of crap on disk...

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
