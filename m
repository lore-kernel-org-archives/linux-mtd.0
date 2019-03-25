Return-Path: <SRS0=pM9p=R4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F68C43381
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 12:57:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 297E420823
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Mar 2019 12:57:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tq6KwHx7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="bW0jCIAV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 297E420823
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rfpuqf0Ev408wIhA1VTN/sZO9hk9Qp7an9JuAEkKqU=; b=Tq6KwHx76bUhkw
	nVaUvN/wSBNKd2w260S2PTB05c6pVr5rn1bgOAxJeB9cgMlD2OQ7X/hmxWpSV5f1+mU0nSaqomOBU
	yoik2jVKVLMNAM283ApdUqBFBx8EQIlGnxg3l56QctfHaWGjrg+G6Jn3kody/Uh+uEtkSXHxht3O2
	b5JVh81LWqfi/8d5TpL8qJpFTmdjE6HoCQy1SnDGWUsM+EHEroMh9FGxDDw4c2i9V1bDt2Y/DK7Rm
	mZXuiZmlApoU/mVBZbsG4/uIzaQjR+lrs9WeGV7abDhzIlcKfIIJ5hPSeXZLkH/D72nlyqVU1GbpW
	h80FvOxNIEgVBOAwN2hQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8PA8-0004q3-OR; Mon, 25 Mar 2019 12:57:12 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8PA3-0004ji-6j; Mon, 25 Mar 2019 12:57:11 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2PCuqgM113732;
 Mon, 25 Mar 2019 07:56:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1553518612;
 bh=DcabNS2o1L/NSvJUGYvkcA1faE5UiCzUk4WYQ737G58=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=bW0jCIAVTFlGy6+w4+Jta4q7w5skZyT4OQKx/38nN0qqWGjVp7KvJqRGVFXsqjQL2
 7QSp7GolLl8C8RzDMkkZvC32Ut+yko7Cp803GdFekHqaganWERwK7MYjlnA3rLrEKm
 kZgZv9rz6NimCgtmzxX448C9uSHsdPBTCfdu2fNQ=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2PCuqeN095112
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 25 Mar 2019 07:56:52 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 25
 Mar 2019 07:56:48 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend Transport;
 Mon, 25 Mar 2019 07:56:48 -0500
Received: from [172.24.190.89] (ileax41-snat.itg.ti.com [10.172.224.153])
 by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2PCugoN020375;
 Mon, 25 Mar 2019 07:56:43 -0500
Subject: Re: [RFC PATCH v2 1/5] mtd: cfi_cmdset_0002: Add support for polling
 status register
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "computersforpeace@gmail.com"
 <computersforpeace@gmail.com>, "bbrezillon@kernel.org"
 <bbrezillon@kernel.org>, "marek.vasut@gmail.com" <marek.vasut@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "richard@nod.at"
 <richard@nod.at>
References: <20190321174548.9288-1-vigneshr@ti.com>
 <20190321174548.9288-2-vigneshr@ti.com>
 <f92362a0678b07d22ccc0f271fe3483dc77364a9.camel@infinera.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <b1961c49-6795-89e7-e154-6270bf43d49c@ti.com>
Date: Mon, 25 Mar 2019 18:27:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <f92362a0678b07d22ccc0f271fe3483dc77364a9.camel@infinera.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_055707_830016_4D7438C9 
X-CRM114-Status: GOOD (  23.07  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "sergei.shtylyov@cogentembedded.com" <sergei.shtylyov@cogentembedded.com>,
 "tudor.ambarus@microchip.com" <tudor.ambarus@microchip.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "nsekhar@ti.com" <nsekhar@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "masonccyang@mxic.com.tw" <masonccyang@mxic.com.tw>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 21/03/19 11:41 PM, Joakim Tjernlund wrote:
> On Thu, 2019-03-21 at 23:15 +0530, Vignesh Raghavendra wrote:
>>
>> HyperFlash devices are compliant with CFI AMD/Fujitsu Extended Command
>> Set(0x0002) for flash operations, therefore drivers/mtd/chips/cfi_cmdset_0002.c
>> can be use as is. But these devices do not support DQ polling method of
>> determining chip ready/good status. These flashes provide Status
>> Register whose bits can be polled to know status of flash operation.
>>
>> Cypress HyperFlash datasheet here[1], talks about CFI Amd/Fujitsu
>> Extended Query version 1.5. Bit 0 of "Software Features supported" field
>> of CFI Primary Vendor-Specific Extended Query table indicates
>> presence/absence of status register and Bit 1 indicates whether or not
>> DQ polling is supported. Using these bits, its possible to determine
>> whether flash supports DQ polling or need to use Status Register.
>>
>> Add support for polling status register to know device ready/status of
>> erase/write operations when DQ polling is not supported.
> 
> Isn't this new Status scheme just a copy of Intels(cmdset_0001)?

Yes, but with one difference: At the end of program/erase operation,
device directly enters status register mode and  starts reflecting
status register content at any address.
The device remains in the read status register state until another
command is written to the device. Therefore there is notion of device is
in "status register read mode" (FL_STATUS) state

But in case of cfi_cmdset_0002, once program/erase operation is
complete, device returns to previous address space overlay from which
operation was started from (mostly read mode)

In order to enter status register overlay mode, Read Status command is
to be written to addr_unlock1(0x555) address. The overlay is in effect
for one read access, specifically the next read access that follows the
Status Register Read command
Therefore code around FL_STATUS state in cfi_cmdset_0001 is not
applicable to cfi_cmdset_0002 as is.


> If so I think the new status impl. in 0002 should borrow from 0001 as this is a
> hardened and battle tested impl.
>

In case of cfi_cmdset_0001.c, program/erase is followed by
inval_cache_and_wait_for_operation() to poll ready bit and based on
status register value, success or the error handling is done.

Most of the code corresponding to inval_cache_and_wait_for_operation()
is already in cfi_cmdset_0002.c. So, whats missing in this patch is
handling and reporting of errors as reflected in status register after
write/erase failures. I will add that in the next version.

But, I don't see much to borrow apart from error handling sequence.
Please, let me know if I missed something.

> I know other modern 0002 chips supports both old and new impl. of Status and I world
> guess that we will see more chips with new Status only.
> 

Agreed. Newer devices would mostly be CFI 1.5.

-- 
Regards
Vignesh

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
