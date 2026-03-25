Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A29FEA80B
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2026 05:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TPkl/MihyVVJAKHd8Xyv93TDOuZ8Wa656tdL2DRfYhA=; b=y6JNF9IN287+0d
	9bcys9WLOZPXLPkK9S0Ndwp9lRrg0IJzPfCG8Fyh7QT1CNsrjtS1yPpzEQTBI8suHhhZNOWeiqeor
	7UJNhEUba51I87JomQe+RBXB+aoTDz2d2gLTzM+QY5Et7fv1xSKbax3LyHPycOpxgcPQQWlxZ1DuX
	2dBGz2Way+7aBeJ3XUaNz1Xzi5vbR5edXALIR6lihXmJmBXyj7G+z2E1ci0N0RobBtxNJA36iUzWD
	FsyiA28GJxV5IIiH2FyJJz3P/W8suUPoiEsJM4CHOOa83ks7bNAL9DT3dn+5AG8u1W+ClTi/6rCi3
	fJhali0/4HfdySXQuKUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H35-00000002jQD-3b0K;
	Wed, 25 Mar 2026 05:44:59 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5H30-00000002jO3-0C1K;
	Wed, 25 Mar 2026 05:44:54 +0000
Date: Tue, 24 Mar 2026 22:44:54 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: richard@nod.at, akpm@linux-foundation.org, chengzhihao1@huawei.com,
	hch@infradead.org, jserv@ccns.ncku.edu.tw, eleanor15x@gmail.com,
	marscheng@google.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] lib/list_sort: Remove dummy cmp() calls to speed
 up merge_final()
Message-ID: <acN2VvcH3MJMxVDN@infradead.org>
References: <20260320180938.1827148-1-visitorckw@gmail.com>
 <20260320180938.1827148-3-visitorckw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260320180938.1827148-3-visitorckw@gmail.com>
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

Looks good assuming you get an ACK on the ubifs part:

Reviewed-by: Christoph Hellwig <hch@lst.de>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
