Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF69C0015E
	for <linux-mtd@archiver.kernel.org>; Thu, 27 Jul 2023 10:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5qidFlA0E4UvPTDfbwGMVAwVH+QtaMG5GncR676YFyQ=; b=l1Y+BcqzWqAv3Kc6STo7KG3LS7
	BVcIbgCXZlkTUKeYcn3DUa7Qwd+gBcHzUGDHn5t3is/bMKceKempFncZc9uUtloiG0Zx445iKKRKP
	dsDUzE440wNUMAJQMQw/juDeJl86OilUkhiXiRMHNRcwWZgFQxC7gAml7E/4GdllzU/X4opUIYUR4
	vq+/2/yiVbrrQgCPXS/0P72OzNa219+6pCzn35OGXAdtTA9Znqfb5obAVEwkT/ZmjkM5BLvmWqf1+
	+6+AmKyoBhdckpj9lDIWcnzaPVUk+NN39iAO548EDym81JtCKHjxi9J1TNU87lVk++7lnnxLOZsCD
	1pHWYl5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxyM-00Cx1N-0Z;
	Thu, 27 Jul 2023 10:11:54 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOxyJ-00Cwyt-1q
	for linux-mtd@lists.infradead.org;
	Thu, 27 Jul 2023 10:11:53 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 1832F125;
	Thu, 27 Jul 2023 12:04:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1690452255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L+So5mwxn8e6A5OiMZxekuKqkCIEomJpCxCUFZCTbJ8=;
	b=y/PJoS4k9DjRZwRc4dQlo1b7alcaJ/lAMt//Tn2vTTSRICtq7pYQFDN7Gpt+l6XvvQe457
	A0ebdNKVABcpEy7O/migSmtA6BPQAV8IPTJbaZPFITtWKog+yOh3tGo54RqN580S67UGnM
	DjnL7VXbe5C2R+7/CqurXD96HVUKiljsserEJrdxJqa71BgyGF8OFGdn8c7B20WN01WEq7
	NNKHzPoDZGMiLrAzSFrcslMsqZl6lA23FkiNwQk5lJ3gqD4u+2LyBucawRq2ZDqwWwWBxq
	j9rig9W9NRbpifb8wWHJWXGZDhfUuUnk9JeaAUf/fIwQLW33JGT+bmMB8722Ww==
MIME-Version: 1.0
Date: Thu, 27 Jul 2023 12:04:14 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, JaimeLiao
 <jaimeliao@mxic.com.tw>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: add support for Macronix Octal flash
In-Reply-To: <a2e8544b-f97b-e318-1c98-7f424b1c810c@linaro.org>
References: <20230727091610.234132-1-jaimeliao.tw@gmail.com>
 <20230727091610.234132-3-jaimeliao.tw@gmail.com>
 <a2e8544b-f97b-e318-1c98-7f424b1c810c@linaro.org>
Message-ID: <ef91b41242da72c4bf6b5e3bed9862d5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_031151_878068_2EA51224 
X-CRM114-Status: UNSURE (   5.62  )
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

Hi,

>> +	{ "mx66uw2g345gx0", INFOB(0xc2943c, 0, 0, 0, 4)
>> +		FLAGS(SPI_NOR_RWW)
>> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_READ | SPI_NOR_OCTAL_DTR_READ 
>> |
>> +			      SPI_NOR_OCTAL_DTR_PP) },
>> +	{ "mx25uw51345g", INFOB(0xc2843a, 0, 0, 0, 4)
>> +		FLAGS(SPI_NOR_RWW)
>> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | 
>> SPI_NOR_OCTAL_DTR_PP) },
>> +	{ "mx25um25345g", INFO(0xc28339, 0, 0, 0)
>> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | 
>> SPI_NOR_OCTAL_DTR_PP) },
>> +	{ "mx25uw25345g", INFOB(0xc28439, 0, 0, 0, 4)
>> +		FLAGS(SPI_NOR_RWW)
>> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | 
>> SPI_NOR_OCTAL_DTR_PP) },
>> +	{ "mx25uw12345g", INFOB(0xc28438, 0, 0, 0, 4)
>> +		FLAGS(SPI_NOR_RWW)
>> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | 
>> SPI_NOR_OCTAL_DTR_PP) },
>> +	{ "mx25uw6345g", INFOB(0xc28437, 0, 0, 0, 4)
>> +		FLAGS(SPI_NOR_RWW)
>> +		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_OCTAL_DTR_READ | 
>> SPI_NOR_OCTAL_DTR_PP) },
> 
> PARSE_SFDP for all the flashes please.

And no NO_SFDP_FLAGS() as discussed.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
