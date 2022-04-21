Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421FCC433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJpp+rIa1t6KyLcYGHzUXmWXwuNAcGIgPAlfcNR1LxM=; b=ISIkhxTvbshTES
	IHD2v3UMW4N40VO+stJpeQAAh0QvitMcfZa18KogLgVWT4aVrP0Qe/zcEhU07MYfUq719u3uXLGTs
	pjwUPxcmY9E+oTz19lqLcrn+fa60Cpszu8XqM5Vnev+daqDi0zlLnuQqG4JyXv0gyKElGvYrhdaxY
	14Uu4czRj7duGMuREY9wvooYz0/MpxGIZZiyBxnjR1WOv3TJE5I1ux4UO3BC2mkmUgjNypLjiVdUh
	7m3chYwpXsgLcovqBfvJmghMlYZ1ddz0uh7XVUBZJfeNNRGhy+RxOE6qEd/GZ71Xgx88kJxXUZP3w
	tYK/KSBrwHlsO0u0y/Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRMB-00C37t-2S; Thu, 21 Apr 2022 07:36:03 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRLu-00C2ub-2A
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:35:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C6D43FF807;
 Thu, 21 Apr 2022 07:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C6B9/vGKb6GFVKIWK870M2LhRzeaUO9FQsN+gmFY9sY=;
 b=GRibdnYBVDXPW0Cl4BbygZ/1rlhXSIeVzPv3qr9b6qSpiDlIQYgl3JSNeEEfbOR4iquXLy
 hp+ZZkS9OdfUwg0KkpXWwODHe6bP/mD6GnxFNbyu0xt8zKRejak4ILQnjFs4nDLx0SeCra
 Ge+8nyQ6ziBduTgpX6vhMJ641H9RfFKPQemZVo74qN07317SjHl9HqaczJMtkscRixHBCu
 h51M++fl/zUDbSJ1//OdSFtHI0Y9nYuNgB7zjyspKWU/yb5CLOF78CiIDXprbtTF6RUcNE
 k9KtDz4F3b0Y0WLXXNaGrqGiwHFC9xQvgaCJ25CxGbPnL2hFFq/yyZpZq8sKtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean-Marc Eurin <jmeurin@google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] mtd: mtdoops: Add a timestamp to the mtdoops
 header.
Date: Thu, 21 Apr 2022 09:35:43 +0200
Message-Id: <20220421073543.71887-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220415001321.252848-4-jmeurin@google.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f812679fab605b3d5b853ed24a81dabb222ea23a'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003546_288708_7F0C9A80 
X-CRM114-Status: UNSURE (   6.13  )
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

On Fri, 2022-04-15 at 00:13:21 UTC, Jean-Marc Eurin wrote:
> On some systems, the oops only has relative time from boot.
> 
> Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
