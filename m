Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E50A9C2B9F7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:41:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7EDB61437
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 09:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7EDB61437
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYepGOhxaUMo4mKPSMeYN3elQr4H7HXKV3ke/Mv8F6A=; b=vNWevS4tjV100s
	Gq46lzOlz7tLS1hztvHnVt6ffmp+8JRPP4axQsTF0SA6ZcxGSFF5bhUCp+DKR42ZrQ1C4l67PGeWK
	FnLw71nchpoc3HBhY+X+4S7cQprY1U+7Ae8g0mQrkT7t/zljm550ZlTlaGCnYjcJxoU6DrpToPEUi
	dWb3NMix/6fVBtAQNmfYeXs/dY1BP7DN4bfw+4TOzlqMbzN025/4fh6RoYg5iRx8ID8jY7MXgi9bJ
	v1BvOdkIQUErJRFuLCcwk1VCyIsC8e+UOj4UmWs9g/StorzjFA3MGow2x1vZp+sr9oyCYGQC++WH2
	SmLWn0iF/kK5ImC5qWJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llq20-00CxMI-Do; Wed, 26 May 2021 09:40:52 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llpRt-00Ci8D-3l
 for linux-mtd@lists.infradead.org; Wed, 26 May 2021 09:03:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id A1E20C001D;
 Wed, 26 May 2021 09:03:30 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 3/5] mtd: rawnand: Add a helper to parse the gpio-cs DT
 property
Date: Wed, 26 May 2021 11:03:30 +0200
Message-Id: <20210526090330.181161-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210510104051.9701-4-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'edc0c2ab124703631cbdd95706dc450b6dce912c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_020333_326850_FE02AFDD 
X-CRM114-Status: GOOD (  11.08  )
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

On Mon, 2021-05-10 at 10:40:49 UTC, Miquel Raynal wrote:
> New chips may feature a lot of CS because of their extended length. As
> many controllers have been designed a decade ago, they usually only
> feature just a couple. This does not mean that the entire range of
> these chips cannot be accessed: it is just a matter of adding more
> GPIO CS in the hardware design. A DT property has been added to
> describe the CS array: cs-gpios.
> 
> Here is the code parsing it this new property, allocating what needs to
> be, requesting the GPIOs and returning an array with the additional
> available CS. The first entries of this array are left empty and are
> reserved for native CS.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
