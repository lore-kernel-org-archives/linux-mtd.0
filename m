Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A64C0015E
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Aug 2023 14:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SBbMtE7q6nJdpoxMbup+AHOFc6PU+UOEqr82yV/1ZzQ=; b=O7090kE/jLCcrU
	cQKWUoJMF9Cvj1ZFQqrGxdDzTMsVqMYcsTyo1YKyk/IyO5hmJCkVnIBY9tmwmtHXfR9YGkJ3nLbJE
	3zBa2QZRATHRF/3Pqa0+GysXqQVm7vTVikJ29ITuiywJSC7mLM85iyQJrgUgbnEDgfNckJObwz1JP
	O7SvDGiv8v9XTs+hVSfr/5geSIj/ruLyj0vTxp4cT8sdl3oo/1ePBNvUKk64iaRIpfbpaWrlMx/lg
	u2JiaAPp6GQsNvP5ZjkvOq8KGRJBOaFS1c1U25mX0tANNi1ESd0zgcvbQ/+JVOnejTCJDBwXczb1x
	Z9yeyONOh+TxMWf9c1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjyX-00589R-0k;
	Wed, 09 Aug 2023 14:15:49 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTjyU-005890-1u
	for linux-mtd@lists.infradead.org;
	Wed, 09 Aug 2023 14:15:47 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 822116732D; Wed,  9 Aug 2023 16:15:42 +0200 (CEST)
Date: Wed, 9 Aug 2023 16:15:42 +0200
From: hch <hch@lst.de>
To: Stephan Wurm <stephan.wurm@a-eberle.de>
Cc: hch <hch@lst.de>, Richard Weinberger <richard@nod.at>,
	linux-block <linux-block@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	Johannes Eigner <johannes.eigner@a-eberle.de>
Subject: Re: ubiblock: null pointer dereference using scatterlist in
 work_queue
Message-ID: <20230809141542.GA32614@lst.de>
References: <ZLT2qEYjaWgSpRD6@PC-LX-Wurm> <1293911429.1782934.1691445776353.JavaMail.zimbra@nod.at> <20230809135308.GA32214@lst.de> <ZNOec8JmndA63Mnh@PC-LX-Wurm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNOec8JmndA63Mnh@PC-LX-Wurm>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_071546_780946_8A310081 
X-CRM114-Status: GOOD (  13.07  )
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

On Wed, Aug 09, 2023 at 04:10:59PM +0200, Stephan Wurm wrote:
> Am 09. Aug 15:53 hat hch geschrieben:
> > Well, a scatterlist culd contain a highmem page, in which case sg_virt
> > isn't going to cut it and you need to kmap.  Is this a 32-bit system
> > with highmem enabled?
> I can confirm it is a 32-bit system with highmem enabled.

Yes.  So the code needs to stop using sg_virt to work on highmem
setups and do the equivalent of scsi_kmap_atomic_sg.  Best way
forward is probably to move scsi_kmap_atomic_sg to lib/scatterlist.c
(and also convert it to kmap_local instead of kmap_atomic while you're
at it) and then use that in ubiblock

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
