Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA79C54FB9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Nov 2023 08:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6J7mCF/pmDJdBUODrso7YWgfRwlk+4MG5/ntJbEhD0=; b=GJdhcDEH+p+fEmWhhF5AxrmYhN
	WoJe8BAa5W5igaNkrgf00ntRXG86VKlfWJFglGXFE5aXlX/rxZI3XciZjHJ8b+nSHqkzehxt4SHab
	wP4aSS0buNx9cbpfO+fGx1VkrwNlolfrS9G69jyYvIL4pWdt4ZSJudOfSxucc4NMWZW0NWaS8ECdq
	YkHJGDGRDcprdb98q5wBoAtWlwGvilL21rPX5lzrmMnt+wcv9b8Lhr7l2OGRGU4p452j/eZ5wFHs6
	xmQqsy0g8V/5Y/D71d0zNL/Ql6hbEQR6A9fthbbq+VJWQmJ4Jn7mhWbMijihpJuMeNBXS872zzgAE
	gSAXmljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5MIs-00G1iF-2t;
	Tue, 21 Nov 2023 08:40:18 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5MIp-00G1hG-1d
	for linux-mtd@lists.infradead.org;
	Tue, 21 Nov 2023 08:40:16 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 83F4AAA;
	Tue, 21 Nov 2023 09:40:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1700556013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XTqZCmRZDno6afkESwvA9qiNCsSA6cxPliBOX19XcLo=;
	b=BYEGvabIcD+Z0P7toNbnEi/pPD4yE5rZ6/jmUgIyCQgZusweFGrU89UNFnMsEd8cyx6BkH
	Oip6P5pFbMDbHJfTEE/PIzx6V4pdktBH8E35PijckXU56c6YZ0yD9tSypXT86kwff22vAC
	5WVFrzx9umM+OOdUbn/mpcjv1mU08ZytWeuCUAVFf6qcp08F0gsLtI5F8aWdWE0EjOq5JQ
	saAGwCBpK8DXAWLXDXjJeJBzrJ0n4lWwCbE2WLbXZM40tWQUJ5dHy/SZEvDt4dMuhMrXQj
	zLX1iinEopXyE1J8wNRr83SIvwKl7KIvEp+izU39TpUlty2Gem0WpjjBd9xcBA==
MIME-Version: 1.0
Date: Tue, 21 Nov 2023 09:40:13 +0100
From: Michael Walle <michael@walle.cc>
To: Jaime Liao <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v5 3/6] mtd: spi-nor: core: Allow specifying the byte
 order in DTR mode
In-Reply-To: <20231117083853.33329-4-jaimeliao.tw@gmail.com>
References: <20231117083853.33329-1-jaimeliao.tw@gmail.com>
 <20231117083853.33329-4-jaimeliao.tw@gmail.com>
Message-ID: <156569dc0b92a7bfbef59a10e6f42224@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_004015_701546_636637EE 
X-CRM114-Status: UNSURE (   7.09  )
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

> +static inline bool spi_nor_is_octal_dtr_swab16(const struct spi_nor 
> *nor,
> +						enum spi_nor_protocol proto)
> +{
> +	return (proto == SNOR_PROTO_8_8_8_DTR) &&
> +		(nor->flags & SNOR_F_DTR_SWAB16);
> +}

I think you can keep this code, but SNOR_F_DTR_SWAB16 only makes sense 
for
SNOR_PROTO_8_8_8_DTR, because this is the only protocol where one clock
cycle transfers more than 8 bit. Are there any other use cases?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
