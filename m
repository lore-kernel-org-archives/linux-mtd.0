Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2735EC3DA6E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jan 2024 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOA8AkkZ+vWvZiFKItoikTDnvBvAsQzW+O5lyCtxYdA=; b=bQajBxI3GB7RhveuUbzyZf785Y
	7Xx4fkHsMU3Juw85G2ekVdd+Phb5BtnH2bF4FytMjUiUVFHmA94oE0tpVKTYZmeEHOP01hYhXa3yF
	czOrUXviVaOnfwsfaIn5DwupHPk3defm/lSjx0n34DjwfORKgbg7J5plINPKHhv/J1/nSSDRjntc9
	nzNnIOqw6kEUdTfONmG2CRuAyp0ec9MULxF7krqGH0YznkFnIGQjbn8uG4D0JNz1RN7umNWU5BFQc
	WQoq72hnmayjXL4i2YNqjP868objD2LHTyJ9Z2jeO12GNMcAc+a9Bsbxwl4COdehrNie2P/S0bCH1
	72MZBr0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjq4-00GtPX-2n;
	Fri, 05 Jan 2024 13:02:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLjq2-00GtP0-1V
	for linux-mtd@lists.infradead.org;
	Fri, 05 Jan 2024 13:02:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 70265CE1DEF;
	Fri,  5 Jan 2024 13:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EADC433C8;
	Fri,  5 Jan 2024 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704459726;
	bh=WBmMnQtnUZ/gWGY+QhI4AFjUWtprD3ofBig2lS5L0cI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=eRYK5FuEcc1r80l+wc5xDMEgCqYATWylfo+qA+ZZFNWPOD3HhoScA9RC4RtJKqRMT
	 ZVG5sJA10GW6mRfGbpDFZwBtYEAFDT8pLl8uh5f9zu+SWGoKpgBRW/chzo5JBmIFx8
	 Cyg9opS5mQI0rcEsXDMaEhEgzu7C7YpLGYPcT/6sAV0Rj1HhwXmkBUNibhkjESUnoC
	 SDMApw8BKYmNT5KDqhcmgH6KfwUYQAADLaOmkWMWmcggRbV0dr6p3tTpSDCI3RZ9Ob
	 CLSkRJCbLhGSH1KgzQ7BsiAzYLAeblrrng/EHeoEfHHBTsHZZAKAInaB4cZMwArW2s
	 GGUPze4vYgSmA==
MIME-Version: 1.0
Date: Fri, 05 Jan 2024 14:02:02 +0100
From: Michael Walle <mwalle@kernel.org>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v7 2/7] spi: spi-mem: Allow specifying the byte order in
 DTR mode
In-Reply-To: <20231221090702.103027-3-jaimeliao.tw@gmail.com>
References: <20231221090702.103027-1-jaimeliao.tw@gmail.com>
 <20231221090702.103027-3-jaimeliao.tw@gmail.com>
Message-ID: <0c80946c777cfe2019ed5d183b5be304@kernel.org>
X-Sender: mwalle@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_050214_671795_49BCDD72 
X-CRM114-Status: UNSURE (   3.50  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I've just noticed you didn't include the SPI maintainer nor linux-spi.
Please make sure you run script/get_maintainer.pl on your patches.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
