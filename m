Return-Path: <SRS0=zmh0=2J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 073F2C43603
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2019 06:46:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB8DF2146E
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2019 06:46:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W80YBYIc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB8DF2146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dominikbrodowski.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hl+GzleGXhvV5NRbzUVis33fM8Oy7/7NryaO9Kg0pzQ=; b=W80YBYIcV+7AiR
	8kRvJtQmYBC1dEj3MWojKZ1+biU6H427iJd++OkFPenfa3+8pkeSCzJD+g6EHB1xekXfcvA1OftEV
	COKbeQh5Gr+jv15RVbktwGgV+t+BciXqznrPLSq/4W1I6BVC875VvZGGiFCFFWO0XIRffHb54VTom
	8l+ka9BYyVlHlOnzLIJUSJ7FiL4XR3oMwruTUaF5ERUkXK4Du+OZguL6GMR6v31cZX6CEZeKZAPD4
	nrcEBo/1NZ6CcU3NbEoMuat8ATbnVvNzXVA1joKGVVETPe4/k1MA5E0bklVal3PCPOGPs9h3thlzV
	iCkPdE90wKaA15UWZAMg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihpZM-000296-RO; Thu, 19 Dec 2019 06:45:56 +0000
Received: from isilmar-4.linta.de ([136.243.71.142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihpZJ-00028c-TE
 for linux-mtd@lists.infradead.org; Thu, 19 Dec 2019 06:45:55 +0000
Received: by isilmar-4.linta.de (Postfix, from userid 1000)
 id 3CD452009B2; Thu, 19 Dec 2019 06:45:51 +0000 (UTC)
Date: Thu, 19 Dec 2019 07:45:51 +0100
From: Dominik Brodowski <linux@dominikbrodowski.net>
To: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: Re: [PATCH v2] mtd: maps: pcmciamtd: fix possible
 sleep-in-atomic-context bugs in pcmciamtd_set_vpp()
Message-ID: <20191219064551.stdx4aoyhwsbqbjj@isilmar-4.linta.de>
References: <20191219032023.7177-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191219032023.7177-1-baijiaju1990@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_224554_094686_8D0B70D4 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Dec 19, 2019 at 11:20:23AM +0800, Jia-Ju Bai wrote:
> The driver may sleep while holding a spinlock.
> The function call path (from bottom to top) in Linux 4.19 is:
> 
> drivers/pcmcia/pcmcia_resource.c, 312:
> 	mutex_lock in pcmcia_fixup_vpp
> drivers/mtd/maps/pcmciamtd.c, 309:
> 	pcmcia_fixup_vpp in pcmciamtd_set_vpp
> drivers/mtd/maps/pcmciamtd.c, 306:
> 	_raw_spin_lock_irqsave in pcmciamtd_set_vpp
> 
> drivers/pcmcia/pcmcia_resource.c, 312:
> 	mutex_lock in pcmcia_fixup_vpp
> drivers/mtd/maps/pcmciamtd.c, 312:
> 	pcmcia_fixup_vpp in pcmciamtd_set_vpp
> drivers/mtd/maps/pcmciamtd.c, 306:
> 	_raw_spin_lock_irqsave in pcmciamtd_set_vp
> 
> mutex_lock() may sleep at runtime.
> 
> To fix these bugs, the spinlock is replaced with a mutex.
> 
> These bugs are found by a static analysis tool STCheck written by
> myself.
> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>
Reviewed-by: Dominik Brodowski <linux@dominikbrodowski.net>

I presume this will go upstream (with CC to stable -- likely applies to all
longterm kernels still maintained) via MTD? Or should I route it via pcmcia?

Thanks,
	Dominik

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
