Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E008CC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 19:11:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7FB361AE2
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 19:11:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A7FB361AE2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttvAALqJ7yinM+x08aBZX5emnL7N7FmNszvlopcW8sI=; b=E5piLIIY9Av9Ny
	VsgTWSTnsukoS5oz8Vgc4y0jXSPCyurT0z/CK9wCLNjBsaFrPpGiK4v88epkDB8Nj+GVcOtZt1P0d
	GqACsi9TruJFjbf4FQPiuNZ5+49btDWON5zSeM5/+qF8pIsGLtFn4ost8IElCo2ONmmC13+Mm0CLB
	PJvGUWvglX3+ExxxSNv53j7ufjNy4+6BNn0DgxSzkbPS7TrZMQ+L3A7MQBeqkiLkDztnhf0sNh1XB
	QLiecfTZrbjy7Vp26vJBKCbiI263VOABUOeiSgzVkH9OenSEGBqKmUNR155qbYCEbIlo40jacFGzP
	Sq5SC1DnJ44r4jgTZRUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo9HW-00BPL3-46; Fri, 19 Nov 2021 19:10:42 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8vo-00BLQV-F4
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:48:19 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 8DA9460006;
 Fri, 19 Nov 2021 18:48:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zev Weiss <zev@bewilderbeest.net>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Michael Walle <michael@walle.cc>, Zhen Lei <thunder.leizhen@huawei.com>,
 Lee Jones <lee.jones@linaro.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Tian Tao <tiantao6@hisilicon.com>, Petr Malat <oss@malat.biz>,
 Jon Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: core: clear out unregistered devices a bit more
Date: Fri, 19 Nov 2021 19:48:12 +0100
Message-Id: <20211119184812.1481781-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211015185049.3318-1-zev@bewilderbeest.net>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'67bcbe202b487a2e4d9da586b63e4df632655568'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_104816_684977_F853BE51 
X-CRM114-Status: UNSURE (   6.46  )
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

On Fri, 2021-10-15 at 18:50:48 UTC, Zev Weiss wrote:
> This allows an MTD device that has been unregistered to be easily
> re-registered later without triggering spurious "already registered"
> warnings in mtd_device_parse_register() and add_mtd_device().
> 
> Signed-off-by: Zev Weiss <zev@bewilderbeest.net>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
