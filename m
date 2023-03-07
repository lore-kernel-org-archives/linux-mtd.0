Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4251C678D5
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Mar 2023 20:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5LkTAYDMXE458alS18DMQVyABgwTzb6Vi8+xjq7lHI=; b=TaphhzrvUNlz9dlci8u5MX4kfw
	VKZeCGh14jXWYj9Nnc+ArHlRvUP9oPTvVx81dqcNKNI+zMr/H0awFdXe/47dmIvXVfYBoZx8vtTYg
	IEU9hnw8a1HfV6rmLMkOHzZPYlp99lUFutPpn/WNd+m3efzcW20AiJYN4YhxJh2zCrWv5XFAjOs34
	U5RHQAgitnZeHbaVORzxMs288QsdkaMvgbp3lNLCOb7G4UQ4AeA5UEbF6hz6WvhQHSxjSkpUQsgFV
	NE06A1EK+pBvYVDys7+FHdBQVYd5X0Ilez1BuqjH1j7co2B4n7j5Tfypzm0mTqqqIqUCCbg+OYvHF
	9JEdOlOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdyr-002O36-UD; Tue, 07 Mar 2023 20:32:17 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZdyl-002O1m-B0
	for linux-mtd@lists.infradead.org; Tue, 07 Mar 2023 20:32:12 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 10A5B1251;
	Tue,  7 Mar 2023 21:31:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678221119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UIy9TosHH/d+Anm5aK4aEwYy9sqxR35wbh+V4pa4Zuk=;
	b=wkNV5JY7BvVTeyydgKVADgVU0A0Bf8jnMMgh2gzfg79BlaOJi2D18GegUPKPmHNcXtlCZh
	2VNuNeF5wYDFo+aarivrYj48w4zFviRtozD5agdPkycQ27LvQ/5djcKiSNr1Ngb0jfCPTw
	d4xUz3plBpP65N7sbsw7+CnQmc46zfVU222JkDFcN+i3D2uMUtVSHp6ADmr+MfbCZacArX
	5GKPeULYXItWBagU8A7Ysdl3y+GvoKFIZIz0pfbmMbncagAfN7Ewc+iGPiVghjt6VxQWIe
	IaiMSPwTRmcJ7ImOE5OMrMd193Lz0nxMwZ2IPPWidAP3TIx7sjLCtBykDuuNvQ==
MIME-Version: 1.0
Date: Tue, 07 Mar 2023 21:31:58 +0100
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: Avoid magic values
In-Reply-To: <20230307192536.470997-1-miquel.raynal@bootlin.com>
References: <20230307192536.470997-1-miquel.raynal@bootlin.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <2403a9162efc64bcf3db3e69edc17fa6@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_123211_576375_148DD178 
X-CRM114-Status: UNSURE (   5.98  )
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

Am 2023-03-07 20:25, schrieb Miquel Raynal:
> Nvmem producer config ID "-1" is actually defined, so use the 
> definition
> rather than hardcoding it with a magic value.
> 
> Suggested-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <michael@walle.cc>

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
