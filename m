Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BFCC04A6A
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Aug 2023 15:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFou4bZj9yuZqIqHFpsvbpHw2GLThMT+MJXW65pXtTI=; b=uYG5bY5JpOedkf
	PbZHSl0GVdtJb2QElOq2gXVSyaqJXsuRrMNbKm9c3Y1M+eMNe7TOdRWwL3EWui1QVt5mbi97CQbzd
	WYBGghrofGX0BnHZjJGo/wmZyMq3QZa38OzsxPG4vicyWPLrl5bNnviRLsYFZgArsEUlccPY+Oh2V
	Mn55D8BGmPcBjamptrgCxw8kr3UKlMRcMl7yBHrSAoxWtGJdZpX38pEt8Bnr+bAoKvKL0zCDBdzA9
	F3TwJPahAjvOpki/e/Y/w+cMMv3sqUWFgGBS0d3SLcFQVvzKMq568p2fqOvvX6EZWnPnxOuTd3sIu
	mTofOgmBce1TNg/fJs4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU7of-0084eG-2s;
	Thu, 10 Aug 2023 15:43:13 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU7od-0084da-0C
	for linux-mtd@lists.infradead.org;
	Thu, 10 Aug 2023 15:43:12 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 7616467373; Thu, 10 Aug 2023 17:43:00 +0200 (CEST)
Date: Thu, 10 Aug 2023 17:43:00 +0200
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
Message-ID: <20230810154300.GA28000@lst.de>
References: <ZLT2qEYjaWgSpRD6@PC-LX-Wurm> <1293911429.1782934.1691445776353.JavaMail.zimbra@nod.at> <20230809135308.GA32214@lst.de> <ZNOec8JmndA63Mnh@PC-LX-Wurm> <20230809141542.GA32614@lst.de> <366198994.5052941.1691620484888.JavaMail.zimbra@nod.at> <20230809223703.GA10719@lst.de> <533238598.5052964.1691621039144.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <533238598.5052964.1691621039144.JavaMail.zimbra@nod.at>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_084311_271205_563F79D1 
X-CRM114-Status: GOOD (  11.06  )
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

On Thu, Aug 10, 2023 at 12:43:59AM +0200, Richard Weinberger wrote:
> > deprecated kmap_atomic to kmap_local first you can sleep and don't
> > need bounce buffers.
> 
> Yep, for upstream kmap_local will do the trick, but I need also something
> for the stable trees.
> Anyway, time to get some sleep.

Maybe just copy and paste it with the kmap_local change and then do
another patch (series) to unify them again.  IIRC we also have a copy
and paste version in an mmc driver somewhere.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
