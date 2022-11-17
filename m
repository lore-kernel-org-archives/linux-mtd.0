Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A50AC433FE
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 06:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rk0BXZOYWd56GwvB7/G3w8R6cI9fhzsKWsXrdi1NExU=; b=No+BRxtkBj7A9R
	IYJ/RlbxgZGUaD9MBg0/I7tCX6uB/rO2K6agiALIH12ZY47BGvg7eJr0Lo4vGA7uHX5XuXgdNaAoF
	DjFyAsjI/VZFDrW3TsFvVbTPuzvsNFnfUp4hGQk3iStr27EaFmFSxrAbgj9699SzHkhQ5l2Bbc7S+
	92p068olbDMmTJvCpsaC/W/DCb9dS+fLzhTRwXg1AOrPlYopzMAAamporeRkee1eEW4lI5MaNodOm
	mj6AwgkRXOIR61SkSI0cBNgU1ls1+DojpwYLyGRgXUl80UObqBB5LZuOhtf7KFr6Mg00N+V97VOdg
	Ika6EmhsCqrUjf/LXScw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovXwr-00AcYD-DF; Thu, 17 Nov 2022 06:00:29 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovXwn-00AcUt-IU; Thu, 17 Nov 2022 06:00:25 +0000
Date: Wed, 16 Nov 2022 22:00:25 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Christoph Hellwig <hch@infradead.org>, Jens Axboe <axboe@kernel.dk>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Matthew Wilcox <willy@infradead.org>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Michal Orzel <michalorzel.eng@gmail.com>,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v5 3/4] partitions/efi: add support for uImage.FIT
 sub-partitions
Message-ID: <Y3XN+fDTjHz09qEE@infradead.org>
References: <cover.1668548123.git.daniel@makrotopia.org>
 <7526fc5a461a0d68eb1dab575f9c1950638fc21a.1668548123.git.daniel@makrotopia.org>
 <Y3R8oQXRQ8uq8p4P@infradead.org>
 <Y3V9/pmHs7ypE7lb@makrotopia.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y3V9/pmHs7ypE7lb@makrotopia.org>
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

On Thu, Nov 17, 2022 at 12:19:10AM +0000, Daniel Golle wrote:
> While weirdness is certainly subjective, uImage.FIT is not just a
> random image format but used by a great majority of headless embedded
> Linux devices out there. It's the default image format of many of the
> SDKs distributed by chip vendors such as Allwinner, Marvell, MediaTek,
> NXP, Qualcomm/Atheros, ...

"Look see, my weird format is used by all these companies building
crappy SOCs, it is not weird.."

> Please let me know if this sounds acceptable, so I won't put effort
> into implementing something which will then be rejected again after 5
> iterations on the mailing list for reasons which could have been
> expressed from the beginning. An RFC for this series was posted on
> 2022-04-25 [1], I wouldn't have worked months to fix all requests of
> other maintainers and tested it on a variety of different hardware
> knowing that the whole approach will be NACK'ed...

If people ignore something that is obviously broken they might just hope
for it to go away, becaue often it does.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
