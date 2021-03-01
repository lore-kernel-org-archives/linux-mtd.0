Return-Path: <SRS0=zfSv=H7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2805FC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 21:32:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7E6360238
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Mar 2021 21:32:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7E6360238
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mECDNpRHdqYf1gOhcHT6Xo6vzm9sVCISrp9XsJEUNVM=; b=wtOXuRHsOGmfyP0QPne6KwSO3
	o2KNn/d/NdMVo//YeO41fcVMpvQ+zbRsISTQWMH34GEiQ3vsytHucl0OA7048pAgd1r5vprPjyYkX
	C25yEutI/rGXQqMrkf+SY/IrtVM47B/xhJOHyQHBIAqkO/++8J0VNUx0EC8lYwp9mq2AOrBMWeLdQ
	0s+cJGVMbIqJJgt4EKBnB+xwGidKxmCQWI4rCGDDQmQ9PoanorqktBNqXxHBIOffGcPj5nrmxo74W
	bnuzbCYCAk02TaxdX5PtOGHcrPwR4JXHE0LXukHLMEpD/gL4tDXWM/9A8wHFEZkjs/HE2VLH+KAv5
	bRLZ16tjA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGq8b-0003yb-RW; Mon, 01 Mar 2021 21:31:33 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGq8Z-0003xS-Bc
 for linux-mtd@lists.infradead.org; Mon, 01 Mar 2021 21:31:32 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4092622178;
 Mon,  1 Mar 2021 22:31:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1614634282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dWINdudDzqzZoFPV0ShG63eP1okbuhfWlZ+qNnyijRc=;
 b=IT8WdaGeBuwrWPy2PNVkWjGoDTOsGzYM1/YrQzPn2UZ2e/n8opxN00vJRIcEG0+7vGV72n
 nMuflnhJJBn1jdXteMP+EP30ASPnPg4HnZZFM7vTTTjQn4A+Fu1bdoXJUAJpb0wL5GKG3M
 qskNpuLH4AJJAPjP5eEeuZWFt61LNkw=
MIME-Version: 1.0
Date: Mon, 01 Mar 2021 22:31:22 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v3 1/2] mtd: spi-nor: add OTP support
In-Reply-To: <7d1f770ae750d6ed5fb942b16979cdcb@walle.cc>
References: <20210216162807.13509-1-michael@walle.cc>
 <20210216162807.13509-2-michael@walle.cc>
 <d4f74b1b-fa1b-97ec-858c-d807fe1f9e57@microchip.com>
 <7d1f770ae750d6ed5fb942b16979cdcb@walle.cc>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <a6ee55184d91fa1c1802bd82290407bd@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_163131_555900_01628048 
X-CRM114-Status: GOOD (  14.59  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am 2021-03-01 18:32, schrieb Michael Walle:
> Am 2021-02-28 13:00, schrieb Tudor.Ambarus@microchip.com:
>> On 2/16/21 6:28 PM, Michael Walle wrote:
>> Does the otp memory organization matter for the end user?
>> Can't we lock/read/write past region size, for example 2 or 3 regions 
>> in a row,
>> depending on length?
> 
> Mhh tough one. I guess the question really is: Do we want
> to remap the 0x1000, 0x2000, 0x3000 offsets?
>  - 0x1000 -> 0
>  - 0x2000 -> 1 * region_size
>  - 0x3000 -> 2 * region_size
> 
> This is just an example, some devices may us other offsets.
> 
> I'd see this as a prerequsite for handling multiple regions
> in one write, because otherwise you'll have to handle the
> holes which makes it impossible I guess. For example what
> would happen with (given an otp size of 0x100):
>  (1) lock(0, 0x100)
>  (2) lock(0x100, 0xf00)
>  (3) lock(0, 0x1000)
> 
> (1) will work, (2) should return -EINVAL; but what will (3)
> return. -EINVAL too, I guess. But then, ops spanning multiple
> regions doesn't make sense at all, because they will always
> return -EINVAL.
> 
> Unfortunately, I don't know how userspace might access it.
> 
> This is how it looks like at the moment:
> 
> # flash_otp_info -u /dev/mtd1
> Number of OTP user blocks on /dev/mtd1: 3
> block  0:  offset = 0x1000  size = 256 bytes  [unlocked]
> block  1:  offset = 0x2000  size = 256 bytes  [unlocked]
> block  2:  offset = 0x3000  size = 256 bytes  [unlocked]

Hm, I just found the following in the mtd-utils [1]:
"offset and size must match on OTP region boundaries".

[1] 
http://git.infradead.org/mtd-utils.git/blob/HEAD:/misc-utils/flash_otp_lock.c#l25

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
