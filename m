Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81513C0015E
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 22:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T8Ljs7wFtLTsu9K2c+x+MAvA1DQGLpv23vUqczvkkXk=; b=LFpvskFrK9JYY3
	uv9t4KJZ0fgnlNX507hrkQ82yf+hqxNuIzOhjoCivjQX02JvZOGhfvf8Q3iTFO36rVKbgbj3dSrNn
	yA3+xKBWXDM0Cdwu/hLe+SkwDUSGu4bfCALbS7B6+a/bYWZIhyjbhwf4x3OogfZFxgwWTWedLgojx
	EGrqIie4LIQSeeG4L7Bq1qW1onfLVFC76shv7QOaIjmrC4+Hl20TeI6UntW0+HbjLUI2f9iZX25yP
	odHpmbaTMtrVcTo2dcZeTbgZJ2bj+X2731f6Ehdah/Dlio0K4Z7+OQ7xgxXJ5py7+pUdBX2CAHkyY
	SeNEP7/uueaQ82gbBgRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrnp-00607f-2e;
	Wed, 09 Aug 2023 22:37:17 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTrnm-00606m-0m
	for linux-mtd@lists.infradead.org;
	Wed, 09 Aug 2023 22:37:16 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 0075668AFE; Thu, 10 Aug 2023 00:37:04 +0200 (CEST)
Date: Thu, 10 Aug 2023 00:37:03 +0200
From: hch <hch@lst.de>
To: Richard Weinberger <richard@nod.at>
Cc: hch <hch@lst.de>, Stephan Wurm <stephan.wurm@a-eberle.de>,
	linux-block <linux-block@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Johannes Eigner <johannes.eigner@a-eberle.de>
Subject: Re: ubiblock: null pointer dereference using scatterlist in
 work_queue
Message-ID: <20230809223703.GA10719@lst.de>
References: <ZLT2qEYjaWgSpRD6@PC-LX-Wurm> <1293911429.1782934.1691445776353.JavaMail.zimbra@nod.at> <20230809135308.GA32214@lst.de> <ZNOec8JmndA63Mnh@PC-LX-Wurm> <20230809141542.GA32614@lst.de> <366198994.5052941.1691620484888.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <366198994.5052941.1691620484888.JavaMail.zimbra@nod.at>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_153714_425151_125697A0 
X-CRM114-Status: GOOD (  10.14  )
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

On Thu, Aug 10, 2023 at 12:34:44AM +0200, Richard Weinberger wrote:
> Will do so! So far I managed to get UBIblock work with scsi_kmap_atomic_sg().
> Sadly now with kmap'ed memory a bounce buffer is needed since IO in UBI/MTD can sleep.
> Is there a strong reason why scsi_kmap_atomic_sg() needs IRQs disabled?

I don't think it needs irqs disabled.  Also if you switch from the
deprecated kmap_atomic to kmap_local first you can sleep and don't
need bounce buffers.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
