Return-Path: <SRS0=MJr3=C4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFB0C43464
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 16:38:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2F76208DB
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Sep 2020 16:38:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CSfMdOSv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mj+sQeKb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2F76208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dUXcrXHJX0dCa2NQPMBesxLbU2p0WsDwFpT1YNAsLgw=; b=CSfMdOSv4nZl6ErL2CimNSZAI
	hHcjLy2mAOZGdTDX6smMpP6okIm777Cmtwz92uWZxEvdmAcdlQFeeFaxEFvRhaI9j7jsdyPtect/E
	N06QEBx7NHVF9szIg7xVwTvickfx72o0j3J75LO7lJEt3gE+lqd2ppUiQG/Td9v4LTtOWH1u+4whJ
	wBRXif2kYK6dzdiL52fIYNyoqhYV+5y82OnybLTPSN0eedy15RumjjUgzf/SQJTpcO8acIUsjidsN
	DKEhE61rrzhGZkNt2wW8RU+FGIrxLOQP3bkVBmMo9XQyjx3ZUzvBHYkmdcFfo6Rw8uAqaJt1ICUgX
	UR2LGhWYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJfre-0004Mq-8u; Sat, 19 Sep 2020 16:37:30 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJfrb-0004MU-BB
 for linux-mtd@lists.infradead.org; Sat, 19 Sep 2020 16:37:28 +0000
Received: by mail-lf1-x144.google.com with SMTP id m5so9481474lfp.7
 for <linux-mtd@lists.infradead.org>; Sat, 19 Sep 2020 09:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NwgOa6fH4TpCq/3xhhYvNLfkJlT5RNRRhkkMLTawhIo=;
 b=mj+sQeKbql/l6e6FPRPRGO77bfR7BBbM2HovtMqH3Rm2V9ICGxp3RMb+xp1L0F09Ht
 qxA1a5djSH3b/5NA/WK/H0haq0gC/HZkcjwzlm4w3Rztjkl885SP5VlzNc3b9NAlEmw4
 yFOwrDGP2GDlFqX4mIgTIoLOWphCCoEjAsMFYuFXzIyiLN6bQ71eLLb0np1Wj5CjUvIN
 ckXXQdybmsgIvpbr7yjv3UHE8amFdwwKqyTkKsF6MwLiFqhvcaFZztjpQl4QoLiovNtZ
 86Vm2PIQepxJGRvHlTJtXqGxnEf01DqcC5DWNe6TTlEJrsr2UgQYXFMikqAx+W/WkPkV
 QtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NwgOa6fH4TpCq/3xhhYvNLfkJlT5RNRRhkkMLTawhIo=;
 b=rF8FrJ4WQrMkmvErTm4uaaRjxJ9OnTM+qCsVKnoO69w+PASm7zWRguV23iRabIfrj9
 9Dcj2fDvGdQLY/ezHgbuYQ+61Vc3bVaFt/yzx/DcmcxCUXMFCsc3JmjrUr5r6cufusSH
 3kYRNMjzeOwkdBB1ddgHtqkAVWm201xEiRkP0qzRl3/jZbuZiNg+CugZNcsQzUgVdoXS
 wgUnvlTU31rfxWg0XkcRno6yCrjavEykA4CcrERyLCqSg9z0UJy+PORdCav/veOQOVL2
 c0lA75ZJcqxIj8k42iTaZ2HMaG3b9dMCkCpjY8xHJcTQYF2MobpEaGhlFmIa3EDL02hX
 fY7A==
X-Gm-Message-State: AOAM533p0TFksVBJDiE6iTzBDGjjXkx4lf5ScGJEDEgUGAktoQ78Gw1S
 t6GzSsgS/CL4fNz7h07L1vg=
X-Google-Smtp-Source: ABdhPJzMLWdIgOOrHlxA1C9ez7P6CJdt/0kBUDV30hkf38fT6r1j+c2tfrcx83Ddz5TccTVeprmXFQ==
X-Received: by 2002:ac2:4a6a:: with SMTP id q10mr11698356lfp.534.1600533444088; 
 Sat, 19 Sep 2020 09:37:24 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:42c4:d9fd:ed82:43eb:5140:3cfb])
 by smtp.gmail.com with ESMTPSA id f18sm1356361lfd.100.2020.09.19.09.37.23
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 19 Sep 2020 09:37:23 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Subject: Re: [PATCH v2] mtd: hyperbus: add Renesas RPC-IF driver
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <3e4cf141-52a3-ef88-5e25-eb5c75b16186@cogentembedded.com>
 <c3cbbc7e-ded0-86dc-8582-af80ff641cfa@ti.com>
Organization: Brain-dead Software
Message-ID: <2b5f3820-370c-8180-3769-af0e4fd0a76e@gmail.com>
Date: Sat, 19 Sep 2020 19:37:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <c3cbbc7e-ded0-86dc-8582-af80ff641cfa@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200919_123727_391975_8F063812 
X-CRM114-Status: GOOD (  27.32  )
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

Hello!

On 09/14/2020 04:09 PM, Vignesh Raghavendra wrote:

>> Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
>> driver using the "back end" APIs in the main driver to talk to the real
>> hardware.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Mails to this ID is bouncing which meant I could not ask status of
> dependencies.

   I no longer work for Cogent Embedded (this also means that I've lost
the hardware access). The mail kept working for several months after my
layoff though...

>> ---
>> This patch is against the 'mtd/next' branch of the MTD 'linux.git' repo.
>> Requires  the RPC-IF main driver patch in order to build/work:
>>
>> [1] https://patchwork.kernel.org/patch/11283127/
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

   Alas, it doesn't work!

>> +
>> + struct	rpcif_hyperbus {
> 
> WARNING: please, no spaces at the start of a line
> #73: FILE: drivers/mtd/hyperbus/rpc-if.c:25:
> + struct^Irpcif_hyperbus {$

   Ugh, must be a stray space... :-/

[...]
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
> Here and elsewhere what does 0x80 represent?

   This is bits 40..47 of the HyperBus command/address packet: thus 0x80 means
memory read.

> Maybe using a self
> describing macro would be helpful when assigning values to op.cmd.opcode?

   It probably would but it apparently needs to be placed in your HyperBus header...

>> +	op.addr.val = addr >> 1;
>> +	op.dummy.buswidth = 1;
>> +	op.dummy.ncycles = 15;
>> +	op.data.dir = RPCIF_DATA_IN;
>> +	op.data.nbytes = 2;
>> +	op.data.buf.in = &data;
> 
> This code block seems like a good candidate to be converted to a macro/
> template to avoid repetition. Template can initializes few values remain

   I'm already using a common template...

> common across the driver and override others based on parameters passed.
> You could probably have one for write op and one for read op, if needed.

   OK, I'll look into doing that...

> [...]
> 
> Regards
> Vignesh

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
