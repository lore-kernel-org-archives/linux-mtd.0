Return-Path: <SRS0=LhK/=CQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8890C433E2
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:37:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75720207C3
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2020 07:37:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i2RfFnQq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75720207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q1CjSpY6LR1F6a0YPGxNkpELohvxh3MCTM1CNhVVjrw=; b=i2RfFnQqidFNZRnRbba6/fLXl
	YLpJxs6bIVkTknag2KIYQpjOBaY2w0pKwAtpeEW3QR+hNgSVmkkqjwNdwvwXfeT43zk+JiNnc9AAQ
	Ty3VO1IGen2zSXcTXN4iTI1f7sBJOjQc2UHjaWgnD95KSPlYLidJjVA38S2aG0bt8Wo2XIh08PTQz
	k1FlV4wW/p1BiGVk3RZjgM9+wKQPL7MXWFrGwcs+UjDxp6P8y1kUJBXzqf/yuP7xM+j+dfLDBAw9Q
	AoIcel4GeqpHuq2+fhMaomckNxwxHQdI8T+x6Y7HsrOhz0PPfJEfNuL4aFIGJKGqiARF5TJ0VuhDS
	MBDySrbcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFBhU-0002Cu-J7; Mon, 07 Sep 2020 07:36:28 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFBfn-0001Fr-Du
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2020 07:34:47 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 5E3D0240007;
 Mon,  7 Sep 2020 07:34:41 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] mtd: lpddr: Replace printk with pr_notice
Date: Mon,  7 Sep 2020 09:34:40 +0200
Message-Id: <20200907073440.27662-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <ff48ce07ef208ba65b858f09279a3b36031d64d2.1588016644.git.gustavo@embeddedor.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 518693abe6e3f57606ec18892e9135abbc04b361
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_033443_813780_7D8FAC78 
X-CRM114-Status: UNSURE (   7.13  )
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
Cc: Joe Perches <joe@perches.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-04-27 at 19:54:13 UTC, "Gustavo A. R. Silva" wrote:
> pr_notice is preferred over printk.
> 
> Also, coalesce formats as coalescing is part of coding-style:
> "never break user-visible strings such as printk messages"
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
