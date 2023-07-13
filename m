Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C995C001B0
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jul 2023 07:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCbgD86mgbMTUzT8tjj2iB2BVWWjyy7hNiQ3iNteYeE=; b=bXFENlG6jpGkxc
	UZ1MKmBXl4U4xnDwFBAyNzezcju2ne585IRPKYhEGe8cF2Nb6zJQKv1k/2pO8CB9LWYsrAZm/dg2k
	Ff2MK+5PuuPuMVM0vHb8iQ8qklZ2uTZomFqxwgEyiIrEAFaAHaA8IknpSM7bpVT/6OXOv5f6m52UK
	GbJgVWPEKrudNWDkCgtzK8AcpBLZl1jh07TVEuXc/WqgmA6D7KZihsoCx9+NvMvrYdg7LJi6Vbq7I
	L4wVMGle4uf2wbr86FfakTZdkFLEcPmCrYIblt5DNeNLEWkjsdhyGGNuQDIGJdqG0ixS0jGtG5aO+
	3wTpWde5Pf/f882/SXQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDI-002Jbl-0B;
	Thu, 13 Jul 2023 07:58:12 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJrDD-002JWV-0S
	for linux-mtd@lists.infradead.org;
	Thu, 13 Jul 2023 07:58:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 08B481BF20E;
	Thu, 13 Jul 2023 07:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689235083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KfWHzF/NZMw6pmpY4U5IE/NM90+HSQvQntRCvYUqciQ=;
	b=GWvBErsDArq/lV/aMaKNBtF9FS0hAxSGmq6VljY40dBVwasYi792ua+e7jxZR06dm8pimU
	1/coVv52t3D13cOCyCHN0SRJFi0HGlDc6do5hk1+HLLzaBkPZ/aO+rARMU+QZdTpFG6lOo
	UhetSdtlF4yQUx4GWaAr29M/SEWyKJQxZKtjwdNM14qEwSSQd3OFkeQjaiXb+ZBhSF2m+H
	Iz4yPpYAzpWZRL7zDJ6dWgIPhsmEH3TSwqRrJrFUBPAdabhmwPYKi8bK++YmFxKTf8pqc5
	V800U5pghPWm8AEpYTzbMTXqHKWhhb3HfZATfBnJcbgS1CWv/HmROmV+RU3ReA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yangtao Li <frank.li@vivo.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/18] mtd: rawnand: fsl_upm: Use devm_platform_get_and_ioremap_resource()
Date: Thu, 13 Jul 2023 09:58:02 +0200
Message-Id: <20230713075802.486192-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230707040622.78174-8-frank.li@vivo.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'892ad2638a6ba33c0b5afb335501b9bb7e8a83b6'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_005807_334150_873CDA2D 
X-CRM114-Status: UNSURE (   5.72  )
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

On Fri, 2023-07-07 at 04:06:12 UTC, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
