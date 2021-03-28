Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40757C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:52:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B69D60238
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B69D60238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qt42larxdZAeRF8VLGS5/9MZtzR1fxkBPBySi4ghOiM=; b=Yn+Qi8qUOtGn9ArdkuhaeJFt4
	ZfhFUpQSJuFVGO+pd8sCdFib1GUeugYsRQYK23fgqnO+LSsGtGHFpe0vL9hALLlTytHWCgmMBcbKp
	od6tGv9/vvpkTyJqHrZRfmhbuvI8yqgd0TIAhnfuQ112dfzfpFXTHSJUx2wrJEpSTrqaXoeVaVDbq
	s3B5aoIQu/e5pBR/VJCzN8QV8NXKcUA/DAk2JhKh5aBGlpqQzpCYMZSRFFfT40NsIXI7HwbvKVnd1
	W/ZUgn9nhZEoaN+QHOXKtlUQPGwORPZh1xL77Uz6S9osKE9U958iG00aegcBlkG28zuOusJ0RLk6z
	A2BvOTv8A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQw2F-000wNw-HX; Mon, 29 Mar 2021 17:50:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQowx-000ZdU-Gx
 for linux-mtd@desiato.infradead.org; Mon, 29 Mar 2021 10:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=7WU2vOjcj3Zpj2en6QjIxrq/dlVqUeHh65XavFWj8YU=; b=I2XEP/Ze7ahJv5JWZWowHMTwAc
 Q5867gAczpyq1P2AMazSXMTYAmlxWSRIRYvCd8cAj6UAbOOD+JRKomz8hWazHZnEDdj4BZuakK+QS
 x8vjjBCRg8LRwy2t2xfroikcBkClrkcSDxoJuPa1B0MeyHo7K6fYlLtgVeyKSusxRFeHcMxKmZAsP
 sJ0ishGOyukOJwZDFYanQKV+ckJxJFU5IH4d+kiLH7qolVfWJUORA+4FQd0L62U2DkyQRX0UbfGYG
 WMPz5V0kV+mIKuBN7kv2AoKcO4ucIc1bUImoCbHnanyZh79GevpM2v+DxVFEy42/XvqTpRRgCVwjr
 IIyaBk9g==;
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQZ0C-000JmC-EU
 for linux-mtd@lists.infradead.org; Sun, 28 Mar 2021 17:15:09 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 33939240002;
 Sun, 28 Mar 2021 17:14:39 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tian Tao <tiantao6@hisilicon.com>, maximlevitsky@gmail.com,
 miquel.raynal@bootlin.com, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: r852: replace spin_lock_irqsave by
 spin_lock in hard IRQ
Date: Sun, 28 Mar 2021 19:14:39 +0200
Message-Id: <20210328171439.7580-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1615770495-31939-1-git-send-email-tiantao6@hisilicon.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'4682dd19a6686dccf1871479d12dd1a4a3df0b70'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_181506_366686_A0373EBE 
X-CRM114-Status: UNSURE (   6.20  )
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

On Mon, 2021-03-15 at 01:08:15 UTC, Tian Tao wrote:
> The code has been in a irq-disabled context since it is hard IRQ. There
> is no necessity to do it again.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
