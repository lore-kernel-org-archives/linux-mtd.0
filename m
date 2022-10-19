Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1400C433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Oct 2022 09:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:MIME-Version:Date:
	Message-ID:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKVAkpW1j0ra1PQZn+UIywdMawQjRpaBLp+LprtOn84=; b=T4aXp/WezxSnTfWs/hP2w9psZy
	tI4G6jidGxj8JdjbFJMwR2UX9Irlw0mVG+yKJ7xbb6U6blOnGrKPaswK0lV+NKbQUpjWOSjEXU4lw
	WTqYvNHMWNRtJZ3FnQfPg1ieNoseHK0Oiiokg3GkEAzIsiwqJDrUAa8FgYJb6b494iWPzdJEMuHJP
	tqB8fq93p/9CEUUoKG7ansWxuuwQCHppkImUTpGXH7RWawAF+gAuMLMLRJqQ5P91lC2/rr7QnfJPX
	dP0Uh9ug+X3YoZhL+4sFNaJ6s4vlGlmyluBF1PVJzIvXbze9pH71riQA0azGyTiYoCL4UB1W2de+u
	LtP5556A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5Km-00HMD7-Uf; Wed, 19 Oct 2022 09:25:57 +0000
Received: from smtp-fw-2101.amazon.com ([72.21.196.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol5Kk-00HMBP-18
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2022 09:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1666171554; x=1697707554;
  h=message-id:date:mime-version:to:cc:references:from:
   in-reply-to:content-transfer-encoding:subject;
  bh=66n6UWckGr9pYzJ89YQCqoPVrnClEd2k3PCNw2hP3jc=;
  b=hJfDjiT86PgDVj2Pg3gmp4mEjxvm6hpNYvJ6KAdAHcs2QiFpQn00mUZb
   PeJOhuu72wMvwv16/z8qSSTkv6rAyGGHgMmUgLMm3v53u1K5ObdX9jzeJ
   ikDBJWMQAIuLhvZlC1lf1PKAyzHGxMk0a12WxtbbUHebfFCVWFkFiWRIA
   I=;
X-IronPort-AV: E=Sophos;i="5.95,195,1661817600"; 
   d="scan'208";a="253598703"
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: micron-st: Enable locking for
 n25q256ax1/mt25qu256a
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO email-inbound-relay-pdx-2c-m6i4x-fa5fe5fb.us-west-2.amazon.com) ([10.43.8.6])
  by smtp-border-fw-2101.iad2.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2022 09:25:45 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan3.pdx.amazon.com [10.236.137.198])
	by email-inbound-relay-pdx-2c-m6i4x-fa5fe5fb.us-west-2.amazon.com (Postfix) with ESMTPS id 9E2B6416A3;
	Wed, 19 Oct 2022 09:25:43 +0000 (UTC)
Received: from EX19D013UWB002.ant.amazon.com (10.13.138.21) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.249) with Microsoft SMTP Server (TLS)
 id 15.0.1497.42; Wed, 19 Oct 2022 09:25:40 +0000
Received: from EX13MTAUEA001.ant.amazon.com (10.43.61.82) by
 EX19D013UWB002.ant.amazon.com (10.13.138.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1118.15;
 Wed, 19 Oct 2022 09:25:40 +0000
Received: from [192.168.160.198] (10.85.143.176) by mail-relay.amazon.com
 (10.43.61.243) with Microsoft SMTP Server id 15.0.1497.42 via Frontend
 Transport; Wed, 19 Oct 2022 09:25:36 +0000
Message-ID: <1ba2e7ff-cf6c-1292-72e0-14b5b5b9282c@amazon.com>
Date: Wed, 19 Oct 2022 12:25:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
To: Michael Walle <michael@walle.cc>
CC: <tudor.ambarus@microchip.com>, <pratyush@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<talel@amazon.com>, <jonnyc@amazon.com>, <hhhawa@amazon.com>,
	<hanochu@amazon.com>, <itamark@amazon.com>, <shellykz@amazon.com>,
	<amitlavi@amazon.com>, <dkl@amazon.com>, "Farber, Eliav" <farbere@amazon.com>
References: <20221019071631.15191-1-farbere@amazon.com>
 <73bfa5ae90e2269387540019806c2839@walle.cc>
Content-Language: en-US
From: "Farber, Eliav" <farbere@amazon.com>
In-Reply-To: <73bfa5ae90e2269387540019806c2839@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_022554_255002_EDE7EF41 
X-CRM114-Status: GOOD (  13.81  )
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

On 10/19/2022 11:21 AM, Michael Walle wrote:
> Hi,
>
> Am 2022-10-19 09:16, schrieb Eliav Farber:
>> n25q256ax1 [1] and mt25qu256a [2] (both have same jedec_id - 0x20bb19)
>> use the 4 bit Block Protection scheme and support Top/Bottom protection
>> via the BP and TB bits of the Status Register.
>> BP3 is located in bit 6 of the Status Register.
>> Tested on both n25q256ax1 and mt25qu256a.
>>
>> [1]
>> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/n25q/n25q_256mb_3v.pdf 
>>
>> [2]
>> https://www.micron.com/-/media/client/global/documents/products/data-sheet/nor-flash/serial-nor/mt25q/die-rev-a/mt25q_qljs_u_256_aba_0.pdf 
>>
>
> If you respin, you can use a "Link:" tag for the URL above.

Ack.

>> Signed-off-by: Eliav Farber <farbere@amazon.com>
>> ---
>> xxd -p
>> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp 
>>
>> 53464450060101ff00060110300000ff84000102800000ffffffffffffff
>> ffffffffffffffffffffffffffffffffffffe520fbffffffff0f29eb276b
>> 273b27bbffffffffffff27bbffff29eb0c2010d80f520000244a99008b8e
>> 03d4ac0127387a757a75fbbdd55c4a0f82ff81bd3d36ffffffffffffffff
>> ffffffffffffffffffe7ffff21dcffff
>>
>> md5sum
>> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp 
>>
>> 5ea738216f68c9f98987bb3725699a32
>> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp 
>>
>>
>> cat
>> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/jedec_id 
>>
>> 20bb19104400
>>
>> cat
>> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/partname 
>>
>> mt25qu256a
>>
>> cat
>> /sys/devices/platform/soc/fd882000.spi/spi_master/spi0/spi0.0/spi-nor/manufacturer 
>>
>> st
>
> That's the mt25qu256a SFDP. What about the n25q256ax1? 

On the same card, with same NOR flash memory I'm running two different
kernel versions.
First version is quite old - 4.19.239 which does not support mt25qu256a
and therefore device is detected as n25q256ax1.
Second version is 6.1.0-rc1 and it detects the same device as mt25qu256a.
So I was able to dump SFDP when running version 6.1.0-rc1, but not when
running 4.19.239 which does not support the sysfs to dump the SFPD
information.
I checked that locking works with my changes when running on both kernel
versions.

--
Regards, Eliav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
