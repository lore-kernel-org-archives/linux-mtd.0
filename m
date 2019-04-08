Return-Path: <SRS0=GmYA=SK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F840C282CE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 08:22:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E448D208E3
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Apr 2019 08:22:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TwP7/yFG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E448D208E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9fDS0VPAdKDmzoLNhP1ytTAuuX81+flL+WaosRhnUg=; b=TwP7/yFGro714x
	PTtf0JybjWki52SPlZj5FiIRup1QhEkuOKmJM+ZC5rLTB4PoEUZzzHMnTyy0ljii6a6sovzklT9Gn
	E80+YyMxN2cZzOAJEixQpgR3uf0S9GaXp5Co1Wld5GuBp36roPByTVoKQypvnTF7fbR051FGSPtBD
	UPFheMqmY52Q0Jvz+Wmxl6NUfMz0v74BQLDyLJZDjphjeisJRxmTUzujHPARxydOOVzLdRmLgRLFs
	zc6UMPLWVEy8zDtjpJGcxhyA+lh2PCGfRiQRglXq7UUAjgX4HLccfPNCkG7glFfesep79R1t4iIEo
	a4Sx7t5uZKteuX2+aXbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDPY8-00010a-PE; Mon, 08 Apr 2019 08:22:40 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDPY4-0000zn-Va
 for linux-mtd@lists.infradead.org; Mon, 08 Apr 2019 08:22:38 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id E08EC6083252;
 Mon,  8 Apr 2019 10:22:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id w3da_GCxnbQ0; Mon,  8 Apr 2019 10:22:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 96BEE6083257;
 Mon,  8 Apr 2019 10:22:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 1M5MoThCE2A4; Mon,  8 Apr 2019 10:22:34 +0200 (CEST)
Received: from blindfold.localnet (unknown [195.149.217.187])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id B94A86083252;
 Mon,  8 Apr 2019 10:22:33 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Eric Biggers <ebiggers@kernel.org>
Subject: Re: [PATCH v2 0/5] fscrypt: d_revalidate fixes and cleanups
Date: Mon, 08 Apr 2019 10:22:32 +0200
Message-ID: <1872467.qaoHDzFeKg@blindfold>
In-Reply-To: <20190401171119.GC131675@gmail.com>
References: <20190320183913.12686-1-ebiggers@kernel.org>
 <20190401171119.GC131675@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_012237_158796_89A1D42D 
X-CRM114-Status: UNSURE (   6.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Gao Xiang <gaoxiang25@huawei.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-mtd@lists.infradead.org,
 Sarthak Kukreti <sarthakkukreti@chromium.org>, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Montag, 1. April 2019, 19:11:21 CEST schrieb Eric Biggers:
 > Any more comments on these patches?  I'd like to apply them to the fscrypt tree
> for 5.2.  Richard, can you check whether these solve your overlayfs use case?
> Also, patch 5 could use Acks from ext4, f2fs, and ubifs people.

Will check this week, traveling right now.

Thanks,
//richard




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
