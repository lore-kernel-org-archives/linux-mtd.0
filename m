Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D1DFC54FD2
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jul 2026 17:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gl7l3ty6vhZVDKEhRaQKBLKFY9OjO4+2M7kGfyPbnjY=; b=mgrydADqH7mFir
	frz7ejLzZjZc80yRaZA4sZfFdAdp8fYVpdVGWi6KKfr/hISfGB5BjSD+wHAcbMrrzno63WWMmyI6Y
	CH/4T8/Kif5mjMm8Wgx2P+dcqWtcFhHlH97EP3OPPZ3GRCm5mSOaEhp41Ej4vAGkuuSX8gpoHSIji
	hSHKzkP2RG41mXSRORGIlCgSOiYGtwVe0RIk+o9c61ecVJfsvNhWGxyB1E6MAgwqHEr2VWghRwCNb
	ZMwkD0CSU3JtouPCGgvn36Ortu2WfKnkDY0d0zISUvvkMZAc01GZwoWFWd2Pb9gOL0DgJ/1DQAfk7
	tMw+JHEEh5toa1HgSgjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7xW-00000008gFD-1Mx4;
	Wed, 29 Jul 2026 17:20:46 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7xU-00000008gDs-3JyH;
	Wed, 29 Jul 2026 17:20:44 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org
Subject: [PATCH] ubifs: headers: clean up some kernel-doc comments
Date: Wed, 29 Jul 2026 10:20:41 -0700
Message-ID: <20260729172044.1793865-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
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

Clean up kernel-doc comments in 3 ubifs header files:

 [PATCH 1/3] ubifs: debug.h: fix kernel-doc struct prototypes
 [PATCH 2/3] ubifs: key.h: use correct function parameter name
 [PATCH 3/3] ubifs: ubifs.h: clean up kernel-doc comments

 fs/ubifs/debug.h |    4 ++--
 fs/ubifs/key.h   |    2 +-
 fs/ubifs/ubifs.h |   20 ++++++++++++--------
 3 files changed, 15 insertions(+), 11 deletions(-)

Cc: Richard Weinberger <richard@nod.at>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: linux-mtd@lists.infradead.org

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
