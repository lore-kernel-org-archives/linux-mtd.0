Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79D8CFC5EB
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Oct 2024 17:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efA8oslhpc/983+16D3ihTpibgUYH8w4BWyFb8QnX8o=; b=Z5RlDAhzhZb9Uu
	/D57GN/2tYmjbMTiCeIBBu2sj4Z3tIbEfZQUWr243/plLKjrp67UDOwsJ+pTCF6B2aBQZmttOwZwt
	WOA3q7nUwmL3ez8a97NDMz7saZOapPsTlwjHR3+1fOKFFRrbSAAZtaIOuwkSLsXkk9gT4ctrxJ/I1
	mxtR6a+i/Zi+FCWppm/nF1nbG/t11pbfvxalSKBfaU97b/8VXqmKnZV2NKIBvhM+wvA01cFV9Um/e
	ubqUVxU7013Svks8V2zpWHVuffZ6iACP5nORjUQauEw/Xx4cCB2zS4AtIhS0yXQDyzZJX1Q4FbZMt
	pG8UXWdTr5r8aOS6aZWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syxQ3-0000000DlQk-1EB0;
	Thu, 10 Oct 2024 17:57:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syxPz-0000000DlP1-3fZ2
	for linux-mtd@lists.infradead.org;
	Thu, 10 Oct 2024 17:57:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A54015C4D75;
	Thu, 10 Oct 2024 17:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A07C4CEC5;
	Thu, 10 Oct 2024 17:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728583062;
	bh=LWqRgOJyjhmzC/oM31Wppo5HRgG6EO757vIU1WFMl3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nr33LrPJDjzXFmLgjgcyuwuiZux+fWPYa84/K3umfWTNtr/BiLgMyp2kv6SulKf6z
	 QYD6yZSPOdF7RYJoz8lB30GY6bVipdTSOCbW+m8tUNhNEjBljJ6pub8XJFr32XC/UK
	 uXWrrAyezHF+zyyoQZ1BQrfzmFXHi02Auz9LjBJf6YjRW7gGTlHkl6yW5n9ELjgxrI
	 nfe0x+qIlw6QHxg0ddwLxjqgw6Y5Zpa215VbotvGueMPziER0V0tO0QIlB/zlqMzlJ
	 CIvT4VI6xhnY31fdPqTHBkN0sw6m67c0K8/KlfVw6opktjcn5rtSiEWwzG9mFK1Q3V
	 w/4duq3lVF7qg==
Date: Thu, 10 Oct 2024 12:57:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com, esben@geanix.com,
	conor+dt@kernel.org, manivannan.sadhasivam@linaro.org,
	linux-kernel@vger.kernel.org, broonie@kernel.org,
	nikita.shubin@maquefel.me, linux-mtd@lists.infradead.org,
	vigneshr@ti.com, arnd@arndb.de, andersson@kernel.org,
	linux-spi@vger.kernel.org, miquel.raynal@bootlin.com,
	krzk+dt@kernel.org, konradybcio@kernel.org, richard@nod.at,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 1/8] spi: dt-bindings: Introduce qcom,spi-qpic-snand
Message-ID: <172858304953.2090269.15996975253037715461.robh@kernel.org>
References: <20241010070510.1504250-1-quic_mdalam@quicinc.com>
 <20241010070510.1504250-2-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241010070510.1504250-2-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_105743_979433_C6A79BE8 
X-CRM114-Status: GOOD (  11.58  )
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


On Thu, 10 Oct 2024 12:35:03 +0530, Md Sadre Alam wrote:
> Document the QPIC-SPI-NAND flash controller present in the IPQ SoCs.
> It can work both in serial and parallel mode and supports typical
> SPI-NAND page cache operations.
> 
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
> 
> Change in [v11]
> 
> * Dropped Reviewed-by tag
> * Added Soc based compitable "qcom,ipq9574-snand"
> 
> Change in [v10]
> 
> * No change
> 
> Change in [v9]
> 
> * No change
> 
> Change in [v8]
> 
> * No change
> 
> Change in [v7]
> 
> * No change
> 
> Change in [v6]
> 
> * No change
> 
> Change in [v5]
> 
> * No change
> 
> Change in [v4]
> 
> * Fix spelling mistake in HW description
> 
> * Added commit message
> 
> * Removed '|' from description
> 
> * Removed minItems in clock
> 
> * Added blank line
> 
> * Removed co-developed by
> 
> Change in [v3]
> 
> * Updated commit message, removed "dt-bindings" from commit
>   message
> 
> * Updated compatible name as file name
> 
> * Added hardware description
> 
> * Documented clock-name
> 
> * Moved dma-names property to top
> 
> * Droped unused label "qpic_nand"
> 
> * Fixed indentation in example dt node
> 
> Change in [v2]
> 
> * Added initial support for dt-bindings
> 
> Change in [v1]
> 
> * This patch was not included in [v1]
> 
>  .../bindings/spi/qcom,spi-qpic-snand.yaml     | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/spi/qcom,spi-qpic-snand.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
