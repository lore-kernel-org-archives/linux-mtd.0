Return-Path: <SRS0=dr6A=FL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3451EC433FE
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 11:16:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E29F522D0A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Dec 2020 11:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E29F522D0A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZXLHuRXwzjoYs817XsUGP1+LE/JdSNUo2Mm7ARhgub8=; b=oDQNCZ6wliBUlm917h5OFnjt0
	zPxAAmSGvRC+hJ7WotlP3wDWbxOzn7HEakGzGLwxU+gttqSpT5bEWbjty/yjavksm62fm2GWf7ikT
	3txkvcKoBc6hq2tKqFZ54tQoPadSWL6udSQcy6NeCkYRRtamfUvtsg/y5e5T8Huc9SblgJX7ysZAc
	FsqIfZqERyJiKjoLo/+s7afMr++ewgWR+m+GoCpuo4HlGHfaY4DtOdaQnydypSF8RYF2Y+zV5smB2
	3oZM3iDI5K9EmtQWCPYgZxsDh2KHq4HjZI8Nc1vvIYR/xF+BR7M/Ex4Bre+YruIkbdhR5tDcorWA2
	AvQ8dMlMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmEUj-00063t-Ts; Mon, 07 Dec 2020 11:15:53 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmEUf-00061A-Ml
 for linux-mtd@lists.infradead.org; Mon, 07 Dec 2020 11:15:50 +0000
X-Originating-IP: 109.220.208.103
Received: from localhost.localdomain
 (lfbn-tou-1-1617-103.w109-220.abo.wanadoo.fr [109.220.208.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id DC6421C0005;
 Mon,  7 Dec 2020 11:15:42 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Guohua Zhong <zhongguohua1@huawei.com>, patrick@baymotion.com,
 joern@lazybastard.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com
Subject: Re: [PATCH v4] phram: Allow the user to set the erase page size.
Date: Mon,  7 Dec 2020 12:15:41 +0100
Message-Id: <20201207111541.8887-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201207095529.20896-1-zhongguohua1@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 103e505981981e8f9ba0435980e368998acec74f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201207_061549_885306_1C95D9EE 
X-CRM114-Status: UNSURE (   9.65  )
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
Cc: nixiaoming@huawei.com, wangle6@huawei.com, young.liuyang@huawei.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-12-07 at 09:55:29 UTC, Guohua Zhong wrote:
> From: Patrick O'Grady <patrick@baymotion.com>
> 
> Permit the user to specify the erase page size as a parameter.
> This solves two problems:
> 
> - phram can access images made by mkfs.jffs2.  mkfs.jffs2 won't
> create images with erase sizes less than 8KiB; many architectures
> define PAGE_SIZE as 4KiB.
> 
> - Allows more effective use of small capacity devices.  JFFS2
> needs somewhere between 2 and 5 empty pages for garbage collection;
> and for an NVRAM part with only 32KiB of space, a smaller erase page
> allows much better utilization in applications where garbage collection
> is important.
> 
> Signed-off-by: Patrick O'Grady <patrick@baymotion.com>
> Reviewed-by: Joern Engel <joern@logfs.org>
> Link: https://lore.kernel.org/lkml/CAJ7m5OqYv_=JB9NhHsqBsa8YU0DFRoP7C+W10PY22wonAGJK=A@mail.gmail.com/
> [Guohua Zhong: fix token array index out of bounds and update patch for kernel master branch]
> Signed-off-by: Guohua Zhong <zhongguohua1@huawei.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
