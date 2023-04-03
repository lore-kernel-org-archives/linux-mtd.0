Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39F4FC76196
	for <linux-mtd@archiver.kernel.org>; Mon,  3 Apr 2023 17:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o0CoLivQFbFL6L23LBrzWkfE0Hu/TjXNY5JMFL07NAY=; b=1K/WdhLQMfkqu8
	+L14ZpXtro5k8ag/uinWWFmymDSTGKcjvW23rlTAlQIpWB2mFeUu3167z/djp8+2iRjg9uo+4vtdr
	JOJaOs/ThpqMi8T18c4OFFN5ZcSivNd4v9gUzT86e1U9ytMZVkcVmXTSDN1zrTDT/iZH2Sz23IFT2
	5ZicYTmj/kf/sJMAaYXryOS4s6rwWOf85CLLOZyvcE41hRxCGhlIfPzqfDonbv4eHSrhbn2t+9Lpe
	VRpcZOjc4yxwKjZowIUQJpeSX2x58gmyb4Aq52LxUDXSeo5mICvsFIPNr2EvTkRBqC6xH5O80cxEF
	1ft6y4wVgthIP/qbgkjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjNXr-00G1tf-2x;
	Mon, 03 Apr 2023 17:00:39 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjMam-00FtkK-2o
	for linux-mtd@lists.infradead.org;
	Mon, 03 Apr 2023 15:59:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6CAD2FF808;
	Mon,  3 Apr 2023 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680537573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZxzAESz2itDatQ0g4Gg/O8O4nZ6xBxSu0J0zCMfdfVI=;
	b=UEulIjSPWvrG4xKO+EsYpQG7wm/RETkk/NF4U9FqG5BeatPS1smcKB4ReIS4Cr80SuJsQz
	jQsNlPtcEnHgZKp/eQjpEdJdX6R/1x3Gq93kD9xPuGoUelcom2n9nsh3R6dvfrb3YJULNA
	L39IunvtJK2lKoqJe48mv6X1k7Orwh/WOlHi8LwNMjwBHIcfiLifNOoznjWsmQD62r8wV0
	XYOidDqFnvIZtubqH0TjsGAkCaFkXSssElf2WHGdm+R5pyWouLJyCppYi/4tGF4GZcxMUR
	mlkqIFQCMdecXXOxbW1ecIDMjubAIChU3DfbsbJrZbb2fZImxD+J7NJEx38DYQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Christophe Kerello <christophe.kerello@foss.st.com>,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	stable@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH v3 1/2] mtd: rawnand: stm32_fmc2: remove unsupported EDO mode
Date: Mon,  3 Apr 2023 17:59:29 +0200
Message-Id: <20230403155929.137657-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230328155819.225521-2-christophe.kerello@foss.st.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'f71e0e329c152c7f11ddfd97ffc62aba152fad3f'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_085937_037768_C4648394 
X-CRM114-Status: UNSURE (   6.00  )
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

On Tue, 2023-03-28 at 15:58:18 UTC, Christophe Kerello wrote:
> Remove the EDO mode support from as the FMC2 controller does not
> support the feature.
> 
> Signed-off-by: Christophe Kerello <christophe.kerello@foss.st.com>
> Fixes: 2cd457f328c1 ("mtd: rawnand: stm32_fmc2: add STM32 FMC2 NAND flash controller driver")
> Cc: stable@vger.kernel.org #v5.4+
> Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git mtd/fixes, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
