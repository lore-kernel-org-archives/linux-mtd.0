Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908B7C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:50:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DF5064DA1
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 09:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DF5064DA1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3YYHhU6xOPIBv+fYlfSNrBnMyrhJcI1to7q6kKoNXHg=; b=OXxYQ+VcArWex2zTY5Vi3ytCY
	masJ7qmtNATXEXydheSJ+GaTcZ+06GKaRRsviMGRhF0RxeEQxXa2Z4HyNS4Xv1ueWXw4k1TRkooIi
	mLRGIB1ziVo2zvABnAWbfyLYkplDOY+qXFaUqJ08tyoUKBOH/gznkFdGzCmtO/d0SpftRw7L2xZ9E
	ECV9+/L3/kY4eaU+uqAXX+8vbYfImUQNtj8NieE7REHYZKuwg3/zlDyLNT/pEjaOdOhloKbFiGV2q
	IPFjOgHcRZE0fBRGimH9U2TJQjJbKYUhCS/gat6x8pPdvJ4BE/45UQRUmk03JK87L5nxtemtsoNQM
	658Qc+6CQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBwyi-0003s5-Iv; Tue, 16 Feb 2021 09:49:08 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBwyc-0003rS-P8
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 09:49:07 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8F80A2223A;
 Tue, 16 Feb 2021 10:48:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1613468939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1RksCp8eFbUv7eQ9L3AeUqfjGYJPVdXYUeHACDCoxyY=;
 b=YoWAVdCr95aHfT0nuZVWkUaORbtAvFL+1zH3iQvAhWd6cnHk7RGsNLeG7Jh2mY3n756C59
 O+fZVyK5SjmebLx6rWeoGSdGsTwEJrX2089GxMq2SwGlZbTanbFZ2qS3wIYlk2OnjAutYD
 IIUPwgexliOCY+Y7gZTHVsV5hLvuH64=
MIME-Version: 1.0
Date: Tue, 16 Feb 2021 10:48:57 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Subject: Re: spi-nor: maxronix MX25L12835F support
In-Reply-To: <20210216092743.jkhfjewu3cbnm5zm@ti.com>
References: <CAEyMn7ZEp9f1SuE6umRDWkr8bVT5hdRi-4F3+G-GP9anuGG1Bw@mail.gmail.com>
 <20210216092743.jkhfjewu3cbnm5zm@ti.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <d7e81d38064ba59a24ec243cb84a1d97@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_044904_347252_BBA44E23 
X-CRM114-Status: GOOD (  14.85  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Thiery <heiko.thiery@gmail.com>, linux-mtd@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-02-16 10:27, schrieb Pratyush Yadav:
> On 15/02/21 10:53PM, Heiko Thiery wrote:
>> Hi all,
>> 
>> I faced an issue with a SPI flash on our board. We use a macronix
>> MX25L12835F [1]. Unfortunately this flash has the same JEDEC ID like
>> the MX25L12805D [2].
>> 
>> The newer MX25L12835F has support for dual/quad read mode and RDSFDP
>> while the older doesn't.
>> 
>> I thought that I could do a fixup with a device specific
>> post_bfpt_fixups() call but by now this seems not possible. The older
>> MX25L12805D has no flags set that allows a call to
>> spi_nor_sfdp_init_params() and implements the fixup.
>> 
>> Has anyone an idea how to solve this?
> 
> The post_sfdp fixup is always run regardless of whether the flash has
> SFDP or not. You can try putting your flash-specific fixups there.

Well the problem here is, that the SFDP setup is skipped though the
flash would support SFDP. If the jedec id wasn't already in the table,
there would be the flag SPI_NOR_QUAD_READ and the SFDP would be
parsed. But because there is already the legacy device (which likely
doesn't support SFDP) it really doesn't fit.

Its unclear to me, why the SFDP is only parsed if one of the
SPI_NOR_*_READ flags are set.

>> [1] 
>> https://www.macronix.com/Lists/Datasheet/Attachments/7397/MX25L12835F,%203V,%20128Mb,%20v1.6.pdf
>> [2] 
>> https://www.mxic.com.tw/Lists/Datasheet/Attachments/7321/MX25L12805D,%203V,%20128Mb,%20v1.2.pdf
> 
> Both these links are broken.

mh, they work for me.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
