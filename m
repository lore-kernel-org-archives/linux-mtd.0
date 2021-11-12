Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECA06C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 21:29:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC64360F51
	for <linux-mtd@archiver.kernel.org>; Fri, 12 Nov 2021 21:29:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC64360F51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zk35+oAEB1P56Qt7JYTxS3I7GSkg9wzf23Mfisa5eiI=; b=c+CdA8XzBBOBBBgPl5K1niMED7
	rA3MGa3iaKX3tQqsjsg2miyIFO7B8nCdzraHTEOs/wfQqU57IDrvkJ30WwJ5KXbeet0qfQUvmQcqB
	pfd6CmYwhMX4RGhu07k1wDhZIaAXg5/Bouzc34TWrU1y0bH9mzxl9nlaSzIs+81jHlj/R6t/Md4zV
	9bTOb98Z5pUV4JwavxIby/3Cet7UpO7s2NeljK+1Ybizq2tlRd64vRMutTbl0KlvP/Pjrf/TsPBBK
	YBRe/4GryotvoyRQntxTMz+6ygnycG4KQxSjB7DusgAS24oIe+UGV9Flu9/h5qZ9rOLCIxfZbSqjO
	5nc1ekyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mle6a-00BbYP-Jv; Fri, 12 Nov 2021 21:29:04 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mle6M-00BbUu-HQ; Fri, 12 Nov 2021 21:28:52 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 893E722175;
 Fri, 12 Nov 2021 22:28:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1636752524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9x5G7L2qE7EZiLaOS3ZgDaofIZhSn9S4dJDcicP12ws=;
 b=BXnFpcc3FhHongV+X1R6BPOTF/vvjAmtN4vkYxGEbGlrI3+kzTnnRTlPVrxv6GaQ37A/fw
 w5DK3npZWAcL6RXzsRSAtrktlvOzBFFJ/3EB6l0jKB/rbYoh7IfhP9k4O7oxGgJ5/3dNQt
 b11SU94INSHrEhbuN2gDgC0laQG87VI=
MIME-Version: 1.0
Date: Fri, 12 Nov 2021 22:28:42 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 13/25] mtd: spi-nor: sst: Get rid of SST_WRITE
 flash_info flag
In-Reply-To: <0d7dc115-f616-bd20-a924-f7ebb7649812@microchip.com>
References: <20211029172633.886453-1-tudor.ambarus@microchip.com>
 <20211029172633.886453-14-tudor.ambarus@microchip.com>
 <ef9e5b2e36b37293a8761cd01e334877@walle.cc>
 <0d7dc115-f616-bd20-a924-f7ebb7649812@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <8bc435899268dec5a3329e9bcfe30440@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_132850_781682_EC6D0C50 
X-CRM114-Status: GOOD (  17.23  )
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

Am 2021-11-09 13:31, schrieb Tudor.Ambarus@microchip.com:
> On 11/9/21 2:21 PM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Am 2021-10-29 19:26, schrieb Tudor Ambarus:
>>> The flash_info flags should be generic and not manufacturer specific.
>>> Get rid of the manufacturer specific flag and use the late_init() 
>>> fixup
>>> hook instead.
>>> Please note that sst_write is now set at flash level and not 
>>> globally,
>>> per manufacturer. Manufacturer hooks are generally a bad idea, 
>>> because
>>> it affects settings for all the flashes and we might end up with 
>>> fixups
>>> for "manufacturer settings".
>>> 
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
>> 
>> Reviewed-by: Michael Walle <michael@walle.cc>
>> 
>> I'm still not sure, if having a just one fixup function will scale 
>> with
>> different flashes. What do you think about having an additional 
>> (opaque
>> to the core) (bit)field for the manufacturer and flash fixups 
>> functions?
> 
> Sounds fine. I can reserve few bits to manufacturers and introduce a
> MANUF_FLAGS genmask for the flash_info flags. Each specific 
> manufacturer
> flag will be visible just for that manufacturer. Please check patch 
> 14/25,
> I can extend the idea from there.
> 
> 
>> In this case, you can reuse the same function - and then a 
>> manufacturer
>> will make more sense (addressing Pratyush comment about a common
>> manufacturer fixup here).
>> 
>> I.e. the SST_WRITE flag would go into these flags, set per flash 
>> device
>> and the fixup can still remain in the manufacturer fixup.
>> 
> 
> Right. Let me know if a MANUF_FLAGS genmask is better than this patch.

Yes, I think so.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
