Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC38D0E6DD
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 10:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ieDX0JLKxgRDemJtxmxzP5tEwTS9OQ6d7Y6V91pJhj8=; b=EghzCFQgouxVZa
	hVMwsAnznBz/MhViIBNRv99pudsivw6amYTm0klFnADFIWwVBsNZmgSa3/TmTKfnCbw+NIkhoraoe
	SJk9X3dLZgkA8SFPaFywjBuqEP9T9ax5XLSxxlp6km5Peir0DSgEJdDawizzslRX0HIxixSAA7uH4
	8qqQlc4FOZfvwKtIfLl+8GFPUNaJ2A+9ZmVHKpRLs9Q3uNnPe8+TmxCX7DkrLt5xNg++bNf2RA3tl
	A8fupYE7n7EHVe0ln4xH68fQLYV/z21XasOcXl6SgvDyKFPrxGeiiwSnLgxl+rE6AJ2/q+Z1WAHH4
	9UkAvJd09wKJ17pAPu4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pNq-00000006qPj-3saW;
	Mon, 21 Oct 2024 10:11:30 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pFc-00000006ny0-1iiR
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 10:03:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6CFE44000D;
	Mon, 21 Oct 2024 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729504977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/Z7LMGBWhPJBX2owJcmglUZqQmujG30H22J2lE8Va2o=;
	b=Rzl7uZx4n17mrB8YbNAkedzOl95YVZ852GbZNLoNSelfrzio7jdJmoVg69fonJxLwvPAam
	GWxIlHwdmJ7V185ww/943+08MmbLkk/sTHry+9mZRhuGmK76PcqHYb67QzBDkYES2NPsH1
	RHxMZQtCSRKaDdt4b84DOOY2QM7X9BNw+0E45BbSmgQQrihxqEbGBne7yjhYph05LVvg9O
	Hogx9eV6XsHlkM9nFsqZJde6/ikmP1S5cS/UMLdlSgCEYklrinikiHfkNnGmcNoyeByRCe
	H3+kadchlkNohyeqqIwhGJ5TYnbZ5TDKQmC0+9OhSfMXln/XaugZbMteougpEw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux@treblig.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH] mtd: rawnand: atmel: Fix possible memory leak
Date: Mon, 21 Oct 2024 12:02:55 +0200
Message-ID: <20241021100255.173515-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001203149.387655-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'6d734f1bfc336aaea91313a5632f2f197608fadd'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030300_649842_9AEBF260 
X-CRM114-Status: UNSURE (   8.84  )
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

On Tue, 2024-10-01 at 20:31:49 UTC, Miquel Raynal wrote:
> The pmecc "user" structure is allocated in atmel_pmecc_create_user() and
> was supposed to be freed with atmel_pmecc_destroy_user(), but this other
> helper is never called. One solution would be to find the proper
> location to call the destructor, but the trend today is to switch to
> device managed allocations, which in this case fits pretty well.
> 
> Replace kzalloc() by devm_kzalloc() and drop the destructor entirely.
> 
> Reported-by: "Dr. David Alan Gilbert" <linux@treblig.org>
> Closes: https://lore.kernel.org/all/ZvmIvRJCf6VhHvpo@gallifrey/
> Fixes: f88fc122cc34 ("mtd: nand: Cleanup/rework the atmel_nand driver")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
