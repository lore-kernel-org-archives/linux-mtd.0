Return-Path: <SRS0=ioUS=UC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2B96C04AB6
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 08:49:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7C2826453
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Jun 2019 08:49:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ru1OS/zn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XJEbTvqA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C7C2826453
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ByhrEuP0II1+JtLFpe/qluKYxxa07xFkuI17HKHjnQ=; b=ru1OS/znGxIxpv
	jZOE9HLR1mkveAYRo39gpNmHN2DAWA+QDnk7nn+xjqa5/sQ/H47i16VQVZt9XuLdjTkeHcd+Qabpo
	nfyzhiicsp0diGNs13QU1Evx3xotZgWHwzH6a6tsONmV00On5joPQvAj8hMNLPhbWg4qmG69I8608
	kNWLKgOPhZQWLa/9mePQMMTF+K5Qsgcc5iIplChQiAiARVNnOMG4C5Pyp7ixR6ycOW2iPlIiCkFu5
	n1ihx+zxEfvUlLSCxNdh0zfep42yB1ejJSS0XyBlw9lVNuQKB8mndDBrJKZGzfrZ4VD7EN5q1i3va
	z/57si6gVI1cI8Y+L0qQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXieX-0004JF-TW; Mon, 03 Jun 2019 08:49:13 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXieW-0004Iy-1G
 for linux-mtd@bombadil.infradead.org; Mon, 03 Jun 2019 08:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dlj/URCTIU8dewG3svplC9f+AGjcu9sFaFLFgld/mF0=; b=XJEbTvqAEnCZVIMuL5x1yNJmJR
 bhuqPHJ7veBJCUWMg7GqVDnCddRx83GHTHpZ3+7CQdio4KuNxNBnza3gWh7TrDtwwi9gI6YbiIhqa
 sjlHwXc1vP+i6BmyybTZn6IlrpKLlWrOzpq2FfcE4uXRAWb6GhgssxTi/bYrnjLGIGVjU0QN/sN29
 IApIH74liff+6Ivmb4Op9XeYAncvmMh4ObbP6NzjQ6gBWvwWDp5l/OtSQFLh1FzT4IOGKgZ/N7UHc
 tXCqCGuwUHGIMSaBZm2E4/IJ7ocYSZcsVtkulYtvWJZN/c73WW9d1veD6huWogI8LwcxjAR5maZRJ
 bzvcmz8Q==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXhx3-0001Nd-Lg
 for linux-mtd@lists.infradead.org; Mon, 03 Jun 2019 08:04:19 +0000
X-Originating-IP: 90.88.144.139
Received: from localhost.localdomain
 (aaubervilliers-681-1-24-139.w90-88.abo.wanadoo.fr [90.88.144.139])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A593160006;
 Mon,  3 Jun 2019 08:03:44 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sascha Hauer <s.hauer@pengutronix.de>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 08/14] mtd: rawnand: gpmi: Drop unnecessary restoring of
 previous chipselection
Date: Mon,  3 Jun 2019 10:03:44 +0200
Message-Id: <20190603080344.28191-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190521070643.6244-9-s.hauer@pengutronix.de>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 5197943c2b7bb3f602161b37d06aea6da0bbfe79
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190603_040417_801074_81A98B90 
X-CRM114-Status: UNSURE (   6.75  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, Shawn Guo <shawnguo@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 kernel@pengutronix.de, Miquel Raynal <miquel.raynal@bootlin.com>,
 Han Xu <han.xu@nxp.com>, Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2019-05-21 at 07:06:37 UTC, Sascha Hauer wrote:
> The i.MX23 specific option read code is called right after nand_scan. We
> can rely on the NAND core having disabled the chipselect, so there's no
> point in restoring the original chip select after NAND operations. Drop
> it.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
