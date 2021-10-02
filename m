Return-Path: <SRS0=Xs+q=OW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CAB4C433FE
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Oct 2021 13:15:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECEA961B20
	for <linux-mtd@archiver.kernel.org>; Sat,  2 Oct 2021 13:14:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ECEA961B20
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PU185VUXWPZxSBqE2R+iVYHUh0pIM8dXMXGRc4w98yM=; b=CFJkkas0tJ3bo1nmCPMMhmK1wM
	PBG8bbHGBoZ01Zg1ZXfyCS+WmMqKJXHFxurB6x8nxY0O6MAsGH0wmy4AnrHfne4gd129PxjBzsJhn
	OhYTbpzNptc5LcsH6XtJfK7WV2Fj0Rq7U7YcHFWZs+4JdklyoPyYPvhjzQ4aANS1XKyBVnpFGMLXB
	fJ6Pa5ZYHyyskNbeOlMuDO6TU3sgau10KOeQsp4uGnLaKB+KOYPjsGEJljukzXsKXJJmpkNApxLey
	h8GqZi6GTk9kdRDkBrQseSKUrvpd0Dzms3p1n82aIxfYjn07bcUvzTNxy5pENcammOP6gF2yKwQDI
	VRLFtlhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWeqO-002FPl-Jt; Sat, 02 Oct 2021 13:14:24 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWeqB-002FOa-Rp; Sat, 02 Oct 2021 13:14:13 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 44B8322247;
 Sat,  2 Oct 2021 15:14:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1633180448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aue7FLoZIkIfAqBNymr8R2Hmh992Gw20tf/68ZlzSoI=;
 b=QJvkpiljQpqrq5fGFAxVBsCicfVL+dG1vrWrDcrboL5s7BUkJkQoyAEF7N+V/WeaTnxDM8
 FVlq4EifRw0Nstz6Sg3TwC88WntSg+PapkIq7Z1ZRnoUZLHjTqPUR54dOtbBVnlLyqcr4I
 8e6FGmWVvg7iR9AtOQPoZaEBRucaf08=
MIME-Version: 1.0
Date: Sat, 02 Oct 2021 15:14:07 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v2 14/35] mtd: spi-nor: spansion: Use manufacturer
 late_init()
In-Reply-To: <d5f6181f-850c-122f-ebd3-57ac6c3eb1c6@microchip.com>
References: <20210727045222.905056-1-tudor.ambarus@microchip.com>
 <20210727045222.905056-15-tudor.ambarus@microchip.com>
 <ebfc420928ef28bb508148b41f55b0e6@walle.cc>
 <d5f6181f-850c-122f-ebd3-57ac6c3eb1c6@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <dd418648f206faa64f10dd1c81caae31@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211002_061412_093543_0C9122FA 
X-CRM114-Status: GOOD (  12.77  )
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

Am 2021-10-01 14:14, schrieb Tudor.Ambarus@microchip.com:
> On 9/10/21 1:02 AM, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Am 2021-07-27 06:52, schrieb Tudor Ambarus:
>>> spansion_post_sfdp_fixups() was called regardless if the flash 
>>> defined
>>> SFDP tables or not. A better place for this kind of parameters init 
>>> is
>>> in manufacturer's late_init() hook. post_sfdp() should be called only
>>> when SFDP is defined. No functional change in this patch.
>>> 
>>> Instead of doing the 4b opcodes settings at manufacturer level, thus
>>> also for every flash that will be introduced, this should be done
>>> just where it is needed, per flash. I'll let this for other patch.
>> 
>> Mh, then why does some flashes define SPI_NOR_4B_OPCODES. It's
>> unclear to me when you would use SPI_NOR_4B_OPCODES and when
> 
> check patch 18/35, I dropped the SPI_NOR_4B_OPCODES flash_info entry 
> flag.

I wasn't that far down the patch series when I reviewed this patch. Ok.

> 4b-opcodes support is SFDP discoverable. Where flashes define the 4bait 
> table,
> they will fill the support by setting SPI NOR SNOR_F_4B_OPCODES flag. 
> Where the
> 4bait table is not defined, SNOR_F_4B_OPCODES should be set in a
> late_init() hook.
> 
>> this individual fixup. Also right now, these SPI_NOR_4B_OPCODES
>> flags for the spansion flashes are superfluous, no?
>> 
> 
> there's no spansion flash_info entry that explicitly declare 
> SPI_NOR_4B_OPCODES,
> if that's what you meant.

after patch 18/35, yes ;)

Reviewed-by: Michael Walle <michael@walle.cc>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
