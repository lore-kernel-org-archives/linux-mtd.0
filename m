Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F7C5CA0FED
	for <linux-mtd@archiver.kernel.org>; Wed, 10 Sep 2025 11:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rssmprgzSCW5aMAf9uNQSjzCPyZ40xs2NEOI9h2TyrU=; b=MatNVlLs2u/PIb
	bFeuezUmDjjOcKhghVXmuCAZREROvglmsTJ4jutod8ExBLsjnTtPCZNHLFIcfStzHwUpBnpcOStAr
	3zfRwq6lCa+yw74MErPPQCCQFiI+2rzJyoi/NipFOtwnij6eeXzqvhV8vvuCckL4hhdJitVVhhuYs
	zeLoVRj+50T8Ux2M2ff3bjmT40cH5IJVTweQIC20mpU9aR2QEPyqQBiBDCPRukRtGwmMkz1cignOq
	d8Z9Pp0CoPHLn7xVVstogvdG3ogb51hrpYaLBkkkRsEQzuGH3OSLltNSpKlPRs46bHzTzTk+25skR
	7ikxhFZ1tnM121Bwv/+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJBc-0000000DtHY-0WIo;
	Wed, 10 Sep 2025 11:40:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwJBZ-0000000DtHC-3Oie
	for linux-mtd@lists.infradead.org;
	Wed, 10 Sep 2025 11:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EC7844922;
	Wed, 10 Sep 2025 11:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D63C4CEF0;
	Wed, 10 Sep 2025 11:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757504425;
	bh=yG+NMaxzNA8zIaIVLj6jr5NYBeJjfeuertNdU0usCsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L96dwETf4nJsRVmr4Mqv5w9o4oKpkrzyrMRkuxfKJV4O6QI+si1/rbdIwOWXOEXy2
	 DEYNQytfbt/pGdsZK/F6tpTKlhSoIZ34X16X5jHDa7nI9fW5ywdsIsg+MtGfNRSiGp
	 OnZedxxr9+hFCewsLCqA45nRhn34uvWoJ7yzBDdF83+Ql0+2xbkpvBwLLo1BWnMUEw
	 MKmGkt7njWkEUMo0lFZSfA7ggcAkmrTluTqSSu6nGYfcwumxvyNhUS7y9ILwUMDZtN
	 EZ0zlxK+dFJdHXPDONsdlhs4OqcObKvFrwkAdLZ62KxwQR5JsRLC9F9RBYXR1L9fTH
	 JaYlyXetTsRyA==
Date: Wed, 10 Sep 2025 13:40:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	tudor.ambarus@linaro.org, mmkurbanov@salutedevices.com, Takahiro.Kuwano@infineon.com, 
	pratyush@kernel.org, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 1/3] dt-bindings: mtd: spi-nand: Add
 enable-randomizer-otp property
Message-ID: <20250910-godlike-berserk-sambar-cd25f7@kuoka>
References: <20250910030301.1368372-1-linchengming884@gmail.com>
 <20250910030301.1368372-2-linchengming884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250910030301.1368372-2-linchengming884@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_044025_874755_C174F7B4 
X-CRM114-Status: UNSURE (   8.79  )
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

On Wed, Sep 10, 2025 at 11:02:59AM +0800, Cheng Ming Lin wrote:
> From: Cheng Ming Lin <chengminglin@mxic.com.tw>
> 
> Add a new boolean property "enable-randomizer-otp" to enable the
> randomizer feature on supported SPI-NAND devices.

What is randomizer feature? Subject, commit msg, description - none of
them explain me that. Is this some standard for NAND? Why is this a
common property?

So many questions and zero explanations in the commit msg. Instead you
just wrote what we see in the diff - that's completely redundant.

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
