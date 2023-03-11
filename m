Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129AEC6FD1C
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Mar 2023 12:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPNt5g2RNPpEshpW0ZH4fa4JDDXMrK18jOo2y5mhUSI=; b=GgmNKUrxo4PSs/
	5AdQYhg0o/vCGGzXmbFG05mrdH/L4XJYc3hkouXWiTscgk6jgcSU3heAKDnX55LTuHtfcsG9FjMJn
	L+HMMycjAj1JepFrh6f/XkGPwBGrr1uhe1fC121jyD6pwvk6YGWr4peEhb04fzxwu8qFkF5e5/v+v
	woIpeO9wgbDNAmIjvuYiBe+OJUSqhth/ceCQo6gkxzgBNeishGPbelOjjrZNsJtrJWnxVyJecEXUn
	giXvL8tT26Q8Bcq0+xHRUDN45uj/NUrpJvABS1gl6iQHBRLt6xXga26A5eji0PuJtN5xIVfIjaRZL
	KW8MCvVuxjMwz/yeTrbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1payWp-000Vmw-IJ; Sat, 11 Mar 2023 12:40:51 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1payWn-000Vkn-5N
	for linux-mtd@lists.infradead.org; Sat, 11 Mar 2023 12:40:50 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id B7B7C68AA6; Sat, 11 Mar 2023 13:40:34 +0100 (CET)
Date: Sat, 11 Mar 2023 13:40:34 +0100
From: Christoph Hellwig <hch@lst.de>
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] ubi: block: Fix missing blk_mq_end_request
Message-ID: <20230311124034.GA21770@lst.de>
References: <20230311092929.2827-1-richard@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230311092929.2827-1-richard@nod.at>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_044049_365653_F75E0B17 
X-CRM114-Status: UNSURE (   8.91  )
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

Looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
