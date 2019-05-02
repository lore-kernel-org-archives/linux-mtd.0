Return-Path: <SRS0=JXt5=TC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F45C43219
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 10:20:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F8920656
	for <linux-mtd@archiver.kernel.org>; Thu,  2 May 2019 10:20:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZaPmGHvi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F8920656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvxyxiMLlu6Y1n2e6WRD0rPQvJf2u2Qi1obNCwmvDr4=; b=ZaPmGHvis9ttTS
	ZNL7ZGLUgDFuzZP9H5Y2SpB8Kpa0X096WdOGoMjVkUYaiWcCu3Q7x2kXtB6hUJg+5ZOgHjubkdv5+
	i3nje1tRV6/FpaCx5xj0MTUbvyOqJ3a6f0wiwZbElHrhvUQqZxeTnEXEE9SBkwLCl1WUaRJ0g3mxk
	yvWmHGLR6zTTJ7sJMOmElLFfCqwX4R9orVJJ8U7oFW+MNJwnRftA//pAUVPkckEXns62fbKhISzpo
	6SZ7VLNIJAGBvHuyOfJqj+uJY37jTtByCTJroyOdL3Wi3dux1MreaHylbyRxzy1/qO4hxLvNzccbb
	Ut7o8XKL+CFnlXkSXmUw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hM8p8-0000Ql-81; Thu, 02 May 2019 10:20:18 +0000
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red
 Hat Linux)) id 1hM8p6-0000QX-6a; Thu, 02 May 2019 10:20:16 +0000
Date: Thu, 2 May 2019 03:20:16 -0700
From: Matthew Wilcox <willy@infradead.org>
To: William Kucharski <william.kucharski@oracle.com>
Subject: Re: [PATCH 5/4] 9p: pass the correct prototype to read_cache_page
Message-ID: <20190502102015.GC8099@bombadil.infradead.org>
References: <20190501160636.30841-1-hch@lst.de> <20190501173443.GA19969@lst.de>
 <AEBFD2FC-F94A-4E5B-8E1C-76380DDEB46E@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AEBFD2FC-F94A-4E5B-8E1C-76380DDEB46E@oracle.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
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
Cc: linux-nfs@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org,
 Sami Tolvanen <samitolvanen@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, May 02, 2019 at 12:08:29AM -0600, William Kucharski wrote:
> 3) Patch 5/4?

That's a relatively common notation when an extra patch is needed to fix
something after a series has been sent ;-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
