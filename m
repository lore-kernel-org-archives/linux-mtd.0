Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BC0C43334
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jul 2022 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sXRGAEGhuhiem28qfFmhXOZQAoA4i0yWwQBP/h2hQLU=; b=3toE4qVhxR+dtTD9gUWpeGm1/q
	Pw01mcuzxPAcaoFkqllkL7P1ISEjynh9ZXMq+6zsm1BndDO/eKRzT84oNOxy12c4OLS6KHA3Pe35J
	kA+7BSTup8CGpr84Lr0ruwTu/w9RtSpgkVkrfllBOQrDc1G/407WXQ9fJg/tFRkgYbL5lpE/5gnO9
	W819mOXqSuLk+dPESSE8k1xYhWLDB9BqSrMWl8vCgPsyBtQw1CvuzzwDbZZ33l260+tKWD3VOt0Ab
	oRjAVF/QNC0tg1BbzpF6vs4fpFAjY8johLOcpse2jTRreaXYUIN+ctUlQARHepdkgYyH41qFCzVAp
	HtJOCkaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdQ6-004XoJ-St; Wed, 13 Jul 2022 14:32:54 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBdQ3-004XfL-EF
	for linux-mtd@lists.infradead.org; Wed, 13 Jul 2022 14:32:52 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 857AF221D4;
	Wed, 13 Jul 2022 16:32:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657722759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=duF3Y9Z02+1a67NZ+Hlfg5VSoW3ZmuWvDf5dQcHYzN8=;
	b=FO+wQKwZIzWjF3oOb7rj19/1KM4CKVAWVtrpt2+C0ESOkyPvH8W/PhlpgDHFGCM4kM1yMH
	5T8yBKYBC3J4iQzC+dUOLVh8KRWy+UHsC+a8zRU7iSpx8RXUk6oaEFsQVjFTqOO2SGyDps
	Si5SbtFEho3nmREwOiMjvfDqKatBqj0=
MIME-Version: 1.0
Date: Wed, 13 Jul 2022 16:32:38 +0200
From: Michael Walle <michael@walle.cc>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: clg@kaod.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, quic_ggregory@quicinc.com,
 quic_jiles@quicinc.com, tudor.ambarus@microchip.com
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
In-Reply-To: <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
 <20220711095042.2095360-1-michael@walle.cc>
 <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_073251_657773_1441B314 
X-CRM114-Status: UNSURE (   9.37  )
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

Am 2022-07-13 16:26, schrieb Jae Hyun Yoo:
>>> +	{ "w25q512nwq", INFO(0xef6020, 0, 64 * 1024, 1024)
>> 
>> Please use INFO(0xef6020, 0, 0, 0) and test wether it will still
>> work correctly. We will then be able to convert it to SNOR_ID3()
>> later.
> 
> Tested it but it doesn't work with INFO(0xef6020, 0, 0, 0). I'll keep
> it as is.

Can you please look into this? I'd expect this to work if the SFDP
tables are correct because all this should come from the tables.
You can look at /sys/kernel/debug/spi-nor/spi0.0/params and see
what is changing there.

Thanks,
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
