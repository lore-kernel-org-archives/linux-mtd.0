Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED09C7EE2E
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Jun 2023 07:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OPNt5g2RNPpEshpW0ZH4fa4JDDXMrK18jOo2y5mhUSI=; b=aM60YJL7uYQSaj
	JiB7Z1C+MUtJ0+nHvvFFf9PizSmPlYrfehfKsGTxECGG6ZZ/GE+FtgBkddq8TEbRIVgeNynwwHHi0
	PbqdWVmKYwpLECpOgLEkEewvOvu3PCgbAWiXurYmRVaP7RvOZO13FadkNovyv2FZ3lDMYe9c4YE3y
	hVbOOUwcyTDQ11fZfrwAp0HuYtIYRuWloaVrqVHbVVpFnpT6TnedNgQNk/U4AE+/JsvRDmWLUpnj1
	JpZfUtqCMOZ9z9X2zXytKPIDunOptpKp4ZmNEvM0JniuAbUXgR0jx2kMln3vop0jjm4tE6PYNUaed
	VR6Mjlli4BZoKTE40ysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7sbB-00FQab-1H;
	Sat, 10 Jun 2023 07:01:21 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1q7sb8-00FQa3-0c;
	Sat, 10 Jun 2023 07:01:18 +0000
Date: Sat, 10 Jun 2023 00:01:18 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: Richard Weinberger <richard@nod.at>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>, hch@infradead.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@axis.com
Subject: Re: [PATCH v2] ubi: block: Fix cleanup handling
Message-ID: <ZIQfvnZ5IIUmM/C7@infradead.org>
References: <20230523-ubiblock-remove-v2-1-7671fc60ba49@axis.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523-ubiblock-remove-v2-1-7671fc60ba49@axis.com>
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
