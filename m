Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6449EC6FA8F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 11:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FA3ccVtrXoyB4MZkEbwH4e2+n+nyhbuB0NA0dVGGyDA=; b=MbjJ0VPIbyC8Z6
	PfbViK3gZ7cuvzzDESemU5EXkxEU6kRKnfMGKtE+heBnaWVlbP9NTsf7jKDnMeaNHVwhi3aIp/csT
	qmJpO/I9UIXZxifve4dAB+9m5JnEfWks6BNN6cBl5ZNBEVLXNXYK6MThcLe8zR6DdtJ1A6HezLFZK
	WeU4DXbhatzatFZLuaM6uQRiv3mzZWiXYSV9uIxnAVYK458UQKYQUZmWyvEpUltFiNFTBBXH6v10a
	8Q6FAKJkhoTajOUg12/0FWQkuRo7AyjxYMzPCWkY1wUC9u9eqsNQAAEE7YuDe91aMdnTMfAO/U1Zf
	8m+u9gRIwUNcM+WXw2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbJkf-00DR7B-2T;
	Wed, 30 Aug 2023 11:52:49 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbJkc-00DR6h-1V
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 11:52:47 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0B26468AA6; Wed, 30 Aug 2023 13:52:34 +0200 (CEST)
Date: Wed, 30 Aug 2023 13:52:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christian Brauner <brauner@kernel.org>
Cc: Christoph Hellwig <hch@lst.de>, Jan Kara <jack@suse.cz>,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 0/2] mtd: switch to keying by dev_t
Message-ID: <20230830115233.GA23130@lst.de>
References: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230829-vfs-super-mtd-v1-0-fecb572e5df3@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_045246_650516_8A64BC5B 
X-CRM114-Status: UNSURE (   9.47  )
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

The series with all the updates from this thread looks good to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
