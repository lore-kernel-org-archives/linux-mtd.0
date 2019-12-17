Return-Path: <SRS0=6Vgz=2H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2096C43603
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Dec 2019 08:58:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5B012072D
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Dec 2019 08:58:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MWQJY3l3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="FwKkOJ07"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5B012072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmmOUMxb8HZlBHSIN+QZGWsUAyxEQLbyCwRTRewY3CM=; b=MWQJY3l3nlFFp/
	CdsiwEZ9UTv47RHGl1BPNBwV71ZiEvVxvUZCmk0SveHBSA8sPMboZvXFV1GohU/FvB6uMXInPW/rb
	FcVzW0QVjgQhgSQ4V+NAUCiFPshRG5oOlAnEybTGxLEtquX2Kcn51y24p3UxJnz3h9PsQyu1UmFiD
	Tz8+skch9yEfge5tY/DI1/XsFeT/uyToVd6+uQLHHwJ1MbPdz9G2opf58NPD3oi1luKUB4pZEzsVo
	q+0ruLwAO39DAegUKX3JzrwPsi/qTzvTwqoKKH/oiqymSgSzELCi5fVQajTckkhFkJ+YmBBZqht4G
	DnkFkHXrPixrGbJ1ZIHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ih8fx-0006tV-Lt; Tue, 17 Dec 2019 08:57:53 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih8fs-0006t6-UT
 for linux-mtd@lists.infradead.org; Tue, 17 Dec 2019 08:57:50 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBH8va5Z014726;
 Tue, 17 Dec 2019 02:57:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1576573056;
 bh=HYWYjlNMdWj34JNvgLJyIrStyNuqiYxy4719U+yi3Ro=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=FwKkOJ07ncUMJcoe1QeC/+HHb+PzHI9m4VIike+jRoI3m/6ixPEsZX8vWt/rdNSkD
 4/dFB+A3e+8NzA/ihVIQ0J7c9jmFW7937MXWttE8/WRMeTrHf8rgICWIBSHttpVzm8
 xcx6PLsUg/NWX4EeaFSFoB4fHapMoO54v13QTTe8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBH8vaog016399
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Dec 2019 02:57:36 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 02:57:35 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 02:57:35 -0600
Received: from [172.24.145.199] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBH8vXXi076193;
 Tue, 17 Dec 2019 02:57:34 -0600
Subject: Re: flash_lock issue for n25q 128mb spi nor part
To: <Tudor.Ambarus@microchip.com>, <john.garry@huawei.com>,
 <linux-mtd@lists.infradead.org>
References: <bbebfe85-73dd-3bc2-01e1-a7493ffad5ef@huawei.com>
 <42e10e49-5ec0-e4a3-bd11-e9fa0cc0d9b1@microchip.com>
 <6ade1621-2d3f-6ddd-64a3-6405b07802c6@huawei.com>
 <a5a59108-bec3-40b4-bd37-76b060fffa93@microchip.com>
 <36c733b3-acac-4779-480d-7f0ae1db710e@huawei.com>
 <f60b2b0a-f3c4-e55c-2087-30b17e81c40a@microchip.com>
 <ce595e1f-a703-e1f1-264b-6c7e66dcc1fa@microchip.com>
 <00cf6eab-9798-b0e9-e4a2-5b2f8374b698@huawei.com>
 <b73c8a25-a58d-a1f1-f68c-0ba35a5c7c51@huawei.com>
 <9d41bfca-f4e3-beb2-ff7f-78be49e8d80e@microchip.com>
 <32a6af31-341b-67cf-a98d-d77a495c7ecc@huawei.com>
 <ee532299-eaa7-28b5-d34c-46816640a1f0@huawei.com>
 <c1a92c89-020d-0847-b7bf-41dbfd9b972e@microchip.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <6667f429-4732-d098-843a-7a030010f192@ti.com>
Date: Tue, 17 Dec 2019 14:27:33 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <c1a92c89-020d-0847-b7bf-41dbfd9b972e@microchip.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_005749_060305_E891F6AF 
X-CRM114-Status: GOOD (  14.98  )
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
Cc: broonie@kernel.org, fengsheng5@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Tudor,

On 12/16/2019 11:39 PM, Tudor.Ambarus@microchip.com wrote:
[...]

>>
>> But, as you may see, it seems that my change to spi_nor_write() is still
>> required to stop the first unlock failure message, but it needs to be
>> relocated to after write_err label, as we now jump there for
>> spi_nor_wait_till_ready() failure. I guess the equivalent relocation is
>> also required for spi_nor_erase().
>>
>> Or maybe spi_nor_wait_till_ready() should clear this flag always.
> 
> I reproduced this on a n25q256a, with both erase and write. Did a lock,
> an erase or write, and then the unlock raises an error on the read back test:
> it receives 0x02 to write (the prev operation let the SR.WE set to 1),
> and after write, it reads back 0x00 (which is correct, WE is de-asserted).
> 
> What is pretty strange is that Micron says about erase or program operations
> that: "When the operation is in progress, the write in progress bit is set
> to 1. The write enable latch bit is cleared to 0, whether the operation is
> successful or not".
> 
> So what I guess it happens, is that when an erase/write command tries to
> modify a software protected area, the flash completely ignores the command,
> so no Write In Progress, and no clearing of the WE.
> 


From PROGRAM Operations section of mt25q datasheet:

" When a command is applied to a protected sector, the command is not
executed, the write enable latch bit remains set to 1, and flag status
register bits 1 and 4 are set."

So, Data sheet is quite clear about this and SW would need to clear WEL
(if required) after write failure.

Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
