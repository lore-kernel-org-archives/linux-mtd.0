Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 602A0C433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:17:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9E94613CA
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 09:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9E94613CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZSUpv/65ZNIeIngR3CzI6zhsR15kANDBbu1quhDAa2c=; b=W49S7qwsd0y0CLKDH18/qfSNZ
	3zINOzeQNgv5Sj+ACGlYqKJcFTLAQEVPY5/DBICMbvElfD1l2Gof0hlW37oWZbI+iOIZofkGH+sAZ
	ngJOmoeWfr1uIdOJXEKtz0IQLp7KxZ9O/yQeYjapvYgxTfAp3Qv03BWYWMtl6GK4PnRT57GaYtVYK
	Yv2fnC3GHXh8ThjqxJJNgw0evEQ+zJRxbS7xm5+vIf8Wl4S75+ul6HRW0aVXNSqpHRIexzLGBGtWG
	jAVnLXA8SH5pmN1PFCqbt0cvGYdw+Q0A2oAOsPw5oP7RXpy88a1KqJVNa2ccE5XWYqZS0GXFk/7zc
	GP3UYNSkw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg21L-00DjY4-VR; Mon, 10 May 2021 09:16:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1vH-00DiPw-GC
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 09:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=eVqx1jCO3gNgrVv0hqGAS5OrDXWsZPbjDQzzdATDlXI=; b=LRWAK483dufzvGup7ltgewXUdR
 ySB0GjBWeKnC/sf36Mg//ZbwAjgd/PGG4OJfg7HZkPde9+GD1jiBSIeCJndhJu/f3AGLSq6wHhCJq
 xeJm4Ot1aWtYEffNYcKTX+u7UVfwUwCDFVynuP6wTEGEfl6wkbbG+XR/NFh7qUTJzMfhkIQNAI5Kl
 IexavJeQo1y7QH3OmQxmXKz35fN1iY7mVL017l8QyVzcS+aASGPBxu9RTk47QbUCi8MgHvtpQa9M6
 ehgvtgbrUzXWYoatHQlDsAO1YdnS0XqM3pUjGKxopcbyvU8ERwNxUM5RnqRI9lM/HXlO8SP41579W
 i5CXILbw==;
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg1vE-008RV4-So
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 09:09:54 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 8D14C20013;
 Mon, 10 May 2021 09:09:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tian Tao <tiantao6@hisilicon.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH drivers/mtd v2 1/2] mtd: core: Convert sysfs
 sprintf/snprintf family to sysfs_emit
Date: Mon, 10 May 2021 11:09:50 +0200
Message-Id: <20210510090950.3908-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <1618220144-33839-2-git-send-email-tiantao6@hisilicon.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5b2fbe0ca0e8a88f8da3c96cd6628561852be655'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_020953_082566_F45C2CFF 
X-CRM114-Status: UNSURE (   5.43  )
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

On Mon, 2021-04-12 at 09:35:43 UTC, Tian Tao wrote:
> Use sysfs_emit instead of snprintf to avoid buf overrun,because in
> sysfs_emit it strictly checks whether buf is null or buf whether
> pagesize aligned, otherwise it returns an error.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
