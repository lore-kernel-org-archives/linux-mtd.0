Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E57C636CC
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Jan 2023 08:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f6MdyBsvgpS9x/VGyx1oUByINNBYXMrU2cOLFHW5NVU=; b=G4GURENWs2wbmzTVCLZ9fDenTV
	uNi0s8jTZT3Xczzu7FkChm8Iq/2PLolN9dNwbXrGe52B8RcUStDX7W74viNeawMyNrlpcLlBVQcLa
	/7+pBvPRlTLeJskjD4hVx6U/O9DSRVEVDnVQqm4Zvnb3/2XcrnPBErioJWteQxgo/huAOZqAshPgx
	PWBzzjrixBOEEu+Nbley8e/+YMlVoSBtwUXd8F/+7yitywGyTJL5Z5g1Nugs852M1jbLVNJ7j6yoR
	YEeWb3aG5y7glaWVeOV5TcTxM/Uoa2TMrMWGImj1S3bRapSJtGnnpJ0FYn9zRlEQP/w/iLNzJYqsX
	yXa45GMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMlpn-006fNa-6y; Tue, 31 Jan 2023 08:17:43 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMlpj-006fLe-TR
	for linux-mtd@lists.infradead.org; Tue, 31 Jan 2023 08:17:41 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 69865164A;
	Tue, 31 Jan 2023 09:17:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1675153054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dnoBW38WrMRCOxEmbm4hIeK+zIeRHOjHTvn4lT7HMzM=;
	b=ZFnL6RZMvAZ8LcSbmcsno/k+ctG1wU9Ds0E47MeA+IK/wAHmvXmpGxZCsShP83ncN4qoiy
	0eS16U/HuDtTFLO4MKQGv/3smIIhon0Hj+3PoV3Gl5fzAbuNRy3B4r5pr3RKbCJuglgZYy
	jHvoR59O5WvPi5MGM19WqUkcfXnLORp2MZi6U27O3jrYPX0hw+ck8c+Gwa+yFoyBrt9R5K
	YTYbUUbktxVkAy8ADa+ujPuVxnMqItfmgZUmWMzV1Z7RXOpgpcSD67Vj8kc1Hi3lzqcWof
	DELfN48U6oHTY6DDU8cTItjH0B4ktQJiZewBpZHIJaJwMv3I8xn6neuqkG0/AA==
MIME-Version: 1.0
Date: Tue, 31 Jan 2023 09:17:34 +0100
From: Michael Walle <michael@walle.cc>
To: lrannou@baylibre.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org
Subject: Re: [PATCH] mtd: spi_nor: Fixes out of bound shift
In-Reply-To: <20230126142612.1518046-1-lrannou@baylibre.com>
References: <20230126142612.1518046-1-lrannou@baylibre.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <27e7476a179b68d7b4501ffdd368bad5@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_001740_142550_B33089B3 
X-CRM114-Status: UNSURE (   9.69  )
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

Am 2023-01-26 15:26, schrieb lrannou@baylibre.com:
> From: Louis Rannou <lrannou@baylibre.com>
> 
> spi_nor_set_erase_type is called twice in sfdp.c with a null size. The
> return from ffs is 0 as well and the shift size becomes (2^32 - 1) 
> which is
> out of bound when applied to the << operator.
> 
> This considers as illegal a call to this function with null size. It
> creates a replacement spi_nor_mask_erase_type for explicit calls to 
> mask
> the erase type.
> 
> Signed-off-by: Louis Rannou <lrannou@baylibre.com>

There is also this thread with a pending patch:
https://lore.kernel.org/r/20211106075616.95401-1-tudor.ambarus@microchip.com/

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
