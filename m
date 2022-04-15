Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F2CC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 15 Apr 2022 06:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9tmdLwqOtBEyxYNm3+mxSizIyvx6vNMM1gZhopbKY7Y=; b=IQ80YBM67Pi5/m
	sgvetkeIiEbdjCPMVWAbh8fh5+xLOkPtSwDw2bWfStkhnQMSdP+1lSKbu4HOldI4UR972YDLo7xQc
	JI6grDf7ZcOQGdPvmYrAjjl/Tz2tMxZoOFT/za1WVAM9kZjHP2Lrf08xOWUXgmI1JjORF1XmaADFz
	a30POw2H36HVQfbFAekwWp3bhJic3AwNRWguIaTdOpCf1/Umr6OlUmaIZo2zFSqe8qEMbLj86KlBf
	uzKp6OXab+K9Xx7dBWpjFj1qFZIK/L/95k3uf2WE+1TU8112qwbr2ogvRnWJxK5s2V2LqnoQTfYmf
	x2dQb9JuX7IXBSlhSq5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfFlE-0096pe-8E; Fri, 15 Apr 2022 06:48:52 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfFlA-0096nw-Tx
 for linux-mtd@lists.infradead.org; Fri, 15 Apr 2022 06:48:50 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F3FAE1F47D9A;
 Fri, 15 Apr 2022 07:48:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650005324;
 bh=XzQWK68/dZeCa/nbUidr9XmW77fjBlg9fKK77YRt9bw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y50odSd+CkLjCRqX3DCAIsCG+FVEujjyOFfwTAp2yeIbsA5UML5ok536TC8CGe5Hm
 moEKM8NoHTGLR5rxX0IHz5NuTEh65uHj5Z8uzoWBwqVVIJB7SUqXuOJaV3gouJU/zF
 GDO4O5eM2bErYPBubluQb9TD+MUorjVCELo/qtCR3lJNA36cgUoNJRbnGeAO2Y1YGa
 9FsVI70v4bbMyDfxCVQOvIXzgUT4aqYJE68c4j5SIGz1DduoI8jYItiTMdslRrfh+T
 mAYuUc5jlUB504KKTuAIoBrhXZ96jFV64vbey7VPYhHxUgbvLQUFqTPUz0YfQRL88z
 oRZOsLnuo51ug==
Date: Fri, 15 Apr 2022 08:48:40 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Patrice Chotard
 <patrice.chotard@foss.st.com>, Christophe Kerello
 <christophe.kerello@foss.st.com>, Mark Brown <broonie@kernel.org>, Daniel
 Palmer <daniel@0x0f.com>, linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCH v2 2/3] mtd: spinand: add support for detection with
 param page
Message-ID: <20220415084840.72a2bc9a@collabora.com>
In-Reply-To: <20220415034844.1024538-3-gch981213@gmail.com>
References: <20220415034844.1024538-1-gch981213@gmail.com>
 <20220415034844.1024538-3-gch981213@gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_234849_402909_06A62A06 
X-CRM114-Status: UNSURE (   7.41  )
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

On Fri, 15 Apr 2022 11:48:43 +0800
Chuanhong Guo <gch981213@gmail.com> wrote:

> +#define SPINAND_IDR_EN BIT(6)

Looks like you're redefining CFG_OTP_ENABLE, why not use that
definition directly?

> +#define SPINAND_PARAM_PAGE 1
> +#define ONFI_PARAM_PAGES 3



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
