Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7EA9C46467
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jan 2023 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9SkAcINZNvDtptcF/ZlrYNzODwqYrpQg7ds0q+sPkLs=; b=dYEunDOHFzJ4zc
	WHbj/mMG3rvMSBSKa3nxKIPjGZCWVGAObRG2SXprGfdxBEKw6vx5lfBxJZa1tWN4Twn3OoIemx8ix
	uIsu06lFZVT9fzZTuS1XLo1CbAGTlPmlXvHSbjBSsLRfUv72MwYo+G3bNV1BCSbPlrKOIF3/y83gx
	8Hcua0KfLffB+kvoGynclgQeOmBxlhrBaUmTNg9pv+y2OB8LsCx8C1QF/ZDYuGfUub2bOcjo/S3qo
	e3gduNakhrVZqMiqNRv7UQZwM/Gn5fZ/fv3EIgTyObL4c4a6Tc/AzpVeL1bO8Oc++RIPh7nSNSEai
	FJt0O4WJlI5fzBQUiePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIry-00AjiP-OO; Mon, 02 Jan 2023 11:20:42 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCIpD-00AioN-2u
	for linux-mtd@lists.infradead.org; Mon, 02 Jan 2023 11:17:53 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 995FA60004;
	Mon,  2 Jan 2023 11:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672658266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W6T2sQS44dBUNM93b9fQFIczRIJJEYUNJHmnnsl6D5E=;
	b=HGtArmvq05UNgt+o8sDXpBbfQz519WsNt5UZ7QLfVKdVJMOqAX7n269LD+nPvjCJDT4EJg
	IsVoCgE0RdZco0Km9EH+DdwCKdUZei+dySEKX22Xo2KaHfgHd1uIXcHIjyh7RTnoYxF/UB
	Cpy0HT6VxgmYOZlYGAxrnrA3fXuRkU+xPF6l/7Io+UgKXvMAgdPVTldIk7q2UObMbq0aUc
	41EBAmEsvNDjFEdmU55tjyPn+yY2/R4jsq29WfCjhbFVsHaFbRAGWJ7Z0pbQVG0BMWyZoM
	1y/YpSo2zujrLeZonoQdGJ+PrN1vpbUfoMPtcESFKXgKMLHVYIAtvdLER+qnvQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yuan Can <yuancan@huawei.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	rafal@milecki.pl,
	error27@gmail.com,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 RESEND] mtd: parsers: Fix potential memory leak in mtd_parser_tplink_safeloader_parse()
Date: Mon,  2 Jan 2023 12:17:44 +0100
Message-Id: <20230102111744.85825-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221208113620.78855-1-yuancan@huawei.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'7adde5ac25fa50dbb1fb237042316685cafe976c'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_031751_292512_EE2AE56F 
X-CRM114-Status: UNSURE (   6.35  )
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

On Thu, 2022-12-08 at 11:36:20 UTC, Yuan Can wrote:
> The parts needs to be freed with all its elements, otherwise it will be
> leaked.
> 
> Fixes: 00a3588084be ("mtd: parsers: add TP-Link SafeLoader partitions table parser")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> Reviewed-by: Dan Carpenter <error27@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
