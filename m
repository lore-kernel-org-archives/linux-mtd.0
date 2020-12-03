Return-Path: <SRS0=8A79=FH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07CE0C0007A
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:51:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 972FA22BE8
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Dec 2020 14:42:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 972FA22BE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w/p7AK3rqk+B7b4OVg1SCRPJE1Vu2QEUly1TlhlPyxM=; b=Jmf6eRiNCgEHkC++p6MPPxHCg
	fKR+g2z9zrxQfznM54un+9LuLgGpz1R0q6SaAuAo8r12fD1mzfiD6mI7ZqWwZLoDYQxJ2d0mJ0KOg
	KjaUX0h1V5dOeTjda53uSKkWWqWtJOMzx1FNFCtruXwrrgIDvBZ1b3Qowji9bQizV3B+TT0YsMnMp
	LdqyIxzuRRJTh8JehY+UCJM3Sucw64zzrcf9LV35HiPMIJ1n1bU3cvn44RXH7ufsh3S7haVswC4qo
	kJYu/7n3qXBPlftoEFJFbQnPnF4DYLoQDlNVgJod07ByRYi3PWLznY4Jh/E3mIAivtzniZ2mIlmhP
	dkP/7Atew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkpnk-00022A-Dx; Thu, 03 Dec 2020 14:41:44 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkpnh-00021H-Kx
 for linux-mtd@lists.infradead.org; Thu, 03 Dec 2020 14:41:42 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id BD21C22EE3;
 Thu,  3 Dec 2020 15:41:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1607006499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bei1lhwQJZstsY68ENjaQ70P2t4ZlXIf/DRsO9Ikv8M=;
 b=lRyS9HqBpXCKuDCKhCRgon9jFgYgw2tvU0SX68nRFY7yDVfReemuipwKL5/UxueQdrKe3B
 YWl3vIEwSnlgjYcBVx65YikHJLIjFrv769+3dTg4FQBfgdkJRc89saMqNiavWh7iEz+Okd
 TxFPvJ2quFggUC8jcyy1wY1+wRAT7VQ=
MIME-Version: 1.0
Date: Thu, 03 Dec 2020 15:41:39 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v7 1/7] mtd: spi-nor: sst: fix BPn bits for the SST25VF064C
In-Reply-To: <fe37e295-9d74-160c-9b16-bbd5dcd5a638@microchip.com>
References: <20201202230040.14009-1-michael@walle.cc>
 <20201202230040.14009-2-michael@walle.cc>
 <fe37e295-9d74-160c-9b16-bbd5dcd5a638@microchip.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <9811370c4350a812ddabc5b9b86aa2a4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_094141_831368_90512588 
X-CRM114-Status: GOOD (  11.94  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2020-12-03 15:40, schrieb Tudor.Ambarus@microchip.com:
> On 12/3/20 1:00 AM, Michael Walle wrote:
>> --- a/drivers/mtd/spi-nor/sst.c
>> +++ b/drivers/mtd/spi-nor/sst.c
>> @@ -18,7 +18,8 @@ static const struct flash_info sst_parts[] = {
>>                               SECT_4K | SST_WRITE) },
>>         { "sst25vf032b", INFO(0xbf254a, 0, 64 * 1024, 64,
>>                               SECT_4K | SST_WRITE) },
>> -       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128, SECT_4K) },
>> +       { "sst25vf064c", INFO(0xbf254b, 0, 64 * 1024, 128,
>> +                             SECT_4K | SPI_NOR_4BIT_BP) },
> 
> And I would put 1/7 after 4/7, so that I can set the locking flags
> in some order: SPI_NOR_HAS_LOCK | SPI_NOR_4BIT_BP. We first indicate
> that the flash supports locking, and then what kind of locking, BP3,
> and not the other way around.

If that patch shouldn't make it into stable, then yes. otherwise, I've
put these patches first to not cause merge conflicts.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
