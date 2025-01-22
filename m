Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AFC2C0218C
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jan 2025 06:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULJBESaWO2oMM3eXRI+BXPIB/R3eZT2rdg3HGJtlevY=; b=C11KLaQecJUpnh
	5tkriJgYI5KfyPWJEefZo7UBuv+4OEN8FQdJd8aNknal4xMX2DwyMNT56Rpp1luiYDI24vM69iVkt
	vQZNQxVNg4ZWWHBdYD/83ururVRuFEHbr5yyNYUQltb4GuyNsD8JWg4Y8jW6yFs+/iLaU+tSdhLrO
	tyQGY6UqJcgwrTsVTrhizGE55USF5oomo5bd4E+1qLzgZkZo4QBGpWUXrFnCwkgNTgavbjn6zUIJQ
	0wG2oIK9LPPiV1G8NZjZxhnDPDN2VmCIgQBNYIw73bDTn4EVc/QHQURqA0MDKG4BIAd4X3HDBJMeK
	xh1YPbDSeyVY/luc2xxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taUIV-00000009VCj-102v;
	Wed, 22 Jan 2025 06:33:07 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taUIS-00000009V9s-0VD1;
	Wed, 22 Jan 2025 06:33:05 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 5197C68D05; Wed, 22 Jan 2025 07:32:51 +0100 (CET)
Date: Wed, 22 Jan 2025 07:32:51 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ming Lei <ming.lei@redhat.com>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	linux-block@vger.kernel.org, nbd@other.debian.org,
	ceph-devel@vger.kernel.org, virtualization@lists.linux.dev,
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org,
	linux-scsi@vger.kernel.org
Subject: Re: [PATCH 1/2] loop: force GFP_NOIO for underlying file systems
 allocations
Message-ID: <20250122063251.GA31207@lst.de>
References: <20250117074442.256705-1-hch@lst.de> <20250117074442.256705-2-hch@lst.de> <Z4pFgIqB50gz-ODi@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z4pFgIqB50gz-ODi@fedora>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_223304_293450_D6A48F55 
X-CRM114-Status: GOOD (  11.20  )
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

On Fri, Jan 17, 2025 at 07:56:48PM +0800, Ming Lei wrote:
> If we call memalloc_noio_save() here, setting PF_MEMALLOC_NOIO can be removed
> from loop_process_work().

Nah, we can skip this patch as the explicit PF_MEMALLOC_NOIO does
everything that is needed.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
