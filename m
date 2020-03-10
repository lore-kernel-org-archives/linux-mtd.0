Return-Path: <SRS0=Hg3y=43=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930F3C10F27
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:46:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C05420873
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2020 18:46:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GNEy8Aqi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C05420873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6WsrRbcYAyps0IKkbWNqb517AmxgjaUUfyGZAVq90Nc=; b=GNEy8AqioL25al
	WxYuq9zHcy+HHUHlpC7lLhMtr+53f2BFA1lnT1KiOrnEmBvdp0JoEsbBhlqqwbr2Fgsoa72FeakTm
	rVa3IzpGKltfCb9OwVkukbmOWVPMnYajNL3m+OB29HFzFH/YIMDF1NGIxfbYvIbfZvGdbF4iLW9e7
	3C7cSFGRS+eDfUyVF1Vtw2afzOAUJwwXaUWlJctbKN7zsQlI8pl9NXjUgSyvuJPpr5zozTw/EISF5
	vyPu1g46M5OoVGBVaJHnb06RZOO60xoDHXpa8kiACIzirnZMV8HNluMraAh148vto2NbzybEUrZcN
	SkVO80NVfrwZnmcEUmCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBjtG-0004qt-Ao; Tue, 10 Mar 2020 18:46:06 +0000
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBjhA-0006Gg-KW
 for linux-mtd@lists.infradead.org; Tue, 10 Mar 2020 18:33:38 +0000
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 651BA200004;
 Tue, 10 Mar 2020 18:33:34 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Harvey Hunt <harveyhuntnexus@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: ingenic: Use
 devm_platform_ioremap_resource()
Date: Tue, 10 Mar 2020 19:33:33 +0100
Message-Id: <20200310183333.19899-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200211173151.27587-1-paul@crapouillou.net>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: c4b7dd35d35936964c71db42e1d94994ee6ea411
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200310_113336_821171_4736BC6B 
X-CRM114-Status: UNSURE (   5.79  )
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
Cc: od@zcrc.me, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 2020-02-11 at 17:31:51 UTC, Paul Cercueil wrote:
> Use devm_platform_ioremap_resource() instead of platform_get_resource()
> + devm_ioremap_resource().
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
