Return-Path: <SRS0=LGak=CY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA276C43461
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 04:09:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24137208FE
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Sep 2020 04:09:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MwhAxAKi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=de.bosch.com header.i=@de.bosch.com header.b="Ykk5hElc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24137208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=de.bosch.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QT3y0gNjuI4IMuHywtaMIKiruche8R+/r5uvUY0QoEw=; b=MwhAxAKij9Nr3ztHqzxOjZpTV
	o2QPuzLod3WKmv5+EbhgDiSx8/mVhdd9s9xAlcPzmQODmkElmpQT2wneydGTGfwtmTFmAEIFKQITe
	80TpoAzIggnppDLKwlKsNUpsaObIfD9duJi4J3DCWfNwLYK/v9yoO/9zQWNoDjPwlfw7pTo6xhlp/
	fO/kYO5aihito31uCI9P3sRW19LBwFR8Z92mIe/bLf7spO7PEFdC5iHHfu1E7QqOkXnxkvkxHZgqv
	pWYCevEQdrxTarf9m+4/YyCXWtm6DDJIGEr1P6mTm6wAPByGKBR4L37yxqCkm+nLGdzW6QRP+laxu
	e0uNtjrrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI2GM-0006Zr-AZ; Tue, 15 Sep 2020 04:08:14 +0000
Received: from de-out1.bosch-org.com ([139.15.230.186])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI2GC-0006ZL-UN
 for linux-mtd@lists.infradead.org; Tue, 15 Sep 2020 04:08:06 +0000
Received: from si0vm1948.rbesz01.com
 (lb41g3-ha-dmz-psi-sl1-mailout.fe.ssn.bosch.com [139.15.230.188])
 by fe0vms0186.rbdmz01.com (Postfix) with ESMTPS id 4Br8pS6Ys4z1XLFjW;
 Tue, 15 Sep 2020 06:08:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.bosch.com;
 s=key1-intmail; t=1600142880;
 bh=rIPfBowUy6vq02UUsUlhRXBYUiMBTsdBrP5Q1JnksEk=; l=10;
 h=Subject:From:From:Reply-To:Sender;
 b=Ykk5hElcqSu24UcY4NS+uMSKeaxOa7rhZwO3JS8te/2H1SQsgdspoflmvnX/e/H7W
 EXO58jzwrm6GUJjJUcgWqSVvfZw7Ctw3YL4X7A8i+7a5WB7xny7cZE/hH9cFqO0EQ+
 oBvxQsL+ik8zNb1OQLQBvCTWQkoxcocLItisYLw0=
Received: from fe0vm1741.rbesz01.com (unknown [10.58.172.176])
 by si0vm1948.rbesz01.com (Postfix) with ESMTPS id 4Br8pS6Gpvz64t;
 Tue, 15 Sep 2020 06:08:00 +0200 (CEST)
