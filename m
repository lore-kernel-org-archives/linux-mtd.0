Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E350C4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Nov 2022 14:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2B1ku0+vzVtrhBGPEslyy73qHJirfsHV4DbCLCI9W88=; b=bZn6o6GXuigGi+
	bVXuS7x4RxKR2CILHgdaHAerZGDhD7BhSCG6mpD3jCAKd7epOpdASJ9fozSXilfd0J+K1Bn04aonl
	ZkcRStF0OyITtN6Wmm10U1raLyjTX26Q+Zmap4vsspVCDIzBBHgo+qD+uCueCrgpHFhE97jTNbyzd
	TKFHitF+h9HXkfRBmcQXPsx0wpGdOGxwMfdVFsOXUWK+8mp20GwepooKmNuGwG9mCk/i1Ht6AIlrR
	ufG9Fawm93uzuT+72QY83yd8Z1WFwE2VFNcgvw3xgWvBRn7WqkTR3KpdO8Fh7q8HXhWv86ijJpleA
	N0W4alskGmvHycYpLhZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovfRk-00EfaJ-3J; Thu, 17 Nov 2022 14:00:52 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovfRi-00EfZE-56
	for linux-mtd@lists.infradead.org; Thu, 17 Nov 2022 14:00:51 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.94.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1ovfRO-0004gw-BJ; Thu, 17 Nov 2022 15:00:30 +0100
Date: Thu, 17 Nov 2022 13:59:04 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Jens Axboe <axboe@kernel.dk>, Miquel Raynal <miquel.raynal@bootlin.com>,
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
Message-ID: <Y3Y+KIaINZOpWlx1@makrotopia.org>
References: <cover.1668548123.git.daniel@makrotopia.org>
 <7526fc5a461a0d68eb1dab575f9c1950638fc21a.1668548123.git.daniel@makrotopia.org>
 <Y3R8oQXRQ8uq8p4P@infradead.org>
 <Y3V9/pmHs7ypE7lb@makrotopia.org>
 <Y3XN+fDTjHz09qEE@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y3XN+fDTjHz09qEE@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_060050_197574_11CF8296 
X-CRM114-Status: GOOD (  23.12  )
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

On Wed, Nov 16, 2022 at 10:00:25PM -0800, Christoph Hellwig wrote:
> On Thu, Nov 17, 2022 at 12:19:10AM +0000, Daniel Golle wrote:
> > While weirdness is certainly subjective, uImage.FIT is not just a
> > random image format but used by a great majority of headless embedded
> > Linux devices out there. It's the default image format of many of the
> > SDKs distributed by chip vendors such as Allwinner, Marvell, MediaTek,
> > NXP, Qualcomm/Atheros, ...
> 
> "Look see, my weird format is used by all these companies building
> crappy SOCs, it is not weird.."

I didn't invent this, and it's just as broken and yet perdominant as,
let's say, MS LDM on x86.

> 
> > Please let me know if this sounds acceptable, so I won't put effort
> > into implementing something which will then be rejected again after 5
> > iterations on the mailing list for reasons which could have been
> > expressed from the beginning. An RFC for this series was posted on
> > 2022-04-25 [1], I wouldn't have worked months to fix all requests of
> > other maintainers and tested it on a variety of different hardware
> > knowing that the whole approach will be NACK'ed...
> 
> If people ignore something that is obviously broken they might just hope
> for it to go away, becaue often it does.

While I'm sure that strategy works seen from your perspective, it does
waste resources on the other end. In this case it might not have been
obvious to everybody, I did receive feedback from other maintainers,
as I said. It's not that everybody ignored this contribution. Hence,
looking at it from my end, the picture is a bit different. Anyway.
I would have appreciated an earlier explicite NACK, that's all I
wanted to say.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
