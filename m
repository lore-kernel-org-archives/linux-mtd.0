Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319BDC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kNDjrSzweI3/vMbYsTLQCMngUMdsBbj+4sAD5WjC+ak=; b=czTsO2J3lqBA29
	htt/pksmGDZpGfUTWDqWp5lSINCPie3E1zHo1BNWeb+iHI9eo8sG9I3Nd22Z1YqItuwRKrWaLzcP6
	G0BOspZh57Kos2SWsxU7cq2Kho1iwVYPCClEj6IwVVr/tpZaZodcikCRG9HcRZVGJa+TxpeBpyRED
	4+sAIoXmlUI5K9/WVeLRdfj1XBdNO64Dg8Ggv/0E4O0iNu146ekL55olxLaMxgb/LEMqkphxq66fG
	WlKAw7fg8NkuFtEDBK6PbtQfg1k4MslUMnc30nBp6OT8YlNvnOrKRLhscDOQ43CdObNhgd3pF0PhE
	+f98xlxEvtyAMTxEsgHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiWu-004ge7-0Y; Tue, 18 Oct 2022 09:04:56 +0000
Received: from relay10.mail.gandi.net ([2001:4b98:dc4:8::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiWQ-004gEO-8E
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:04:27 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3E4EB240007;
	Tue, 18 Oct 2022 09:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1666083863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fcNEHm3uRroE+9KMi+2SaJ1+7JpYDEKgO9FYj1dRJ1A=;
	b=CQf0pO15PlAwGKEVET3hbZBNhHeRQXs5H9L5mvp7Tp/OnwotdCGRRz7G3kIh6ixxKoIwlB
	/ABGYGYWZW6X1mbBYD7nw2yuE7531sc1mojak+ZoLM5zQoTnbXHx0LkLqxSvYibdRe42/d
	truulu45a51o24pPGVc4fX8hqSi04wgEHhCCjuny2AptkxaSybCMRVzoYn6oYgUdq1qWqg
	JoLTARSTRcYkQ122G5G6MhInwQ6fwjYGCBaY2BEhIDTh97N46ZCjHPELZMeEAoq4zPV0bQ
	bmpektX/8QIIFDDFhVagepIJfZrADB+pA7CkYIxncv7qvi0Mj2+KYgPu8E4D4w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: rawnand: lpc32xx_mlc: switch to using gpiod API
Date: Tue, 18 Oct 2022 11:04:22 +0200
Message-Id: <20221018090422.466352-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928230019.2140896-1-dmitry.torokhov@gmail.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'782e32a990d9d7029a8400f09a4d02b1ba78cb77'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_020426_475178_AAF8981A 
X-CRM114-Status: UNSURE (   6.76  )
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

On Wed, 2022-09-28 at 23:00:18 UTC, Dmitry Torokhov wrote:
> This switches the driver from legacy gpio API to a newer gpiod API.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
