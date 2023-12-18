Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC99AC35274
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 12:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AXTSW70fflR8r0vT0ooyDpyWnq8N9jpAFA4N3Eb4lyI=; b=JFlU/eNh9xdp6Y6VQMHTDCcuCL
	H+roUIBT0+52bM+rvKHq0bZcGTKcWwWf8aiNMesviE1YtKK8jh0QWHH65gTE8dplR8BjXbblxkYBr
	fcZr9sWVdTc3f/qWevldpmSc7JmVVv9lzITrgxPX0h+84iWETHp3mBq5Dm2Kc1+Rljik6fqhl/IDP
	H59Og+HIG/p7XWIeQeHg1TuHf2fe0kZ5Yg5AAXMjPJoW54KPtVVPAIIV02ddwWxLHisNo8WxHCls1
	ilXijcJ4IboilIIfTA+AK+fjmvC8GudPh4AsxAts+4AqNdkvDjwjtscO/Mu12PJhjKxFPg2F8vBB7
	Lo4LmZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFCPi-00AYOI-0y;
	Mon, 18 Dec 2023 12:08:02 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFCPf-00AYLW-0k
	for linux-mtd@lists.infradead.org;
	Mon, 18 Dec 2023 12:08:00 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id C1C9A4FB;
	Mon, 18 Dec 2023 13:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702901271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6hONpi+9Up26PTg3zkKlX6fImQXNBFZKhWsqSr/nQzw=;
	b=IK/Ee2Qhbf0M3wvpr0/p60S5k2gxujpToMUKjYb4o3qgVwdWsB4t+LAgCYjjU3fYrmlCvU
	wVowx2ZY2WTyJRfhYElq00BgGKs9TMiI9aVWQP6w/elU1M/L0BGMdfKJOKfD3GUbv5gtLQ
	WYCsW124m2Hjebc6c8kd2AhB80KUsyLz6JqMMlgo9cQFi4xGDo68jm2ktSc83RgMVkaE8b
	in5b40MVKWATbLkduMLarTFTgI/xe5FPCQ7sBTsuTFknskRiLwat+thJIiLr0kz90pkv9k
	XsNTRG9KQn9Q0VYic9qEci3tavaBbq7nHimF83fQi7tc9kl0cbwJXR1eXYeWyw==
MIME-Version: 1.0
Date: Mon, 18 Dec 2023 13:07:51 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: pratyush@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 jaimeliao@mxic.com.tw, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] mtd: spi-nor: print flash ID instead of name
In-Reply-To: <20231215082138.16063-2-tudor.ambarus@linaro.org>
References: <20231215082138.16063-1-tudor.ambarus@linaro.org>
 <20231215082138.16063-2-tudor.ambarus@linaro.org>
Message-ID: <46c4de18c6650a695c6ce2b4af7bd9a4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_040759_444204_A9AE1499 
X-CRM114-Status: UNSURE (   6.25  )
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

Am 2023-12-15 09:21, schrieb Tudor Ambarus:
> We saw flash ID collisions which make the flash name unreliable. Print
> the manufacgturer and device ID instead of the flash name.
> 
> Lower the print to dev_dbg to stop polluting the kernel log.
> 
> Suggested-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
