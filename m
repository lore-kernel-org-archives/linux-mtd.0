Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC4C1ECAAD8
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Sep 2022 08:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F3wC3veA98O0JoBvGyq+Z8u3fbn0gJ2UqlwNgfjoNsE=; b=zMNrak408nRs8U
	x5uH91o9bT+hHKx8LmH6N+YNRdC0WEmzVb92DTg8yAY5viMQl2FreGmlMVV2lZbBepRoBYXprKDdh
	QOLoM17f8sqf5loTUY+sZTh9W+3HB/mN0q8IIcKGGOpgZloeW5zOCm6Q5IA5QQYn/09fz3HGskPS5
	bxaymmXMu/MZLE59EkW0bmd2H8QP3sjKbsM8zU9Pjr4iLZxHlAKvQ2BPdYthhdkgG4pg3sAsxdBa6
	AdoGle5X0DznB746cZz9CfAxKMZuhWqPT4vtA10bWBj/AJOKl3lfviOZGaLsDRAfmj5PsXyDpZpou
	QsZXdQ8BSJviTeCsCJlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYMA-001e7h-HG; Tue, 20 Sep 2022 08:11:50 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaYLd-001dXG-VI
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2022 08:11:20 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3847EE0006;
	Tue, 20 Sep 2022 08:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1663661470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FYw776a8tiBkeyoGWt+RRk/t/WHYRfwOtyHykS/tkzo=;
	b=gOs5kzRTn1wMng7I6nEFJVmYTCVJ/tFQfTfrm6yznxfQzbyQfXgcMe4grn+JJT0nh5baft
	3axkTi/8KTWa2m6OxlU1me4r97PZtLGtAmfg0Xf37QHpXH4jAt2ffihGrHxaXWEQzyMAAq
	Wj+XfrDt4hSmVscS23Nvd9eGYi9YguUNvNKsJw+y/OIzjLF1WuloDIa36RBClkUUT4dmfn
	jxBeA+H/bz2v9XG6TrhrxZGgdzIIJVZcRH6PFC+gRKgTu69DHP4VheYMtZ9NyYTSAYaw47
	MHGAyjfexOlgPl0lIUxWAdqE04/ctGUI67MHyOMwWOA5knYTmCOiEeqHaEzrVw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Slark Xiao <slark_xiao@163.com>,
	han.xu@nxp.com,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	richard@nod.at
Cc: linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix typo 'the the' in comment
Date: Tue, 20 Sep 2022 10:11:07 +0200
Message-Id: <20220920081107.597391-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220722072850.72797-1-slark_xiao@163.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'12e971b21caf069e4cae9720cfc70e200b24992b'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_011118_448885_8449205E 
X-CRM114-Status: UNSURE (   5.51  )
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

On Fri, 2022-07-22 at 07:28:50 UTC, Slark Xiao wrote:
> Replace 'the the' with 'the' in the comment.
> 
> Signed-off-by: Slark Xiao <slark_xiao@163.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
