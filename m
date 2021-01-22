Return-Path: <SRS0=x7NS=GZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80BFFC433E9
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 17:21:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27EED23433
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Jan 2021 17:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27EED23433
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TlToRTp0v+Am2AivdM9mR9D6nAMUWlcusw0vF7m5Da0=; b=pZ5LvhsVuwoEFr/uqwz3LFYm4
	NiClmq06yoF2IwojDrrXx4Ccz/mXsMZ3qeYOV17u59L8zF0Inlc13JIxn56EzTrKScTCmG+5cdNC2
	6ShQB3dRddj3kMoytRE6sriJHpU91z+DQbEHKy/Ev7aLf5lrblKQG3e52l1e2A/Kdoic3i+Ouh6xi
	iLJwYDXMWJTlPTPUyRLT+vP3zAb5+W/yS1H6DwzRDS7rB5B39BpVRIMDiCzHwiiYnY95fe9wqiNvA
	9a/hov5R3N9TSyK7+3PnX5NlwRmPHn4PphgTtSyXd8hofN8hcG8QKYRd8c2xZPBNrQMcCU22ggXFF
	DcbnN03+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3076-0002mL-Ft; Fri, 22 Jan 2021 17:20:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3074-0002m5-Ds
 for linux-mtd@merlin.infradead.org; Fri, 22 Jan 2021 17:20:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=z/ZCNnT3pwMxzeZYvTCjmF9FEmUXDQjZsExOmtjFM20=; b=V2lAc3ELSVEfWhGjIQ6EJkilCO
 B8CW93q6Sk1bGyEiMBP/zB1GVOl5ScjV13w0iTR++72wzupPPFVT2udq+eMD7qTi3dns+yEkbjVsW
 wtSnz2QWHF0ry1jxyuTGWnpfP/p1rUlzPfYR++Z3ZfJG/o2eu6He+a/GZ5T4iSdRcGDOFBxxn8xVv
 mMi4ThhVHYM6RrRMfvu3O9jukfTIwR8GX/AwtBPaZhzz82/DBukx52tE5JkQSbfv8cDJDtBkxXCjp
 w5gsE7NILnomftWPaEaKt4VCevhVJ1vP53tvQ6WasehY5WZeMpAnFfYM3zfFVN4owzvm5zBq5FdeP
 BRJnYz2A==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l3070-0010W0-G6; Fri, 22 Jan 2021 17:20:44 +0000
Date: Fri, 22 Jan 2021 17:20:42 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Subject: Re: [PATCH 7/8] ubifs: export get_znode
Message-ID: <20210122172042.GC237653@infradead.org>
References: <20210122151536.7982-1-s.hauer@pengutronix.de>
 <20210122151536.7982-8-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210122151536.7982-8-s.hauer@pengutronix.de>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, Jan Kara <jack@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jan 22, 2021 at 04:15:35PM +0100, Sascha Hauer wrote:
> get_znode will be needed by upcoming UBIFS quota support. Rename it to
> ubifs_get_znode and export it.

I wonder why'd you want to export ubifs functionality, but it only
gains global instead of static scope, so this looks ok to me.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
