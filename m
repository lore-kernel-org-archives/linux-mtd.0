Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87281CF9C69
	for <linux-mtd@archiver.kernel.org>; Sun, 22 Sep 2024 20:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RLWlhSp9oQGIdvvjtUMY7+sCMk1yCrMutrTNA6iJwmI=; b=wsIGlSp3UlOTtO
	LN73CGOjNaqhOlN7nB6TGm5l4P+/FkqH59Q/zaEfgANY5jKsNCXekl8rggur5H7Uy9O45IuvB1sd2
	FvB9QqJZLHTEPoI7bUuBdBCicAGe4pk0TLHCIJXAw+lQn5BRs/EEH84Q+S8+GFGIeWvH/Nj6lFPdH
	mAlpc0lxOB+6Wy1wSCoP0uyVH7BHm5XOoqQ63chyqZDNwxFcVHvAjz2k4MpTZM7oKxsPzZRbNvS0h
	VdyCTFMuSi3Mp4bj5Pv62y2WHtW9PppyEgh+KP0zqU5jrP/CRH+Jay9LJqS4CxGYDlGJzqMxS5aWG
	daGVXzoQqHkyWLHXHFZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssTFl-0000000Fi0K-36Pq;
	Sun, 22 Sep 2024 20:32:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssTFh-0000000Fhzx-3itU
	for linux-mtd@lists.infradead.org;
	Sun, 22 Sep 2024 20:32:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CD662A41036;
	Sun, 22 Sep 2024 20:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C88F6C4CEC3;
	Sun, 22 Sep 2024 20:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727037136;
	bh=Wkhxr7zFNFIazgoASlMplbrwcKNgSTWyidioOVkTuBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TiDvsu+9gnBUH6LkeNAgFbvmb8NH/msjU0IY5ssA4B4yiyvdSIJOBNVt6vCf+X7YG
	 WJLbqLlUuc/Te1whGHFwEypeKUFrWs71Bh1+fpInwHV33FhGbpBUTX1jbQ35xmxPB+
	 TsRxgFFUXsyxhtsD6eQEYfuYmqPak4IBWdVMSgU0lQU2Heut0HrZPS2AbY6B2oADnt
	 7YwYx+QHfAM1IuTPAuwvjZfHbrt35b0tjZFzqpVzv1x1X4eQoeWM2AhxApYf44d4B0
	 L8HdmiZEjiRvmc7YWNKlO/6nxa1GF/orW/YVi89RdHNyHrLYhQPcExR94FdWMG1Ya0
	 aq9rHAbK56XIg==
Date: Sun, 22 Sep 2024 22:32:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org, 
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	manivannan.sadhasivam@linaro.org, vkoul@kernel.org, nikita.shubin@maquefel.me, esben@geanix.com, 
	linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, quic_srichara@quicinc.com, 
	quic_varada@quicinc.com
Subject: Re: [PATCH v10 1/8] spi: dt-bindings: Introduce qcom,spi-qpic-snand
Message-ID: <k3id2ywyghhmoiekehko7ear2nef5ygmizvkax5s6sdi2zhn5d@yfhgl5xte4dw>
References: <20240922113351.2390195-1-quic_mdalam@quicinc.com>
 <20240922113351.2390195-2-quic_mdalam@quicinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240922113351.2390195-2-quic_mdalam@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240922_133218_010320_C0ACAAAB 
X-CRM114-Status: GOOD (  11.01  )
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

On Sun, Sep 22, 2024 at 05:03:44PM +0530, Md Sadre Alam wrote:
> Document the QPIC-SPI-NAND flash controller present in the IPQ SoCs.
> It can work both in serial and parallel mode and supports typical
> SPI-NAND page cache operations.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
> ---
> 
> Change in [v10]
> 
> * No change

...

> +title: Qualcomm QPIC NAND controller
> +
> +maintainers:
> +  - Md sadre Alam <quic_mdalam@quicinc.com>
> +
> +description:
> +  The QCOM QPIC-SPI-NAND flash controller is an extended version of
> +  the QCOM QPIC NAND flash controller. It can work both in serial
> +  and parallel mode. It supports typical SPI-NAND page cache
> +  operations in single, dual or quad IO mode with pipelined ECC
> +  encoding/decoding using the QPIC ECC HW engine.
> +
> +allOf:
> +  - $ref: /schemas/spi/spi-controller.yaml#
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,spi-qpic-snand

Recently it turned out that Qualcomm generic compatibles are not
generic... That was odd, but to me it is a clear signal that something
should not be called generic if it is not generic enough.

Please switch to soc-specific compatibles (and drop my reviewed-by, so
this will appear in my review queue).

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
