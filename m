Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EA4CC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:48:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35D00610E9
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 18:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 35D00610E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6tl4XQn89u71FmG6bcox16tqxa+p1k4ZQ+OeQkTaLGs=; b=FOV8v4/PLXteng
	CUzRVKKWW0E33en7tuqnwyg0nCut/af0bm6EcQtg2+cNebm6JlyBwznbroYm1US+zuQRCD2fv5sfM
	/o72Lx/RnnhtC2hibAXpSnn1Bd2uyQmUglMtYOwKrFB7cCP7aetbI28jIYpxfusGQssDcsL8YhNHg
	EKVKyES+sVOZN/TnY6xRNzws5n8aK0vkb99D0SYOuVHaZvY/2b9rqfvJOJahTJSClKLxWV/3PoMaR
	LHiMojNqCERqzK9VHFg2gyJ9K9k7QWZUdzQGu6IXj/MXl7EGnaffa91BSlZQYDkwTxgSUvqp2i49x
	UTejALgK/7MFqzo3WTEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo8ve-00BLOD-7k; Fri, 19 Nov 2021 18:48:06 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo8mb-00BJLJ-TV
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 18:38:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id BAFB81C0007;
 Fri, 19 Nov 2021 18:38:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 2/4] mtd: rawnand: Fix nand_choose_best_timings() on
 unsupported interface
Date: Fri, 19 Nov 2021 19:38:43 +0100
Message-Id: <20211119183843.1402825-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211119150316.43080-3-herve.codina@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'ffb753f0b4bb685834ac42e94d028cfe63ecb200'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_103846_117805_D183706D 
X-CRM114-Status: GOOD (  13.11  )
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

On Fri, 2021-11-19 at 15:03:14 UTC, Herve Codina wrote:
> When the NV-DDR interface is not supported by the NAND chip,
> the value of onfi->nvddr_timing_modes is 0. In this case,
> the best_mode variable value in nand_choose_best_nvddr_timings()
> is -1. The last for-loop is skipped and the function returns an
> uninitialized value.
> If this returned value is 0, the nand_choose_best_sdr_timings()
> is not executed and no 'best timing' are set. This leads the host
> controller and the NAND chip working at default mode 0 timing
> even if a better timing can be used.
> 
> Fix this uninitialized returned value.
> 
> nand_choose_best_sdr_timings() is pretty similar to
> nand_choose_best_nvddr_timings(). Even if onfi->sdr_timing_modes
> should never be seen as 0, nand_choose_best_sdr_timings() returned
> value is fixed.
> 
> Fixes: a9ecc8c814e9 ("mtd: rawnand: Choose the best timings, NV-DDR included")
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
