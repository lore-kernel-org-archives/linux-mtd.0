Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2AFC433ED
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:20:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C202D61421
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C202D61421
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qLQD8mXMJfWrue9siuqYDkb74NL6y6awheMnc7bOuJ0=; b=VUOn2KdzQtf4Etux0CAfpLnxm
	mdwtdtR6SgFfeJ/t0GzGHNZAaZNhnhCz4OG8EbrIE5TMl2csOrhXNLtVY7iKK/qJOzOpWTqfX7iiQ
	hefTguPHNgkp1EEIzg8fr4ZrJ6DED/7zdAgpiwgRbbrPEKI+Y+dtR/3IgO+GQPaEvd/4en7x5hOiV
	laR9H7aVGYITWwvOl3pEHM+9l+fbhpTw2NJnOouv/iXy21UwKVH5UzsLwGwdl/i1AgzY/qq7znBYy
	2hD96RIiu8KYXWSiqTsG6IXWWeoGpoJ+k/IfCcr7tLr/6BRDTznJkx2kIUri2PTbhoF9b9T+g5eQT
	G8iMudW2g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg30w-00Due2-Bv; Mon, 10 May 2021 10:19:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg30i-00DubY-FF
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=ChLcYZx8jjHijQyGpdN1rQu+oYgaLWe+qA4N0gZtdxE=; b=uYeOgUnmi6R66xweYngZF61T4o
 7QvjYmxmi1WPQUbAHXRKVLj+BFWVJ9qAzRsCH9h2xLmyZyqMCV6bxfETTd+bLuIpLLbhAOjyxum+f
 MjLayTXVZ9DmGR/oO1KdiwLyc20Gu66bZN11lXfKspE8VvzRzAfNmWc1CfLtGoSGZ3ubLCcxR9Y6m
 TU667oJfXWlzXVzL60Es846VAkVwOfUQyV63G9z467X7TCIkgiw5YDhDg5VCG892cGzdCbrwDMDv2
 rs9MQ3M87GodZcXF1yIR3VUa0cajc3t4jnygGR4eO6+eWUJvBAfVRMXqJEZlC3MT7JDz6j93TQJta
 JYUrncTw==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg30f-008WGJ-JC
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:19:35 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 392BC1BF203;
 Mon, 10 May 2021 10:19:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hauke Mehrtens <hauke@hauke-m.de>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com
Subject: Re: [PATCH v2 2/3] mtd: parsers: trx: Allow to specify brcm,
 trx-magic in DT
Date: Mon, 10 May 2021 12:19:20 +0200
Message-Id: <20210510101920.7947-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210418214616.239574-3-hauke@hauke-m.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'd7f7e04f8b67571a4bf5a0dcd4f9da4214f5262c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_031933_783601_B5CA4B26 
X-CRM114-Status: UNSURE (   7.09  )
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

On Sun, 2021-04-18 at 21:46:15 UTC, Hauke Mehrtens wrote:
> Buffalo uses a different TRX magic for every device, to be able to use
> this trx parser, make it possible to specify the TRX magic in device
> tree. If no TRX magic is specified in device tree, the standard value
> will be used. This value should only be specified if a vendor chooses to
> use a non standard TRX magic.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
