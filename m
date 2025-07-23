Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BE0C83F17
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jul 2025 05:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eFE0k2VFRWaxDR2esG5kA9ibwojRq8i/TCMWdVCVREA=; b=mCIPFQhmc6eJuK
	u3c/YE8h3E5JUKZmDKR/lpnPHyfTIzPjdBZGmWOY9OWySSYWV5ViDbtsfCPsjyJ8SpFutq1gUYiXO
	F+zV4+yDY9mUD8jdoHnxf6Zz9IMZ5gqhgZxmKoBMb7vndus8P8sQvCRVNoyUAe8yJevR9OVPHntRB
	gC7E02iKMs+VmUpR+9nZo46b3vGwWiNTG0WWm8+dK7YOG+bj4Oty4GY8wGhXOqcbvHk+egIdRB9b1
	SiM7vg+raEe7GomGbgg0vEOVp5V1DMRsyxpn0TllFX3dAU2UOsSqSBA3FZ5wJOtEupXXshO4zdSEi
	I/xB+YmEc3wrCgC0Bq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueS7O-0000000442G-3EH8;
	Wed, 23 Jul 2025 05:34:18 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueS7L-000000043zz-3kDI
	for linux-mtd@lists.infradead.org;
	Wed, 23 Jul 2025 05:34:17 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3074967373; Wed, 23 Jul 2025 07:34:04 +0200 (CEST)
Date: Wed, 23 Jul 2025 07:34:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Christoph Hellwig <hch@lst.de>, richard@nod.at,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] ubifs: stop using write_cache_pages
Message-ID: <20250723053403.GA18295@lst.de>
References: <20250711081116.564445-1-hch@lst.de> <35dcb159-ddf9-2403-f1dc-f11d8d4562ce@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <35dcb159-ddf9-2403-f1dc-f11d8d4562ce@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_223416_077068_5EACDCB7 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Can you pick this for 6.17?


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
