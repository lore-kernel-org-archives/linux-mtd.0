Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938E2C43217
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Nov 2022 16:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mJzKaQKgQQdvsE6Neit90JbMzzY7uk3zlBRWeN8Pous=; b=OYs86BpNilSy7N
	EvSMrHC6Kw+xVKCY4SMm6IIuqzG6Yep5b44GH4C+RlMW4ja8BZORbFN2kUH4QJ/HkdbdET1BH6TZj
	KxKe1o4uiAhhl7XHZ6rwTn6agN9I1pGRl6dybuN0gpK/OtySl9FVEqxlw6MsjyIkXp8Z+IZ/QzCVW
	R/6/XxndVTqHbqZHwKW85Ga/yAhBrga98eRZX0/bDoG2DWJJcgrwusH46QgQ9C5CrSp/FjhyHVqN6
	I7XaDbm8W1SSy3a0BtCA9wA192yBNySMd06oXmedT951ZwwbeTHzI9yvu12R1TZd9j11EUQ+YRWNh
	rKs/JqHCfFJzog1pJiPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os51t-00GCYY-8X; Mon, 07 Nov 2022 16:31:21 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os4rG-00G7cM-P4
	for linux-mtd@lists.infradead.org; Mon, 07 Nov 2022 16:20:24 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 249D440004;
	Mon,  7 Nov 2022 16:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667838018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s7aszBHSBcyAAcN1a1kUyOs2oLb5S8ndGC4JnlHsv6s=;
	b=LN5GHOM6hCsnQF5f0WpLlSr8Q/NAsCzFHUFIWhkz3XhV2Sb8gfMQcMl3Nuxwb182idYH1H
	ilzNcX1WmdMjYorN4g+3NLbAdXELBAWhVCiWp/uC/p2xrd5xKEdsCtXv1m10HCdTwa1w0q
	fYkIRmkYaTcRX1oE2/jDpDq03wZZktEQjJZcBiC8JhpZkrUTCg+uSZMOLfkBLEXUFlFg3I
	1I9Wxwp6oWMK873joZVvpdnmujq5BId5MctWeBXW17u4Ha+RtqOj9a3TfW5oH6AJEL35kZ
	wqgeXIIoPTugVW9pHER02B43B9kXOQxbVHCfFMP8gCh26AfbAMdwgs4qvnXgeA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jilin Yuan <yuanjilin@cdjrlc.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: inftlcore: fix repeated words in comments
Date: Mon,  7 Nov 2022 17:20:16 +0100
Message-Id: <20221107162016.48949-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028134036.63000-1-yuanjilin@cdjrlc.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'077dc37db1e1da1f0e6a745328e4caa6d414e501'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_082022_974911_0EEB4118 
X-CRM114-Status: UNSURE (   4.97  )
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

On Fri, 2022-10-28 at 13:40:36 UTC, Jilin Yuan wrote:
> Delete the redundant word 'it'.
> 
> Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
