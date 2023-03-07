Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A6DAC678D4
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 19:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkLPHGKHS560s0/nbXNetgKZmkI9oWsm63YAh9rCZdY=; b=Z7DCXJSdU84W/F
	kQIHng70HAO0sNrI0cf6WlvG97567LKvZirMnny5JXrjbXSp8lw9J92y5NNCiwNN+tk58E2UDE2de
	cabCN0ZaFOCMOUuSGD3YsT4Pf6FHrOFM/bEVB645jst++0d7hlOfTLC++u2EgeWgw2RENDEY3ADwZ
	7lmgp8BkvJzjxN8FwDyiKGdL2u+z+exE4760F79dfgGzAuILGgo5AsDIW9NKzhA7CYNHDBYOw4ejB
	+szyAdXUbTR6GRY02998rK/auIw69u5/boE/+kRiDsq2y0BHsV/5t//YluvwX8UHS1AEn5hb04wHv
	83ZUJdNW1vPb4aTX6IyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcu7-002Dh4-91; Tue, 07 Mar 2023 19:23:19 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcu4-002DeK-1b
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 19:23:17 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 15D40FF802;
	Tue,  7 Mar 2023 19:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678216991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8BXOAdv3ZY1yqGvfT92jz/aIBRhNnHINlK7UC1NP5j4=;
	b=A8HDzBU4gWP65Mhb6DRDKH2HbXtHuinWkc/yI0gGFkZtjK/TDfkBWremqkgHUPrhr5Imvd
	YsEniQwg98YBSVZPLXOunq9dACVbWGLhsrsxIfuzz02AOakxTEXggwhtF8JG8gIOtT2ViY
	gxaElNaqxxGafaqpqohdl1sypnDqmaMdnkPIRPSAfAq76hdN3moBPum7azZrTQJMWUCDV4
	mBmcS5igjZv/wCcNgAwKAtnXb8KkL4FP8TG5KGi2wTAdWU0Xrjk0GypdFqpqnRv+RSFXT8
	6aQ26t8pxl3S3R1OO7GxZY69Sv7ay6CFIfYNUh7axwEG2CxuqyaeNplPl33sdg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] mtd: core: prepare mtd_otp_nvmem_add() to handle -EPROBE_DEFER
Date: Tue,  7 Mar 2023 20:23:07 +0100
Message-Id: <20230307192307.353572-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306125805.678668-4-michael@walle.cc>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'2e9d68641030c280f2132036d0fb089255e3862f'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_112316_239904_DE10CF6A 
X-CRM114-Status: UNSURE (   7.99  )
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

On Mon, 2023-03-06 at 12:58:05 UTC, Michael Walle wrote:
> NVMEM soon will get the ability for nvmem layouts and these might
> not be ready when nvmem_register() is called and thus it might
> return -EPROBE_DEFER. Don't print the error message in this case.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
