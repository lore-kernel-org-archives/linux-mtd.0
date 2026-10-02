Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A771ACA5FD4
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Oct 2026 06:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5zYL/ZJivmST5IFJt1d6WGfTuPmE2ak4a8nNTy9CgZk=; b=1OaeaCyTcz4cNT+Lud0+wabpoh
	DK7AGZwm+qMr+1Z2Ckfrp9Huij/CD9h9wRbPrnO+5mtbnRHlFK855CMlXm8uB0T6JDv/k57CgmC54
	fUKNxQkedF0v3LAwmPExiAoMPdjwuIT7mucE06zxibFPEG6SB9A7GGZKAa0WxfFETXpiuruVnB+ls
	8G9CVX13XiyVLYn09ELsO14nNOdCbx21RNaTmLj9y/KMrQgP4HOmpgVrgFLR4+cGyD/ulrvqOiJ+5
	EOqN8scoc5yOUGKLkD8mUg0mrx9a4DDVonPEm8+NFSJCgulv2orDepn5O0qj+lpMQdzHXSZjFRII7
	KwXY+1wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCX5I-0000000AkNU-3uCK;
	Fri, 02 Oct 2026 06:49:32 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCX5F-0000000AkN9-004q
	for linux-mtd@lists.infradead.org;
	Fri, 02 Oct 2026 06:49:31 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1790923727; bh=wHuTCO3Jc8e6MPxkCVOYFT+
	fxRijmIByOGGlSNjEg4g=; b=HF5y9sLUwTHQhsdnolTtefKw1Zr51LcKQoFf4522gqzDAqn3xm
	jrd8u+ViU6afbTKAqbUlFpGgunxuKhmohBDg==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1790923727; bh=wHuTCO3Jc8e6MPxkCVOYFT+
	fxRijmIByOGGlSNjEg4g=; b=TVqZw9qfxzLON+ZTDG2s/RE0X4RroB1wP5TradoASdWUlw09Qv
	b8Oxh6ZMDHgbEpBtV6xEpFPNIxtDvI+IrIYKmWVbJlCJcHy5zF/FYjQFVE7J0rud/eSa58XNfF5
	nfKijqqZIhsjYvB+4yAjpT4ckz/onOMqYY7MnzkLJQRKyHyM0Hf5VGyml39HWtmNN4Xptjoxmu4
	7rCsYPmQlm/VvxJRVjQXNE6pAo0HIthcOjDELEdPKTZTxpmSCFA83XJdUFvoY+sf/mAFCpX4yjD
	FNPoPmjpHWtFHvmRNwy17mtWTSyMPSCz9PlhEUIZDNQM4fnGrPUm5paRYY4uZm897hA==;
From: "Richard Weinberger" <richard@nod.at>
To: "wang wei" <a929244872@163.com>, <sashiko-bot@kernel.org>,
 <bbrezillon@kernel.org>, <miquel.raynal@bootlin.com>,
 <sashiko-reviews@lists.linux.dev>, <vigneshr@ti.com>,
 <wenyou.yang@microchip.com>, <yamada.masahiro@socionext.com>
Cc: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 "wang wei" <a929244872@163.com>, <stable@vger.kernel.org>
Subject: =?us-ascii?Q?AW:_[PATCH_V3]_drivers/mtd:_rawnand:_nandsim:_Fix_st?=
 =?us-ascii?Q?ale_NAND=5FROW=5FADDR=5F3_with_overridesize?=
Message-ID: <muqlqvvu.895affce-ffa5-46d3-a538-b190525cab98@nod.at>
In-Reply-To: <20261002024709.16510-1-a929244872@163.com>
References: <20261002024709.16510-1-a929244872@163.com>
Date: Fri, 2 Oct 2026 06:48:47 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_234929_195590_E7AE724B 
X-CRM114-Status: UNSURE (   3.87  )
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

Am Fri, Oct 2, 2026, 04:47 schrieb wang wei <a929244872@163.com>:
> The overridesize module parameter changes the size of the simulated
> device after nand_scan() has completed. It updates nsmtd->size,

Do you actually use this feature?
I suggest just dropping it. It's horrible.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
