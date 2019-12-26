Return-Path: <SRS0=ZJv5=2Q=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BF34C2D0C0
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Dec 2019 22:50:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BEF22080D
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Dec 2019 22:50:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L0KKe4DK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BEF22080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fi+AH3ibTggjtcIj5fxtA1+NJaQJ2A5dtPEDXYCvQRs=; b=L0KKe4DKRTAmgo
	g+uO3ihjh7Red5k4oDKdzuXOh6apfvjFxqa+fV8++Qwnp2NehUvg9S5D/cVeqLWRdsvJMeS/nfP4T
	iUjCkKaH1cYUstbk2FDq777OS8RLQ1G4PFYq2y2QtuXW7kDZlDo6ZLcx4+K6dD4AZ4aS+BoGG2t55
	oNkmCad4PawpfWAxaI34dSt/Hp7mcQcjxG+T5Uz9jmzatLgD1KNmeqq/OUs7TLl7AvyGh7PKejwMJ
	BQfz8w1rEkuWXy+9BVx50UUBRsYPsHC/YYcLxfvDxas/9EGwF6WrJWYPdqKHCdgBTGAV0G10ihHR5
	Mw6QI5/+nB0M+XDT6Mxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ikbxX-0007T4-VH; Thu, 26 Dec 2019 22:50:23 +0000
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ikbxP-0005tU-8I
 for linux-mtd@lists.infradead.org; Thu, 26 Dec 2019 22:50:16 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1ikbvG-0000uN-8v; Thu, 26 Dec 2019 22:48:02 +0000
Date: Thu, 26 Dec 2019 22:48:02 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: Re: [PATCH] fs: jffs2: fix possible sleep-in-atomic-context bugs
Message-ID: <20191226224802.GR4203@ZenIV.linux.org.uk>
References: <20191217135143.12875-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191217135143.12875-1-baijiaju1990@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191226_145015_329110_B8B48377 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Dec 17, 2019 at 09:51:43PM +0800, Jia-Ju Bai wrote:
> The filesystem may sleep while holding a spinlock.
> The function call path (from bottom to top) in Linux 4.19 is:
> 
> fs/jffs2/malloc.c, 188: 
> 	kmem_cache_alloc(GFP_KERNEL) in jffs2_alloc_refblock
> fs/jffs2/malloc.c, 221: 
> 	jffs2_alloc_refblock in jffs2_prealloc_raw_node_refs

... gets called only if jeb->last_node is NULL.  I've no idea
whether it is possible on those call chains and analysis is
certainly needed before applying that kind of patches.

It might very well be real, and certainly worth asking jffs2
folks to look into.  But this kind of "defensive" fixes
is no good without understanding of the situation in the
code being (hopefully) fixed.

It's a good catch; even if there is a reason why we never
hit the blocking allocation in there, that reason should be
spelled out in the code.  It isn't, and that can easily
grow into a bug even if it hasn't done so already.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
