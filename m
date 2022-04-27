Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB1EC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Apr 2022 15:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wRyIi/ofYPXVT/aXYn0FZw2JyzscpNXnA/1CjXfbU4=; b=aRR5Kr95a8iGHG
	sYRMiJ8kJB8ukLmARJq+vuL46+IVGxQvMLy1Zdvt9qzKc5+cPfXwLbZ90aYvtJlAVQDepwwLl0G2p
	WZ3qGbzj/icPkFQm+TyQXJVxSZK3eBmpVszLRdRIYq8BEmtse0oiYsbNwCUoDeparBCdymDzFMVBy
	rugvGrCvHTKJuqTBOL92AyxTM03FJWoEkeZ8/BPdTiCZDvk+kuVLYP0NhBCnhCxlXirKVkbLVgXaJ
	Z0Hap6k9nFCaWvAHcgzeIvjheuLRCNtD4yAR/cIJMnttSaIW8Gx/ZKmkd0CzJr7jQpbXW+bNJgJfT
	crKHyFvOjDtbO4KcQ4RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njjYg-001yqi-Np; Wed, 27 Apr 2022 15:26:26 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njjYc-001yly-8J
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2022 15:26:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E26F11BF203;
 Wed, 27 Apr 2022 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1651073177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k9Rf97iebmoDfy15ErOJ4xhdjVjGSFyAVnacL6ziYLY=;
 b=lM9P1GbmTn5Xmb4Sf0bbbpTN1qlRPeRwz35/sn0FJwJcJ9w7esHk+i1kmH5FS9FHy558/i
 FtxYLtpZajg1fHuoWPcjagHEd0AFvm1UOYBU2huxi5Q9Lq5VWPRPdPEn2YsjMbTNe7m3tc
 OP0RTxf8c5UyQwPIJDX/XZRcMueXtAqbioj0Usm4rBK95YorjDdRfNIICmywZ+XqLkkF8W
 FWUJgAY2jvjDqwGnuFKVe2PI9jYWaicTs8AM2aTwt5km5avNMVxtwqcD1jBaFTANmpmhWr
 sZo+wrhVB06/T7GRw1QNPj1hn4itFS1Acmy+tFmXnJTjyhIntt6QWD9w7I/xIg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	richard@nod.at
Subject: Re: [PATCH 1/3] mtd: rawnand: cadence: fix possible null-ptr-deref in
 cadence_nand_dt_probe()
Date: Wed, 27 Apr 2022 17:26:15 +0200
Message-Id: <20220427152615.101037-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220426084913.4021868-1-yangyingliang@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'a28ed09dafee20da51eb26452950839633afd824'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_082622_504667_829A8818 
X-CRM114-Status: UNSURE (   6.75  )
X-CRM114-Notice: Please train this message.
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

On Tue, 2022-04-26 at 08:49:11 UTC, Yang Yingliang wrote:
> It will cause null-ptr-deref when using 'res', if platform_get_resource()
> returns NULL, so move using 'res' after devm_ioremap_resource() that
> will check it to avoid null-ptr-deref.
> And use devm_platform_get_and_ioremap_resource() to simplify code.
> 
> Fixes: ec4ba01e894d ("mtd: rawnand: Add new Cadence NAND driver to MTD subsystem")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
