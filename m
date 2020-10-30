Return-Path: <SRS0=OfxJ=EF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3AC5C5517A
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:27:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73CB920756
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Oct 2020 17:27:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QRQZEpyH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73CB920756
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7q+BvbkbLhadNCSiDYcEyuFEJBOr0pJ3C+FWi/JktBI=; b=QRQZEpyH4JQmq7FSaJt7vkLe3
	g31OgHf9PVjznQRSagNxChErZvY6dV9yBrt0xcOeOiZUUtxeRboVln3dUfu0CngK+X/YmQNRMu6JD
	9htMVNfmCdrq1OBf43JiqnHtvnRxjXCnCsYeDb1b51JhkGE3R+6p85gXHKaln2u/sIZI/E4r44/5j
	Pu0zf9nFXnZviiY557Gs5UBnUJ/sXb+3wneLr/HR3/NW/7n3luA6Z9cAUiv26mvH7zwG5mCJUauIS
	Dh3hXXT1AewPicLTOtRNRFa3rdcU9QXmvD6zCEcwxnavbBpl1mnJrrwOqlC4kce+asaqkpSaL0geT
	yj+AKqZBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYYBO-0004qv-5U; Fri, 30 Oct 2020 17:27:22 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYYBL-0004pn-7k
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2020 17:27:20 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 0E27C1C0003;
 Fri, 30 Oct 2020 17:27:15 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sergei Antonov <saproj@gmail.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: meson: fix meson_nfc_dma_buffer_release() arguments
Date: Fri, 30 Oct 2020 18:27:14 +0100
Message-Id: <20201030172714.29036-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201028094940.11765-1-saproj@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: db37c76e767a0d2de190959948099504c16b3e61
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_132719_396507_B2CF7F87 
X-CRM114-Status: UNSURE (   6.82  )
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
Cc: liang.yang@amlogic.com, jianxin.pan@amlogic.com, stable@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 2020-10-28 at 09:49:40 UTC, Sergei Antonov wrote:
> Arguments 'infolen' and 'datalen' to meson_nfc_dma_buffer_release() were mixed up.
> 
> Fixes: 8fae856c53500 ("mtd: rawnand: meson: add support for Amlogic NAND flash controller")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sergei Antonov <saproj@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