X-AuditID: 0a3aad15-f9dff700000022e8-70-5f603e204a57
Received: from fe0vm1652.rbesz01.com ( [10.58.173.29])
 (using TLS with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by fe0vm1741.rbesz01.com (SMG Outbound) with SMTP id B4.5B.08936.02E306F5;
 Tue, 15 Sep 2020 06:08:00 +0200 (CEST)
Received: from FE-HUB2000.de.bosch.com (fe-hub2000.de.bosch.com [10.4.103.109])
 by fe0vm1652.rbesz01.com (Postfix) with ESMTPS id 4Br8pS5SB5zB1G;
 Tue, 15 Sep 2020 06:08:00 +0200 (CEST)
Received: from [10.141.183.118] (10.141.183.118) by FE-HUB2000.de.bosch.com
 (10.4.103.109) with Microsoft SMTP Server id 15.1.1979.3; Tue, 15 Sep 2020
 06:08:00 +0200
Subject: Re: [PATCH v2] mtd: hyperbus: add Renesas RPC-IF driver
To: Vignesh Raghavendra <vigneshr@ti.com>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <3e4cf141-52a3-ef88-5e25-eb5c75b16186@cogentembedded.com>
 <c3cbbc7e-ded0-86dc-8582-af80ff641cfa@ti.com>
From: "Behme Dirk (CM/ESO2)" <dirk.behme@de.bosch.com>
Message-ID: <663f56cb-d38c-1e38-8459-4306a6da88db@de.bosch.com>
Date: Tue, 15 Sep 2020 06:07:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <c3cbbc7e-ded0-86dc-8582-af80ff641cfa@ti.com>
Content-Language: en-US
X-Originating-IP: [10.141.183.118]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOLMWRmVeSWpSXmKPExsXCZbVWVlfBLiHe4M19I4vdTcvYLQ6372O1
 mLzzDaPF90OrWSz+n/3A7sDqMW9NtcfOWXfZPTYvqfe4Oa/Q4/iN7UwBrFFcNimpOZllqUX6
 dglcGV1z2Qt6ZCvm/+1jbGDcIt7FyMkhIWAi8f/3L2YQW0hgBpPErb1iXYxcQPYeRomtncfY
 IRIrGSX27I/oYuTgEBZwkNizyh4kLCJwGii8WxqipFSi7+tsRhCbTcBM4vWSWWA2r4C9xKU7
 v1lAbBYBVYnDB84zgowRFUiW6PlaAVEiKHFy5hOwEk4BK4mV56+xgdjMAhYSM+efZ4SwxSVu
 PZnPBGHLS2x/O4cZ4nwliXON8xgnMArOQjJqFpL2WUjaZyFpX8DIsopRNC3VoCzX0NzEUK8o
 KbW4ysBQLzk/dxMjJOxFdzDe6f6gd4iRiYPxEKMEB7OSCO+Bxvh4Id6UxMqq1KL8+KLSnNTi
 Q4zSHCxK4rwqPBvjhATSE0tSs1NTC1KLYLJMHJxSDUwzfnB/0D+0c9Huok7Gi2ZTX3vYpM/t
 rXROubeGTcPyaXkxyxubl88PzXuuevnZ4s0J/Z2dHNXlVQ+n1jG91j32OaVRNfPO8Y/tjyI/
 VrAdcpp9OHXHu4p/c86uKNhx7syH2J0rzt5ifyi6uPdA7nbrQxuLUm68n76OxTdQOLd24pJP
 AYw3p/A8nCiy9JC4av0eLy6NV7+/H1YJt1mmv/5Gx9meTV5iPYlfBd4E7Go/9PDZ6uDtNyZp
 XDibLq18toLJ6lfuSzarn8fZpb6ffdBhn/fQq/ez5cM7hhMllzPeCf9kId72r1es/cUXHh+v
 +PaPy9YcsMsy1ckROT75WEuHsmKW4Oupy69MYbe0tP2nqsRSnJFoqMVcVJwIAGukxiTqAgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_000805_450784_695B36E9 
X-CRM114-Status: GOOD (  27.38  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 14.09.2020 15:09, Vignesh Raghavendra wrote:
> Hi Sergei,
> 
> On 5/14/20 2:13 AM, Sergei Shtylyov wrote:
>> Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
>> driver using the "back end" APIs in the main driver to talk to the real
>> hardware.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
> 
> Mails to this ID is bouncing which meant I could not ask status of
> dependencies.
> 
>> ---
>> This patch is against the 'mtd/next' branch of the MTD 'linux.git' repo.
>> Requires  the RPC-IF main driver patch in order to build/work:
>>
>> [1] https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.kernel.org%2Fpatch%2F11283127%2F&amp;data=02%7C01%7Cdirk.behme%40de.bosch.com%7C67d24357a6644232518008d858af6cd0%7C0ae51e1907c84e4bbb6d648ee58410f4%7C0%7C0%7C637356857751715684&amp;sdata=XDR3Nu15LcC3G5C4HZgb9UH8eNGWDpuxupf6zoXcM%2Fc%3D&amp;reserved=0
>>
> [...]
>> --- /dev/null
>> +++ linux/drivers/mtd/hyperbus/rpc-if.c
>> @@ -0,0 +1,165 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Linux driver for RPC-IF HyperFlash
>> + *
>> + * Copyright (C) 2019-2020 Cogent Embedded, Inc.
>> + */
>> +
>> +#include <linux/err.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/mtd/hyperbus.h>
>> +#include <linux/mtd/mtd.h>
>> +#include <linux/mux/consumer.h>
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/types.h>
>> +
>> +#include <memory/renesas-rpc-if.h>
>> +
>> +/* FIXME: How to drop this? */
>> +#ifndef CONFIG_MTD_CFI_BE_BYTE_SWAP
>> +#error Enable config "Flash cmd/query data swapping (BIG_ENDIAN_BYTE)"
>> +#endif
> 
> select MTD_CFI_BE_BYTE_SWAP in Kconfig does not help?


If I remember correctly 'select MTD_CFI_BE_BYTE_SWAP' in Kconfig doesn't 
seem to work. Therefore the FIXME. I can't remember exactly the root 
cause for that any more, but maybe it was the 'bool' type of 
MTD_CFI_BE_BYTE_SWAP?

If anybody has a nice solution for that, it would be welcome :)

Best regards

Dirk


>> +
>> + struct	rpcif_hyperbus {
> 
> WARNING: please, no spaces at the start of a line
> #73: FILE: drivers/mtd/hyperbus/rpc-if.c:25:
> + struct^Irpcif_hyperbus {$
> 
> 
> 
>> +	struct rpcif rpc;
>> +	struct hyperbus_ctlr ctlr;
>> +	struct hyperbus_device hbdev;
>> +};
>> +
>> +static const struct rpcif_op rpcif_op_tmpl = {
>> +	.cmd = {
>> +		.buswidth = 8,
>> +		.ddr = true,
>> +	},
>> +	.ocmd = {
>> +		.buswidth = 8,
>> +		.ddr = true,
>> +	},
>> +	.addr = {
>> +		.nbytes = 1,
>> +		.buswidth = 8,
>> +		.ddr = true,
>> +	},
>> +	.data = {
>> +		.buswidth = 8,
>> +		.ddr = true,
>> +	},
>> +};
>> +
>> +static u16 rpcif_hb_read16(struct hyperbus_device *hbdev, unsigned long addr)
>> +{
>> +	struct rpcif_hyperbus *hyperbus =
>> +		container_of(hbdev, struct rpcif_hyperbus, hbdev);
>> +	struct rpcif_op op = rpcif_op_tmpl;
>> +	map_word data;
>> +
>> +	op.cmd.opcode = 0x80;
> 
> Here and elsewhere what does 0x80 represent? Maybe using a self
> describing macro would be helpful when assigning values to op.cmd.opcode?
> 
>> +	op.addr.val = addr >> 1;
>> +	op.dummy.buswidth = 1;
>> +	op.dummy.ncycles = 15;
>> +	op.data.dir = RPCIF_DATA_IN;
>> +	op.data.nbytes = 2;
>> +	op.data.buf.in = &data;
> 
> This code block seems like a good candidate to be converted to a macro/
> template to avoid repetition. Template can initializes few values remain
> common across the driver and override others based on parameters passed.
> You could probably have one for write op and one for read op, if needed.
> 
> [...]
> 
> Regards
> Vignesh
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
