Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F14DC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 10:27:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDC126008E
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Nov 2021 10:27:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDC126008E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eH5DUoQiYlvlmD3L6ht/DJGxP2IUuebe9PYKWPY0As=; b=1bCstiz2GqxtmP/N/xpIWmIJqx
	87PnUPT6LZaIDdI1vOJlcmMAthIExgM7rsdAMM3LksDDpJmVEtT+DLScPahMEgpW0pzi8ge2USw+S
	MW5Y3ukCJGt6kIYd9UTL1Vhn9t0nyys2lUvXpp3P/+jumEMNuquEMd05sTB6OmNOqtR8fEbHT756m
	85DLMIcn26rlE2ew/7Qaun28IeLlyGYfjywjJxr3Rf1aRObAFvLJfdD9ZNf+c6HjJrfgpu1YqXFu8
	4XbCUtlMKfNpk0rzZAeR3OxybZL1dGObLzfBj0JtVIwctHUoplw+jl2Z8h3ggFxjmv+xBwVALsv0L
	h6iZslhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkOL7-001Wea-BT; Tue, 09 Nov 2021 10:26:53 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkOIb-001Vsr-AM; Tue, 09 Nov 2021 10:24:18 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0DEE922234;
 Tue,  9 Nov 2021 11:24:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636453455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iyr4HK32S+KXwv/qyoEwE1AGNi6lczkGDzAJBefPqYI=;
 b=roa6YjVhP4CIjtMsEX2jLWsB09jXF09jDNHRYVOc60e0QtzweSfq736n9Ubzm1y40duhqp
 Oz1W9FawwKbzoLDL/Y4vahI8h1JmvODJiH7uREzF0gpV65oR40eMBpRm0umusFYevPVTnM
 r01Sdt6410+GVb8+0nkYA3Xyazy3lA4=
MIME-Version: 1.0
Date: Tue, 09 Nov 2021 11:24:14 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 10/25] mtd: spi-nor: sst: Use manufacturer late_init()
 to set _write()
In-Reply-To: <a82dddac-e258-c87b-be9d-73f1dd336051@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-11-tudor.ambarus@microchip.com>
 <6bd3505f4c87d6b1ceeaaf51e3dfcac8@walle.cc>
 <a82dddac-e258-c87b-be9d-73f1dd336051@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <036190ec9252722fb9e13e7124638b60@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_022417_575170_E3A171B0 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: macromorgan@hotmail.com, vigneshr@ti.com, jaimeliao@mxic.com.tw,
 richard@nod.at, esben@geanix.com, linux@rasmusvillemoes.dk,
 knaerzche@gmail.com, Nicolas.Ferre@microchip.com,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 code@reto-schneider.ch, miquel.raynal@bootlin.com, heiko.thiery@gmail.com,
 sr@denx.de, p.yadav@ti.com, mail@david-bauer.net, zhengxunli@mxic.com.tw
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

>> SST_WRITE is only used during to set this. Shouldn't this be
>> a fixup per flash so we don't need that flag.
> 
> We should get rid of the SST_WRITE indeed. Do you want me to handle 
> this
> or do you want to take care of it yourself?

Well you already got a patch (in this series) which will do exactly this 
;)
But I didn't notice, because its later in this series.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
