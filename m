Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FA7C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:52:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30DA161981
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:52:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30DA161981
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xImTEl8WX6HvtVZMqt+SHRxp6SKvKkORJ73mV5DU0Ko=; b=BJyFO1vXNkMf7yUevRnukLV+X
	lak1mtrRmEBisu/A//KJR/MC6H4auJuI8CC0nB9IMT/REfdLD3KHXGK1wZvYfnhL++ckCoxIUUnBI
	+qHbps+xxOlGdL9FNc6dkdMLUhBN7EsE8D1F1uaaNIWVpfi/doKkIUgu3gMsq+YZ0ycdzfTsWnFk4
	R1tWAC2d34c9ugrpLOEQUWNbYjxQvInvAwPTyaP9fqZusvdX8jrXEJnuPwVFsu7SuhV1ikQJg0laj
	pW3YfgVAsNkr1eugDDiAlcT0ySUfbbIKW38nvOjB9O0I1xBDHqdNB210WK7fAlrXpG9Rh74ViacOa
	dU6SoIr5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQw2a-000wRz-Mm; Mon, 29 Mar 2021 17:51:04 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQox3-000Zdl-KD; Mon, 29 Mar 2021 10:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=EXeaxlL6bhzkMm//HPCXkjTwOZKKZSjc2HWV3BpDgak=; b=IUSNeEP0PDKerel5Us76n71aCh
 UVTlaVAX7KN4dKttYOv8S8pU4i98YIK7DvAgr3tNJ4eesS869ySoDUVFBfIGxbwnkgk9qF5b/SiLH
 sZB5CPuAVS+1XqC1zDJB8BWeqF+sXm/D/x4xEPLSyCMtMesYWBlhk+WW9eO01ylNR73lmFuwq4YeI
 X1fOuzSuMySwT/eaXpsGnS/CSgpZCwTED9mbXH+MukwtOyP02AQ1vJm0kTuFI5JuaH+vF0h+B80Wl
 kBI+bJjyCBefIH/hrv8YuzFJQR5l8jsyAppA7ICR80aeP6izr5xcKoe34kCnyXnAbNZ9CUD4en6XL
 0ycA3gTQ==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQYzx-000JgU-8M; Sun, 28 Mar 2021 17:14:59 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 83C1760006;
 Sun, 28 Mar 2021 17:14:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zou Wei <zou_wei@huawei.com>, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, heiko@sntech.de
Cc: yifeng.zhao@rock-chips.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] mtd: rawnand: rockchip: Use flexible-array member
 instead of zero-length array
Date: Sun, 28 Mar 2021 19:14:22 +0200
Message-Id: <20210328171422.7386-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210323131137.45552-1-zou_wei@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'5c8a620ab22b05eae7e480cb83ff599047b8aff4'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_181450_891346_415F69A7 
X-CRM114-Status: UNSURE (   5.01  )
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

On Tue, 2021-03-23 at 13:11:37 UTC, Zou Wei wrote:
> Suppresses the following coccinelle warning:
> 
> drivers/mtd/nand/raw/rockchip-nand-controller.c:162:4-8: WARNING use flexible-array member instead
> 
> Signed-off-by: Zou Wei <zou_wei@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
