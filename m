Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40B16C41513
	for <linux-mtd@archiver.kernel.org>; Mon, 27 May 2024 12:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dgm1+L1/FM8qLf2VI9vA6WigwGmFQpSAkXD7HirV0gI=; b=XEbmSuZlicqaXF
	U2lXpLhg+2du4naJJels4bwaAZgeRMP/GpK+p3Fr4zHr0/neRB/my/eQUv9pJnWCFA+HHNXjCpyX7
	t7kM/+9gTduaJoR0mTKKC4O2ABiD89vu2lpN5lqZQKdp2eom//zUL0erqeeQYW0BV1L689fIwyArY
	iv2j8bl1hQaFuktwZeIkBAk9ExY89XchaDPSaVBr0bC/h/IhsYoEKHwLv7/so1eCwSlg9WES7FlEF
	UkqNBD4PqKY1ewZY4qo6NGljtzF46UKA+m987OP/5wA671wGa486bn6Cyi8emBHF8lzQ5cSt4x6iD
	TmlRM96Tj0KY1JE3bKOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZFo-0000000EoV4-2EQf;
	Mon, 27 May 2024 12:15:04 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBZFl-0000000EoSk-0vOj
	for linux-mtd@lists.infradead.org;
	Mon, 27 May 2024 12:15:03 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7915460007;
	Mon, 27 May 2024 12:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716812098;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDTmRRXuN9QOiag5lhJ8j7FE52vEtHWkBxLBSHfYwSI=;
	b=Q3sP9eQCk5J3Pk72WWYPhS9H5SoRZJzfNYMhb27TjZLeklmSPTCpueTwgty/SQWxPpcVJK
	9VpxeZYLgvXfMhTpz4g1GZIPvEAaXiXuUEsx2IVEBaH1KrweTb2kiqy3AU/oX4QINk4vIM
	t3dEummnMtRLAUXaZfVmEHC1Ud1Boc91Qex9BYr05hxWIyhxeSngV7gbApTIGCX1Zr5lgr
	icZ+lo+/RIP3huDLHgEDrdqQ0h/MIE41Kl3IBvR3L5dwDCaAsJUomhuiPwk6JnYN9pKHua
	Yc2R6jLGQbbE59HAavlTAu6U+4LDWR2h0s7TbRnj3oRsVH5vDxvd5gLGEicE9A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Alexander Dahl <ada@thorsis.com>,
	Steven Seeger <steven.seeger@flightsystems.net>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: Bypass a couple of sanity checks during NAND identification
Date: Mon, 27 May 2024 14:14:56 +0200
Message-Id: <20240527121456.29738-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240516131320.579822-3-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'8754d9835683e8fab9a8305acdb38a3aeb9d20bd'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_051501_409771_0AEB7657 
X-CRM114-Status: GOOD (  13.98  )
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

On Thu, 2024-05-16 at 13:13:20 UTC, Miquel Raynal wrote:
> Early during NAND identification, mtd_info fields have not yet been
> initialized (namely, writesize and oobsize) and thus cannot be used for
> sanity checks yet. Of course if there is a misuse of
> nand_change_read_column_op() so early we won't be warned, but there is
> anyway no actual check to perform at this stage as we do not yet know
> the NAND geometry.
> 
> So, if the fields are empty, especially mtd->writesize which is *always*
> set quite rapidly after identification, let's skip the sanity checks.
> 
> nand_change_read_column_op() is subject to be used early for ONFI/JEDEC
> identification in the very unlikely case of:
> - bitflips appearing in the parameter page,
> - the controller driver not supporting simple DATA_IN cycles.
> 
> As nand_change_read_column_op() uses nand_fill_column_cycles() the logic
> explaind above also applies in this secondary helper.
> 
> Fixes: c27842e7e11f ("mtd: rawnand: onfi: Adapt the parameter page read to constraint controllers")
> Fixes: daca31765e8b ("mtd: rawnand: jedec: Adapt the parameter page read to constraint controllers")
> Cc: stable@vger.kernel.org
> Reported-by: Alexander Dahl <ada@thorsis.com>
> Closes: https://lore.kernel.org/linux-mtd/20240306-shaky-bunion-d28b65ea97d7@thorsis.com/
> Reported-by: Steven Seeger <steven.seeger@flightsystems.net>
> Closes: https://lore.kernel.org/linux-mtd/DM6PR05MB4506554457CF95191A670BDEF7062@DM6PR05MB4506.namprd05.prod.outlook.com/
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Sascha Hauer <s.hauer@pengutronix.de>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
