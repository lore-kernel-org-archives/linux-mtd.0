Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34214C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jul 2022 14:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/juJsK2ZvqHrEru+f6LcNeoxgj8SQcMw3YfB1xRkqKg=; b=OX4oF6jS6fpmTxI3bOyCeNtY8B
	eA7uT14otbSqv+jvVZ46l5vPBjD0GUKM8Kxl59FLK3j/U1paFATyjSa8+v5sdD/YaLs6TGKA5wNXe
	O9tZYg79Sl7Wo+D1T0q9aPO8GuMZcLeayJT6iy/59rbcbeF2qH6gzTOWr35x0c7THF11gTTNJY6Z2
	MXrPB8PdaEshCuMPACjIDsc3EaQCqRuxqt4mlKw2kb8/ryKjweWvSthxJU3ON36mDc36Bp8EL6tK6
	s0NkmLawmUIDa2/ZRQNG4jsy/pJq3/HjuYePogFR84Zfv23B3SOJwRZN21zwCOnt9qY/lKo41mCfD
	TYz/xHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBze4-00F6hh-HM; Thu, 14 Jul 2022 14:16:48 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBze0-00F6cl-Ru
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2022 14:16:46 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 5A75722238;
	Thu, 14 Jul 2022 16:16:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657808199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i4hkXMmFP+CHQ05L6lGn9y6aeHyZZDWO3dv2qnfJNbI=;
	b=nNAGnq+MNxIYaLLhUxVHcQUBPZA+T0V9Z/XOTnEAh5DWVO8Q/dLrTgswYOd1d5GoQ/PaIE
	sGh1JnJBKdPlXfkYG0abvN/nb3jzF8h/MWvYwtO5Ifoh4IbuTp3Ee0F8nHI5yv8hWlYezg
	htvnggQyWQfOyolVvfUDhr5/ioYuuJw=
MIME-Version: 1.0
Date: Thu, 14 Jul 2022 16:16:39 +0200
From: Michael Walle <michael@walle.cc>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: clg@kaod.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, quic_ggregory@quicinc.com,
 quic_jiles@quicinc.com, tudor.ambarus@microchip.com
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
In-Reply-To: <63cedfce-34bb-ed63-3871-75a6c3dd5d73@quicinc.com>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
 <20220711095042.2095360-1-michael@walle.cc>
 <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
 <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
 <2260955b-354d-ceda-cadc-49453bfca3e4@quicinc.com>
 <00f0c9d480ef5a414f1c34492661bd9e@walle.cc>
 <63cedfce-34bb-ed63-3871-75a6c3dd5d73@quicinc.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <6be710bb5c1bf0449e54a54b78f6f7a0@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_071645_124650_83719547 
X-CRM114-Status: UNSURE (   8.11  )
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

Am 2022-07-14 15:47, schrieb Jae Hyun Yoo:
> On 7/14/2022 12:41 AM, Michael Walle wrote:
>> What does "doesn't boot at all" mean? Are there any kernel startup
>> messages?
> 
> I'm sharing the error messages below.

Thanks.

> [    0.748594] spi-nor spi0.0: w25q512nwq (65536 Kbytes)
> [    0.865216] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:4 
> [0x406c0741]
> [    0.872833] ------------[ cut here ]------------
> [    0.877984] WARNING: CPU: 1 PID: 1 at drivers/mtd/mtdcore.c:583
> add_mtd_device+0x28c/0x53c
> [    0.887237] CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> 5.15.43-AUTOINC-dirty-23801a6 #1

Could you please try it on the latest (vanilla) linux-next?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
