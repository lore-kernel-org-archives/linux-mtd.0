Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3861EE57DF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 15:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ParfYDzoyka92XAIwvx/Tpqgb8rNC8dmfLuwLkPpxPc=; b=b+HUAtza6O23W/
	ecS40PNEL4HYvRz1h32VyWw/NVoadbwDypO1TELd1gBYtTPps6AIG+DxZD2umrFNIwyNhPtkv0Se6
	CajWn3PzONWe/R1jNAv2xTTxjhYkOB32rpalBsJAbSOkso+DTcwxGnVVwLRDTzetlKNR86jX5GF8f
	GDBn0aPI+fdNYkanirLMpjA7pA/FBpVjMWRyApVnpyQrLRvp93IKjrogUzQ6ZrMykPUfNFI2BqaiI
	1SSVgakoxV8GEwa9scfng6sr7VVfyWQ0JvZJxrGuvN7hfxUeq9kR7xo9O69OOclEGMjX5fYJgPQEX
	2Oqo6iMz6ZDagkz3fiJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjFm-000wrJ-2f;
	Mon, 11 Sep 2023 15:55:10 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfjFf-000wpp-1F
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 15:55:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A924FE0024;
	Mon, 11 Sep 2023 15:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1694447700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O3vuoRl+RdDbBEa7LX1PCZn8k8YNFYHdyS3xcvL6/hc=;
	b=pac5vbNCQYaTKPxE9CPbhvhia1Soiv3q78u6+yPaTYWchzPOpNVMgS7kQSop/KUCWeu+Iy
	fQ+i/OGcHjSv4LjAAQzTxyGzOgz/S+t7cBiTlv5lJHtpsetw9iuBveWDxcdrvofBauHNW4
	Xc5SrPa9+3igfFDJn5hfn2e7GkZqrUxWZUY5CMv+QtZieyyQMsXSMW4yUm5iEmxPupGgdE
	Fq5X/qSZsuonfFZk1n+WLy4wDft5npUZuhvBVGxKytlDjYTx5PnVCGxow8MvK8k7q4R0dP
	liWFISOQnNsobKBCDb9RBNPkQgfyT9DV1rWabCCdDexfOOazHdm0BO2IaOu/2g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org,
	Aviram Dali <aviramd@marvell.com>
Subject: Re: [PATCH 1/3] mtd: rawnand: marvell: Ensure program page operations are successful
Date: Mon, 11 Sep 2023 17:53:53 +0200
Message-Id: <20230911155353.611221-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230717194221.229778-1-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'3e01d5254698ea3d18e09d96b974c762328352cd'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_085503_563841_64C53011 
X-CRM114-Status: GOOD (  13.20  )
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

On Mon, 2023-07-17 at 19:42:19 UTC, Miquel Raynal wrote:
> The NAND core complies with the ONFI specification, which itself
> mentions that after any program or erase operation, a status check
> should be performed to see whether the operation was finished *and*
> successful.
> 
> The NAND core offers helpers to finish a page write (sending the
> "PAGE PROG" command, waiting for the NAND chip to be ready again, and
> checking the operation status). But in some cases, advanced controller
> drivers might want to optimize this and craft their own page write
> helper to leverage additional hardware capabilities, thus not always
> using the core facilities.
> 
> Some drivers, like this one, do not use the core helper to finish a page
> write because the final cycles are automatically managed by the
> hardware. In this case, the additional care must be taken to manually
> perform the final status check.
> 
> Let's read the NAND chip status at the end of the page write helper and
> return -EIO upon error.
> 
> Cc: stable@vger.kernel.org
> Fixes: 02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
> Reported-by: Aviram Dali <aviramd@marvell.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Ravi Chandra Minnikanti <rminnikanti@marvell.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
