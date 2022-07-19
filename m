Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559F2C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Jul 2022 07:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y6ik9NuskFZddGrBa+JtEyLLOFwy7QEG0sCAoKzX4jU=; b=HwnskFisHVm6dlHLTccb8IpwYt
	QeFJ5tkP/8ptkzIXxFG4PwhSq4EowPIo0LqS+0IdB/jF0Nk0ro1B8g4jnk5D/MLoNQTeh82Olnl4Y
	Edh0iERp9CMc+ZWQsYbpQgveXJmEz8fEPFV+j0qW/AhRNb5ErAdZs+v4L6rd1lafwdL4Xf/TlYXeP
	FA2jbUpkTUOOalZuyCnXvSLyRwKnBrJc7jo+UeqiVRq1JXSbP75c0nmeRxAWIzdlObx9m3CTQA9q5
	sl3Ju60naIsupPgOvYzgdksDKkKaQKGLOl2tW+wRD1JZCuOhG7FpPVnH6QogC7K7PYnUV7vTqqfaw
	6781uB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhKA-005oPZ-Sz; Tue, 19 Jul 2022 07:07:18 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDhK8-005oMo-8A
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2022 07:07:17 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 0D0CF221D4;
	Tue, 19 Jul 2022 09:07:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1658214431;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+hc/fgBpwn4nfyKBqGshJaCyj+0/ns0DEr+WNZ/nNBE=;
	b=hp7Q7Us9wZQRMYOhLaKFlYu1g61zrgdBCiRcLQp54CHRWhluJ7isCnS4MExQL3xtF52L1z
	TNuhUKLRPhMYgzepBS4MQ+yge8hNlHgIzwFUsNb8Z1m3ATNCDCbqJ4Qso4bsu77eOVxAY4
	D+u/dlGVwitW7ihSZsxLuo/ukGQlY+0=
MIME-Version: 1.0
Date: Tue, 19 Jul 2022 09:07:10 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
In-Reply-To: <160ddac1-6d0a-c922-1380-09e7823a285e@microchip.com>
References: <20220510140232.3519184-1-michael@walle.cc>
 <20220510140232.3519184-2-michael@walle.cc>
 <160ddac1-6d0a-c922-1380-09e7823a285e@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <02125e047cfbf347d81811224be3141e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_000716_478019_E37D1171 
X-CRM114-Status: GOOD (  14.73  )
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

Am 2022-07-19 07:57, schrieb Tudor.Ambarus@microchip.com:
> On 5/10/22 17:02, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Up until now, flashes were defined by specifying the JEDEC ID, the
>> sector size and the number of sectors. This can be read by parsing the
>> SFDP, we don't have to specify it. Thus provide a new macro SNOR_ID3()
>> which just takes the JEDEC ID and implicitly set .parse_sfdp = true. 
>> All
>> new flashes which have SFDP should use this macro.
> 
> I like the idea, but you need to refine it a bit.
> Your assumptions are true only for flashes that are compliant with SFDP 
> revB or
> later because params->page_size is initialized by querying BFPT DWORD
> 11. I think it would be good to specify this in the comment section.

Sure.

> Also, I think you introduce
> a bug in spi_nor_select_erase() when CONFIG_MTD_SPI_NOR_USE_4K_SECTORS 
> is not
> selected. wanted_size will be zero, will you select an invalid erase 
> type?

You mean to squeeze [1] into this one? If so, sure.

-michael

[1] 
https://lore.kernel.org/linux-mtd/20220716000643.3541839-1-quic_jaehyoo@quicinc.com/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
