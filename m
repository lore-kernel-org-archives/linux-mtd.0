Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEAFC433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:20:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47F8E61007
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:20:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47F8E61007
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HAo0FMg1qsp9eWRO7wxmK42xWds1v0kj45YP1vNSr9k=; b=FbyU2WJm1ipknXcmaDX6P9jev
	AhDf9YNbp5e5ljoIG3cZYBUUFK8bK+3bdMZm6r2tOg6gwPd7iwZ1hdtXNslE4zAISfvqrzy16yJwW
	lt/oKA+sRcF0efOrh93+yzP/snTmIkKbLyfC7v4WBJnRtcHTuW54UYx+ntYwTve9itfW2PF5Rgt4v
	qFiq3WWeLT20N/+1Ofy/vbP65MNh+t15qmA5TFK/IhGqkmbIvi9JzctmV465HaaDzXHdT2LIZ8I5l
	Xqa5NP6LarTaBlmOBqu5RSYbHWVPk5x/tWQJQ6Mdz0jnCedf0psxHUURJc9yWYaV6TXBgCVf6xFMI
	QLXMK1LYg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg30V-00DuYy-Qr; Mon, 10 May 2021 10:19:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg30R-00DuYH-3o
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=YT1MsxMZMs2TYkNnSvxXCEHxCjLsR/tNEKKjYYG91po=; b=0jTptOXmzSUTgfWYgzcNz6794b
 7IELNeFqhnEb7UaummoZFMW3xgUhX5ckefazHYu2V9gk5u35BaJwESyUWu1sKx0txhUFRx2KaE5ZE
 6U2pPgBfCE/Kjwx4c4Zhy0M1Cj4SC+kN3aSo/KnZS+gFoxKKAEFIgaC2xZ83P0a2yZrEauT/LIaD1
 f1nJzZ9xSWw/p7/Aacj+N8Va9n0qyQTdqijW1bhoZZzjqaMDUcOilDiH71oYP/wgwi20nMPgrPGCI
 2hhyJJ+YqD+ZPHkCambPS5yzAkpRgaH+LAlno24oMXnzBBxnzqKH34FfQBMVl3/NHfnw3f6VaaDxN
 NKN/brpw==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg30O-008WFW-GS
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:19:17 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 3EC40240002;
 Mon, 10 May 2021 10:19:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Hauke Mehrtens <hauke@hauke-m.de>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh+dt@kernel.org
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 rafal@milecki.pl, musashino.open@gmail.com
Subject: Re: [PATCH v2 3/3] mtd: parsers: trx: Allow to use TRX parser on
 Mediatek SoCs
Date: Mon, 10 May 2021 12:19:09 +0200
Message-Id: <20210510101909.7869-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210418214616.239574-4-hauke@hauke-m.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'81bb218c829246962a6327c64eec18ddcc049936'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_031916_700812_2BBAA372 
X-CRM114-Status: UNSURE (   4.63  )
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

On Sun, 2021-04-18 at 21:46:16 UTC, Hauke Mehrtens wrote:
> Buffalo uses the TRX partition format also on Mediatek MT7622 SoCs.
> 
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
