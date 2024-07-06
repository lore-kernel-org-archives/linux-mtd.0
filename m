Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD5FC2BD09
	for <linux-mtd@archiver.kernel.org>; Sat,  6 Jul 2024 23:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4kHdkiK1L3n552kIp+uMZeJpuHQ+DVT2sZUS6mQMQE=; b=GbUtyRAA9BXNie
	b9XcZBTxJHXrx27R7Bcal0QnRNUDo9SJM1wdEshTADcdlXYrKaFBWoWXfikEwXPvRYP5uCY06F9GA
	xFgw8msiQ7blnIODdMrO3PGuabSuSHCR5j2WnfzxQtFkpoF4hvrU6IrnxlybgckaluNfQ9XhsdsFr
	2Z5y72hQ/+Fd9dnpbCpMmS0qnId3/8MFWSimlzEhufu42zBeJyhvA96XR9iFZ0HJkeL90Gwiaw/zc
	1y5efl+5zgA9OewrG2XOLyMrYQVFFjXMaiMxvZvA2/KYMuS0RXa70WC6yZVPDHgLFu1kxlwo2J7hG
	iT8R0Hg2/5zzry9qkfXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQEan-000000011GH-0V3L;
	Sat, 06 Jul 2024 23:13:21 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQEaV-000000011Bg-1pIp;
	Sat, 06 Jul 2024 23:13:05 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGmPy3kcNz4wbp;
	Sun,  7 Jul 2024 09:12:54 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Krzysztof Kozlowski <krzk@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Esben Haabendal <esben@geanix.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240530-fsl-ifc-config-v3-0-1fd2c3d233dd@geanix.com>
References: <20240530-fsl-ifc-config-v3-0-1fd2c3d233dd@geanix.com>
Subject: Re: [PATCH v3 0/3] memory: fsl_ifc: Make FSL_IFC config visible and selectable
Message-Id: <172030740436.964765.1139338200184408064.b4-ty@ellerman.id.au>
Date: Sun, 07 Jul 2024 09:10:04 +1000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_161303_802852_11BA11EA 
X-CRM114-Status: UNSURE (   9.11  )
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

On Thu, 30 May 2024 16:46:35 +0200, Esben Haabendal wrote:
> While use of fsl_ifc driver with NAND flash is fine, as the fsl_ifc_nand
> driver selects FSL_IFC automatically, we need the CONFIG_FSL_IFC option to
> be selectable for platforms using fsl_ifc with NOR flash.
> 
> Fixes: ea0c0ad6b6eb ("memory: Enable compile testing for most of the drivers")
> 
> Changes in v3:
> - Refresh arm64 defconfig.
> - Link to v2: https://lore.kernel.org/r/20240528-fsl-ifc-config-v2-0-5fd7be76650d@geanix.com
> 
> [...]

Patch 2 applied to powerpc/next.

[2/3] powerpc/configs: Update defconfig with now user-visible CONFIG_FSL_IFC
      https://git.kernel.org/powerpc/c/45547a0a93d85f704b49788cde2e1d9ab9cd363b

cheers

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
