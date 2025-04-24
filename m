Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6457FC369AB
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Apr 2025 05:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=26mGeeAgsE915DeKI+xNlotfhbolOR8oiDaqmg3whz0=; b=aRVGrdHCadebb6
	9AoRRnmtcMjoizfq4tT5EgSDi0Ehqe+OatxdISxcqxQk/InKRMbZZm9hw/5Ggd8L35VUJOepCUWx4
	xHC6kEKUt4NMDS/SDSFntSscbl3a8vWQPYZs9dP997lxuQ5f8+MjOIepMmbixVIk/h4Tan9SWuBvs
	t63o9sWFcdJ/r75hCGpCsOvaAsZC5W92bvXiS1AhxNBH6UfoEwSWeY/+WM0S8rF9/pFd9sjSaBEey
	o4FC+4npOn2aRJzNOgc2DsZs4xdG1pR32vEPG9/6ET6w3fl5ODdlhvR88l4SeD6zQsMiv11JWNE/v
	PXqNcWCDY5y558peNjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pGf-0000000Ctmr-20Dg;
	Thu, 24 Apr 2025 05:37:01 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pGc-0000000Ctll-18GG
	for linux-mtd@lists.infradead.org;
	Thu, 24 Apr 2025 05:37:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7ED53A40FC4;
	Thu, 24 Apr 2025 05:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ADC2C4CEE3;
	Thu, 24 Apr 2025 05:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745473017;
	bh=ABXHbVwLQcuJdhcmr+KvmkNayeZgHJI6vYnH8pSInZk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ZdRnFw1U4X+JULTVPLk0DVyljEjUvmcT2ItgugX7qm9xS9sPYIz4gJdOBr554eALd
	 j+4av0+YaoM7oTlrpoMegQLy9/rsJQ4U3PW39VeCkAMYOZoW5Kg1ZGMLX7msb9Q7YX
	 8/ObCYsYaqMh5nKJTo4td1HqftSsJV8Sv5IFAKS938ZZ3y3JTMu/l0U4xUcYu2XbEF
	 AFgucCU2c3TN+dh6brkmkxyyw/lA57iw1f9DeTHn3iC8nKJyyF5EZN+9RDJyD0Dw8L
	 4piHM2rI4/0f9qKv7NGA4SzL7n3GCo0XEvvBj0rzBR2mXP5SGh7lccD3ilyX2rgHPS
	 9O+OEWxGfGL+w==
From: Vinod Koul <vkoul@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 manivannan.sadhasivam@linaro.org, miquel.raynal@bootlin.com, richard@nod.at, 
 vigneshr@ti.com, andersson@kernel.org, konradybcio@kernel.org, 
 agross@kernel.org, Kaushal Kumar <quic_kaushalk@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mtd@lists.infradead.org
In-Reply-To: <20250423063054.28795-1-quic_kaushalk@quicinc.com>
References: <20250423063054.28795-1-quic_kaushalk@quicinc.com>
Subject: Re: (subset) [PATCH v3 0/5] Enable QPIC BAM and QPIC NAND support
 for SDX75
Message-Id: <174547301233.316124.15937980058360184263.b4-ty@kernel.org>
Date: Thu, 24 Apr 2025 11:06:52 +0530
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_223658_376498_9FE75D77 
X-CRM114-Status: UNSURE (   6.05  )
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


On Wed, 23 Apr 2025 12:00:49 +0530, Kaushal Kumar wrote:
> This series adds and enables devicetree nodes for QPIC BAM and QPIC NAND
> for Qualcomm SDX75 platform.
> 
> This patch series depends on the below patches:
> https://lore.kernel.org/linux-spi/20250410100019.2872271-1-quic_mdalam@quicinc.com/
> 

Applied, thanks!

[2/5] dt-bindings: dma: qcom,bam: Document dma-coherent property
      commit: 5965fd614b18e77c56cfefbd2d747b6b1edf1497

Best regards,
-- 
~Vinod



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
