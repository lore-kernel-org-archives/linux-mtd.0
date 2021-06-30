Return-Path: <SRS0=ctmN=LY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A4F9C11F65
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 18:48:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C8BB61424
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Jun 2021 18:48:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C8BB61424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dxhxz9zBUR/mdHlou3RWueiSXHHrc30uRAAirWMrsL8=; b=i1I6sOyDYHA4xfPR5Ifx+GJqBv
	gyHKnQegyZtIT4ykMJtGDXfhRjM8/o2kyKujWVA9sPMzlhP3wJnEDCMzwmG1WB1AgsHhQeo62pJMz
	gY082LMrekrpEumsdBztGvWjkQ3+Ghhj26SA61w7F1llpfG+jJoC8Fv8sy1djtzqLHsG+4pBTc1CL
	2IzlJBBfNWFPMMrWDZ9tiLLloHU3nt9n1f5P4Ytu3Z/kFXJaaXUMFhDpu3+0/JwhLNxhSfc+IRb1y
	4ShSGDA1WTFuUBoO6rAz8MP6s75jzjovnOuiTTOfxq4AQ148RXaBT5ilaZpHe8WxKD8lqxWIzyOb5
	HUH/V8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyfFT-00F2QP-50; Wed, 30 Jun 2021 18:47:47 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyfFR-00F2PY-0E
 for linux-mtd@lists.infradead.org; Wed, 30 Jun 2021 18:47:46 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id x6so1649693qvx.4
 for <linux-mtd@lists.infradead.org>; Wed, 30 Jun 2021 11:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=60fGwYuMLeZ3w6f/QlUbAzK/Tjn7WY3lrVIKtdFV0vE=;
 b=LzgLnsFE+DhrGM/j/IN7YopN6o3LeoGE9g0yyE3qnyBrqwWfJVE2uapkEGiR02s3ef
 vTEkjreUeYXuenawNTbMqFlrh2c8SVWGRMsMdvOL+jeQPirX5Kth+6O1oK2HjUrEqeVk
 v5ctK0HFUwkXlre0Tx5aARDYO7zeCBx45Q1Etx/p5Mxg44M/OvAMxWsLzE5yqUjBmIDb
 ub3lQ+jgLCxOq2koDxpcwx9QwisHZ+VLaPqE5XuQiLkT4VTycWyn8QKiEq2drikZhDLW
 0t2n5TDC+mtKpItTs5tQefsSh8XiQ6XMu4H6qlJG05097NwX/iLm7QpdHVu3uzXfOxhP
 ySmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=60fGwYuMLeZ3w6f/QlUbAzK/Tjn7WY3lrVIKtdFV0vE=;
 b=jSfrQzQaWLIQyg7dABsXZDeuPR7awKwLiLsMDyzMTP50ULXaAEe/z8Dzd28nCselRF
 +4wyFZ8uiplQXxyQW/x6ArjezFMEDHoq4yLOVd6Shcdo08APeaoLQ6tUb1HKIY7EP43h
 +icYRxW4jbQPPJeqtfeEHgVfPrh+f/NuKsfnSlqpITwhOqdANd4srR6VtTdSOm/SQZpu
 i+sydWpIT7JfysrZSfMZRGNyr104rGa8/aDJ/UHOc5ZlxcHJvOhIjDOoczAeSl8wBDjQ
 4k7k/aWMYUJYqirUR4v9X0t8zGH5NW8jQ8Jmo3RNuC8XWalCFIfd3EA01/OyER14Hk1I
 wZog==
X-Gm-Message-State: AOAM533LMuOUYTQ5eE8+kMH4NmlPk+tz0pVRRpxHSHuRwkFWmTppozpj
 712lH5ssFRXKWCWnIeKzm+zH7w==
X-Google-Smtp-Source: ABdhPJySaixmMF28wbxHFLTNG5QwoLBZMlZqqSpQpvgNC1zV/DlGQX5TKq247Pv5skCWrOtnTOgEYA==
X-Received: by 2002:a0c:be85:: with SMTP id n5mr23634306qvi.59.1625078862845; 
 Wed, 30 Jun 2021 11:47:42 -0700 (PDT)
Received: from localhost (rfs.netwinder.org. [206.248.184.2])
 by smtp.gmail.com with ESMTPSA id c22sm3842608qka.95.2021.06.30.11.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 11:47:42 -0700 (PDT)
Date: Wed, 30 Jun 2021 14:47:41 -0400
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, Marek Vasut <marex@denx.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: denali: add more delays before latching
 incoming data
Message-ID: <20210630184741.GA1037365@maple.netwinder.org>
References: <20200317071821.9916-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200317071821.9916-1-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_114745_094042_63879039 
X-CRM114-Status: GOOD (  12.86  )
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

On Tue, Mar 17, 2020 at 04:18:21PM +0900, Masahiro Yamada wrote:
>
>Marek Vasut reported this driver in the latest kernel does not work
>on his SOCFPGA board. (The on-board NAND chip is mode 5)

In a bit of an ironic twist, this change seems to cause a regression for 
me. I'm also using a Cyclone V SoC system, similar but not the same as 
the SOCFPGA eval board. The NAND device in my case is S34ML04G2.

It worked fine in 4.9, 4.19 and 5.4 kernels. However after upgrading to 
5.10 the NAND driver fails with "timeout while waiting for irq 0x4", 
just as was reported back in 2018:
https://lore.kernel.org/linux-mtd/737ejrj81y.fsf@pengutronix.de/

Reverting commit 5756f2e8dad46eba6e2d3e530243b8eff4dd5a42 restores the 
behaviour in my case, but that would presumably break the SOCFPGA board.

Any thoughts on how we could make it work for everybody?

Ralph

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
