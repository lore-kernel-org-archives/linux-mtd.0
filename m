Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D66C61DA4
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Feb 2023 14:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=73lzhxAP5pAQXEBNCLyIjXhyQIVigvbrVo+rJ+Kt7Qc=; b=yEUm6lLZ3+1ivZ
	eoaN8n3XLr+s60IKZqtOzquZj+fIYyK3FXXCjccYWKqcvj3y5aQaXR1ODjhu0qAkFkzE0TmTVT+tZ
	oG3M86/9AO/5cxhKPbjIMTOcqb0Df+yKk+Y41w078wC0lzPZrVQrUS6DeA02x8Bb6PU3wB/yfunUz
	U1PZQ51QzQYYzX5KH21darWQKgGi3kO8n33BRk+g0YCsWU2QULV2EdJOZbUsxoia5j1dOGsCpHHcc
	7kyeKo59qpXx+U3+CazBgFYdYmpDre4R1NB7H3q0KGCeioAIf8rjOeQZkPK0fKQEVjhBXwqZuUxx2
	BMmLWgUx2SfXUUpJtGyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwhH-002JvF-Se; Tue, 14 Feb 2023 14:54:20 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRw1J-0021fB-Tq
	for linux-mtd@lists.infradead.org; Tue, 14 Feb 2023 14:11:00 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id E406867373; Tue, 14 Feb 2023 15:10:47 +0100 (CET)
Date: Tue, 14 Feb 2023 15:10:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: harshit.m.mogalapalli@gmail.com, error27@gmail.com, hch@lst.de,
	Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH linux-next] ubi: block: Fix a possible use-after-free
 bug in ubiblock_create()
Message-ID: <20230214141047.GA13930@lst.de>
References: <20230214093801.1267044-1-harshit.m.mogalapalli@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230214093801.1267044-1-harshit.m.mogalapalli@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_061058_164159_14686AB5 
X-CRM114-Status: GOOD (  13.15  )
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

On Tue, Feb 14, 2023 at 01:38:01AM -0800, Harshit Mogalapalli wrote:
> Smatch warns:
> 	drivers/mtd/ubi/block.c:438 ubiblock_create()
> 	warn: '&dev->list' not removed from list
> 
> 'dev' is freed in 'out_free_dev:, but it is still on the list.
> 
> To fix this, delete the list item before freeing.
> 
> Fixes: 91cc8fbcc8c7 ("ubi: block: set BLK_MQ_F_BLOCKING")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>

Thanks, this looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
