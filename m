Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D17C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 07:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Si3DR+P/FWy+4qlfxvqmkE+URv2din2Ud0lTPCxgaw=; b=dabA25IXYuGTby
	vRjpxifeMue3DL2ihub3+CwXqxzxIOAiQAqI41i1VhQYDYDSzu0wh7WONgO8Kn2lSNF17yVXBysvv
	0K0/WSvbinZIBiGWGEIwkSxXEXqRJM5NmHvIEAwzoAY0xk7dBphs7w8RCMWdWJGEE2IrHCvLtW1yc
	3oCTgv/YGWAZySOxqd5DCHTtOeqkNhYUwv60peaESOrmsH4TivZy4XFb4sgctcPlWXqAJPbPArnKn
	vK/BZnA1VbGRkoY0NNd3YvtnEmmyfnreq5mQUSYkznjA7Io/YtdP4PpdC+NHmGnciq+AFLsFJG/4v
	e1jaKh9DOnft9vGgBJIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhRMO-00C3JF-KK; Thu, 21 Apr 2022 07:36:16 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhRM5-00C31M-2W
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 07:35:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B49261BF209;
 Thu, 21 Apr 2022 07:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650526554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XGsM2GQEMgFdPKCnMpoDRkCkxt3Jk31U76JbVY16cr4=;
 b=c3wNV+oUFLzhCTyd019QDGMZUMk9xLubpdRvZnSyRsVSJmA6m0GU6W23BFXkti6P/OvgPJ
 mQvULURY8F+pcI87t9Fbscyg7spsJ8ZJTCeeOl/SdM/uwW4YW8wqKXnNFBCFnExTD86+Z2
 F+DxBH1ruFhEsc04jsyL8EJ5ShxGXzqJk8p8Xft1iMm2KBZ+eWEdERQTnUvQuk0Uzoe9KV
 abg+2MKHGhzrbCn94TYa/WgP8l3XSO6ykj8HDV99lbW2YUAcnOTwZpROXjqvePrWXwVwac
 pUjpIwBu6CGJfZkgf/cDn5Alx9eAI3DlExsHmHwgh/Xtf8fxU1m+86pQkxJmFA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jean-Marc Eurin <jmeurin@google.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] mtd: mtdoops: Fix the size of the header read
 buffer.
Date: Thu, 21 Apr 2022 09:35:52 +0200
Message-Id: <20220421073552.72015-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220415001321.252848-2-jmeurin@google.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6ae35884007189f7dee68dcc31f0caec30ac2c08'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_003557_316181_BB818312 
X-CRM114-Status: UNSURE (   6.37  )
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

On Fri, 2022-04-15 at 00:13:19 UTC, Jean-Marc Eurin wrote:
> The read buffer size depends on the MTDOOPS_HEADER_SIZE.
> 
> Tested: Changed the header size, it doesn't panic, header is still
> read/written correctly.
> 
> Signed-off-by: Jean-Marc Eurin <jmeurin@google.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
