Return-Path: <SRS0=6x0o=6L=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78971C4CECC
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 17:58:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 485FB20B1F
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Apr 2020 17:58:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dTskuTDX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 485FB20B1F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=yadavpratyush.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKHWqiNHK2/S933eDqREVkQ9tX8gF/EMJlFl8i6yMA0=; b=dTskuTDX02+rrP
	5mhzXWRWSOGaGkr6jq9RVxPcrfKpVZtJ/T/YzeQrf8MVsqYsPPPSR8BGBqEFitxDEEyZnJW6Xe8I/
	Gs5Vw+HS+H5Q0JQe0amfRSvD9KHBVr25GoXt3t2oC+hmGiBzNug5LCFPPAGQw2ag1oREWiXOG9uvD
	dGxN9HRUosKF0wtjGZITPFNiGy9ldCvEks/f4DGyr8LyTivKwQ9B44OHMgkR9IQaqgUqG9a8SwWvW
	98DTCIvdHcGNTTS9yBKzpxMPLtA8vY87RXf+PAGlCU2kBWqc0kGCj2BKAMKh8sWRsU/G5WNN7ZZQh
	yzxqADRnEiapFdaG56EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT81D-0003vX-9P; Mon, 27 Apr 2020 17:58:11 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT819-0003uA-Lm
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2020 17:58:09 +0000
X-Originating-IP: 42.111.30.142
Received: from localhost (unknown [42.111.30.142])
 (Authenticated sender: me@yadavpratyush.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 6DE7B1C0005;
 Mon, 27 Apr 2020 17:57:52 +0000 (UTC)
Date: Mon, 27 Apr 2020 23:25:36 +0530
From: Pratyush Yadav <me@yadavpratyush.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH v2 0/5] mtd: spi-nor: Add support for Octal 8D-8D-8D mode
Message-ID: <20200427175536.2mmei2fy6f7bg6jm@yadavpratyush.com>
References: <1587451187-6889-1-git-send-email-masonccyang@mxic.com.tw>
 <20200421092328.129308f6@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200421092328.129308f6@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_105807_846920_5553A84C 
X-CRM114-Status: GOOD (  13.86  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, juliensu@mxic.com.tw,
 richard@nod.at, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 broonie@kernel.org, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 Mason Yang <masonccyang@mxic.com.tw>, Pratyush Yadav <p.yadav@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 21/04/20 09:23AM, Boris Brezillon wrote:
> +Pratyush who's working on a similar patchet [1].
> 
> Hello Mason,
> 
> On Tue, 21 Apr 2020 14:39:42 +0800
> Mason Yang <masonccyang@mxic.com.tw> wrote:
> 
> > Hello,
> > 
> > This is repost of patchset from Boris Brezillon's
> > [RFC,00/18] mtd: spi-nor: Proposal for 8-8-8 mode support [1].
> 
> I only quickly went through the patches you sent and saying it's a
> repost of the RFC is a bit of a lie. You completely ignored the state
> tracking I was trying to do to avoid leaving the flash in 8D mode when
> suspending/resetting the board, and I think that part is crucial. If I
> remember correctly, we already had this discussion so I must say I'm a
> bit disappointed.
> 
> Can you sync with Pratyush? I think his series [1] is better in that it
> tries to restore the flash in single-SPI mode before suspend (it's
> missing the shutdown case, but that can be easily added I think). Of
> course that'd be even better to have proper state tracking at the SPI
> NOR level.

Hi Mason,

I posted a re-roll of my series here [0]. Could you please base your 
changes on top of it? Let me know if the series is missing something you 
need.
 
[0]  https://lore.kernel.org/linux-mtd/20200424184410.8578-1-p.yadav@ti.com/

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
