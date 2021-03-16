Return-Path: <SRS0=hRrE=IO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6034FC433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 11:16:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 034A465016
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Mar 2021 11:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 034A465016
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TGKJUuT8dXMb1JJYo3/uSOw0pf1HUN1UKC8Ae8imGaI=; b=Je4B5vaDaAAzGIXe+nlQaWMpU
	xGfD02ZZynrTz4HyeSr8zEIcWJBLBL194i1OpNmN9wxn0eLH5wH7728cZmq7uDWnPSeDNdqmg/VpL
	TWML9PK9IuCKiI2SxJPHPv3LRlf4V7GPw93FPcq/IKhBvd5NC7pQPOHAw11tOXz9yeFHFGInSAFRm
	1ga5Y8hs+LbDd/V/CKFJaiO1MDSXetPbq9DleOTHQyUPpl7ti+Yfrksuvdj0cRAwCOU4wCG5iAb5w
	mPJDLGoxhuK5TxTC82JOerI0rXjXVPWgG15KHqzSr+ztWaIKOCXWGiqNFsuaBbX4R7GFZ9w+okZkj
	RYBnRUL5A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM7fX-000Wlz-Ue; Tue, 16 Mar 2021 11:15:24 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM7fQ-000WlS-0e
 for linux-mtd@lists.infradead.org; Tue, 16 Mar 2021 11:15:22 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E751E22238;
 Tue, 16 Mar 2021 12:15:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615893315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/VAnFTM2V5VZe+SHwr7s9BLyFf+rzEmoHeV5Jv7zDYM=;
 b=ST+Y4dMcfT1Difl7Y3AcFpiI0XvWZiES16XX4gu3eYqGXtPxsut/5/mKRZZTlnmJa7+ibX
 INmPzsdxeP1qcaHtvMrrC2eh8QyQuqrkm1T9/lVrX9XaXp/XID0BOdjNVntVBqOMSInX6n
 XHTui+kj89eIqFyeEPpbikG6HghZjM4=
MIME-Version: 1.0
Date: Tue, 16 Mar 2021 12:15:14 +0100
From: Michael Walle <michael@walle.cc>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Subject: Re: [RFC PATCH 2/3] mtd: spi-nor: sfdp: fix spi_nor_read_sfdp()
In-Reply-To: <20210316110400.kepjn6b654lhq4dy@ti.com>
References: <20210312190548.6954-1-michael@walle.cc>
 <20210312190548.6954-3-michael@walle.cc>
 <20210316110400.kepjn6b654lhq4dy@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <25579f51e4e0626ad96bcaf2f8015260@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_111516_213669_DFB81BE5 
X-CRM114-Status: GOOD (  24.36  )
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

Am 2021-03-16 12:04, schrieb Pratyush Yadav:
> On 12/03/21 08:05PM, Michael Walle wrote:
>> If spi_nor_read_sfdp() is used after probe, we have to set read_proto
>> and the read dirmap.
>> 
>> Signed-off-by: Michael Walle <michael@walle.cc>
>> ---
>>  drivers/mtd/spi-nor/sfdp.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>> 
>> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
>> index b1814afefc33..47634ec9b899 100644
>> --- a/drivers/mtd/spi-nor/sfdp.c
>> +++ b/drivers/mtd/spi-nor/sfdp.c
>> @@ -179,19 +179,27 @@ static int spi_nor_read_sfdp(struct spi_nor 
>> *nor, u32 addr,
>>  			     size_t len, void *buf)
>>  {
>>  	u8 addr_width, read_opcode, read_dummy;
>> +	struct spi_mem_dirmap_desc *rdesc;
>> +	enum spi_nor_protocol read_proto;
>>  	int ret;
>> 
>>  	read_opcode = nor->read_opcode;
>> +	read_proto = nor->read_proto;
>> +	rdesc = nor->dirmap.rdesc;
>>  	addr_width = nor->addr_width;
>>  	read_dummy = nor->read_dummy;
>> 
>>  	nor->read_opcode = SPINOR_OP_RDSFDP;
>> +	nor->read_proto = SNOR_PROTO_1_1_1;
>> +	nor->dirmap.rdesc = NULL;
>>  	nor->addr_width = 3;
>>  	nor->read_dummy = 8;
> 
> NACK. You can't assume the device is still in 1S-1S-1S mode after 
> probe.
> For example, the s28hs512t flash is switched to 8D-8D-8D mode by the
> time the probe finishes so this would be an invalid command. Same for
> any flash that goes into a stateful mode.

I see.

> And you can't even keep using nor->read_proto to read SFDP because the
> Read SFDP command might not be supported in all modes. xSPI spec
> (JESD251) says that the Read SFDP command is optional in 8D-8D-8D mode.
> 
> I think the best approach for this would be to cache the entire SFDP
> table at parse time. This obviously comes with a memory overhead but I
> don't think it would be too big. For example, the sfdp table on
> s28hs512t is 491 bytes and it has 6 tables. Anyway, if the memory usage
> is too much of a problem we can put the feature behind a config.

I don't like to have it a config option, because then, if you really
need it, i.e. some user has an unknown flash, it might not be there.

The next question would be, should I leave the current parsing code
as is or should I also change that to use the sftp data cache. I'd
prefer to leave it as is.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
