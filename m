Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 270F7C433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 08:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPNt5g2RNPpEshpW0ZH4fa4JDDXMrK18jOo2y5mhUSI=; b=4+Hfudb2jTOdbj
	k82VoYxEwb6vhsCoewqvEUVr2iAoDX1zAc2dKMWljHLmGNJ9AP5Ls5yalugVaoM35CFnrYEpCHyMw
	gYjD9FRVHTacXq8ryvZb3W8QxYPZVZoqAKJKKjIL+fXwhL7dbrrn6sPwLojoV/AGWzmovUFDcH63j
	PNJ4/YLtt5Dk3k6nta3V9X4G7BOqqoPylg5jjLGXnG1kOkWFsGH2PZYtDRn0H+wyH0U96F9cB4G55
	kr/qxBt3U6utB6ELy92CrHzfbQyrwf8muyE3rxhp4Y0LLvFZuw+gT1yAI9XWBhfJrlNNT5pnNfvqt
	ihsyvpTeipADaa/b4Sdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqsX-00Bsj3-Qx; Wed, 08 Jun 2022 08:17:25 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqsW-00BsiF-56; Wed, 08 Jun 2022 08:17:24 +0000
Date: Wed, 8 Jun 2022 01:17:24 -0700
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
Subject: Re: [PATCH 07/20] nfs: Convert to migrate_folio
Message-ID: <YqBbFE4FPeRbnkWF@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
 <20220606204050.2625949-8-willy@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606204050.2625949-8-willy@infradead.org>
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
