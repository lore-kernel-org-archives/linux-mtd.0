Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F2BC2BD09
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2024 12:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nUM6f6iTgULfOkuBnzNXUAJijFvMGU2InuhuTeQtYq0=; b=0V2bYeFAHSb/0T
	XAoYj2++4SqBsM33jIgCkIZpQKINieHufjtbfkSokuCdg4S8TZg+whnj80gnqZ+8b3hisv0ebP3ha
	dIkn1ZBH7d8NE5GXRljWasinHwCYk8fu02Zitff4Ua0Wi4PtTbItaDkRiZ16Qap8h/vzrd8qkOeeQ
	f13casgU3OjwKzmJD2HeIt69PeuFWT8d++U3l7lc1eK1QzV3gaDuOC1Nwfv+9i/x8j7RmVd0425AT
	4C/yjN6W0qCP/dywjCW4bd1oMYtTRw/AIuog+y1xyg2jPsnFDUoAwPrngFmHkjnxuQ0AykDWlxRzC
	RmsA4fAkE88kVoEPP0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG3f-000000039aY-3BQl;
	Mon, 01 Jul 2024 12:22:59 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOFhv-00000003002-3ZgQ
	for linux-mtd@lists.infradead.org;
	Mon, 01 Jul 2024 12:00:39 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21D8DC0002;
	Mon,  1 Jul 2024 12:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719835227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=stCq6xm2MokH+wKmsDICPsDu1Nj3JaDipa8NgCyyLi8=;
	b=PKdIXZjjZcZR1vP07WHZRVqmsM/pWwO1uTn47KNy/kpgSYVk8QFFU88I4ezo8OXQPGed94
	P9EBNy0vRXlu6ye1/+N9dCiO8D6fQb/QDRdpzm0drDPhHJbVt1QItH18l7G6ApbOkQGPGM
	G3kkKunePH1JNhtkoVCPtoEOaso4r2OIE0JarZZ2GtTHHK9GP180/rnHRde9o0bGav1NEn
	06dN1VQlrKAfGd9HJS9cV8yyZo2fRvhsA+tBj8Gx7po5gzcUpTgy0srr7j3feqI+UUrQ9t
	vP9YbbRp8fbXLS923T98tvJMcmfxaMqsfZruwBkTOlqc8XRXCZ4B9srGny4T4g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] mtd: rawnand: intel: use 'time_left' variable with wait_for_completion_timeout()
Date: Mon,  1 Jul 2024 14:00:26 +0200
Message-Id: <20240701120026.525512-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240604212919.5038-6-wsa+renesas@sang-engineering.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'177bf19628dcf214c658c08eb1e41ab9c373e7ff'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_050032_641845_993A4236 
X-CRM114-Status: UNSURE (   8.98  )
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

On Tue, 2024-06-04 at 21:29:21 UTC, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
> 
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> Fix to the proper variable type 'unsigned long' while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
