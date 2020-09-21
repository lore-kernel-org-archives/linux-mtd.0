Return-Path: <SRS0=HVA7=C6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 310C9C43465
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 07:30:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5D7320709
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2020 07:30:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q9IM+O4/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ti.com header.i=@ti.com header.b="NgzIRtj0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5D7320709
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Br4TNh1i81Iswk5irg5c7ZUlg7/c/nIWFj7BRMrBIdc=; b=q9IM+O4/AfBYr4WNGjdLrkoXV
	TmZKwMNblAkSzWDgmAbZqxx/dvdh484+AtaP+jYdsAfN7o9pAOR9SwRh8bEf6Xt91ou3Ohao2qn9S
	vTqxwDa90T4E6uvvEvpCkU1+pBwEBeK4MwXvd+TZQYo+RKGhPkPF1aP2q1JBM1ugD15R6GlBP2orr
	OWoYUWyNE4bYSyc8aPU2w1hE0CtxpWArVBf0Qj/VawMJRhNuQVKkxGqVaZV0ShT695H/WrwO0FWW5
	/MTztaG0AK4Rl07UAgzbiQRm/57EZ7chVJ0wHjm0FT3kWubuB/VInws+Jd92g2NCzgmGDDykgZa/R
	FWuI+PzXQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKGGI-0006e4-Vv; Mon, 21 Sep 2020 07:29:23 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKGGG-0006dR-II
 for linux-mtd@lists.infradead.org; Mon, 21 Sep 2020 07:29:21 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08L7TBGp019345;
 Mon, 21 Sep 2020 02:29:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1600673351;
 bh=q691u1Aw/r96BQyvdIz+vqlagJEK0myCVT5ZltY868U=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=NgzIRtj0bDbgINHxFKqoDfSoPqq3ZMfQiMCW8eZUgfrV/3dSdF2GlECebWLxMHehf
 Lg5HfiVc6fDOY9lkm2c6Pze5gcbpaNr1iG5ESQjsHF6O4r0DGxM2r5acfkswPm6678
 dpBJMDaIWX7SczXJy0JYnpyQnGlVvpmYWxddV7sY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08L7TAVT089859
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 21 Sep 2020 02:29:10 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 21
 Sep 2020 02:29:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 21 Sep 2020 02:29:10 -0500
Received: from [10.250.235.166] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08L7T8KF082482;
 Mon, 21 Sep 2020 02:29:08 -0500
Subject: Re: [PATCH v2] mtd: hyperbus: add Renesas RPC-IF driver
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>
References: <3e4cf141-52a3-ef88-5e25-eb5c75b16186@cogentembedded.com>
 <c3cbbc7e-ded0-86dc-8582-af80ff641cfa@ti.com>
 <2b5f3820-370c-8180-3769-af0e4fd0a76e@gmail.com>
From: Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <bf91f4ab-73df-ec58-4261-95845fc8cfd2@ti.com>
Date: Mon, 21 Sep 2020 12:59:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2b5f3820-370c-8180-3769-af0e4fd0a76e@gmail.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_032920_716938_59FCA8AC 
X-CRM114-Status: GOOD (  23.33  )
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
Cc: Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 9/19/20 10:07 PM, Sergei Shtylyov wrote:
> Hello!
> 
> On 09/14/2020 04:09 PM, Vignesh Raghavendra wrote:
> 
>>> Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
>>> driver using the "back end" APIs in the main driver to talk to the real
>>> hardware.
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
[...]
>>> +#include <linux/err.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/module.h>
>>> +#include <linux/mtd/hyperbus.h>
>>> +#include <linux/mtd/mtd.h>
>>> +#include <linux/mux/consumer.h>
>>> +#include <linux/of.h>
>>> +#include <linux/platform_device.h>
>>> +#include <linux/types.h>
>>> +
>>> +#include <memory/renesas-rpc-if.h>
>>> +
>>> +/* FIXME: How to drop this? */
>>> +#ifndef CONFIG_MTD_CFI_BE_BYTE_SWAP
>>> +#error Enable config "Flash cmd/query data swapping (BIG_ENDIAN_BYTE)"
>>> +#endif
>>
>> select MTD_CFI_BE_BYTE_SWAP in Kconfig does not help?
> 
>    Alas, it doesn't work!
> 

As I corrected in another reply, why not use "depends on" like:

 config RPCIF_HYPERBUS
        tristate "Renesas RPC-IF HyperBus driver"
        depends on RENESAS_RPCIF
-       select MTD_CFI_ADV_OPTIONS
+       depends on MTD_CFI_BE_BYTE_SWAP || COMPILE_TEST
        help
          This option includes Renesas RPC-IF HyperFlash support.

>>> +
>>> + struct	rpcif_hyperbus {
>>
>> WARNING: please, no spaces at the start of a line
>> #73: FILE: drivers/mtd/hyperbus/rpc-if.c:25:
>> + struct^Irpcif_hyperbus {$
> 
>    Ugh, must be a stray space... :-/
> 
> [...]
>>> +static const struct rpcif_op rpcif_op_tmpl = {
>>> +	.cmd = {
>>> +		.buswidth = 8,
>>> +		.ddr = true,
>>> +	},
>>> +	.ocmd = {
>>> +		.buswidth = 8,
>>> +		.ddr = true,
>>> +	},
>>> +	.addr = {
>>> +		.nbytes = 1,
>>> +		.buswidth = 8,
>>> +		.ddr = true,
>>> +	},
>>> +	.data = {
>>> +		.buswidth = 8,
>>> +		.ddr = true,
>>> +	},
>>> +};
>>> +
>>> +static u16 rpcif_hb_read16(struct hyperbus_device *hbdev, unsigned long addr)
>>> +{
>>> +	struct rpcif_hyperbus *hyperbus =
>>> +		container_of(hbdev, struct rpcif_hyperbus, hbdev);
>>> +	struct rpcif_op op = rpcif_op_tmpl;
>>> +	map_word data;
>>> +
>>> +	op.cmd.opcode = 0x80;
>>
>> Here and elsewhere what does 0x80 represent?
> 
>    This is bits 40..47 of the HyperBus command/address packet: thus 0x80 means
> memory read.
> 
>> Maybe using a self
>> describing macro would be helpful when assigning values to op.cmd.opcode?
> 
>    It probably would but it apparently needs to be placed in your HyperBus header...

That's fine, Patches are welcome...

> 
>>> +	op.addr.val = addr >> 1;
>>> +	op.dummy.buswidth = 1;
>>> +	op.dummy.ncycles = 15;
>>> +	op.data.dir = RPCIF_DATA_IN;
>>> +	op.data.nbytes = 2;
>>> +	op.data.buf.in = &data;
>>
>> This code block seems like a good candidate to be converted to a macro/
>> template to avoid repetition. Template can initializes few values remain
> 
>    I'm already using a common template...
> 

Yes, but I see there is scope to extend further as I pointed out below..

>> common across the driver and override others based on parameters passed.
>> You could probably have one for write op and one for read op, if needed.
> 
>    OK, I'll look into doing that...
> 
>> [...]
>>
>> Regards
>> Vignesh
> 
> MBR, Sergei
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
