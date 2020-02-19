Return-Path: <SRS0=2g81=4H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3F1C34056
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 20:13:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F4E12064C
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 20:13:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QeTb4TDB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Pn5e4GlQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F4E12064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fn/FAsihlO/qFFhGWndqN92XmtlyRZe6bVko/+Cpfy4=; b=QeTb4TDB9Gk9LP
	Ao4isVP5776u51V5cjsqnlf4FYWnxkhkglQkpS93YVSLSJWIiq3o9dUh9OmQyeUCSWklDvlP8SkO+
	oIuSQYeey7SAOMXNlFIthvW0h5Isg4o+9R6NitiM22GqyY2LRZTW402I/RFV9LRhK/qVSBBau7So5
	wpDKbez4LoopgoOV9sb9Ty22sbKvUZ7ssmKBkDFvazZX2/wEH991eVLJpTcxYA9w44Ee/8A3yyteq
	yhwGyKkRwOpZvXU8BT1/TXmhCA49xNHCxllHleFPo3kGYmf0IGimhcb1XqP0raO7TjhzF6GQ4gio0
	gG1qNgP1O/Xfbcu7TGcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Vj5-00053I-Hv; Wed, 19 Feb 2020 20:13:43 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Vj2-0004sM-TT
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2020 20:13:42 +0000
Received: by mail-lf1-x142.google.com with SMTP id z5so1121966lfd.12
 for <linux-mtd@lists.infradead.org>; Wed, 19 Feb 2020 12:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j/a6V6DEe+WHew2072+vD1gDbLYpBHBTTSSf8AvNqVw=;
 b=Pn5e4GlQpbu4k7Zd8FgVUANgbuGSHv9xjIDS8DTjW24DY177bgg8LKjmOFOSCwfjk+
 Rb94JNKGH/zIxU9FD6LGmxJZscqoJFL/BXTYHYKQ5HMNakzNfG79p1Gha+iHjdDX0gx8
 ELmbmKGLeHZV7h2rSetKZ78zzL4fkFugaDWU46bP51us3lODDti4cZSvvkfMoV0SS/4E
 lQ4BieP04wQZTSz0QfAjTEc6SoyKoRa85tdmVFe4hmFT3Sgw5nxzmELFu6TsyyUXmTnq
 b4kmV2AXk9JQUXetoLHRL/xnGuGyh9IqvDfdu70TJgaJGQJnL2MRmcCe5ucdLSLhDQpV
 4hTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=j/a6V6DEe+WHew2072+vD1gDbLYpBHBTTSSf8AvNqVw=;
 b=ihcKBBoXdcXFkAhg2HexqqrYwdjcFRpRXV/WoIxkbjEtYQF10Cp8RsC0dU7+kpxw2t
 GaMkNMtm7ehEKjINhy+U3pZK3aTarVLAC1Y7L7XpjaZWoI07mgzSFkxuI8tnNemR+ZQz
 cDre6dpIDC35H+j1qGggkKGeW9sN0b/+BYaAeLmpTWnMQDb1wOdF5qNNWyMl5HMMT1G3
 1Wy6DyA37RpPMOVr0D1aGpo9JqJpwe3OWTNTI/tlz9pWNr0a686akjjhvAWOL7qtw8v6
 TzseEq1ys4wEP7WudCDGDeKoG1v54XHMUwiBUWfi9OoxWW4QP7g0sNhRQV6ulMmllaTb
 5H2A==
X-Gm-Message-State: APjAAAWtk5SdgjXQ/buJLt19UR93PAsJXLViewJ45sS+3tgv0H2O7WsL
 Dqjn5NOCw3HI+oGoRicGmdpAAcvNK78=
X-Google-Smtp-Source: APXvYqzZ9kls7Ofv8fiXP15tu0vsR+GAG65uXQy0eI2eBco3BpVQLX2xWyD6NERiD2ipjv1Svu9aRw==
X-Received: by 2002:a05:6512:1cc:: with SMTP id
 f12mr14797325lfp.128.1582143218699; 
 Wed, 19 Feb 2020 12:13:38 -0800 (PST)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:485f:9799:5d0d:27ec:672b:ad53])
 by smtp.gmail.com with ESMTPSA id g21sm394540ljj.53.2020.02.19.12.13.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Feb 2020 12:13:38 -0800 (PST)
Subject: Re: [PATCH RFT 0/2/2] mtd: hyperbus: add Renesas RPC-IF driver
To: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
References: <fd1360ab-8872-f750-1314-77c6d432b413@cogentembedded.com>
 <eba43289-3cb2-406b-cc5f-1209778621bf@cogentembedded.com>
 <16309076-4378-d9ff-30c3-93a46af1d803@ti.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <d09bb1b9-fef8-5a96-df4e-eccc228f2777@cogentembedded.com>
Date: Wed, 19 Feb 2020 23:13:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <16309076-4378-d9ff-30c3-93a46af1d803@ti.com>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_121341_129966_CD94B47D 
X-CRM114-Status: GOOD (  19.42  )
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
Cc: Mark Brown <broonie@kernel.org>, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 02/18/2020 07:00 AM, Vignesh Raghavendra wrote:

>> Add the HyperFLash driver for the Renesas RPC-IF.  It's the "front end"
>> driver using the "back end" APIs in the main driver to talk to the real
>> hardware.
>>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]
>> Index: linux/drivers/mtd/hyperbus/rpc-if.c
>> ===================================================================
>> --- /dev/null
>> +++ linux/drivers/mtd/hyperbus/rpc-if.c
>> @@ -0,0 +1,162 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Linux driver for RPC-IF HyperFlash
>> + *
>> + * Copyright (C) 2019 Cogent Embedded, Inc.
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
>> +struct	rpcif_hyperbus {
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
> 
> Looking around, there seems to be more than one SPI controllers, apart
> from Renesas, which also support SPI NOR and HyperFlash protocol within
> a single IP block. E.g.: Cadence xSPI controller [1]. Therefore, we need
> a generic framework to support these kind of controllers.

   We can use e.g. 'struct rpcif_op' as generic command description.

> One way would be to extend spi_mem_op to support above template along
> with a new field to distinguish SPI NOR vs HyperFlash protocol. HyperBus
> core can then register a spi_device and use spi-mem ops to talk to
> controller driver.

   We have discussed this idea with Mark Brown, the SPI maintainer, and
he wasn't terribly impressed (I've invited him to #mtd -- his nick is
broonie and mine is headless, I'm also adding him to CC:).

> So, I suggest making Renesas RPC-IF backend a full fledged spi-mem
> driver (instead of driver/memory) and use extended spi_mem_op to support
> HyperFlash.

   I don't think cramming support for the different flash busses into
the SPI drivers is a good idea... I'm not against generalizing the
drivers/memory/ APIs though.

> [1]
> https://ip.cadence.com/uploads/1244/cdn-dsd-mem-fla-host-controller-ip-for-xspi-pdf

   Do they have the full datasheet available? I'll try looking at the driver 
tomorrow...

> Regards
> Vignesh

[removed the patch you haven't replied to]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
