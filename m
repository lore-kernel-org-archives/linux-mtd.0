Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1330C282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 14:06:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 934DC206BA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 14:06:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b/6V7d3Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 934DC206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iG7/JAYU9NU1L1+mXjCSsS2MqIb+pMP0A0Ywt9amjP4=; b=b/6V7d3YddEUiR
	Z0Vw7POzxJZFM38Ft046j3+kybN08gP2gjmd8GrG9JYnQ9yIW6gX61NZJIaXUFAoaVf527PMHANGE
	W9vCyXBoy7P4FBcRHE7pCznt3iXyJstpFyC7hNlJ/FRFuAi6NQOoYfPLbKYhMIH0s/o08ufLw4OPz
	C0lSBGGZLa1+vZv40LivVyyorQpqcaBzu5mdsfs7STQSAvDYeVXYsgrdRDCX78Key6F6NJYf4Ghtu
	K5CSFggLSRpyPQHGfxjcsrV6FZhWwZh1sbGoVBZce6GXRDGWtXuAn5SQ9d75noayQk9CIkadFmNE0
	cXthYUOlaz5Cxdss2V9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGlCh-0001Bc-Rt; Wed, 17 Apr 2019 14:06:23 +0000
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGlCe-0001Ax-PE
 for linux-mtd@lists.infradead.org; Wed, 17 Apr 2019 14:06:22 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-109.corp.google.com
 [104.133.0.109] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x3HE6Agt002081
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 17 Apr 2019 10:06:11 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 3DD27420497; Wed, 17 Apr 2019 10:06:10 -0400 (EDT)
Date: Wed, 17 Apr 2019 10:06:10 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 3/5] fs, fscrypt: clear DCACHE_ENCRYPTED_NAME when
 unaliasing directory
Message-ID: <20190417140610.GC4686@mit.edu>
References: <20190320183913.12686-1-ebiggers@kernel.org>
 <20190320183913.12686-4-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190320183913.12686-4-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_070620_987075_0679E2C4 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

On Wed, Mar 20, 2019 at 11:39:11AM -0700, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Make __d_move() clear DCACHE_ENCRYPTED_NAME on the source dentry.  This
> is needed for when d_splice_alias() moves a directory's encrypted alias
> to its decrypted alias as a result of the encryption key being added.
> 
> Otherwise, the decrypted alias will incorrectly be invalidated on the
> next lookup, causing problems such as unmounting a mount the user just
> mount()ed there.
> 
> Note that we don't have to support arbitrary moves of this flag because
> fscrypt doesn't allow dentries with DCACHE_ENCRYPTED_NAME to be the
> source or target of a rename().
> 
> Fixes: 28b4c263961c ("ext4 crypto: revalidate dentry after adding or removing the key")
> Reported-by: Sarthak Kukreti <sarthakkukreti@chromium.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good, applied.

					- Ted

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
