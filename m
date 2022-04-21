Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0E8C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Apr 2022 11:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N1cqgRyCXfaEqYoRveK85rGgAaCZs8RVTEJJ0SteLe8=; b=JauiY22xF9s5U8
	zhg3zz1SncQbB8WBUA/LAkkHTKHZ7FlG4oKQD0jopdVl1Pahnnh7tr8Pv8BLWOZ330FeX7mZWvR03
	Z9afqCUy9BLDNMDaGOTHXAfJsNWXGKRpuSHlE5ky5ZUHu2y138g/ZUHWRziaVWAmRCLsdXmwZrmgy
	/F40rl3MbmKZmJNBBgNLIy8tR5AYZvKIwIzQW2az3LccjvcHWe/Taj189vUt5we/LropqjlSYgjRF
	cUKgvu0/R8/nwPzqCPoxz/K53dQP70fVBXWh2dqDc1s1OGdcrh105WzrD+K6A8Ofk5LQX4rGjTtJl
	UpffO4cIFSe1R9PffSFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhV0m-00DC7Z-JO; Thu, 21 Apr 2022 11:30:12 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhV0j-00DC6N-94
 for linux-mtd@lists.infradead.org; Thu, 21 Apr 2022 11:30:10 +0000
Received: from apollo.. (unknown [IPv6:2a02:810b:4340:43bf:4685:ff:fe12:5967])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 6290C221D4;
 Thu, 21 Apr 2022 13:30:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1650540602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6c20wSMOySh6CC+m9LtSMD3wAXHxSRF1mu40jUdgTdM=;
 b=H8k4YH0fwfaCVOwDPiS0KKTa6cfMTuJQi0WKCKE+/GgbHMJoeyScI51huqWth71IpCHrZd
 JreMfMT/crqeB/df8OKejTVXjPQ4CtREwJan1nyNKsvDcj2RStYx4bjhghTF1FiRfTy0LF
 PBd0faaHi74fz8pdoOkHujckJLnAby4=
From: Michael Walle <michael@walle.cc>
To: tudor.ambarus@microchip.com
Cc: Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, p.yadav@ti.com,
 richard@nod.at, tkuw584924@gmail.com, vigneshr@ti.com,
 Michael Walle <michael@walle.cc>
Subject: Re: [PATCH v13 1/4] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
Date: Thu, 21 Apr 2022 13:29:56 +0200
Message-Id: <20220421112956.292089-1-michael@walle.cc>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <4420110b-356f-a738-b5e2-233200e0637f@microchip.com>
References: <4420110b-356f-a738-b5e2-233200e0637f@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_043009_514373_8305F3BB 
X-CRM114-Status: GOOD (  17.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

> On 4/21/22 12:40, tkuw584924@gmail.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>> 
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> 
>> In 4BAIT parse, keep nor->addr_width because it may be used as
>> current address mode in SMPT parse later on.
>> 
>> Signed-off-by: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>> ---
>>  drivers/mtd/spi-nor/core.c | 7 ++++++-
>>  drivers/mtd/spi-nor/sfdp.c | 1 -
>>  2 files changed, 6 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
>> index 40ba45328975..87603a99938f 100644
>> --- a/drivers/mtd/spi-nor/core.c
>> +++ b/drivers/mtd/spi-nor/core.c
>> @@ -2210,7 +2210,12 @@ static int spi_nor_default_setup(struct spi_nor *nor,
>>  static int spi_nor_set_addr_width(struct spi_nor *nor)
>>  {
>>         if (nor->addr_width) {
>> -               /* already configured from SFDP */
>> +               /*
>> +                * Already configured from SFDP. Use an address width of 4 in
>> +                * case the device has 4byte opcodes.
>> +                */
>> +               if (nor->addr_width == 3 && nor->flags & SNOR_F_HAS_4BAIT)
>> +                       nor->addr_width = 4;
>>         } else if (nor->read_proto == SNOR_PROTO_8_8_8_DTR) {
> 
> Can we have this instead?
> 
> commit 61d73dea7e63db4c7a3ffaa7f2b5068fb71c2d8b
> Author: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> Date:   Thu Apr 21 18:40:21 2022 +0900
> 
>     mtd: spi-nor: Retain nor->addr_width at 4BAIT parse
>     
>     In 4BAIT parse, keep nor->addr_width because it may be used as
>     current address mode in SMPT parse later on.

Mh, I don't know it that is any better, there are places where
addr_width is set in parse_bfpt. Why can't we fix the real problem
here and collect any changes made by the SFDP parsing (and possible
fixups) and apply them at a common place?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
