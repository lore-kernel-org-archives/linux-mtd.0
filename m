Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BD9E77184
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Dec 2024 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0kx6GrodwV03bsbQjJVkS80O7R0J6p6jmQCsFExU9Oc=; b=kf+Kw7CR1T8aGG
	1WQ1nnbBaBmcT6urXbKEhQVQJc4eNxrO6bJ9DdYrSmMfqPbhzC8d7o8p1oI+uSJ4hLrAllrvilmoO
	pWnpT2wmJ75ynfegf8QQOQL90ajiK8GBtbn3tVscVcQV3+TaK42tZ6/D7pEHdtJctD2nGkRSGhdQf
	tue6UcUdpTDXtRWsoIj4Q6gcJuopURdcf6mRw/hMo0qPlOgU1Tmq8GQd5IXkJBjo1sLkEIVQn2dfL
	PoFCyBfnjMnDM1kA67HlmjeMEoD+OVQQnPinDVLfT2xpaumrV1EVwyJeIx8Wk0YLzI04oEIJMPSyK
	NYVry5eTS6JdnaUmwe5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHwF-000000026L8-2oGk;
	Thu, 19 Dec 2024 14:55:43 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOHwD-000000026Ke-2SCy
	for linux-mtd@lists.infradead.org;
	Thu, 19 Dec 2024 14:55:42 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23E271C000C;
	Thu, 19 Dec 2024 14:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734620138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ovmYWnItiL16WI2OJifkalmCJJUx8jG6mu9hX55Nug=;
	b=RJeMB+1fav6wA0agcDWJC7gPu3G2p845bq3c4g6uq9V98+9m0Zg7HdY69SKg4eJx8wtW6I
	gt+5XyivTs4uBzdaFT54bYWjcQSEauwX6wcpldU+mWFsPJ+tvodrZEN30lpKs4dgpvds8J
	u+7/9/SzlE3LiFNobaDv9lh6jWwx0E831kP579UzoR2aXbdAaBREJgG78/CCNoL834NMlJ
	swdBP8Tc/7aCnJT1eBbxeDykdr5U4zyVv/ZSu74j10Ws/Nu8wn9s8slSsVfuDSL7bTFUBI
	HCzsMM2vV8az4bVe9/4jpJHl8N+uMpUgAlTDgUP+sSDbTNCB0flXw7CVI9ZVjA==
Message-ID: <9edfc43a-7f2e-4036-9eaa-6666608085b8@bootlin.com>
Date: Thu, 19 Dec 2024 15:55:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd: rawnand: davinci: Reduce polling interval in
 NAND_OP_WAITRDY_INSTR
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20241219-patch-nand-poll-v1-1-605e5f15f24a@bootlin.com>
Content-Language: en-US
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
In-Reply-To: <20241219-patch-nand-poll-v1-1-605e5f15f24a@bootlin.com>
X-GND-Sasl: bastien.curutchet@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_065541_776659_B5BCF08F 
X-CRM114-Status: UNSURE (   9.63  )
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

Hi all,

On 12/19/24 3:25 PM, Bastien Curutchet wrote:
> For each NAND_OP_WAITRDY_INSTR operation, the NANDFSR register is
> polled only once every 100 us to check for the EMA_WAIT pin. This
> isn't frequent enough and causes delays in NAND accesses.
> 
> Set the polling interval to 0s. It increases the page read speed
> reported by flash_speed by ~40% (~30% on page writes).
> 
> ---
> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>

I just realized that this SOB should be above the '---'. Sorry about 
that, I'll send a V2 right away.

Best regards,
Bastien

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
