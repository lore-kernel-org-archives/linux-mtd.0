Return-Path: <SRS0=B2Jc=KF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD692C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:53:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7356761919
	for <linux-mtd@archiver.kernel.org>; Mon, 10 May 2021 10:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7356761919
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PugFt/M5nWa5jqhgWEre4kbA2v2t5UJiPeMRaihzHmQ=; b=MhUWYVmbhg9x6r1FRxg2X0FEd
	8ZtN+AxHr24R+l0JNdzXtbNQvo4HM4GtUvD2dDD1xMZISKPES6p3D8CTdecbzXmew0s+jhkaLQXeq
	0HTWgMg43kEM1IsqlKwDk/dgZfyQBCSklv/Jl0yvprp6dAI8kDiFnBnSmWQLpTKk/kjEk5d8eZg6I
	I6V7kJlONkmld1Iiubpq6F5zsFMOVOxBY51g3ckMHGMqiblimg4QjD9Ry8BDyTzDXamS+twZFcdDS
	WEJpTKnjEqSCluQEjvarZiSUn/404GIJydkCmau/7gXO7JNeqoOxxrkSD+FW/maAsanbHLIL9BoVQ
	m5EofEYUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg3Wr-00E0Zv-7Y; Mon, 10 May 2021 10:52:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3O0-00Dyy6-QI
 for linux-mtd@desiato.infradead.org; Mon, 10 May 2021 10:43:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=PSYHyZzHnWpn7NfeqnZ2XVZNiUlZ4fs5D4X1ztS8BuI=; b=Ic2aabBVl8QcxL1pHnyCirN4z9
 S1a4gvMMcAHLxOjAqrO8t9785vQr4awpIXjP9MQVoafrYDk0272N8jvXh7wo2kWwtEDFbqeKJNqyI
 Bw4kAi/pU0NTmC342I2jOLIh/yUqsqllBeBNXbLzvSIiftiQ4f61PIISHlZHTnmZEYFRIBJUlkmbF
 BfzC8UMg5iaAAAfCfY//5B8/QlX/6AHPSpdUYnaFr/4kcLEIaC2npcHhNoqAXJi8x+STt0MNsyktw
 cbfX8DZCyuhet29qWs0jp50Oxj6Ivxkar99rDbUnAaEmvhr56Letfff0Y6ODYajeuuotT3Q3zMTWu
 yMmcwaQg==;
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg3Nx-008YqW-UW
 for linux-mtd@lists.infradead.org; Mon, 10 May 2021 10:43:39 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 0A7EB240006;
 Mon, 10 May 2021 10:43:35 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Petr Malat <oss@malat.biz>,
	linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH] mtd: Create partname and partid debug files for child MTDs
Date: Mon, 10 May 2021 12:43:35 +0200
Message-Id: <20210510104335.10819-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210430065057.32018-1-oss@malat.biz>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7c232778364c2bc74fe140e65040cf178c607d74'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_034338_135379_EEEBBC03 
X-CRM114-Status: UNSURE (   8.42  )
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

On Fri, 2021-04-30 at 06:50:57 UTC, Petr Malat wrote:
> Partname and partid are set by the upper driver (spi-nor) on the master
> MTD. If this MTD is partitioned and CONFIG_MTD_PARTITIONED_MASTER is
> disabled, the master MTD is not instantiated and partname and partid
> aren't available to the userspace.
> 
> Always read the partname and partid from the master MTD, they describe
> the HW, which can't differ between master and its children.
> 
> Signed-off-by: Petr Malat <oss@malat.biz>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
