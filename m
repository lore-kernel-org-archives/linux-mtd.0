Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED9BAC43334
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 08:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPNt5g2RNPpEshpW0ZH4fa4JDDXMrK18jOo2y5mhUSI=; b=lFmTUc/xTYoQXY
	hcF050gouI0gEk9Hl+Mc7tta06fb9Av1sb4O5uYcPUKg0wF/sSksqrqNBahcFE7W2J/uW740zrtuo
	2DXMy2l4GWGGoo8zece2322E6XldlNLJXjlgZ2z4Qw7F33WAFbfLE0Acs1u/vfSoIZVoU5+OWTfzJ
	p7QVedQjfGvSVnlBbkvkBk6JQD5XeGznVCUuvBIy07unDcEmkve/Nb3sLtZL761aoDdhG014xWKu6
	SS0TktY5jB709apnXhiJH7xSW4XoWG3kxu1K9zT3kAHMOb9Gj3JGmEijHoXGUpjlb1JYZw/0t4pbv
	//EuGSJMLkARqhFkVuKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqze-00BwUh-78; Wed, 08 Jun 2022 08:24:46 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqxF-00BvQJ-NI; Wed, 08 Jun 2022 08:22:17 +0000
Date: Wed, 8 Jun 2022 01:22:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-aio@kvack.org,
	linux-btrfs@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-mm@kvack.org, linux-xfs@vger.kernel.org,
	linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
	ocfs2-devel@oss.oracle.com, linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH 20/20] mm/folio-compat: Remove migration compatibility
 functions
Message-ID: <YqBcOfiduNfPpYYE@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
 <20220606204050.2625949-21-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606204050.2625949-21-willy@infradead.org>
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
