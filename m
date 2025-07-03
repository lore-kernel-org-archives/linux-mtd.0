Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4AAC77B7C
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Jul 2025 17:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6bpXAA359UG+cQGpt2bj2sx/sdD70hhyAA6BaIiE2iU=; b=Y1zrrRfCzTK5Ns
	hEvocuLw+exTHqe95MaMET3jNr1U35Ps3xBY1ZFZNYU25uUypJ+QsQ9pgp+IhZ2XuPDsTtImaeJ5k
	KS8fT7DBGiLwwM1FNl/p2WpDZRb/X12qsnrmj2dgXoc0+ZiBTqKcMMkooSwfgFEfJAGkM+wcxy8vi
	wBEkIQQmOBW1X7jSMmmW2zOcIcrPJM9hFLeCAeerEOMS91f5B2cQfGvBb4kVnFhInwTjDXjb+hd9D
	vOctX2VYbM/SeMKMDTZSsDhCHCU5e+ce2U/vgswLIvxZtmWTF2MCuPIvge0om5qpTO2AKSKsS0JxC
	PMP7T5uXHhetTcx11M3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNTZ-0000000C5bc-1bDc;
	Thu, 03 Jul 2025 17:11:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXL3B-0000000Bh0B-2OYk
	for linux-mtd@lists.infradead.org;
	Thu, 03 Jul 2025 14:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C47AC43B65;
	Thu,  3 Jul 2025 14:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4288FC4CEE3;
	Thu,  3 Jul 2025 14:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751553392;
	bh=nVETv5P+aZJXZMi/j9tZ4lMlgii5uB8/cLl650IqYz4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZX1gEZ2MfK1BlIWOgyLEvlzdfuO2erIRE46NeqJirWqY6OZzikE6lonT111+8HmaT
	 TCOwfMTmTOVW7Cjphh81nYEWjNn+hTkEYq93XWVE415vOdmboI1FpXLMoq6m3gfTU1
	 IXsqCPmx6xPRGRd1TeV0CsP03HXcmjxmmkHMxCOVSXoAfYBnY3GzDHthoKnub60/Kd
	 B6C+INru0iZXzK8g2SsLOsclpZeRr12Uw00vIgpT2UVIOIc8fPv2KFmxKYeN5D8p/T
	 rSGCcy3dmsa9Pd9Q3tP0P2gwCW2fRz4AFJU6swTckApFni+/Dk6TyBBuyTnnKEe+M9
	 5Yp+Kxet5QD/w==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  stable@vger.kernel.org,  Jean-Marc Ranger
 <jmranger@hotmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Fix spi_nor_try_unlock_all()
In-Reply-To: <20250701140426.2355182-1-mwalle@kernel.org>
References: <20250701140426.2355182-1-mwalle@kernel.org>
Date: Thu, 03 Jul 2025 16:36:30 +0200
Message-ID: <mafs0sejd1gup.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_073633_628687_51DB6644 
X-CRM114-Status: GOOD (  10.95  )
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

On Tue, Jul 01 2025, Michael Walle wrote:

> Commit ff67592cbdfc ("mtd: spi-nor: Introduce spi_nor_set_mtd_info()")
> moved all initialization of the mtd fields at the end of spi_nor_scan().
> Normally, the mtd info is only needed for the mtd ops on the device,
> with one exception: spi_nor_try_unlock_all(), which will also make use
> of the mtd->size parameter. With that commit, the size will always be
> zero because it is not initialized. Fix that by not using the size of
> the mtd_info struct, but use the size from struct spi_nor_flash_parameter.

I suppose some of this code would be cleaner if we declared a size
variable instead of typing out nor->params->size every time, but I don't
think it matters too much so this patch is fine too. Thanks for fixing
this!

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
