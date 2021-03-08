Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F985C4332D
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:17:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC455651E3
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC455651E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MhYKcLgv7Op86FqLkPyUxzRMWQ2QJHz9SV6MuQpOrOo=; b=kjnGlUosylU6rZEmeBtozbvUc
	5rDuQ15x673MHPP7s9SHg6QmQxjx0upHQjUbTJU1q+x4DqXKDaOnumXeqvgpHpi8m/hP25IryxfLy
	cutcoYSgrerT8A0HtGl7ghlE/vm9Oavhe9tmFVLWkOCYLm/+4acf9xVy7zsale/6/9kcOUyoEcclp
	lZT7vPyWtBsQ2FXrAynAUZWkdW/S1Ey0ViDD0YwhpSJskBeJPn35lhpDpLMaXrlFgeS1B4awY2grx
	oXRflfdeC+dvuXmuLzMrfUzTL7+vnDua28GAXVHjzpv1ZzYnEypXLDkYFJr/CQsy1jWCjd4sd53wf
	dlm3SEluA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJBzz-00G8cL-93; Mon, 08 Mar 2021 09:16:23 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJBzr-00G8aA-My
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 09:16:20 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5F2EB22236;
 Mon,  8 Mar 2021 10:16:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615194973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSm22EZercwLIzd/SsvtIFgX1YzE6NowPAsgh9f2Q2A=;
 b=HJ1iYmntvjJE2fVyiDqrhl02U6T6Rm3pBAQ1f78SQesGSwySl7I+3AQFSH9JZ5pHa757Te
 OVG8/2Thj5AbKZ5wVfEHU0rWLb44Adk2F8Kshx2z40DBblxt8GI/Dzj6ncm7nHGQJoSiTs
 eDbOImJK7M489YWkBBe+FrQIWVF5kBQ=
From: Michael Walle <michael@walle.cc>
To: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
Cc: Michael Walle <michael@walle.cc>
Subject: Re: [PATCH 1/2] mtd: spi-nor: add block protection flags to macronix
Date: Mon,  8 Mar 2021 10:16:04 +0100
Message-Id: <20210308091604.3502-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303094833.139221-1-mail@david-bauer.net>
References: <20210303094833.139221-1-mail@david-bauer.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_091616_674718_3B327DE3 
X-CRM114-Status: GOOD (  14.13  )
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

> Macronix flash chips support block protection by using BP bits in the
> read status register. Add the corresponding flag to indicate block
> protection support.
> 
> Otherwise, locked blocks are not unlocked when requested.
> 
> Signed-off-by: David Bauer <mail@david-bauer.net>
> ---
>  drivers/mtd/spi-nor/macronix.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macronix.c
> index 9203abaac229..2d39dd32a64e 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -94,6 +94,7 @@ static const struct flash_info macronix_parts[] = {
>  
>  static void macronix_default_init(struct spi_nor *nor)
>  {
> +	nor->flags |= SNOR_F_HAS_LOCK;

Please do not add global locking support. Add it per flash device.
See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e6204d4620276398ed7317d64c369813a1f96615

-michael

>  	nor->params->quad_enable = spi_nor_sr1_bit6_quad_enable;
>  	nor->params->set_4byte_addr_mode = spi_nor_set_4byte_addr_mode;
>  }

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
