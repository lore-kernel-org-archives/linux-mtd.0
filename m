Return-Path: <SRS0=LIJd=PD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8825DC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:57:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C21B61040
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Oct 2021 10:57:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C21B61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MzGI+SV7KEgURW5+Gv1So9h2teiFnrIwIgRgtVRQ83A=; b=T+yVfH21syDlZI
	oauA/RkBTB26+AWgsqzpEqVfaXStQKzW15CboP1+QEc6j2//0D+o0bMC5e/EPdxUYftnqF6TdS+Rz
	y/NmQlmKtmXsdkkJpaG154jGqq6GCSRRlZ04iVeq0aAE7Ikv6WD47uDISaNyG+V80WgavZFY9+L73
	9fmqJKWO2Ez4RU0XP/v1kUZ17UGedu8k2vOhgEEMSsAsreL1fikF7PwKpu83tR2T4PjASdNsTu9zC
	NDx96YEfSD8rO+llnzIW0m5h43r55mhzgg5j68JFlhhzMwkUfdeC2HayAf8Q97AQQf2QcSMY1eEFn
	eZlQ1+xlgwbJC7PIX0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbKt8-006asB-Kp; Fri, 15 Oct 2021 10:56:34 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbKWA-006V0r-Qp; Fri, 15 Oct 2021 10:32:52 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 48FEA240007;
 Fri, 15 Oct 2021 10:32:45 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 7/8] Revert "mtd: rawnand: lpc32xx_slc: Fix external use
 of SW Hamming ECC helper"
Date: Fri, 15 Oct 2021 12:32:44 +0200
Message-Id: <20211015103244.950026-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210928221507.199198-8-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'fe972c458fc561113671dde6bd10198cc7719910'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_033251_048957_F8173A91 
X-CRM114-Status: GOOD (  19.72  )
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

On Tue, 2021-09-28 at 22:15:06 UTC, Miquel Raynal wrote:
> This reverts commit c4b7d7c480d607e4f52d310d9d16b194868d0917.
> 
> Before the introduction of the ECC framework infrastructure, many
> drivers used the ->calculate/correct() Hamming helpers directly. The
> point of this framework was to avoid this kind of hackish calls and use a
> proper and generic API but it is true that in certain cases, drivers
> still need to use these helpers in order to do ECC computations on
> behalf of their limited hardware.
> 
> Right after the introduction of the ECC engine core introduction, it was
> spotted that it was not possible to use the shiny rawnand software ECC
> helpers so easily because an ECC engine object should have been
> allocated and initialized first. While this works well in most cases,
> for these drivers just leveraging the power of a single helper in
> conjunction with some pretty old and limited hardware, it did not fit.
> 
> The idea back then was to declare intermediate helpers which would make
> use of the exported software ECC engine bare functions while keeping the
> rawnand layer compatibility. As there was already functions with the
> rawnand_sw_hamming_ prefix it was decided to declare new local helpers
> for this purpose in each driver needing one.
> 
> Besides being far from optimal, this design choice was blamed by Linus
> when he pulled the "fixes" pull request [1] so that is why now it is
> time to clean this mess up.
> 
> The implementation of the rawnand_ecc_sw_* helpers has now been enhanced
> to support both cases, when the ECC object is instantiated and when it is
> not. This way, we can still use the existing and exported rawnand
> helpers while avoiding the need for each driver to declare its own
> helper, thus this fix from [2] can now be safely reverted.
> 
> [1] https://lore.kernel.org/lkml/CAHk-=wh_ZHF685Fni8V9is17mj=pFisUaZ_0=gq6nbK+ZcyQmg@mail.gmail.com/
> [2] https://lore.kernel.org/linux-mtd/20210413161840.345208-1-miquel.raynal@bootlin.com
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
