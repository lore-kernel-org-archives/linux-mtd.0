Return-Path: <SRS0=mdPP=EZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54DD7C56201
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:09:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C09A922255
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2020 21:09:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0CRi6Zwx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C09A922255
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OC4p4YhWl/mmb4sqZ0cu+c+OovBuBor6GhNSrcMrdtg=; b=0CRi6Zwxsx+qcooiCgUMIC9qE
	64qFtEFvEk1XRdX/6hleOm4sbgO1JAQo2clcxM89spkeqWuBHBfbYC1H9eioZ9L2+Yk8RbW2Bpu46
	8GFXlSugqxXvHbRbVexcNYTSAlXlysHBVioOFQDv6uny7IiAqMjCuHCqlBnw/ufa+fLPKPvcBugPL
	sXNl8HPlNLXBnKU+eKSdsn5+lvDvTtn7KLtH7su3w3IwdQ9LN4pX04l/Idmsem4VfvKjMLFvqVVSW
	WN0XUFNv34avrEhG5q3lmclPEUUcwPT2Jg1oKdfXg+wZa8VuN5sku0P4eOt6UcYSmoGLME1QoOYHz
	tIT29ti3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfrAB-000254-JA; Thu, 19 Nov 2020 21:08:19 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfr9k-0001sq-14
 for linux-mtd@lists.infradead.org; Thu, 19 Nov 2020 21:07:53 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 2816EE0006;
 Thu, 19 Nov 2020 21:07:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 19/23] mtd: rawnand: omap2: Fix a bunch of kernel-doc
 misdemeanours
Date: Thu, 19 Nov 2020 22:07:49 +0100
Message-Id: <20201119210749.25398-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201109182206.3037326-20-lee.jones@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: cd4c4f41a70354bc690c67b28e0688debd1aaaf1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_160752_202974_82AC12A6 
X-CRM114-Status: UNSURE (   8.21  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Jian Zhang <jzhang@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-11-09 at 18:22:02 UTC, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/mtd/nand/raw/omap2.c:191: warning: Function parameter or member 'info' not described in 'omap_prefetch_enable'
>  drivers/mtd/nand/raw/omap2.c:221: warning: Function parameter or member 'cs' not described in 'omap_prefetch_reset'
>  drivers/mtd/nand/raw/omap2.c:221: warning: Function parameter or member 'info' not described in 'omap_prefetch_reset'
>  drivers/mtd/nand/raw/omap2.c:946: warning: Function parameter or member 'chip' not described in 'omap_enable_hwecc'
>  drivers/mtd/nand/raw/omap2.c:946: warning: Excess function parameter 'mtd' description in 'omap_enable_hwecc'
>  drivers/mtd/nand/raw/omap2.c:1017: warning: Function parameter or member 'chip' not described in 'omap_dev_ready'
>  drivers/mtd/nand/raw/omap2.c:1017: warning: Excess function parameter 'mtd' description in 'omap_dev_ready'
>  drivers/mtd/nand/raw/omap2.c:1036: warning: Function parameter or member 'chip' not described in 'omap_enable_hwecc_bch'
>  drivers/mtd/nand/raw/omap2.c:1036: warning: Excess function parameter 'mtd' description in 'omap_enable_hwecc_bch'
>  drivers/mtd/nand/raw/omap2.c:1142: warning: Function parameter or member 'ecc_calc' not described in '_omap_calculate_ecc_bch'
>  drivers/mtd/nand/raw/omap2.c:1142: warning: Excess function parameter 'ecc_code' description in '_omap_calculate_ecc_bch'
>  drivers/mtd/nand/raw/omap2.c:1270: warning: Function parameter or member 'ecc_calc' not described in 'omap_calculate_ecc_bch_sw'
>  drivers/mtd/nand/raw/omap2.c:1270: warning: Excess function parameter 'ecc_code' description in 'omap_calculate_ecc_bch_sw'
>  drivers/mtd/nand/raw/omap2.c:1284: warning: Function parameter or member 'ecc_calc' not described in 'omap_calculate_ecc_bch_multi'
>  drivers/mtd/nand/raw/omap2.c:1284: warning: Excess function parameter 'ecc_code' description in 'omap_calculate_ecc_bch_multi'
>  drivers/mtd/nand/raw/omap2.c:1681: warning: Function parameter or member 'info' not described in 'is_elm_present'
>  drivers/mtd/nand/raw/omap2.c:1681: warning: Function parameter or member 'elm_node' not described in 'is_elm_present'
>  drivers/mtd/nand/raw/omap2.c:1681: warning: Excess function parameter 'omap_nand_info' description in 'is_elm_present'
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Jian Zhang <jzhang@ti.com>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
