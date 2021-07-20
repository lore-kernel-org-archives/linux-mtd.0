Return-Path: <SRS0=qhal=MM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BB4C636C8
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 21:32:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD81D60E0B
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jul 2021 21:32:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD81D60E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zZ/bf/Btx/huNs7QKJWkSodHIbfI4rCW9zwMeh1kYg8=; b=H8wP4VFPDoPjHZ
	tv/fadk4UIele9AUWBDTNRhZ9tpLRInV4+isUB9e5WorLg7xASqarWMm/sE4K0OzPiISn9z5F6cG2
	m1q/EDlDxZocaki8mPrm1qMnUiQwngvidESEW2MukLvpPMyvH6z2pKfI+HfP2LdELCCSpRLe+BCrS
	TZKPsOMV7+2yug4adMP56EAp4/dZfmw+tEsqHqMhP/GuA1KJcOTlBT5r9Q60sWdqWF878UO58w1en
	R5HJ/Lu2U+3+HPns9yU1yC9CCmSM+6mawbNTk257AkqY3paAW/z2+wJXKakZZxlQmyJA+5uXN4m/S
	TyHCgN4tvuNK6whOlXOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5xKo-00Dyfm-Cj; Tue, 20 Jul 2021 21:31:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5xKl-00Dyf7-Cr
 for linux-mtd@lists.infradead.org; Tue, 20 Jul 2021 21:31:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8583160D07;
 Tue, 20 Jul 2021 21:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626816682;
 bh=i23eFEgSE0wuhLAejNnKB7S2wizVK8Av41Ojl11uxBc=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Lbvp9Fb212Yc8Un6EW2mD0F1mM75CtTpnwORJkMUaJybD4UckohiEDWsY96OvIvY/
 RMasGoTavM8G+3+TeSFA66aUfTRcvF4rfti/jE71r3s+BVNwF9Ttj5oSGVZx0lA2Ge
 HZanppRxCOAvFHA2FzaskaqXlBnH1iO2G22G5raRiuodv3qyhUPDmqYxUWtzFNxElf
 F8D9s5hdiuvSokHUKzFcFMK2ytLuQUlgaqsW6EmSlX6XPdZUByZ7TomalyvZ1zqWFR
 RNXmivlQgfZ/BP/nDLU3NtKF7VwCAsBv9TNCXwWlBnuICmlGqt1MQ2BXsRgVepWxHe
 iKi8FVxQQfl8Q==
MIME-Version: 1.0
In-Reply-To: <20210713193453.690290-1-robh@kernel.org>
References: <20210713193453.690290-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: More dropping redundant minItems/maxItems
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
 Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sebastian Siewior <bigeasy@linutronix.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-mtd@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org
To: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Date: Tue, 20 Jul 2021 14:31:20 -0700
Message-ID: <162681668027.2679160.3696036662982059954@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_143123_497385_D6FB2D63 
X-CRM114-Status: GOOD (  14.53  )
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

Quoting Rob Herring (2021-07-13 12:34:53)
> Another round of removing redundant minItems/maxItems from new schema in
> the recent merge window.
> 
> If a property has an 'items' list, then a 'minItems' or 'maxItems' with the
> same size as the list is redundant and can be dropped. Note that is DT
> schema specific behavior and not standard json-schema behavior. The tooling
> will fixup the final schema adding any unspecified minItems/maxItems.
> 
> This condition is partially checked with the meta-schema already, but
> only if both 'minItems' and 'maxItems' are equal to the 'items' length.
> An improved meta-schema is pending.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Sebastian Siewior <bigeasy@linutronix.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: linux-clk@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
